<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\OrderDetails;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = User::find(auth()->user()->id);
        return view('frontend.user.info',compact('user'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    public function orderInfo($id)
    {
        $order = Order::where('id',$id)->where('user_id',auth()->user()->id)->first();
        if($order==null)
        {
            toastr()->closeButton()->addWarning('This order is not made by you');
            return redirect()->route('profile.order');
        }
         else
        {
            $details = OrderDetails::where('order_id', $order->id)->get();
            return view('frontend.user.order_details', compact('order','details'));
        }
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
    public function update(Request $request)
    {
        $id = auth()->user()->id;
        $request->validate([
            'name' => 'required|unique:users,name,'.$id,
            'phone' => 'required|unique:users,phone,'.$id,
            'address' => 'required',
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
            'phone' =>    $request->input('phone'),
            'address' =>    $request->input('address'),
            'info' =>    $request->input('info'),
            'gender' =>  $request->input('gender'),
            'photo'   =>    $img_name,
        ]);
        if ($result) {
            toastr()->closeButton()->addSuccess('User Info Update');
            return redirect()->back();
        }
        else
        {
            toastr()->closeButton()->addError('Something is Wrong');
            return redirect()->back();
        }
    }


    public function allOrders()
    {
        $orders = Order::where('user_id',auth()->user()->id)->orderByDesc('id')->paginate(10);
        return view('frontend.user.order',compact('orders'));
    }


    public function password()
    {
        return view('frontend.user.password');
    }

    public function updatePassword(Request $request)
    {
        $id = auth()->user()->id;
        $request->validate([
            'old_pass' => 'required|min:8',
            'new_pass' => 'required|min:8|confirmed',
        ]);

        #Match The Old Password
        if(!Hash::check($request->old_pass, auth()->user()->password)){
            toastr()->closeButton()->addError('Old Password Doesn\'t match!');
            return redirect()->back()->with('old_pass',"Old Password Doesn't match!");
        }

        #Update the new Password
        $result = User::whereId($id)->update([
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


    public function order()
    {
        return view('frontend.order');
    }


    public function orderTrack(Request $request)
    {
        $request->validate([
            'phone'=>'required',
            'order_id'=>'required'
        ]);
        $order = Order::find($request->order_id);
        if($order==null)
        {
            toastr()->closeButton()->addError('Phone Number or Order Id not match');
            return back();
        }
        else
        {
            $orderd = Order::find($request->order_id)->where('phone', $request->phone)->first();
            if ($orderd==null)
            {
                toastr()->closeButton()->addError('Phone Number or Order Id not match');
                return back();
            }
            else
            {
                $details = OrderDetails::where('order_id', $orderd->id)->get();
                toastr()->closeButton()->addSuccess('Order Information found');
                return view('frontend.order_track', compact('details','order'));
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
