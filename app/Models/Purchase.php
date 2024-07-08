<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    use HasFactory;
    protected $fillable = [
        'product_id','invoice_no','purchase_date','supplier','qty','price','payment_type','note','creator_role','created_by'
    ];

    public function product_name(){
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }



}
