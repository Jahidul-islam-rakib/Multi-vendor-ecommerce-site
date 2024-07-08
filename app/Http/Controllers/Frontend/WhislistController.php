<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class WhislistController extends Controller
{
    public function addToWishlist($slug)
    {
        $product = Product::where('slug', $slug)->first();
        $wishlist = \session()->has('wishlist') ? \session()->get('wishlist') : [];

        if (key_exists('c' . $product->id, $wishlist)) {
            return response()->json([
                'message' => 'Already Added to wishlist'
            ]);
        } else {
            $wishlist ['c' . $product->id] = [
                'id' => $product->id,
                'slug' => $product->slug,
                'name' => $product->name,
                'image' => $product->thumb_photo,
                'price' => $product->offer_price > 0 ? $product->offer_price : $product->sell_price,
                'qty' => 1,
            ];
        }

        \session(['wishlist' => $wishlist]);

        return response()->json([
            'message' => 'New item added to wishlist'
        ]);
    }

    public function allItems()
    {
        $wishlist = \session()->has('wishlist') ? \session()->get('wishlist') : [];
        return view('frontend.wishlist', compact('wishlist'));
    }

    public function deleteItem(Request $request)
    {
        $wishlist = \session()->has('wishlist') ? \session()->get('wishlist') : [];
        foreach ($wishlist as $key => $item) {
            if ($item['id'] == $request->id) {
                unset($wishlist[$key]);
            }
            session(['wishlist' => $wishlist]);
        }
        toastr()->closeButton()->addSuccess('Item remove from wishlist');
        return redirect()->route('wishlist');
    }

    public function wishlist()
    {
        $wishlist = \session()->has('wishlist') ? \session()->get('wishlist') : [];
        $wish = 0;
        foreach ($wishlist as $item) {
            $wish++;
        }
        return response()->json([
            'wish' => $wish
        ]);
    }

}
