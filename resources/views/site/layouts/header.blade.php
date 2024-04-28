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
            @foreach ($menuarr as $item)
            <li  @if(sizeof($item['sons'])) 
              class="dropdown"  @endif >           
              <a class="nav-link scrollto" href="{{ url('/lang'.'/'.$transarr['langs']->first()->code.'/about') }}">
              <span>{{Str::of($item['tr_title'])->toHtmlString()}}</span>
              @if(sizeof($item['sons']))             
              <i class="bi bi-chevron-down"></i> @endif </a>
              @if(sizeof($item['sons'])) 
             
              <ul>
                @foreach ($item['sons'] as $subitem)
                <li><a href="#">{{Str::of( $subitem['tr_title'])->toHtmlString()}}</a></li>
                @endforeach
              </ul>
              @endif
            </li>
          
            @endforeach
           
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
  
    
  