<?php

namespace Database\Seeders;

use App\Models\Admin;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //Admin
        Admin::create([
            'name'=>'Admin',
            'email'=>'admin@gmail.com',
            'password'=>Hash::make('12345678'),
            'phone'=>'+880 1797948994',
            'status'=>'active',
        ]);
        Admin::create([
            'name'=>'Rakib',
            'email'=>'rakib@gmail.com',
            'password'=>Hash::make('1234'),
            'phone'=>'+880 1797948995',
            'status'=>'active',
        ]);
    }
}
