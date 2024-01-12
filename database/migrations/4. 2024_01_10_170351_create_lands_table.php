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
        Schema::create('lands', function (Blueprint $table) {
            $table->id();
            $table->string('land_name', 100);
            $table->string('location', 100);
            $table->string('surface_area',50);
            $table->string('deskripsi');
            $table->string('rental_price');
            $table->foreignId('landowner_id')
            ->references('id')
            ->on('landowners')
            ->onDelete("cascade")
            ->onUpdate("cascade");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lands');
    }
};
