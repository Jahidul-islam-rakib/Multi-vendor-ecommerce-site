<?php

namespace App\Http\Controllers\Vendor;

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
        $brands = Brand::where('creator_role','vendor')->where('created_by',Auth::guard('vendor')->user()->id)->orderByDesc('id')->get();
        return view('vendor.brand.index', compact('brands'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('vendor.brand.create');
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
            'creator_role' =>  'vendor',
            'created_by' =>  Auth::guard('vendor')->user()->id,
            'photo'   =>    $img_name,
        ]);

        if ($brand) {
            toastr()->closeButton()->addSuccess('Brand Added');
            return redirect()->route('v_brand.create');
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
        if('vendor'==$brand->creator_role && Auth::guard('vendor')->user()->id==$brand->created_by) {
            return view('vendor.brand.edit', compact('brand'));
        }
        else
        {
            toastr()->closeButton()->addError('You didn\'t add this brand' );
            return redirect()->back();
        }

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $brand = Brand::find($id);
        if('vendor'==$brand->creator_role && Auth::guard('vendor')->user()->id==$brand->created_by) {
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
                toastr()->closeButton()->addSuccess('Brand Updated');
                return redirect()->route('v_brand.index');
            }
            else
            {
                toastr()->closeButton()->addError('Brand Not Updated');
                return redirect()->back();
            }
        }
        else
        {
            toastr()->closeButton()->addError('You didn\'t add this brand' );
            return redirect()->back();
        }

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $brand = Brand::find($id);
        if('vendor'==$brand->creator_role && Auth::guard('vendor')->user()->id==$brand->created_by) {
            if (file_exists($brand->photo)) {
                unlink($brand->photo);
            }
            $result = $brand->delete();

            if ($result) {
                toastr()->closeButton()->addSuccess('Brand Deleted');
                return redirect()->route('v_brand.index');
            } else {
                toastr()->closeButton()->addError('Brand Not Delete');
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
