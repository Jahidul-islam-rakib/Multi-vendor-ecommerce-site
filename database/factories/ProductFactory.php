<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => fake()->text(50),
            'slug' => fake()->slug('4'),
            'category_id' => 1,
            'brand_id' => 1, // password
            'price' => 1000,
            'sell_price' => 1000,
            'offer_price' => 1000,
            'short_desc' => fake()->text(100),
            'description' => fake()->text(100),
            'ad_info' => fake()->text(100),
            'thumb_photo' => fake()->imageUrl('60','60'),
            'creator_role'=>'admin',
            'created_by'=>1,
        ];
    }
}
