<?php

namespace App\Http\Controllers\frontend;

use App\Models\User;
use App\Models\Course;
use App\Models\Slider;
use App\Models\InfoBox;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Models\CourseLecture;
use App\Models\CourseSection;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class FrontendDashboardController extends Controller
{
    public function home()
    {

        $all_sliders = Slider::all();
        $all_info = InfoBox::all();

        $all_categories = Category::inRandomOrder()->limit(6)->get();
        $categories = Category::all();
        $course_category = Category::with('course', 'course.user', 'course.course_goal')->get();
        $allCourse = Course::all();
        // dd($course);
        return view('frontend.home', compact('all_sliders', 'all_info', 'all_categories', 'categories', 'course_category', 'allCourse'));
    }

    public function view($slug)
    {

        $course = Course::where('course_name_slug', $slug)->with('category', 'subcategory', 'user')->first();
        $total_lecture = CourseLecture::where('course_id', $course->id)->count();
        $course_content = CourseSection::where('course_id', $course->id)->with('lecture')->get();

        // Get the currently authenticated user's ID
        $userId = Auth::id();

        // Fetch similar courses but exclude those already ordered by the student
        $similarCourses = Course::where('category_id', $course->category_id)
            ->where('id', '!=', $course->id)->get();

        $all_category = Category::orderBy('name', 'asc')->get();

        //more course instructor

        $more_course_instructor = Course::where('instructor_id', $course->instructor_id)->where('id', '!=', $course->id)->with('user')->get();

        $total_lecture = CourseLecture::where('course_id', $course->id)->count();


        $total_minutes = CourseLecture::where('course_id', $course->id)->sum('video_duration');

        $hours = floor($total_minutes / 60);
        $minutes = floor($total_minutes % 60);
        $seconds = round(($total_minutes - floor($total_minutes)) * 60);

        $total_lecture_duration = sprintf('%02d:%02d:%02d', $hours, $minutes, $seconds);


        return view('frontend.pages.course-details.index', compact('course', 'total_lecture', 'course_content', 'similarCourses', 'all_category', 'more_course_instructor', 'total_minutes', 'total_lecture_duration'));
    }

    public function all_course(Request $request)
    {
        // Ambil parameter filter dari berbagai sumber
        $selectedCategories = $request->input('categories', []);
        $selectedInstructors = $request->input('instructor', []);
        $searchQuery = $request->input('search', '');
        
        // Jika categories berupa string (dari single click), konversi ke array
        if (!is_array($selectedCategories)) {
            $selectedCategories = [$selectedCategories];
        }
        
        // Query dasar
        $query = Course::with(['category', 'user']);
        
        // Filter pencarian jika ada
        if (!empty($searchQuery)) {
            $query->where(function($q) use ($searchQuery) {
                $q->where('course_title', 'LIKE', "%{$searchQuery}%")
                ->orWhereHas('user', function($userQuery) use ($searchQuery) {
                    $userQuery->where('name', 'LIKE', "%{$searchQuery}%");
                })
                ->orWhereHas('category', function($categoryQuery) use ($searchQuery) {
                    $categoryQuery->where('name', 'LIKE', "%{$searchQuery}%");
                });
            });
        }
        
        // Filter kategori jika ada
        if (!empty($selectedCategories)) {
            $query->whereIn('category_id', $selectedCategories);
        }
        
        // Filter instructor jika ada
        if (!empty($selectedInstructors)) {
            $query->whereIn('instructor_id', $selectedInstructors);
        }
        
        $all_courses = $query->get();
        $all_category = Category::all();
        $instructor = User::where('role','instructor')->get();
        
        return view('frontend.all_course', compact(
            'all_courses', 
            'all_category', 
            'instructor', 
            'selectedCategories', 
            'selectedInstructors',
            'searchQuery'
        ));
    }
}
