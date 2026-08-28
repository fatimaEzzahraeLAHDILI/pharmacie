<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Medicine;

class MedicineController extends Controller
{
    // récupérer les médicaments
    public function index()
    {
        $medicines = Medicine::all();
        return response()->json($medicines);
    }

    // ajouter médicament
    public function store(Request $request)
    {
        $medicine = Medicine::create([
            'name' => $request->name,
            'price' => $request->price,
            'image' => $request->image
        ]);

        return response()->json($medicine);
    }
}