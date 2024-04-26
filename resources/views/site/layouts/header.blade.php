
<body>
    <!-- ======Top Bar ======= -->
    <section id="topbar" class="d-flex align-items-center">
      <div class="container d-flex justify-content-center justify-content-md-between">
        <div class="contact-info d-flex align-items-center">
          @if($mainarr['emailrow']->is_active==1)
          <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:{{$mainarr['emailrow']->value1}}">{{ $mainarr['emailrow']->value1 }}</a></i>
          @endif
          @if($mainarr['phonerow']->is_active==1)
          <i class="bi bi-phone d-flex align-items-center ms-4"><span>{{ $mainarr['phonerow']->value1 }}</span></i>
          @endif
        </div>
        <div class="social-links d-none d-md-flex align-items-center">
          @foreach ($mainarr['h_social_list'] as $socialrow )           
          <a href="{{ $socialrow['link'] }}" class="{{ $socialrow['code'] }}"><i class="bi bi-{{$socialrow['code']}}"></i></a>
          @endforeach
    
        </div>
      </div>
    </section>
  
    <!-- ======= Header ======= -->
    <header id="header" class="d-flex align-items-center">
      <div class="container d-flex align-items-center justify-content-between">
  
        {{-- <h1 class="logo"><a href="index.html">BizLand<span>.</span></a></h1> --}}
        <!-- Uncomment below if you prefer to use an image logo -->
        <a href="index.html" class="logo"><img src="{{ $mainarr['logo']}}" alt=""></a>
  
        <nav id="navbar" class="navbar">
          <ul>
            <li><a class="nav-link scrollto active" href="{{ url('lang',$transarr['langs']->first()->code)}}">Home</a></li>
            <li><a class="nav-link scrollto" href="{{ url('/lang'.'/'.$transarr['langs']->first()->code.'/about') }}">Company</a></li>
            <li><a class="nav-link scrollto" href="#services">Services</a></li>
            
            <li><a class="nav-link scrollto" href="#team">Team</a></li>
            <li class="dropdown"><a href="#"><span>Drop Down {{ $defultlang->code }}</span> <i class="bi bi-chevron-down"></i></a>
              <ul>
                <li><a href="#">Drop Down 1</a></li>
                <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                  <ul>
                    <li><a href="#">Deep Drop Down 1</a></li>
                    <li><a href="#">Deep Drop Down 2</a></li>
                    <li><a href="#">Deep Drop Down 3</a></li>
                    <li><a href="#">Deep Drop Down 4</a></li>
                    <li><a href="#">Deep Drop Down 5</a></li>
                  </ul>
                </li>
                <li><a href="#">Drop Down 2</a></li>
                <li><a href="#">Drop Down 3</a></li>
                <li><a href="#">Drop Down 4</a></li>
              </ul>
            </li>
            <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
            <li class="dropdown"><a href="#"><img class="selected-lang-img"  width="25" height="20" src="{{$defultlang->image_path}}">
              <span>{{$defultlang->name }}</span><i class="bi bi-chevron-down"></i></a>
              <ul>
                @foreach ( $transarr['langs']->skip(1) as $langrow )
                <li><a class="lang-menu" 
 
                  href="{{route(\Illuminate\Support\Facades\Route::currentRouteName(),['lang' => $langrow->code])}}">
                  <img  width="25" height="20" src="{{$langrow->image_path}}"><span class="lang-menu-name">{{ $langrow->name }}</span></a></li>
                @endforeach
             
              </ul>
            </li>
          </ul>
          <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->
  
      </div>
    </header><!-- End Header -->
  
    
  