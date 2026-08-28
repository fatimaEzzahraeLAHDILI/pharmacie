<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    // hal mochekil"Table not found"
    // li ta t9ol Laravel yekhedem bi table medicines li deja 3andi
    protected $table = 'medicines'; 

    
     //L-khanat li mshmouh n-3emro f l-Base de données
    protected $fillable = [
        'name',
        'price',
        'dosage',
        'forme',
        'benefits',
        'image',
        'stock',
        'category',
        'description'
    ];
}