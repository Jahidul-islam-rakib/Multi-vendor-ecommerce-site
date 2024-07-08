<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    public function index()
    {
        $products = Product::where('status',1)->orderByDesc('id')->paginate(12);
        $categories = Category::where('status',1)->orderByDesc('id')->get();
        $brands = Brand::where('status',1)->orderByDesc('id')->get();
        return view('frontend.shop', compact('products', 'categories', 'brands'));
    }

    public function productShowByCategory($slug)
    {
        $category = Category::where('slug',$slug)->first();
        $products = Product::where('status',1)->where('category_id', $category->id)->orderByDesc('id')->paginate(12);
        $categories = Category::where('status',1)->orderByDesc('id')->get();
        $brands = Brand::where('status',1)->orderByDesc('id')->get();
        return view('frontend.shopByCat', compact('products', 'categories', 'brands'));
    }

    public function search(Request $request)
    {
        $slug = $request->q;
        $slug = '%'.$request->q.'%';
//        $products = Product::where('name','like','%'.$slug.'%')->orderByDesc('id')->paginate(12);
        $products = Product::where('slug','like',$slug)->orderBy('id', 'DESC')->paginate(12);
        $categories = Category::where('status',1)->orderByDesc('id')->get();
        $brands = Brand::where('status',1)->orderByDesc('id')->get();
        return view('frontend.shop', compact('products', 'categories', 'brands'));
    }

}
