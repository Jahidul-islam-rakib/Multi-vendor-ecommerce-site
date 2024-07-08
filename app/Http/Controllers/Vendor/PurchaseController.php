<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Purchase;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PurchaseController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $purchases = Purchase::where('creator_role','vendor')->where('created_by', Auth::guard('vendor')->user()->id)->orderByDesc('id')->get();
        return view('vendor.purchase.index', compact('purchases'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $products = Product::where('creator_role','vendor')->where('created_by',Auth::guard('vendor')->user()->id)->orderByDesc('id')->get();
        return view('vendor.purchase.create', compact('products'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required',
            'invoice_no' => 'required',
            'purchase_date' => 'required',
            'supplier' => 'required',
            'qty' => 'required',
            'price' => 'required',
            'payment_type' => 'required',
        ]);

        $product = Product::find($request->product_id);
        if ($product)
        {
            $result = Purchase::create([
                'product_id' => $product->id,
                'invoice_no' => $request->input('invoice_no'),
                'purchase_date' => $request->input('purchase_date'),
                'supplier' => $request->input('supplier'),
                'qty' => $request->input('qty'),
                'price' => $request->input('price'),
                'payment_type' => $request->input('payment_type'),
                'note' => $request->input('note'),
                'creator_role'=>'vendor',
                'created_by'=>Auth::guard('vendor')->user()->id,
            ]);

            $product->update([
               'qty'=> $product->qty + $request->input('qty'),
               'available_qty'=> $product->available_qty + $request->input('qty'),
            ]);

            if ($result) {
                toastr()->closeButton()->addSuccess('Purchase Done');
                return redirect()->route('v_purchase.create');
            }
            else
            {
                toastr()->closeButton()->addError('Purchase Error');
                return redirect()->back();
            }
        }
        else
        {
                toastr()->closeButton()->addError('Product not found');
                return redirect()->back();
        }


    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $products = Product::where('creator_role','vendor')->where('created_by',Auth::guard('vendor')->user()->id)->orderByDesc('id')->get();
        $purchase = Purchase::find($id);
        return view('vendor.purchase.edit', compact('purchase','products'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'product_id' => 'required',
            'invoice_no' => 'required',
            'purchase_date' => 'required',
            'supplier' => 'required',
            'qty' => 'required',
            'price' => 'required',
            'payment_type' => 'required',
        ]);

        $product = Product::find($request->product_id);
        $purc = Purchase::find($id);
        if ($product && $purc)
        {
            $result = Purchase::find($id)->update([
                'product_id' => $product->id,
                'invoice_no' => $request->input('invoice_no'),
                'purchase_date' => $request->input('purchase_date'),
                'supplier' => $request->input('supplier'),
                'qty' => $request->input('qty'),
                'price' => $request->input('price'),
                'payment_type' => $request->input('payment_type'),
                'note' => $request->input('note'),
                'creator_role'=>'vendor',
                'created_by'=>Auth::guard('vendor')->user()->id,
            ]);

            if ($purc->qty>$request->input('qty'))
            {
                $gap = $purc->qty - $request->input('qty');
                $product->update([
                    'qty'=> $product->qty - $gap,
                    'available_qty'=> $product->available_qty - $gap,
                ]);
            }

            if ($purc->qty<$request->input('qty'))
            {
                $gap = $request->input('qty') - $purc->qty;
                $product->update([
                    'qty'=> $product->qty+$gap,
                    'available_qty'=> $product->available_qty + $gap,
                ]);
            }

            if ($result) {
                toastr()->closeButton()->addSuccess('Purchase Info Update');
                return redirect()->route('v_purchase.index');
            }
            else
            {
                toastr()->closeButton()->addError('Purchase Info Update Error');
                return redirect()->back();
            }
        }
        else
        {
            toastr()->closeButton()->addError('Something Wrong');
            return redirect()->back();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $purchase = Purchase::find($id);
        if('vendor'==$purchase->creator_role && Auth::guard('vendor')->user()->id==$purchase->created_by) {
            $result = $purchase->delete();
            if ($result) {
                toastr()->closeButton()->addSuccess('Purchase Deleted');
                return redirect()->route('v_purchase.index');
            } else {
                toastr()->closeButton()->addError('Purchase Not Delete');
                return redirect()->back();
            }
        }
        else
        {
            toastr()->closeButton()->addError('You didn\'t have access' );
            return redirect()->back();
        }
    }
}
