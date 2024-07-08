<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

    }


    public function productDetails($slug)
    {
        $product = Product::where('slug',$slug)->first();
        $relProducts = Product::where('category_id', $product->category_id)->paginate(8);
        if ($product != null) {
            return view('frontend.product_details', compact('product','relProducts'));
        } else {
            toastr()->closeButton()->addError('Product Not Found');
            return redirect()->back();
        }
    }



    public function productView($slug)
    {
        $product = Product::where('slug',$slug)->first();
        if ($product != null) {
            return response()->json([
                'product'=>$product,
                'category'=>$product->category->name
            ]);
        } else {
            toastr()->closeButton()->addError('Product Not Found');
            return redirect()->back();
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
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
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
