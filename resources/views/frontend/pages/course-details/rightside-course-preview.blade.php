<div class="card card-item">
    <div class="card-body">
        <div class="preview-course-video">
            <a href="javascript:void(0)" data-toggle="modal" data-target="#previewModal">
                <img src="{{ asset($course->course_image) }}"
                    data-src="{{ asset($course->course_image) }}" alt="course-img"
                    class="w-100 rounded lazy">
                    
                <div class="preview-course-video-content">
                    <div class="overlay"></div>
                    <div class="play-button">
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px"
                            y="0px" viewBox="-307.4 338.8 91.8 91.8"
                            style=" enable-background:new -307.4 338.8 91.8 91.8;"
                            xml:space="preserve">
                            <style type="text/css">
                                .st0 {
                                    fill: #ffffff;
                                    border-radius: 100px;
                                }

                                .st1 {
                                    fill: #000000;
                                }
                            </style>
                            <g>
                                <circle class="st0" cx="-261.5" cy="384.7"
                                    r="45.9"></circle>
                                <path class="st1"
                                    d="M-272.9,363.2l35.8,20.7c0.7,0.4,0.7,1.3,0,1.7l-35.8,20.7c-0.7,0.4-1.5-0.1-1.5-0.9V364C-274.4,363.3-273.5,362.8-272.9,363.2z">
                                </path>
                            </g>
                        </svg>
                    </div>
                    <p class="fs-15 font-weight-bold text-white pt-3">Preview this course</p>
                </div>
            </a>
        </div><!-- end preview-course-video -->
        <div class="preview-course-feature-content pt-40px">
            <form action="/pesanan/submit" method="post" id="pesanan-form">
                @csrf
                <input type="hidden" name="course_id" value="{{ $course->id }}">
                <input type="hidden" name="instructor_id" value="{{ $course->instructor_id }}">
                <input type="hidden" name="course_title" value="{{ $course->course_title }}">
                <input type="hidden" name="price" value="{{ $course->discount_price }}">
                <p class="d-flex align-items-center pb-2">
                    <span class="fs-20 font-weight-semi-bold text-black">Rp {{ number_format($course->discount_price) }}</span>
                    <span class="before-price mx-1">Rp {{ number_format($course->selling_price) }}</span>
                    <span class="price-discount">24% off</span>
                </p>
                <p class="preview-price-discount-text pb-35px">
                    <span class="text-color-3">4 hari</span> tersisa dengan harga ini!
                </p>
                <div class="buy-course-btn-box">
                    <button type="submit" class="btn theme-btn w-100 mb-2"><i
                        class="la la-shopping-bag fs-18 mr-1"></i>Beli Sekarang</button>
                    </div>
                </form>
            <p class="fs-14 text-center pb-4">Garansi 30-hari uang kembali</p>
            <div class="preview-course-incentives">
               <h3 class="card-title fs-18 pb-2">Kursus ini mencakup</h3>
<ul class="generic-list-item pb-3">
    <li><i class="la la-play-circle-o mr-2 text-color"></i>2,5 jam video sesuai permintaan</li>
    <li><i class="la la-file mr-2 text-color"></i>34 artikel</li>
    <li><i class="la la-file-text mr-2 text-color"></i>12 sumber daya yang dapat diunduh</li>
    <li><i class="la la-code mr-2 text-color"></i>51 latihan pemrograman</li>
    <li><i class="la la-key mr-2 text-color"></i>Akses seumur hidup penuh</li>
    <li><i class="la la-television mr-2 text-color"></i>Dapat diakses di ponsel dan TV</li>
    <li><i class="la la-certificate mr-2 text-color"></i>Sertifikat penyelesaian</li>
</ul>

                <div class="section-block"></div>
                <div class="buy-for-team-container pt-4">
                  <h3 class="fs-18 font-weight-semi-bold pb-2">Melatih 5 orang atau lebih?</h3>
<p class="lh-24 pb-3">Berikan tim Anda akses ke lebih dari 3.000 kursus terbaik di Aduca, kapan pun dan di mana pun.</p>
<a href="for-business.html" class="btn theme-btn theme-btn-sm theme-btn-transparent lh-30 w-100">
    Coba Aduca untuk Bisnis
</a>

                </div>
            </div><!-- end preview-course-incentives -->
        </div><!-- end preview-course-content -->
    </div>
</div><!-- end card -->
<script src="https://app.sandbox.midtrans.com/snap/snap.js" data-client-key="{{ config('midtrans.client_key') }}"></script>

<script>
$(document).ready(function() {
    $('#pesanan-form').submit(function(event) {
        event.preventDefault();

        var formData = $(this).serialize();

        Swal.fire({
            title: 'Confirm?',
            text: "Apakah anda ingin melanjutkan proses ini?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Ya, Pesan Sekarang!',
            cancelButtonText: 'Tidak'
        }).then((result) => {
            if (result.isConfirmed) {
               
                Swal.fire({
                    title: 'Loading...',
                    text: 'Mohon tunggu pesanan sedang diproses.',
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading()
                    }
                });

                $.ajax({
                    url: "/pesanan/submit",
                    type: 'POST',
                    data: formData,
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    success: function(response) {
                        Swal.close();
                        
                        if (response.status === 'success') {
                            snap.pay(response.snap_token, {
                                onSuccess: function(result) {
                                    Swal.fire('Success!', 'Pembayaran berhasil', 'success');
                                },
                                onPending: function(result) {
                                    Swal.fire('Pending', 'Menunggu pembayaran', 'info');
                                },
                                onError: function(result) {
                                    Swal.fire('Error', 'Terjadi kesalahan saat pembayaran', 'error');
                                }
                            });
                        } else {
                            Swal.fire('Error', response.message, 'error');
                        }
                    },
                    error: function(xhr, status, error) {
                        Swal.close();
                        let errorMessage = 'Terjadi kesalahan';
                        
                        if (xhr.responseJSON && xhr.responseJSON.message) {
                            errorMessage = xhr.responseJSON.message;
                        }
                        
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: errorMessage
                        });
                    }
                });
            }
        });
    });
});
</script>