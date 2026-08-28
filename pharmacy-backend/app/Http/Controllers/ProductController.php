<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index() {
        return Product::all();
    }

    
    public function store(Request $request) {
        try {
            $imagePath = 'default.png';

            if ($request->hasFile('image')) {
                $request->validate([
                    'image' => 'image|mimes:jpeg,jpg,png,gif,webp|max:2048',
                ]);

                $uploadDir = public_path('uploads/medicines');
                if (!file_exists($uploadDir)) {
                    mkdir($uploadDir, 0755, true);
                }

                $file = $request->file('image');
                $fileName = time() . '_' . preg_replace('/\s+/', '_', $file->getClientOriginalName());
                $file->move($uploadDir, $fileName);
                $imagePath = 'uploads/medicines/' . $fileName;
            } elseif ($request->filled('image')) {
                $imagePath = $request->image;
            }

            // had star ta cree produit w tayhal les probleme l khanat li na9sa
            $product = Product::create([
                'name'        => $request->name,
                'price'       => $request->price,
                'stock'       => $request->stock,
                'dosage'      => $request->dosage ?? null,
                'forme'       => $request->forme ?? null,
                'benefits'    => $request->benefits ?? $request->description ?? 'Pas de notice',
                'category'    => $request->category ?? 'Médicament', //  ila kant khawya ta y3amarha bi Médicament
                'description' => $request->description ?? 'Pas de description',
                'image'       => $imagePath,
            ]);

            return response()->json([
                'message' => 'تمت الإضافة بنجاح! ✅',
                'product' => $product
            ], 201);

        } catch (\Exception $e) {
            // هاد السطر غيطلع ليك فـ الـ Network -> Response فاش يوقع مشكل
            return response()->json([
                'error' => 'Erreur technique: ' . $e->getMessage()
            ], 500);
        }
    }

    public function update(Request $request, $id) {
        $product = Product::findOrFail($id);
        $product->update($request->only([
            'name',
            'price',
            'stock',
            'dosage',
            'forme',
            'benefits',
            'category',
            'description'
        ]));
        return response()->json(['message' => 'Product updated!']);
    }

    public function destroy($id) {
        Product::findOrFail($id)->delete();
        return response()->json(['message' => 'Product deleted!']);
    }
}