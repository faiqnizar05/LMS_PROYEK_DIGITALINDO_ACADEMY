<div class="sidebar-wrapper" data-simplebar="true">
    <div class="sidebar-header">
        <div>
            <img src="{{asset('backend/assets/images/logo_da.jpg')}}" class="logo-icon" alt="logo icon">
        </div>
        <div>
            <h4 class="logo-text">Admin</h4>
        </div>
        <div class="toggle-icon ms-auto"><i class='bx bx-arrow-back'></i>
        </div>
    </div>
    <!--navigation-->
    <ul class="metismenu" id="menu">
        <li class="{{ setSidebar(['admin.dashboard']) }}">
            <a href="{{route('admin.dashboard')}}">
                <div class="parent-icon"><i class='bx bx-category'></i>
                </div>
                <div class="menu-title">Dashboard</div>
            </a>

        </li>

        <li class="{{ setSidebar(['admin.category*', 'admin.subcategory*']) }}">
            <a href="javascript:;" class="has-arrow">

                <div class="parent-icon"><i class="bx bx-category"></i>
                </div>
                <div class="menu-title">Kelola Kategori</div>
            </a>
            <ul>
                <li  class="{{ setSidebar(['admin.category*']) }}">
                     <a href="{{route('admin.category.index')}}"><i class='bx bx-radio-circle'></i>Semua Kategori</a>
                </li>
                <li class="{{ setSidebar(['admin.subcategory*']) }}" >
                    <a href="{{route('admin.subcategory.index')}}"><i class='bx bx-radio-circle'></i>Semua Subkategori</a>
                </li>

            </ul>
        </li>

        <li  class="{{ setSidebar(['admin.instructor.index', 'admin.instructor.active']) }}">
            <a href="javascript:;" class="has-arrow">
                <div class="parent-icon"><i class="bx bx-category"></i>
                </div>
                <div class="menu-title">Kelola Instruktur</div>
            </a>
            <ul>
                <li class="{{ setSidebar(['admin.instructor.index']) }}">
                    <a href="{{route('admin.instructor.index')}}"><i class='bx bx-radio-circle'></i>Semua Instruktur</a>
                </li>
                <li class="{{ setSidebar(['admin.instructor.active']) }}">
                    <a href="{{route('admin.instructor.active')}}"><i class='bx bx-radio-circle'></i>Instruktur Aktif</a>
                </li>

            </ul>
        </li>


        <li class="{{ setSidebar(['admin.course*']) }}">
            <a href="javascript:;" class="has-arrow">
                <div class="parent-icon"><i class="bx bx-category"></i>
                </div>
                <div class="menu-title">Kelola Kursus</div>
            </a>
            <ul>
                <li class="{{ setSidebar(['admin.course*']) }}">
                    <a href="{{route('admin.course.index')}}"><i class='bx bx-radio-circle'></i>Semua Kursus</a>
                </li>


            </ul>
        </li>

         <li class="{{ setSidebar(['admin.order*']) }}">
            <a href="javascript:;" class="has-arrow">
                <div class="parent-icon"><i class="bx bx-category"></i>
                </div>
                <div class="menu-title">Kelola Pesanan</div>
            </a>
            <ul>
                <li class="{{ setSidebar(['admin.order*']) }}">
                    <a href="{{route('admin.order.index')}}"><i class='bx bx-radio-circle'></i>Semua Pesanan</a>
                </li>


            </ul>
        </li>



        <li class="{{ setSidebar(['admin.slider*', 'admin.info*', 'admin.partner*', 'admin.subscriber*', 'admin.site-setting*', 'admin.page-setting*']) }}">
            <a href="javascript:;" class="has-arrow">

                <div class="parent-icon"><i class="bx bx-category"></i>
                </div>
                <div class="menu-title">Pengaturan Aplikasi</div>
            </a>
            <ul>

                <li class="{{ setSidebar(['admin.slider*']) }}">
                    <a href="{{route('admin.slider.index')}}"><i class='bx bx-radio-circle'></i>Kelola Banner</a>
                </li>

                <li class="{{ setSidebar(['admin.info*']) }}">
                    <a href="{{route('admin.info.index')}}"><i class='bx bx-radio-circle'></i>Kelola Informasi</a>
                </li>

                 <li class="{{ setSidebar(['admin.partner*']) }}">
                    <a href="{{route('admin.partner.index')}}"><i class='bx bx-radio-circle'></i>Kelola Mitra</a>
                </li>

                 <li class="{{ setSidebar(['admin.site-setting*']) }}">
                    <a href="{{route('admin.site-setting.index')}}"><i class='bx bx-radio-circle'></i>Pengaturan Situs</a>
                </li>


            </ul>
        </li>




         <li>
            <a href="javascript:;" class="has-arrow">
                <div class="parent-icon"><i class="bx bx-category"></i>
                </div>
                <div class="menu-title">Pengaturan Konfigurasi</div>
            </a>
            <ul>

                <li> <a href="{{route('admin.mailSetting')}}"><i class='bx bx-radio-circle'></i>Mail Setting</a>
                </li>

                <li>
                    <a href="{{route('admin.stripeSetting')}}"><i class='bx bx-radio-circle'></i>Stripe Setting</a>
                </li>

                <li>
                    <a href="{{route('admin.googleSetting ')}}"><i class='bx bx-radio-circle'></i>Google Setting</a>
                </li>


            </ul>
        </li>





    </ul>
    <!--end navigation-->
</div>
