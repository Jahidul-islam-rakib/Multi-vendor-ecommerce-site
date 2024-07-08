<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Purchase;
use App\Models\Returnproduct;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReturnController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Returnproduct::where('creator_role','admin')->where('created_by',Auth::guard('admin')->user()->id)->orderByDesc('id')->get();
        return view('backend.return.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $products = Product::where('creator_role','admin')->where('created_by',Auth::guard('admin')->user()->id)->orderByDesc('id')->get();
        return view('backend.return.create', compact('products'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required',
            'date' => 'required',
            'qty' => 'required',
            'price' => 'required',
        ]);

        $product = Product::find($request->product_id);
        $purchase = Purchase::where('creator_role','admin')->where('product_id',$request->product_id)->where('created_by',Auth::guard('admin')->user()->id)->orderByDesc('id')->first();
        if ($purchase != null) {
            if ($request->qty > $purchase->qty && $product->avilable_qty<$request->qty) {
                toastr()->closeButton()->addError('Please Check Quantity');
                return redirect()->back()->withInput();
            } else {
                $result = Returnproduct::create([
                    'product_name' => $product->name,
                    'purchase_id' => $purchase->id,
                    'qty' => $request->input('qty'),
                    'price' => $request->input('price'),
                    'date' => $request->input( 'date'),
                    'note' => $request->input( 'note'),
                    'creator_role'=>'admin',
                    'created_by'=>Auth::guard('admin')->user()->id,
                ]);
                $product->update([
                    'available_qty'=>$product->available_qty-$request->input('qty')
                ]);

                if ($result) {
                    toastr()->closeButton()->addSuccess('Purchase Return Done');
                    return redirect()->route('return.create');
                }
                else
                {
                    toastr()->closeButton()->addError('Purchase Return Problem');
                    return redirect()->back();
                }
            }
        }
        else
        {
            toastr()->closeButton()->addError('You did not purchase this product');
            return redirect()->back();
        }
    }
}
