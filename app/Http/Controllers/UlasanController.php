<?php

namespace App\Http\Controllers;

use App\Models\Ulasan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UlasanController extends Controller
{
     public function store(Request $request)
    {
        // Validasi data
        $validator = Validator::make($request->all(), [
            'course_id' => 'required|exists:courses,id',
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'rating' => 'required|integer|between:1,5',
            'message' => 'required|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        // Cek apakah user sudah login
        $userId = auth()->check() ? auth()->id() : null;

        // Jika user login, gunakan data dari user
        if ($userId) {
            $name = auth()->user()->name;
            $email = auth()->user()->email;
        } else {
            $name = $request->name;
            $email = $request->email;
        }


        // Simpan review
        Ulasan::create([
            'course_id' => $request->course_id,
            'user_id' => $userId,
            'name' => $name,
            'email' => $email,
            'rating' => $request->rating,
            'message' => $request->message,
            'is_approved' => false, // Default perlu approval admin
        ]);

        return redirect()->back()
            ->with('success', 'Ulasan Anda berhasil dikirim dan menunggu persetujuan admin.');
    }

    // Method untuk menampilkan review yang approved
    public function getApprovedReviews($courseId)
    {
        return Ulasan::with('user')
            ->where('course_id', $courseId)
            ->approved()
            ->latest()
            ->get();
    }
}
