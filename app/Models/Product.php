<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'slug','category_id','brand_id','price','sell_price','offer_price','short_desc','description','ad_info','thumb_photo','photo','status','creator_role','created_by','location','qty','available_qty'
    ];

    public function category(){
        return $this->belongsTo(Category::class,'category_id','id');
    }

    public function brand(){
        return $this->belongsTo(Brand::class, 'brand_id', 'id');
    }

    public function created_by($create){
        if ($create=='admin')
        {
            dd($this->belongsTo(Admin::class, 'created_by', 'id'));
//            return $this->belongsTo(Admin::class, 'created_by', 'id');
        }
        else{
            dd($this->belongsTo(Vendor::class, 'created_by', 'id'));
//            return $this->belongsTo(Vendor::class, 'created_by', 'id');
        }

    }




}
