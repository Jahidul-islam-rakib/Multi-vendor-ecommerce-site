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
        Schema::create('purchases', function (Blueprint $table) {
            $table->id();
            $table->integer('product_id');
            $table->string('invoice_no');
            $table->dateTime('purchase_date');
            $table->string('supplier');
            $table->integer('qty');
            $table->integer('price');
            $table->string('payment_type');
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
        Schema::dropIfExists('purchases');
    }
};
