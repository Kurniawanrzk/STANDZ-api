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
        Schema::create('land_photos', function (Blueprint $table) {
            $table->id();
            $table->foreignId('land_id')
            ->references('id')
            ->on("lands")
            ->onUpdate("cascade")
            ->onDelete("cascade");
            $table->string("file_name");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('land_photos');
    }
};
