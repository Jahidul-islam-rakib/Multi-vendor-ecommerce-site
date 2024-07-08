<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'slug','details','status','photo','creator_role','created_by'
    ];

    public function created_by($create){
        if ($create=='admin')
        {
            return $this->belongsTo(Admin::class, 'created_by', 'id');
        }
        else{
            return $this->belongsTo(Vendor::class, 'created_by', 'id');
        }

    }
}
