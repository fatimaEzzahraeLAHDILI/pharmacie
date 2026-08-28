<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Had l-User factory khallih aw mshih, machi mouchkil
        User::factory()->create([
            'name' => 'Test User',
            'email' => 'test@example.com',
        ]);

        // Zidi had l-khet hna bach t-executi l-30 dwa li derti
        $this->call([
            MedicineSeeder::class,
        ]);
    }
}