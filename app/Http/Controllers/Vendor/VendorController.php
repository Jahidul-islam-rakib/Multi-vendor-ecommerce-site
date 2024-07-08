<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Models\Vendor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class VendorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $vendors = Vendor::all();
        return view('backend.vendor.index', compact('vendors'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('backend.vendor.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:vendors,name',
            'email' => 'required|unique:vendors,email',
            'store_name' => 'required|unique:vendors,store_name',
            'phone' => 'required|unique:vendors,phone',
            'address' => 'required',
            'info' => 'required',
            'password' => ['required', 'confirmed', Password::min(6)],
            'photo' => 'required|image|max: 512|mimes:jpg,webp,png',
        ]);

        $image    =     $request->file('photo');
        $img_name =     "vendor_".random_int(1000000,9999999).time().".".$image->getClientOriginalExtension();
        $image->move('upload/vendor',$img_name);
        $img_name = 'upload/vendor/'.$img_name;

        $result = Vendor::create([
            'name'    =>    $request->input('name'),
            'email'    =>    $request->input('email'),
            'store_name'    =>    $request->input('store_name'),
            'phone' =>    $request->input('phone'),
            'address' =>    $request->input('address'),
            'info' =>    $request->input('info'),
            'password' =>  Hash::make($request->input('password')),
            'status' =>  'inactive',
            'created_by' =>  Auth::guard('admin')->user()->id,
            'photo'   =>    $img_name,
        ]);

        if ($result) {
            toastr()->closeButton()->addSuccess('Vendor Added');
            return redirect()->route('a_vendor.create');
        }
        else
        {
            toastr()->closeButton()->addError('Vendor Not added');
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
        $vendor = Vendor::find($id);
        return view('backend.vendor.edit', compact('vendor'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {

        $request->validate([
            'name' => 'required|unique:vendors,name,'.$id,
            'email' => 'required|unique:vendors,email,'.$id,
            'store_name' => 'required|unique:vendors,store_name,'.$id,
            'phone' => 'required|unique:vendors,phone,'.$id,
            'address' => 'required',
            'info' => 'required',
            'status' => 'required',
            'photo' => 'image|max: 512|mimes:jpg,webp,png',
        ]);
        if ($request->password!='' && ($request->password!=null)) {
            $request->validate([
                'password' => ['confirmed', Password::min(6)],
            ]);
        }
        $vendor = Vendor::find($id);
        if ($request->file('photo'))
        {
            $image    =     $request->file('photo');
            $img_name =     "vendor_".random_int(1000000,9999999).time().".".$image->getClientOriginalExtension();
            $image->move('upload/vendor',$img_name);
            $img_name = 'upload/vendor/'.$img_name;
            if (file_exists($vendor->photo)) {
                unlink($vendor->photo);
            }
        }
        else
        {
            $img_name = $vendor->photo;
        }
        if ($request->password!='' && ($request->password!=null)) {
            $result = $vendor->update([
                'name'    =>    $request->input('name'),
                'email'    =>    $request->input('email'),
                'store_name'    =>    $request->input('store_name'),
                'phone' =>    $request->input('phone'),
                'address' =>    $request->input('address'),
                'info' =>    $request->input('info'),
                'password' =>  Hash::make($request->input('password')),
                'status' =>  $request->input('status'),
                'photo'   =>    $img_name,
            ]);
        }else
        {
            $result = $vendor->update([
                'name'    =>    $request->input('name'),
                'email'    =>    $request->input('email'),
                'store_name'    =>    $request->input('store_name'),
                'phone' =>    $request->input('phone'),
                'address' =>    $request->input('address'),
                'info' =>    $request->input('info'),
                'status' =>  $request->input('status'),
                'photo'   =>    $img_name,
            ]);

        }
        if ($result) {
            toastr()->closeButton()->addSuccess('Vendor Info Update');
            return redirect()->route('a_vendor.index');
        }
        else
        {
            toastr()->closeButton()->addError('Vendor Info Not Update');
            return redirect()->back();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $vendor = Vendor::find($id);
        if (file_exists($vendor->photo)) {
            unlink($vendor->photo);
        }
        $result = $vendor->delete();

        if ($result) {
            toastr()->closeButton()->addSuccess('Vendor Deleted');
            return redirect()->route('a_vendor.index');
        } else {
            toastr()->closeButton()->addError('Vendor Not Delete');
            return redirect()->back();
        }
    }

    /**
     * login the form for creating a new resource.
     */
    public function login()
    {
        if(Auth::guard('vendor')->user()!==null){
            return redirect()->route('vendor.dashboard');
        }
        return view('vendor.auth.login');
    }

    /**
     * login credential check.
     */
    public function checkLogin(Request $request)
    {


        $check = $request->all();
        if ($admin = Auth::guard('vendor')->attempt(['email'=>$check['email'], 'password'=>$check['password']]))
        {
            if(Auth::guard('vendor')->attempt(['email'=>$check['email'], 'password'=>$check['password'],'status'=>'inactive']))
            {
                toastr()->closeButton()->addError('Please contact with admin');
                Auth::guard('vendor')->logout();
                return redirect()->back()->withInput();
            }
            else if(Auth::guard('vendor')->attempt(['email'=>$check['email'], 'password'=>$check['password'],'status'=>'restricted']))
            {
                toastr()->closeButton()->addError('You are restricted');
                Auth::guard('vendor')->logout();
                return redirect()->back()->withInput();
            }
            else{
                toastr()->closeButton()->addSuccess('Login Successful');
                return redirect()->route('vendor.dashboard');
            }
        }
        else
        {
            toastr()->closeButton()->addError('Invalid Email or Password');
            return redirect()->back()->withInput();
        }
    }

    /**
     * login credential check.
     */
    public function vendorLogout()
    {
        Auth::guard('vendor')->logout();
        toastr()->closeButton()->addSuccess('Logout Successful');
        return redirect('/vendor/login');

    }




}
