<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\OrderDetails;
use App\Models\Product;
use http\Client\Curl\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CartController extends Controller
{
    public function addToCart($slug){
        $product = Product::where('slug',$slug)->first();
        $cart = \session()->has('cart') ? \session()->get('cart') : [];

        if ($product->available_qty<=0)
        {
            return response()->json([
                'message'=>'This item stock out'
            ]);
        }
        else if (key_exists('c'.$product->id, $cart)){
            $cart['c'.$product->id]['qty'] = $cart['c'.$product->id]['qty']+1;
            return response()->json([
                'message'=>'Already Added to Cart Just update quantity'
            ]);
        }else{
            $cart ['c'.$product->id] = [
                'id' =>  $product->id,
                'slug' =>  $product->slug,
                'name'       =>  $product->name,
                'image'      =>  $product->thumb_photo,
                'price'      =>  $product->offer_price>0?$product->offer_price:$product->sell_price,
                'qty'        =>  1,
            ];
        }
        \session(['cart'=>$cart]);
        return response()->json([
            'message'=>'New item added to cart'
        ]);
    }

    public function addToCart2($slug){
        $product = Product::where('slug',$slug)->first();
        $cart = \session()->has('cart') ? \session()->get('cart') : [];

        if ($product->available_qty<=0)
        {
            return response()->json([
                'message'=>'This item stock out'
            ]);
        }
        else if (key_exists('c'.$product->id, $cart)){
            $cart['c'.$product->id]['qty'] = $cart['c'.$product->id]['qty']+1;
            return response()->json([
                'message'=>'Already Added to Cart Just update quantity'
            ]);
        }else{
            $cart ['c'.$product->id] = [
                'id' =>  $product->id,
                'slug' =>  $product->slug,
                'name'       =>  $product->name,
                'image'      =>  $product->thumb_photo,
                'price'      =>  $product->offer_price>0?$product->offer_price:$product->sell_price,
                'qty'        =>  1,
            ];
        }
        \session(['cart'=>$cart]);
        return response()->json([
            'message'=>'New item added to cart'
        ]);
    }

    public function cart(){
        $carts = \session()->has('cart') ? \session()->get('cart') : [];
        if ($carts == null){
            return response()->json([
                'message'=>'Empty Cart'
            ]);
        }else{
            return response()->json([
                'cart'=>$carts
            ]);
        }
    }

    public function allItems(){
        $carts = \session()->has('cart') ? \session()->get('cart') : [];
        $subtotal = 0;
        foreach ($carts as $cart){
            $subtotal+=$cart['price']*$cart['qty'];
        }
        return view('frontend.cart', compact('carts','subtotal'));
    }

    public function addToCartFromWishlist(Request $request){
        $product = Product::where('slug',$request->slug)->first();
        $cart = \session()->has('cart') ? \session()->get('cart') : [];
        if ($product->available_qty<=0)
        {
            toastr()->closeButton()->addSuccess('This Item Stock Out');
            return redirect()->back();
        }
        else if (key_exists('c'.$product->id, $cart)){
            $cart['c'.$product->id]['qty'] = $cart['c'.$product->id]['qty']+$request->qty;
        }else{
            $cart ['c'.$product->id] = [
                'id' =>  $product->id,
                'slug' =>  $product->slug,
                'name'       =>  $product->name,
                'image'      =>  $product->thumb_photo,
                'price'      =>  $product->offer_price>0?$product->offer_price:$product->sell_price,
                'qty'        =>  $request->qty,
            ];
        }
        \session(['cart'=>$cart]);
        $wishlist = \session()->has('wishlist') ? \session()->get('wishlist') : [];
        foreach ($wishlist as $key => $item){
            if ($item['id']==$product->id){
                unset($wishlist[$key]);
            }
            session(['wishlist'=>$wishlist]);
        }
        toastr()->closeButton()->addSuccess('New item added to cart');
        return redirect()->back();
    }

    public function deleteItem($id){
        $carts = \session()->has('cart') ? \session()->get('cart') : [];
        foreach ($carts as $key => $cart){
            if ($cart['id']==$id){
                unset($carts[$key]);
            }
            session(['cart'=>$carts]);
        }
        return response()->json([
            'message'=>'Item Remove From Cart'
        ]);
    }

    public function cartsItemDelete($id){
        $carts = \session()->has('cart') ? \session()->get('cart') : [];
        foreach ($carts as $key => $cart){
            if ($cart['id']==$id){
                unset($carts[$key]);
            }
            session(['cart'=>$carts]);
        }
        return redirect()->route('cart')->response()->json([
            'message'=>'Successfully Item Delete From Cart'
        ]);

    }

    public function update(Request $request)
    {
        $ids = $request->input('id');
        $qtys = $request->input('qty');
        $cart = \session()->has('cart') ? \session()->get('cart') : [];
        foreach ($ids as $i=>$id){
            if ($qtys[$i]<=0){
                unset($cart['c'.$id]);
            }else
            {
                if (key_exists('c'.$id, $cart)){
                    $cart['c'.$id]['qty'] = $qtys[$i];
                }
            }
        }
        session(['cart'=>$cart]);
        toastr()->closeButton()->addSuccess('Cart Update');
        return redirect()->back();
    }

    public function order(Request $request){
//        dd($request);
        $user = auth()->user();
        $request->validate([
            'name'    => 'required',
            'phone'   => 'required',
            'address' => 'required',
            'transaction_id'  => 'required|nullable|unique:orders,transaction_id',
            'shipping'  => 'required',
        ]);

        try {
            $inputs = [
                'user_id'   => $user->id,
                'name' => $request->name,
                'address'   => $request->address,
                'phone'     => $request->phone,
                'email'     => $user->email,
                'price'     => $request->price,
                'status'    => 'Pending',
                'transaction_id'    => $request->transaction_id,
            ];

            DB::beginTransaction();
            $order = Order::create($inputs);
            $carts = \session()->has('cart') ? \session()->get('cart') : [];
            foreach ($carts as $cart){
                $product = Product::find($cart['id'])->first();
                OrderDetails::create([
                    'order_id' =>   $order->id,
                    'product_id'    =>  $product->id,
                    'name'    =>  $product->name,
                    'price'    =>  $cart['price'],
                    'qty'    =>  $cart['qty'],
                    'creator_role'    =>  $product->creator_role,
                    'created_by'    =>  $product->created_by
                ]);

                $product = Product::find($cart['id']);
                $product->update([
                    'available_qty'=>$product->available_qty-$cart['qty']
                ]);
            }


            DB::commit();
            \session()->forget('cart');
            toastr()->closeButton()->addSuccess('Order Successful');
            return redirect()->route('dashboard');
        }catch (\Exception $exception){
            DB::rollBack();
            toastr()->closeButton()->addError('Something is wrong try again');
            return redirect()->back();
        }

    }

    public function checkout(){
        if(auth()->user()==null)
        {
            toastr()->closeButton()->addError('Login First');
            return redirect()->route('login');
        }
        else
        {
            $carts = \session()->has('cart') ? \session()->get('cart') : [];
            $user = \App\Models\User::find(auth()->user()->id);
            if ($carts == null){
                toastr()->closeButton()->addWarning('Your cart is empty');
                return redirect()->back();
            }else{
                return view('frontend.checkout',compact('carts', 'user'));
            }
        }

    }


}
