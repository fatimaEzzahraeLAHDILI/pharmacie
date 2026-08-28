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
        Schema::create('medicines', function (Blueprint $table) {
            $table->id();
            $table->string('name');           // Smyt d-dwa
            $table->decimal('price', 8, 2);   // T-taman (ex: 25.50)
            $table->text('benefits');         // L-fawa2id w l-isti3mal
            $table->string('category');       // L-asnaf (ex: Grippe, Vitamin...)
            $table->string('image')->nullable(); // Path dial t-tswira (ila bghiti t-zidha)
            $table->timestamps();
            
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('medicines');
    }
};
