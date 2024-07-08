<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Returnproduct extends Model
{
    use HasFactory;
    protected $fillable = [
      'product_name','date','qty','creator_role','created_by','purchase_id','note','price'
    ];

}
