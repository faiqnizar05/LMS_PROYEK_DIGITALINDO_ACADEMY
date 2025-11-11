@extends('frontend.master')

@section('content')


<section class="breadcrumb-area pt-50px pb-50px bg-white pattern-bg">
    <div class="container">
        <div class="col-lg-8 mr-auto">
            <div class="breadcrumb-content">
                <ul class="generic-list-item generic-list-item-arrow d-flex flex-wrap align-items-center">
                    <li><a href="index.html">Beranda</a></li>
                    <li><a href="#">{{ $course['category']['name'] }}</a></li>
                    <li><a href="#">{{ $course['subcategory']['name'] }}</a></li>
                </ul>

                <div class="section-heading">
                    <h2 class="section__title">{{ $course['course_name'] }}</h2>
                    <p class="section__desc pt-2 lh-30">{{ $course['course_title'] }}</p>
                </div><!-- end section-heading -->

                <div class="d-flex flex-wrap align-items-center pt-3">

                    <h6 class="ribbon ribbon-lg mr-2 bg-3 text-white" style="text-transform: capitalize">
                        {{ $course['label'] }}</h6>

                    <div class="rating-wrap d-flex flex-wrap align-items-center">
                        <div class="review-stars">
                            <span class="rating-number">4.4</span>
                            <span class="la la-star"></span>
                            <span class="la la-star"></span>
                            <span class="la la-star"></span>
                            <span class="la la-star"></span>
                            <span class="la la-star-o"></span>
                        </div>
                        <span class="rating-total pl-1">(20.230 penilaian)</span>
                        <span class="student-total pl-2">540.815 siswa</span>
                    </div>
                </div><!-- end d-flex -->

                <p class="pt-2 pb-1">Dibuat oleh
                    <a href="teacher-detail.html" class="text-color hover-underline">{{ $course['user']['name'] }}</a>
                </p>

                <div class="d-flex flex-wrap align-items-center">
                    <p class="pr-3 d-flex align-items-center">
                        <svg class="svg-icon-color-gray mr-1" width="16px" viewBox="0 0 24 24">
                            <path
                                d="M23 12l-2.44-2.78.34-3.68-3.61-.82-1.89-3.18L12 3 8.6 1.54 6.71 4.72l-3.61.81.34 3.68L1 12l2.44 2.78-.34 3.69 3.61.82 1.89 3.18L12 21l3.4 1.46 1.89-3.18 3.61-.82-.34-3.68L23 12zm-10 5h-2v-2h2v2zm0-4h-2V7h2v6z">
                            </path>
                        </svg>
                        Terakhir diperbarui {{ \Carbon\Carbon::parse($course->updated_at)->format('d F Y') }}
                    </p>
                    <p class="pr-3 d-flex align-items-center">
                        <svg class="svg-icon-color-gray mr-1" width="16px" viewBox="0 0 24 24">
                            <path
                                d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zm6.93 6h-2.95a15.65 15.65 0 00-1.38-3.56A8.03 8.03 0 0118.92 8zM12 4.04c.83 1.2 1.48 2.53 1.91 3.96h-3.82c.43-1.43 1.08-2.76 1.91-3.96zM4.26 14C4.1 13.36 4 12.69 4 12s.1-1.36.26-2h3.38c-.08.66-.14 1.32-.14 2s.06 1.34.14 2H4.26zm.82 2h2.95c.32 1.25.78 2.45 1.38 3.56A7.987 7.987 0 015.08 16zm2.95-8H5.08a7.987 7.987 0 014.33-3.56A15.65 15.65 0 008.03 8zM12 19.96c-.83-1.2-1.48-2.53-1.91-3.96h3.82c-.43 1.43-1.08 2.76-1.91 3.96zM14.34 14H9.66c-.09-.66-.16-1.32-.16-2s.07-1.35.16-2h4.68c.09.65.16 1.32.16 2s-.07 1.34-.16 2zm.25 5.56c.6-1.11 1.06-2.31 1.38-3.56h2.95a8.03 8.03 0 01-4.33 3.56zM16.36 14c.08-.66.14-1.32.14-2s-.06-1.34-.14-2h3.38c.16.64.26 1.31.26 2s-.1 1.36-.26 2h-3.38z">
                            </path>
                        </svg>
                        Bahasa Inggris
                    </p>
                </div><!-- end d-flex -->

                <div class="bread-btn-box pt-3">
                    <button class="btn theme-btn theme-btn-sm theme-btn-transparent lh-28 mr-2 mb-2">
                        <i class="la la-heart-o mr-1"></i>
                        <span class="swapping-btn" data-text-swap="Ditambahkan ke Wishlist"
                            data-text-original="Wishlist">Wishlist</span>
                    </button>
                    <button class="btn theme-btn theme-btn-sm theme-btn-transparent lh-28 mr-2 mb-2" data-toggle="modal"
                        data-target="#shareModal">
                        <i class="la la-share mr-1"></i>Bagikan
                    </button>
                    <button class="btn theme-btn theme-btn-sm theme-btn-transparent lh-28 mb-2" data-toggle="modal"
                        data-target="#reportModal">
                        <i class="la la-flag mr-1"></i>Laporkan penyalahgunaan
                    </button>
                </div>
            </div><!-- end breadcrumb-content -->
        </div><!-- end col-lg-8 -->
    </div><!-- end container -->
