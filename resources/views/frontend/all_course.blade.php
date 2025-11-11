@extends('frontend.master')
@section('content')
<section class="breadcrumb-area section-padding img-bg-2">
    <div class="overlay"></div>
    <div class="container">
        <div class="breadcrumb-content d-flex flex-wrap align-items-center justify-content-between">
            <div class="section-heading">
                <h2 class="section__title text-white" style="text-transform: capitalize">semua kursus</h2>
            </div>
            <ul class="generic-list-item generic-list-item-white generic-list-item-arrow d-flex flex-wrap align-items-center">
                <li><a href="/">Home</a></li>
                <li>Pages</li>
                <li style="text-transform: capitalize">semua-kursus</li>
            </ul>
        </div><!-- end breadcrumb-content -->
    </div><!-- end container -->
</section>
<section class="course-area section--padding">
    <div class="container">

        <div class="filter-bar mb-4">
            <div class="filter-bar-inner d-flex flex-wrap align-items-center justify-content-between">
                <p class="fs-14">Kami menemukan <span class="text-black">{{ $all_courses->count() }}</span> kursus yang tersedia untuk Anda</p>
                <div class="d-flex flex-wrap align-items-center">
                </div>
            </div><!-- end filter-bar-inner -->
        </div><!-- end filter-bar -->
        <div class="row">
            <div class="col-lg-4">
               <div class="sidebar mb-5">
    <!-- Ubah method dari POST ke GET -->
   <form action="{{ route('all-course') }}" method="get">
    <button type="submit" class="btn btn-primary mb-2">Cari Data</button>
    
    <div class="card card-item">
        <div class="card-body">
            <h3 class="card-title fs-18 pb-2">Kategori</h3>
            <div class="divider"><span></span></div>
            @foreach ($all_category as $item)
            <div class="custom-control custom-checkbox mb-1 fs-15">
                <input type="checkbox" class="custom-control-input category-filter category-checkbox"
                    id="catCheckbox_{{$item->id}}" name="categories[]" value="{{$item->id}}"
                    {{ in_array($item->id, request('categories', [])) ? 'checked' : '' }}>
                <label class="custom-control-label custom--control-label text-black"
                    for="catCheckbox_{{$item->id}}">
                    {{$item->name}}
                </label>
            </div>
            @endforeach
        </div>
    </div><!-- end card -->
    
    <div class="card card-item">
        <div class="card-body">
            <h3 class="card-title fs-18 pb-2">Instructors</h3>
            <div class="divider"><span></span></div>
            @foreach ($instructor as $item)
            <div class="custom-control custom-checkbox mb-1 fs-15">
                <input type="checkbox" class="custom-control-input instructor-checkbox"
                    id="instructorCheckbox{{$item->id}}" name="instructor[]" value="{{$item->id}}"
                    {{ in_array($item->id, request('instructor', [])) ? 'checked' : '' }}>
                <label class="custom-control-label custom--control-label text-black"
                    for="instructorCheckbox{{$item->id}}">
                    {{$item->name}} 
                </label>
            </div><!-- end custom-control -->
            @endforeach
        </div>
    </div><!-- end card -->
</form>
</div><!-- end sidebar -->
            </div>

            <div class="col-lg-8 course-main-content" id="">
                @if($all_courses->count() > 0)
                <div class="row">
                    @foreach ($all_courses as $item)
                    <div class="col-lg-6 responsive-column-half">
                        <div class="card card-item card-preview"
                            data-tooltip-content="#powerful-business-writing-how-to-write-concisely">

                            <div class="card-image">
                                <a href="#" class="d-block">
                                    <img class="card-img-top lazy" width="200" height="200"
                                        src="{{$item->course_image}}"
                                        data-src="{{$item->course_image}}"
                                        alt="Card image cap">
                                </a>
                                <div class="course-badge-labels">
                                    <div class="course-badge">
                                        Bestseller
                                    </div>
                                    <div class="course-badge blue">
                                        -20%
                                    </div>
                                </div>

                            </div> <!-- end card-image -->

                            <div class="card-body">
                                <h6 class="ribbon ribbon-blue-bg fs-14 mb-3" style="text-transform:capitalize">beginer
                                </h6>

                                <h5 class="card-title"><a
                                        href="/course-details/{{$item->course_name_slug}}">{{$item->course_title}}</a>
                                </h5>

                                <p class="card-text">
                                    <a href="https://devexplorers.xyz/instructor/Josh%20Portila/2">
                                        {{$item->user->name}}
                                    </a>
                                </p>

                                <div class="rating-wrap d-flex align-items-center py-2">
                                    <div class="review-stars">
                                        <span class="rating-number">0.0</span>
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                    </div>
                                    <span class="rating-total pl-1">(0 ratings)</span>
                                    <span class="student-total pl-2">0 students</span>

                                </div><!-- end rating-wrap -->

                                <div class="d-flex justify-content-between align-items-center">
                                    <p class="card-price text-black font-weight-bold">
                                        {{number_format($item->discount_price)}} <span class="before-price font-weight-medium">{{number_format($item->selling_price)}}</span>
                                    </p>

                                    <div class="icon-element icon-element-sm shadow-sm cursor-pointer wishlist-icon"
                                        title="Add to Wishlist" data-course-id="7">


                                        <i class="la la-heart-o"></i>



                                    </div>

                                </div>

                            </div>

                        </div>
                    </div><!-- end col-lg-6 -->
                    @endforeach
                </div>
                
                <div class="text-center py-3">
                    <nav aria-label="Page navigation example" class="pagination-box">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <span class="page-link"><i class="la la-arrow-left"></i></span>
                            </li>
                            <li class="page-item active"><span class="page-link">1</span></li>
                            <li class="page-item disabled">
                                <span class="page-link"><i class="la la-arrow-right"></i></span>
                            </li>
                        </ul>
                    </nav>
                    <p class="fs-14 pt-2">Showing 1-{{ $all_courses->count() }} of {{ $all_courses->count() }} results</p>
                </div>
                
                @else
                <!-- Tampilan ketika tidak ada kursus -->
                <div class="row">
                    <div class="col-12">
                        <div class="card card-item text-center py-5">
                            <div class="card-body">
                                <div class="empty-state">
                                    <i class="la la-book la-5x text-muted mb-4"></i>
                                    <h3 class="card-title fs-24">Kursus Tidak Ditemukan</h3>
                                    <p class="card-text text-muted fs-16">
                                        Maaf, tidak ada kursus yang sesuai dengan filter yang Anda pilih.
                                    </p>
                                    <div class="mt-4">
                                        <a href="{{ route('all-course') }}" class="btn btn-primary btn-lg">
                                            <i class="la la-refresh mr-2"></i>Reset Filter
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endif

            </div><!-- end col-lg-8 -->
        </div><!-- end row -->
    </div><!-- end container -->
</section>
@endsection