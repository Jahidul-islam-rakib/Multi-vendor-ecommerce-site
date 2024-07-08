<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderDetails;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        $orders = OrderDetails::where('creator_role','vendor')->where('created_by',auth()->guard('vendor')->user()->id)->orderByDesc('id')->get();
        return view('vendor.order.index',compact('orders'));
    }

    public function show($id)
    {
        $order = Order::where('id',$id)->first();
        if($order==null)
        {
            toastr()->closeButton()->addWarning('Order Id not match');
            return redirect()->route('v_order.index');
        }
        else
        {
            $details = OrderDetails::where('order_id', $order->id)->get();
            return view('vendor.order.order_details', compact('order','details'));
        }
    }

    public function statusUpdate(Request $request)
    {
        $id = $request->order_id;
        $order = Order::where('id',$id)->first();
        if($order==null)
        {
            toastr()->closeButton()->addWarning('Order Id not match');
            return redirect()->route('v_order.index');
        }
        else
        {
            $details = OrderDetails::where('order_id', $order->id)->where('creator_role','vendor')->where('created_by',auth()->guard('vendor')->user()->id)->update([
                'status'=>$request->status
            ]);
            toastr()->closeButton()->addSuccess('Order Status Update');
            return redirect()->route('v_order.index');
        }

    }
}