</section><!-- end breadcrumb-area -->


<!--======================================
        START COURSE DETAILS AREA
======================================-->
<section class="course-details-area pb-20px">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 pb-5">
                <div class="course-details-content-wrap pt-90px">

                    <div class="course-overview-card bg-gray p-4 rounded">
                        <h3 class="fs-24 font-weight-semi-bold pb-3">Apa yang akan Anda pelajari</h3>
                        <ul class="generic-list-item overview-list-item">

                            @foreach ($course['course_goal'] as $item)
                            <li><i class="la la-check mr-1 text-black"></i> {{ $item->goal_name }}</li>
                            @endforeach


                        </ul>
                    </div><!-- end course-overview-card -->

                    <div class="course-overview-card">
                        <h3 class="fs-24 font-weight-semi-bold pb-3">Description</h3>

                        <!-- Truncated Description -->
                        <div class="">
                            {!! $course->description !!}
                        </div>


                    </div>


                    <div class="course-overview-card">
                        <div class="curriculum-header d-flex align-items-center justify-content-between pb-4">
                            <h3 class="fs-24 font-weight-semi-bold">Course content</h3>
                            <div class="curriculum-duration fs-15">
                                <span class="curriculum-total__text mr-2"><strong
                                        class="text-black font-weight-semi-bold">Total:</strong> {{$total_lecture}}
                                    lectures</span>


                                <span class="curriculum-total__hours"><strong
                                        class="text-black font-weight-semi-bold">Total hours:</strong>
                                    02:35:47</span>
                            </div>
                        </div>
                        <div class="curriculum-content">
                            <div id="accordion" class="generic-accordion">

                                @foreach ($course_content as $index => $item)
                                <div class="card">
                                    <div class="card-header" id="heading-{{ $index }}">
                                        <button class="btn btn-link d-flex align-items-center justify-content-between"
                                            data-toggle="collapse" data-target="#collapse-{{ $index }}"
                                            aria-expanded="{{ $index == 0 ? 'true' : 'false' }}"
                                            aria-controls="collapse-{{ $index }}">
                                            <i class="la la-plus"></i>
                                            <i class="la la-minus"></i>
                                            {{ $item->section_title }}
                                            <span
                                                class="fs-15 text-gray font-weight-medium">{{$item['lecture']->count()}}
                                                lectures</span>
                                        </button>
                                    </div><!-- end card-header -->
                                    <div id="collapse-{{ $index }}" class="collapse {{ $index == 0 ? 'show' : '' }}"
                                        aria-labelledby="heading-{{ $index }}" data-parent="#accordion">
                                        <div class="card-body">
                                            <ul class="generic-list-item">

                                                @foreach ($item['lecture'] as $lecture)
                                                <li>
                                                    <a href="#"
                                                        class="d-flex align-items-center justify-content-between text-color"
                                                        data-toggle="modal" data-target="">
                                                        <span>
                                                            <i class="la la-play-circle mr-1"></i>
                                                            {{ $lecture->lecture_title }}

                                                        </span>
                                                        <span>{{$lecture->video_duration}}</span>
                                                    </a>
                                                </li>
                                                @endforeach



                                            </ul>
                                        </div><!-- end card-body -->
                                    </div><!-- end collapse -->


                                </div><!-- end card -->
                                @endforeach



                            </div><!-- end generic-accordion -->
                        </div><!-- end curriculum-content -->
                    </div><!-- end course-overview-card -->

                    <div class="course-overview-card pt-4">
                        <h3 class="fs-24 font-weight-semi-bold pb-4">Siswa juga membeli</h3>
                        <div class="view-more-carousel owl-action-styled">

                            @forelse($similarCourses as $course)
                            <div class="card card-item card-item-list-layout border border-gray shadow-Tidakne">
                                <div class="card-image">
                                    <a href="course-details.html" class="d-block">
                                        <img class="card-img-top lazy" src="{{ asset($course->course_image) }}"
                                            data-src="{{ asset($course->course_image) }}" alt="Card image cap">
                                    </a>
                                    <div class="course-badge-labels">

                                        <div class="course-badge">
                                            @if ($course->bestseller == 'Ya')
                                            Bestseller
                                            @elseif($course->featured == 'Ya')
                                            Featured
                                            @else
                                            HighestRated
                                            @endif
                                        </div>

                                        <div class="course-badge blue">
                                            -{{ round((($course->selling_price - $course->discount_price) / $course->selling_price) * 100) }}%
                                        </div>


                                    </div>
                                </div><!-- end card-image -->
                                <div class="card-body">
                                    <h6 class="ribbon ribbon-blue-bg fs-14 mb-3" style="text-transform:capitalize">
                                        {{ $course->label }}
                                    </h6>
                                    <h5 class="card-title"><a
                                            href="{{ route('course-details', $course->course_name_slug) }}">{{ $course->course_name }}</a>
                                    </h5>

                                    <p class="card-text">
                                        <a href="#">
                                            {{ $course['user']['name'] }}
                                        </a>
                                    </p>

                                    <div class="rating-wrap d-flex align-items-center py-2">
                                        <div class="review-stars">
                                            <span class="rating-number">3</span>

                                        </div>
                                        <span class="rating-total pl-1">(10 ratings)</span>
                                    </div><!-- end rating-wrap -->
                                    <div class="d-flex justify-content-between align-items-center">
                                        <p class="card-price text-black font-weight-bold">
                                            ${{ $course->discount_price }} <span
                                                class="before-price font-weight-medium">{{ $course->selling_price }}</span>
                                        </p>


                                        <div class="icon-element icon-element-sm shadow-sm cursor-pointer wishlist-icon"
                                            title="Add to Wishlist" data-course-id="{{ $course->id }}">




                                        </div>


                                    </div>
                                </div><!-- end card-body -->
                            </div><!-- end card -->
                            @empty
                            <div class="alert alert-danger">
                                <p>Tidak ada course</p>
                            </div>
                            @endforelse


                        </div><!-- end view-more-carousel -->
                    </div><!-- end course-overview-card -->

                    <div class="course-overview-card pt-4">
                        <h3 class="fs-24 font-weight-semi-bold pb-4">Tentang Instruktur</h3>
                        <div class="instructor-wrap">
                            <div class="media media-card">
                                <div class="instructor-img">
                                    <a href="teacher-detail.html" class="media-img d-block">
                                        <img class="lazy" src="{{ $course['user']['photo'] }}"
                                            data-src="{{ $course['user']['photo'] }}" alt="Foto instruktur">
                                    </a>
                                    <ul class="generic-list-item pt-3">
                                        <li><i class="la la-star mr-2 text-color-3"></i> Rating Instruktur: 4.6</li>
                                        <li><i class="la la-user mr-2 text-color-3"></i> 45.786 Siswa</li>
                                        <li><i class="la la-comment-o mr-2 text-color-3"></i> 2.533 Ulasan</li>
                                        <li><i class="la la-play-circle-o mr-2 text-color-3"></i> 24 Kursus</li>
                                        <li><a href="teacher-detail.html">Lihat semua kursus</a></li>
                                    </ul>
                                </div><!-- end instructor-img -->
                                <div class="media-body">
                                    <h5><a href="#">{{ $course['user']['name'] }}</a></h5>

                                    <div class="bio-collapsible">
                                        {!! $course['user']['bio'] !!}
                                    </div>
                                </div>
                            </div>
                        </div><!-- end instructor-wrap -->
                    </div>
                    <!-- end course-overview-card -->

                    <div class="course-overview-card pt-4">
                        <h3 class="fs-24 font-weight-semi-bold pb-40px">Umpan Balik Siswa</h3>
                        <div class="feedback-wrap">
                            <div class="media media-card align-items-center">
                                <div class="review-rating-summary">
                                    <span class="stats-average__count">4.6</span>
                                    <div class="rating-wrap pt-1">
                                        <div class="review-stars">
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star-half-alt"></span>
                                        </div>
                                        <span class="rating-total d-block">(2.533)</span>
                                        <span>Penilaian Kursus</span>
                                    </div><!-- end rating-wrap -->
                                </div><!-- end review-rating-summary -->
                                <div class="media-body">
                                    <div class="review-bars d-flex align-items-center mb-2">
                                        <div class="review-bars__text">5 bintang</div>
                                        <div class="review-bars__fill">
                                            <div class="skillbar-box">
                                                <div class="skillbar" data-percent="77%">
                                                    <div class="skillbar-bar bg-3"></div>
                                                </div> <!-- End Skill Bar -->
                                            </div>
                                        </div><!-- end review-bars__fill -->
                                        <div class="review-bars__percent">77%</div>
                                    </div><!-- end review-bars -->
                                    <div class="review-bars d-flex align-items-center mb-2">
                                        <div class="review-bars__text">4 bintang</div>
                                        <div class="review-bars__fill">
                                            <div class="skillbar-box">
                                                <div class="skillbar" data-percent="54%">
                                                    <div class="skillbar-bar bg-3"></div>
                                                </div> <!-- End Skill Bar -->
                                            </div>
                                        </div><!-- end review-bars__fill -->
                                        <div class="review-bars__percent">54%</div>
                                    </div><!-- end review-bars -->
                                    <div class="review-bars d-flex align-items-center mb-2">
                                        <div class="review-bars__text">3 bintang</div>
                                        <div class="review-bars__fill">
                                            <div class="skillbar-box">
                                                <div class="skillbar" data-percent="14%">
                                                    <div class="skillbar-bar bg-3"></div>
                                                </div> <!-- End Skill Bar -->
                                            </div>
                                        </div><!-- end review-bars__fill -->
                                        <div class="review-bars__percent">14%</div>
                                    </div><!-- end review-bars -->
                                    <div class="review-bars d-flex align-items-center mb-2">
                                        <div class="review-bars__text">2 bintang</div>
                                        <div class="review-bars__fill">
                                            <div class="skillbar-box">
                                                <div class="skillbar" data-percent="5%">
                                                    <div class="skillbar-bar bg-3"></div>
                                                </div> <!-- End Skill Bar -->
                                            </div>
                                        </div><!-- end review-bars__fill -->
                                        <div class="review-bars__percent">5%</div>
                                    </div><!-- end review-bars -->
                                    <div class="review-bars d-flex align-items-center mb-2">
                                        <div class="review-bars__text">1 bintang</div>
                                        <div class="review-bars__fill">
                                            <div class="skillbar-box">
                                                <div class="skillbar" data-percent="2%">
                                                    <div class="skillbar-bar bg-3"></div>
                                                </div> <!-- End Skill Bar -->
                                            </div>
                                        </div><!-- end review-bars__fill -->
                                        <div class="review-bars__percent">2%</div>
                                    </div><!-- end review-bars -->
                                </div><!-- end media-body -->
                            </div>
                        </div><!-- end feedback-wrap -->
                    </div><!-- end course-overview-card -->


                    <div class="course-overview-card pt-4">
                        <h3 class="fs-24 font-weight-semi-bold pb-4">Ulasan</h3>
                        <div class="review-wrap">
                            <div class="d-flex flex-wrap align-items-center pb-4">
                                <form method="post" class="mr-3 flex-grow-1">
                                    <div class="form-group">
                                        <input class="form-control form--control pl-3" type="text" name="search"
                                            placeholder="Cari ulasan">
                                        <span class="la la-search search-icon"></span>
                                    </div>
                                </form>
                                <div class="select-container mb-3">
                                    <select class="select-container-select">
                                        <option value="all-rating">Semua penilaian</option>
                                        <option value="five-star">Lima bintang</option>
                                        <option value="four-star">Empat bintang</option>
                                        <option value="three-star">Tiga bintang</option>
                                        <option value="two-star">Dua bintang</option>
                                        <option value="one-star">Satu bintang</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Ulasan 1 -->
                            <div class="media media-card border-bottom border-bottom-gray pb-4 mb-4">
                                <div class="media-img mr-4 rounded-full">
                                    <img class="rounded-full lazy" src="images/img-loading.png"
                                        data-src="{{ asset('frontend/images/small-avatar-1.jpg') }}"
                                        alt="Foto pengguna">
                                </div>
                                <div class="media-body">
                                    <div class="d-flex flex-wrap align-items-center justify-content-between pb-1">
                                        <h5>Kavi Arasan</h5>
                                        <div class="review-stars">
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                        </div>
                                    </div>
                                    <span class="d-block lh-18 pb-2">1 bulan lalu</span>
                                    <p class="pb-2">
                                        Ini adalah salah satu kursus terbaik yang pernah saya ambil. Materinya sangat
                                        lengkap dan membantu saya memahami Java dan database SQL dengan lebih baik.
                                    </p>
                                    <div class="helpful-action">
                                        <span class="d-block fs-13">Apakah ulasan ini membantu?</span>
                                        <button class="btn">Ya</button>
                                        <button class="btn">Tidak</button>
                                        <span class="btn-text fs-14 cursor-pointer pl-1" data-toggle="modal"
                                            data-target="#reportModal">Laporkan</span>
                                    </div>
                                </div>
                            </div><!-- end media -->

                            <!-- Ulasan 2 -->
                            <div class="media media-card border-bottom border-bottom-gray pb-4 mb-4">
                                <div class="media-img mr-4 rounded-full">
                                    <img class="rounded-full lazy" src="images/img-loading.png"
                                        data-src="{{ asset('frontend/images/small-avatar-2.jpg') }}"
                                        alt="Foto pengguna">
                                </div>
                                <div class="media-body">
                                    <div class="d-flex flex-wrap align-items-center justify-content-between pb-1">
                                        <h5>Jitesh Shaw</h5>
                                        <div class="review-stars">
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                        </div>
                                    </div>
                                    <span class="d-block lh-18 pb-2">1 bulan lalu</span>
                                    <p class="pb-2">
                                        Kursus ini luar biasa! Penjelasannya mudah dipahami dan sangat terstruktur. Saya
                                        jadi semakin tertarik belajar Java dan SQL.
                                    </p>
                                    <div class="helpful-action">
                                        <span class="d-block fs-13">Apakah ulasan ini membantu?</span>
                                        <button class="btn">Ya</button>
                                        <button class="btn">Tidak</button>
                                        <span class="btn-text fs-14 cursor-pointer pl-1" data-toggle="modal"
                                            data-target="#reportModal">Laporkan</span>
                                    </div>
                                </div>
                            </div><!-- end media -->

                            <!-- Ulasan 3 -->
                            <div class="media media-card border-bottom border-bottom-gray pb-4 mb-4">
                                <div class="media-img mr-4 rounded-full">
                                    <img class="rounded-full lazy" src="images/img-loading.png"
                                        data-src="{{ asset('frontend/images/small-avatar-3.jpg') }}"
                                        alt="Foto pengguna">
                                </div>
                                <div class="media-body">
                                    <div class="d-flex flex-wrap align-items-center justify-content-between pb-1">
                                        <h5>Miguel Sanches</h5>
                                        <div class="review-stars">
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                            <span class="la la-star"></span>
                                        </div>
                                    </div>
                                    <span class="d-block lh-18 pb-2">2 bulan lalu</span>
                                    <p class="pb-2">
                                        Kursus ini benar-benar membantu saya memahami konsep pemrograman dengan cara
                                        yang menyenangkan. Penjelasannya detail dan aplikatif.
                                    </p>
                                    <div class="helpful-action">
                                        <span class="d-block fs-13">Apakah ulasan ini membantu?</span>
                                        <button class="btn">Ya</button>
                                        <button class="btn">Tidak</button>
                                        <span class="btn-text fs-14 cursor-pointer pl-1" data-toggle="modal"
                                            data-target="#reportModal">Laporkan</span>
                                    </div>
                                </div>
                            </div><!-- end media -->
                        </div><!-- end review-wrap -->

                        <div class="see-more-review-btn text-center">
                            <button type="button" class="btn theme-btn theme-btn-transparent">Muat lebih banyak
                                ulasan</button>
                        </div>
                    </div>
                    <!-- end course-overview-card -->
                    <div class="course-overview-card pt-4">
                        <h3 class="fs-24 font-weight-semi-bold pb-4">Tambah Ulasan</h3>
                         <form method="post" action="{{ route('review.store') }}" class="row">
                            @csrf
                        <div class="leave-rating-wrap pb-4">
                            <div class="leave-rating leave--rating">
                                <input type="radio" name="rating" id="star5" value="5" required />
                                <label for="star5"></label>
                                <input type="radio" name="rating" id="star4" value="4" required />
                                <label for="star4"></label>
                                <input type="radio" name="rating" id="star3" value="3" required />
                                <label for="star3"></label>
                                <input type="radio" name="rating" id="star2" value="2" required />
                                <label for="star2"></label>
                                <input type="radio" name="rating" id="star1" value="1" required />
                                <label for="star1"></label>
                            </div><!-- end leave-rating -->
                        </div>
                       
                            <input type="hidden" name="course_id" value="{{ $course->id }}">

                            @auth
                            <!-- Jika user sudah login, otomatis ambil data dari user -->
                            <input type="hidden" name="name" value="{{ auth()->user()->name }}">
                            <input type="hidden" name="email" value="{{ auth()->user()->email }}">
                            @else
                            <!-- Jika user belum login, tampilkan input field -->
                            <div class="input-box col-lg-6">
                                <label class="label-text">Nama <span class="text-danger">*</span></label>
                                <div class="form-group">
                                    <input class="form-control form--control" type="text" name="name"
                                        value="{{ old('name') }}" required>
                                    <span class="la la-user input-icon"></span>
                                </div>
                            </div><!-- end input-box -->
                            <div class="input-box col-lg-6">
                                <label class="label-text">Email <span class="text-danger">*</span></label>
                                <div class="form-group">
                                    <input class="form-control form--control" type="email" name="email"
                                        value="{{ old('email') }}" required>
                                    <span class="la la-envelope input-icon"></span>
                                </div>
                            </div><!-- end input-box -->
                            @endauth

                            <div class="input-box col-lg-12">
                                <label class="label-text">Pesan <span class="text-danger">*</span></label>
                                <div class="form-group">
                                    <textarea class="form-control form--control pl-3" name="message"
                                        placeholder="Tulis pesan anda disini" rows="5"
                                        required>{{ old('message') }}</textarea>
                                </div>
                            </div><!-- end input-box -->
                            <div class="btn-box col-lg-12">
                                <button class="btn theme-btn" type="submit">Kirim Ulasan</button>
                            </div><!-- end btn-box -->
                        </form>
                    </div><!-- end course-overview-card -->
                </div><!-- end course-details-content-wrap -->
            </div><!-- end col-lg-8 -->

            @include('frontend.pages.course-details.right-sidebar')

        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end course-details-area -->

<!-- Modal -->
@include('frontend.pages.course-details.course-preview-modal')

@include('frontend.pages.course-details.related-course')


@include('frontend.pages.course-details.become-teacher')



@endsection
