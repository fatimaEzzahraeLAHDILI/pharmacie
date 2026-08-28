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
        Schema::table('medicines', function (Blueprint $table) {
            // Zidna l-quantité dyal dwa
            $table->integer('stock')->default(0)->after('price'); 
            
            // Zidna l-catégorie (Antibiotique, Vitamine, etc.)
            // category w description aslan kainin (category mtla9yin, wlkin ndiro tcheck)
            // wait, we saw benefits in original but not description. Let's rely on adding them or modify them.
            if (!Schema::hasColumn('medicines', 'category')) {
                $table->string('category')->nullable()->after('stock'); 
            }
            if (!Schema::hasColumn('medicines', 'description')) {
                $table->text('description')->nullable()->after('category'); 
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('medicines', function (Blueprint $table) {
            // Bach ila drti rollback, yt-mshou had l-khounat b-tlata
            $table->dropColumn(['stock', 'category', 'description']);
        });
    }
};