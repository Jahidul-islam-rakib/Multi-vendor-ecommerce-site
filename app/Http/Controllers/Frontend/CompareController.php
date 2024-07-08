<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class CompareController extends Controller
{
    public function addToCompare($slug){
        $product = Product::where('slug',$slug)->first();
        $compare = \session()->has('compare') ? \session()->get('compare') : [];

        if (key_exists('c'.$product->id, $compare)){
            return response()->json([
                'message'=>'Already Added to Compare'
            ]);
        }else{
            $compare['c'.$product->id] = [
                'id' =>  $product->id,
                'slug' =>  $product->slug,
                'name'       =>  $product->name,
                'image'      =>  $product->thumb_photo,
                'description'      =>  $product->short_desc,
                'sell_price'      =>  $product->sell_price,
                'offer_price'      =>  $product->offer_price,
            ];
        }

        \session(['compare'=>$compare]);

        return response()->json([
            'message'=>'New item added to compare'
        ]);
    }

    public function allItems(){
        $compare = \session()->has('compare') ? \session()->get('compare') : [];
        return view('frontend.compare', compact('compare'));
    }

    public function deleteItem(Request $request){
        $compare = \session()->has('compare') ? \session()->get('compare') : [];
        foreach ($compare as $key => $item){
            if ($item['id']==$request->id){
                unset($compare[$key]);
            }
            session(['compare'=>$compare]);
        }
        toastr()->closeButton()->addSuccess('Item remove from compare');
        return redirect()->route('compare');
    }

    public function compare(){
        $compare = \session()->has('compare') ? \session()->get('compare') : [];
        $comp=0;
        foreach ($compare as $item){
            $comp++;
        }
        return response()->json([
            'comp'=>$comp
        ]);
    }

}
