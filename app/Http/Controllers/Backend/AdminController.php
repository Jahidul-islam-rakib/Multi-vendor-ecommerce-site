<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    /**
     * login the form for creating a new resource.
     */
    public function login()
    {
        if(Auth::guard('admin')->user()!==null){
            return redirect()->route('admin.dashboard');
        }
        return view('backend.auth.login');
    }



    public function profile()
    {
        $profile = Admin::find(auth()->guard('admin')->user())->first();
//        dd($profile);
        return view('backend.profile.index', compact('profile'));
    }

    /**
     * login credential check.
     */
    public function checkLogin(Request $request)
    {
        $check = $request->all();
        if ($admin = Auth::guard('admin')->attempt(['email'=>$check['email'], 'password'=>$check['password']]))
        {
            if(Auth::guard('admin')->attempt(['email'=>$check['email'], 'password'=>$check['password'],'status'=>'inactive']))
            {
                toastr()->closeButton()->addError('Please contact with admin');
                Auth::guard('admin')->logout();
                return redirect()->back()->withInput();
            }
            else if(Auth::guard('admin')->attempt(['email'=>$check['email'], 'password'=>$check['password'],'status'=>'restricted']))
            {
                toastr()->closeButton()->addError('You are restricted');
                Auth::guard('admin')->logout();
                return redirect()->back()->withInput();
            }
            else{
                toastr()->closeButton()->addSuccess('Login Successful');
                return redirect()->route('admin.dashboard');
            }
        }
        else
        {
            toastr()->closeButton()->addError('Invalid Email or Password');
            return redirect()->back()->withInput();
        }
    }

    public function profileUpdate(Request $request){
        $id = auth()->guard('admin')->user()->id;
        $request->validate([
            'name' => 'required|unique:admins,name,'.$id,
            'phone' => 'required|unique:admins,phone,'.$id,
        ]);
        $result = Admin::find($id)->update([
            'name'=>$request->name,
            'phone'=>$request->phone,
        ]);
        if ($result) {
            toastr()->closeButton()->addSuccess('Profile Information Updated');
            return redirect()->back();
        }
        else
        {
            toastr()->closeButton()->addError('Profile Information Not Updated');
            return redirect()->back();
        }



    }

    public function passwordUpdate(Request $request)
    {
        $id = auth()->guard('admin')->user()->id;
        $request->validate([
            'old_pass' => 'required|min:8',
            'new_pass' => 'required|min:8|confirmed',
        ]);

        #Match The Old Password
        if(!Hash::check($request->old_pass, auth()->guard('admin')->user()->password)){
            toastr()->closeButton()->addError('Old Password Doesn\'t match!');
            return redirect()->back()->with('old_pass',"Old Password Doesn't match!");
        }

        #Update the new Password
        $result = Admin::whereId($id)->update([
            'password' => Hash::make($request->new_pass)
        ]);

        if ($result) {
            toastr()->closeButton()->addSuccess('Password Updated');
            return redirect()->back();
        }
        else
        {
            toastr()->closeButton()->addError('Something is Wrong');
            return redirect()->back();
        }
    }

    public function photoUpdate(Request $request)
    {
        $request->validate([
            'photo' => 'required|image|max: 512|mimes:jpg,webp,png',
        ]);
        $user = Admin::find(auth()->guard('admin')->user()->id);
        $image    =     $request->file('photo');
        $img_name =     "admin_".time().".".$image->getClientOriginalExtension();
        $image->move('upload/admin',$img_name);
        $img_name = 'upload/admin/'.$img_name;
        if (file_exists($user->photo))
        {
            unlink($user->photo);
        }
        $result= Admin::find(auth()->guard('admin')->user()->id)->update([
            'photo'   =>    $img_name,
        ]);
        if ($result) {
            toastr()->closeButton()->addSuccess('Profile Photo Updated');
            return redirect()->back();
        }
        else
        {
            toastr()->closeButton()->addError('Profile Photo Not Updated');
            return redirect()->back();
        }

    }

    /**
     * login credential check.
     */
    public function adminLogout()
    {
        Auth::guard('admin')->logout();
        toastr()->closeButton()->addSuccess('Logout Successful');
        return redirect('/admin/login');

    }
}
