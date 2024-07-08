<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $brands = Brand::all()->sortDesc();
        return view('backend.brand.index', compact('brands'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('backend.brand.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:brands,name',
            'slug' => 'required|unique:brands,slug',
            'photo' => 'required|image|max: 512|mimes:jpg,webp,png',
        ]);

        $image    =     $request->file('photo');
        $img_name =     "brand_".time().".".$image->getClientOriginalExtension();
        $image->move('upload/brands',$img_name);
        $img_name = 'upload/brands/'.$img_name;

        $brand = Brand::create([
            'name'    =>    $request->input('name'),
            'slug'    =>    $request->input('slug'),
            'details' =>    $request->input('details'),
            'creator_role' =>  'admin',
            'created_by' =>  Auth::guard('admin')->user()->id,
            'photo'   =>    $img_name,
        ]);

        if ($brand) {
            toastr()->closeButton()->addSuccess('Brand Added');
            return redirect()->route('brand.create');
        }
        else
        {
            toastr()->closeButton()->addError('Brand Not added');
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
        $brand = Brand::find($id);
        return view('backend.brand.edit', compact('brand'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required|unique:brands,name,'.$id,
            'slug' => 'required|unique:brands,slug,'.$id,
            'photo' => 'image|max: 512|mimes:jpg,webp,png',
        ]);
        $image    =     $request->file('photo');
        if ($image){
            $img_name =     "brand_".time().".".$image->getClientOriginalExtension();
            if (file_exists($request->input('pre_photo'))){
                unlink($request->input('pre_photo'));
            }
            $image->move('upload/brands',$img_name);
            $img_name = 'upload/brands/'.$img_name;
        }else{
            $img_name = $request->input('pre_photo');
        }
        $brand = Brand::find($id)->update([
            'name'    =>    $request->input('name'),
            'slug'    =>    $request->input('slug'),
            'details' =>    $request->input('details'),
            'status'  =>    $request->input('status'),
            'photo'   =>    $img_name,
        ]);
        if ($brand) {
            toastr()
                ->closeButton()
                ->addSuccess('Brand Updated');
            return redirect()->route('brand.index');
        }
        else
        {
            toastr()
                ->closeButton()
                ->addError('Brand Not Updated');
            return redirect()->back();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $brand = Brand::find($id);
        if (file_exists($brand->photo))
            unlink($brand->photo);
        $result = $brand->delete();
        if ($result) {
            toastr()->closeButton()->addSuccess('Brand Deleted');
            return redirect()->route('brand.index');
        }
        else {
            toastr()->closeButton()->addError('Brand Not Delete');
            return redirect()->back();
        }
    }
}
