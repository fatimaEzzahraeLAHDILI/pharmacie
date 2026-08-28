<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class OrdonnanceController extends Controller
{
    public function upload(Request $request)
    {
        $request->validate([
            'ordonnance' => 'required|image|mimes:jpeg,jpg,png,webp|max:4096',
        ]);

        $uploadDir = public_path('uploads/ordonnances');
        if (!file_exists($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }

        $file = $request->file('ordonnance');
        $fileName = time() . '_' . preg_replace('/\s+/', '_', $file->getClientOriginalName());
        $file->move($uploadDir, $fileName);

        $relativePath = 'uploads/ordonnances/' . $fileName;

        return response()->json([
            'message' => 'Ordonnance envoyée avec succès',
            'path' => $relativePath,
            'url' => url($relativePath),
        ], 201);
    }
}
