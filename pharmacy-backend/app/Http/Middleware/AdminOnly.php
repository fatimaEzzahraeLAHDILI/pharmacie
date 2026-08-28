<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AdminOnly
{
    public function handle(Request $request, Closure $next): Response
    {
        $adminEmail = strtolower((string) env('ADMIN_EMAIL', 'fatimaishrak1@gmail.com'));
        $userEmail = strtolower((string) $request->user()?->email);

        if (!$request->user() || $userEmail !== $adminEmail) {
            return response()->json(['message' => 'Accès administrateur requis.'], 403);
        }

        return $next($request);
    }
}