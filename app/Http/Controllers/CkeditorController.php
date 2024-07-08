<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CkeditorController extends Controller
{
    public function imageUpload(Request $request){
        if ($request->hasFile('upload'))
        {
            $image    =     $request->file('upload');
            $img_name =     "ckeditor_".time().".".$image->getClientOriginalExtension();
            $image->move('upload/ckeditor',$img_name);
            $url = asset('/').'upload/ckeditor/'.$img_name;
            return response()->json(['fileName'=>$img_name,'uploaded'=>1,'url'=>$url]);
        }
    }


}
