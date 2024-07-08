<?php

namespace Database\Seeders;

use App\Models\Vendor;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class VendorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //vendor
        Vendor::create([
            'name'=>'seller',
            'store_name'=>'Abc Shop',
            'address'=>'Mirpur 10',
            'email'=>'seller@gmail.com',
            'password'=>Hash::make('12345678'),
            'phone'=>'+880 1797948994',
            'status'=>'active',
        ]);
    }
}
