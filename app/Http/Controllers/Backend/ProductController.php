<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Product::all()->sortDesc();
        return view('backend.product.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {

        $categories = Category::all()->sortDesc();
        $brands = Brand::all()->sortDesc();
        return view('backend.product.create', compact('categories','brands'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:products,name',
            'slug' => 'required|unique:products,slug',
            'thumb_photo' => 'required|image|max: 512|mimes:jpg,webp,png',
            'photo.*' => 'image|max: 512|mimes:jpg,webp,png',
            'category_id' => 'required',
            'brand_id' => 'required',
            'price' => 'required',
            'sell_price' => 'required',
            'short_desc' => 'required',
            'description' => 'required',
            'ad_info' => 'required',
        ],[
            'category_id.required' => 'Category field is required',
            'thumb_photo.required' => 'Thumbnail Image field is required',
            'brand_id.required' => 'Brand field is required',
            'ad_info.required' => 'Additional Information field is required',
        ]);

        $image    =     $request->file('thumb_photo');
        $img_name =     "thumb_".time().".".$image->getClientOriginalExtension();
        $image->move('upload/products',$img_name);
        $thumb_img_name = 'upload/products/'.$img_name;

        $images=array();
        if($files=$request->file('photo')) {
            foreach ($files as $file) {
                $img_name = "product_" . time() .random_int(100000,99999999). "." . $file->getClientOriginalExtension();
                $file->move('upload/products', $img_name);
                $images[] = 'upload/products/' . $img_name;
            }
        }

        $locations=array();
        if($locs=$request->location) {
            foreach ($locs as $loc) {
                $locations[] = $loc;
            }
        }

        $product = Product::create([
            'name'    =>    $request->input('name'),
            'slug'    =>    $request->input('slug'),
            'category_id' =>    $request->input('category_id'),
            'brand_id' =>    $request->input('brand_id'),
            'price' =>    $request->input('price'),
            'sell_price' =>    $request->input('sell_price'),
            'offer_price' =>    $request->input('offer_price'),
            'short_desc' =>    $request->input('short_desc'),
            'description' =>    $request->input('description'),
            'ad_info' =>    $request->input('ad_info'),
            'thumb_photo' =>    $thumb_img_name,
            'photo' =>    json_encode($images),
            'location' =>    json_encode($locations),
            'status' =>    1,
            'tags' =>    $request->input('tags'),
            'creator_role'=>'admin',
            'created_by'=>Auth::guard('admin')->user()->id,
        ]);

        if ($product) {
            toastr()->closeButton()->addSuccess('Product Added');
            return redirect()->back();
        }
        else
        {
            toastr()->closeButton()->addError('Product Not added');
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
        $categories = Category::all()->sortDesc();
        $brands = Brand::all()->sortDesc();
        $product = Product::find($id);
        return view('backend.product.edit', compact('product','categories','brands'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $product = Product::find($id);
        $request->validate([
            'name' => 'required|unique:products,name,'.$id,
            'slug' => 'required|unique:products,slug,'.$id,
            'thumb_photo' => 'image|max: 512|mimes:jpg,webp,png',
            'photo.*' => 'image|max: 512|mimes:jpg,webp,png',
            'category_id' => 'required',
            'brand_id' => 'required',
            'price' => 'required',
            'sell_price' => 'required',
            'short_desc' => 'required',
            'description' => 'required',
            'ad_info' => 'required',
        ],[
            'category_id.required' => 'Category field is required',
            'thumb_photo.required' => 'Thumbnail Image field is required',
            'brand_id.required' => 'Brand field is required',
            'ad_info.required' => 'Additional Information field is required',
        ]);

        $image    =     $request->file('thumb_photo');
        if ($image){
            $img_name =     "thumb_".time().".".$image->getClientOriginalExtension();
            if (file_exists($product->thumb_photo)){
                unlink($product->thumb_photo);
            }
            $image->move('upload/products',$img_name);
            $thumb_img_name = 'upload/products/'.$img_name;
        }else{
            $thumb_img_name = $product->thumb_photo;
        }

        if($files=$request->file('photo')) {
            foreach ($files as $file) {
                echo '<pre>';
                print_r($file);
                echo '</pre>';
                $img_name = "product_".time().random_int(100000,99999999). "." . $file->getClientOriginalExtension();
                $file->move('upload/products', $img_name);
                $images[] = 'upload/products/'. $img_name;
            }
            if ($old_images = json_decode($product->photo)){
                foreach ($old_images as $img){
                    if (file_exists($img))
                        unlink($img);
                }
            }
        }
        else
        {
            $images=json_decode($product->photo);
        }

        $locations=array();
        if($locs=$request->location) {
            foreach ($locs as $loc) {
                $locations[] = $loc;
            }
        }

        $result = $product->update([
            'name'    =>    $request->input('name'),
            'slug'    =>    $request->input('slug'),
            'category_id' =>    $request->input('category_id'),
            'brand_id' =>    $request->input('brand_id'),
            'price' =>    $request->input('price'),
            'sell_price' =>    $request->input('sell_price'),
            'offer_price' =>    $request->input('offer_price'),
            'short_desc' =>    $request->input('short_desc'),
            'description' =>    $request->input('description'),
            'ad_info' =>    $request->input('ad_info'),
            'thumb_photo' =>    $thumb_img_name,
            'photo' =>    json_encode($images),
            'location' =>    json_encode($locations),
            'status' =>    $request->status,
            'tags' =>    $request->input('tags'),
            'created_by'=>Auth::guard('admin')->user()->id,
        ]);

        if ($result) {
            toastr()->closeButton()->addSuccess('Product Info Update');
            return redirect()->route('product.index');
        }
        else
        {
            toastr()->closeButton()->addError('Product Info Not Update');
            return redirect()->back();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {

        $product = Product::find($id);
        if (file_exists($product->thumb_photo))
            unlink($product->thumb_photo);
        if ($images = json_decode($product->photo)){
            foreach ($images as $img){
                if (file_exists($img))
                    unlink($img);
            }
        }

        $result = $product->delete();
        if ($result) {
            toastr()->closeButton()->addSuccess('Product Deleted');
            return redirect()->route('product.index');
        }
        else {
            toastr()->closeButton()->addError('Product Not Delete');
            return redirect()->back();
        }
    }
}
