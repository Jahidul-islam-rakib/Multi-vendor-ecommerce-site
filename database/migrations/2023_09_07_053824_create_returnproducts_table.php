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
        Schema::create('returnproducts', function (Blueprint $table) {
            $table->id();
            $table->string('purchase_id');
            $table->string('product_name');
            $table->date('date');
            $table->integer('qty');
            $table->integer('price');
            $table->string('note')->nullable();
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
        Schema::dropIfExists('returnproducts');
    }
};
