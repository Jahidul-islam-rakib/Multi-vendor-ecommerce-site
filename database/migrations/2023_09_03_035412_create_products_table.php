<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->string('slug')->unique();
            $table->integer('category_id');
            $table->integer('brand_id')->nullable();
            $table->string('price');
            $table->string('sell_price');
            $table->string('offer_price')->nullable();
            $table->string('short_desc');
            $table->text('description');
            $table->text('ad_info');
            $table->string('thumb_photo');
            $table->string('photo')->nullable();
            $table->string('location')->nullable();
            $table->text('tags')->nullable();
            $table->integer('qty')->default(0);
            $table->integer('available_qty')->default(0);
            $table->tinyInteger('status')->default(0);
            $table->string('creator_role');
            $table->integer('created_by');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
