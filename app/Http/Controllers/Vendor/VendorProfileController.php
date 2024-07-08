<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Models\Vendor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class VendorProfileController extends Controller
{

    public function profile()
    {
        $profile = Vendor::find(auth()->guard('vendor')->user()->id)->first();
        return view('vendor.profile.index',compact('profile'));
    }

    public function profileUpdate(Request $request){
        $id = auth()->guard('vendor')->user()->id;
        $request->validate([
            'name' => 'required|unique:vendors,name,'.$id,
            'address' => 'required',
            'info' => 'required',
            'phone' => 'required|unique:vendors,phone,'.$id,
        ]);
        $result = Vendor::find($id)->update([
            'name'=>$request->name,
            'phone'=>$request->phone,
            'address'=>$request->address,
            'info'=>$request->info,
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
        $id = auth()->guard('vendor')->user()->id;
        $request->validate([
            'old_pass' => 'required',
            'new_pass' => 'required|min:8|confirmed',
        ]);

        #Match The Old Password
        if(!Hash::check($request->old_pass, auth()->guard('vendor')->user()->password)){
            toastr()->closeButton()->addError('Old Password Doesn\'t match!');
            return redirect()->back()->with('old_pass',"Old Password Doesn't match!");
        }

        #Update the new Password
        $result = Vendor::whereId($id)->update([
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
        $user = Vendor::find(auth()->guard('vendor')->user()->id);
        $image    =     $request->file('photo');
        $img_name =     "admin_".time().".".$image->getClientOriginalExtension();
        $image->move('upload/vendor',$img_name);
        $img_name = 'upload/vendor/'.$img_name;
        if (file_exists($user->photo))
        {
            unlink($user->photo);
        }
        $result= Vendor::find(auth()->guard('vendor')->user()->id)->update([
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

}
