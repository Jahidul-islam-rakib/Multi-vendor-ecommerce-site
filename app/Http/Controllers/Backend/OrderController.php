<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderDetails;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Order::all()->sortDesc();
        return view('backend.order.index',compact('orders'));
    }

    public function show($id)
    {
        $order = Order::where('id',$id)->first();
        if($order==null)
        {
            toastr()->closeButton()->addWarning('Order Id not match');
            return redirect()->route('order.index');
        }
        else
        {
            $details = OrderDetails::where('order_id', $order->id)->get();
            return view('backend.order.order_details', compact('order','details'));
        }
    }

    public function statusUpdate(Request $request)
    {
        $id = $request->order_id;
        $order = Order::where('id',$id)->first();
        if($order==null)
        {
            toastr()->closeButton()->addWarning('Order Id not match');
            return redirect()->route('order.index');
        }
        else
        {
            $order->update([
                'status'=>$request->status
            ]);

            $details = OrderDetails::where('order_id', $order->id)->update([
                'status'=>$request->status
            ]);
            toastr()->closeButton()->addSuccess('Order Status Update');
            return redirect()->route('order.index');
        }

    }


}
