<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class UserController extends Controller
{
    private string $adminEmail;

    public function __construct()
    {
        $this->adminEmail = env('ADMIN_EMAIL', 'fatimaishrak1@gmail.com');
    }

    public function index(): JsonResponse
    {
        $users = User::query()
            ->select(['id', 'name', 'email', 'phone', 'email_verified_at', 'created_at'])
            ->orderByDesc('created_at')
            ->get();

        return response()->json($users);
    }

    public function update(Request $request, int $id): JsonResponse
    {
        $user = User::findOrFail($id);

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
            'phone' => 'nullable|string|max:20',
        ]);

        $user->update($validated);

        return response()->json([
            'message' => 'Utilisateur mis a jour avec succes',
            'user' => $user->only(['id', 'name', 'email', 'phone', 'email_verified_at', 'created_at']),
        ]);
    }

    public function destroy(int $id): JsonResponse
    {
        $user = User::findOrFail($id);

        if (strtolower($user->email) === strtolower($this->adminEmail)) {
            return response()->json([
                'message' => 'Le compte admin principal ne peut pas etre supprime',
            ], 422);
        }

        $user->delete();

        return response()->json([
            'message' => 'Utilisateur supprime avec succes',
        ]);
    }
}
