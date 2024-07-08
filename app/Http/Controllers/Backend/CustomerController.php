<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $customers = User::all();
        return view('backend.customer.index', compact('customers'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('backend.customer.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:users,name',
            'email' => 'required|unique:users,email',
            'phone' => 'required|unique:users,phone',
            'password' => ['required', 'confirmed', Password::min(6)],
            'photo' => 'image|max: 512|mimes:jpg,webp,png',
        ]);

        if ($request->file('photo')) {
            $image = $request->file('photo');
            $img_name = "user_" . random_int(1000000, 9999999) . time() . "." . $image->getClientOriginalExtension();
            $image->move('upload/user', $img_name);
            $img_name = 'upload/user/' . $img_name;
        }else{
            $img_name = '';
        }

        $result = User::create([
            'name'    =>    $request->input('name'),
            'email'    =>    $request->input('email'),
            'phone' =>    $request->input('phone'),
            'address' =>    $request->input('address'),
            'info' =>    $request->input('info'),
            'password' =>  Hash::make($request->input('password')),
            'status' =>  $request->status,
            'creator_role' =>  'admin',
            'created_by' =>  Auth::guard('admin')->user()->id,
            'photo'   =>    $img_name,
        ]);

        if ($result) {
            toastr()->closeButton()->addSuccess('Customer Added');
            return redirect()->route('a_customer.create');
        }
        else
        {
            toastr()->closeButton()->addError('Customer Not added');
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
        $customer = User::find($id);
        return view('backend.customer.edit', compact('customer'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {

        $request->validate([
            'name' => 'required|unique:users,name,'.$id,
            'email' => 'required|unique:users,email,'.$id,
            'phone' => 'required|unique:users,phone,'.$id,
            'status' => 'required',
            'photo' => 'image|max: 512|mimes:jpg,webp,png',
        ]);
        $customer = User::find($id);
        if ($image = $request->file('photo'))
        {
            $img_name =     "user_".random_int(1000000,9999999).time().".".$image->getClientOriginalExtension();
            $image->move('upload/user',$img_name);
            $img_name = 'upload/user/'.$img_name;
            if (file_exists($customer->photo)) {
                unlink($customer->photo);
            }
        }
        else
        {
            $img_name = $customer->photo;
        }
        $result = $customer->update([
            'name'    =>    $request->input('name'),
            'email'    =>    $request->input('email'),
            'phone' =>    $request->input('phone'),
            'address' =>    $request->input('address'),
            'info' =>    $request->input('info'),
            'status' =>  $request->input('status'),
            'photo'   =>    $img_name,
        ]);
        if ($result) {
            toastr()->closeButton()->addSuccess('Customer Info Update');
            return redirect()->route('a_customer.index');
        }
        else
        {
            toastr()->closeButton()->addError('Customer Info Not Update');
            return redirect()->back();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $customer = User::find($id);
        if (file_exists($customer->photo)) {
            unlink($customer->photo);
        }
        $result = $customer->delete();

        if ($result) {
            toastr()->closeButton()->addSuccess('Customer Deleted');
            return redirect()->route('a_customer.index');
        } else {
            toastr()->closeButton()->addError('Customer Not Delete');
            return redirect()->back();
        }
    }
}
