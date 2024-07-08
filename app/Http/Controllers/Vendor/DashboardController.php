<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Http\Middleware\Admin;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $t_orders = OrderDetails::where('creator_role','vendor')->where('created_by',\auth()->guard('vendor')->user()->id)->get()->count();
        $t_categories = Category::get()->count();
        $t_brands = Brand::where('creator_role','vendor')->where('created_by',\auth()->guard('vendor')->user()->id)->count();
        $t_products = Product::where('creator_role','vendor')->where('created_by',\auth()->guard('vendor')->user()->id)->count();
        return view('vendor.dashboard', compact('t_orders','t_brands','t_categories','t_products'));
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
