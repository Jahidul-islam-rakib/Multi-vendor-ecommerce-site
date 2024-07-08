<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // user
        User::create([
            'name'=>'Customer',
            'email'=>'user@gmail.com',
            'password'=>Hash::make('123456'),
            'phone'=>'+880 1797948994',
            'status'=>'active',
        ]);
    }
}
