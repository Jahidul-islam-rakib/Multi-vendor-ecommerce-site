<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Model;

class Vendor extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    protected $guard = 'vendor';
    protected $fillable = [
        'name',
        'store_name',
        'email',
        'password',
        'photo',
        'phone',
        'address',
        'info',
        'status',
        'created_by'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function created_by(){
        return $this->belongsTo(Admin::class, 'created_by', 'id');
    }
}
