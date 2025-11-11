<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Course;

class CourseController extends Controller
{
    public function index()
    {
        // Ambil semua kategori urut alfabet
        $categories = Category::orderBy('name', 'asc')->get();

        // Ambil daftar course per kategori
        $course_category = $categories->map(function ($category) {
            return [
                'id' => $category->id,
                'slug' => $category->slug,
                'name' => $category->name,
                'course' => Course::where('category_id', $category->id)->get(),
            ];
        });

        return view('frontend.section.course', compact('categories', 'course_category'));
    }

    public function show($slug)
    {
        // Menampilkan detail course
        $course = Course::where('slug', $slug)->firstOrFail();
        return view('frontend.section.course_detail', compact('course'));
    }
}
