@extends('site.layouts.layout')
{{-- @section('mainslide')
   <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex align-items-center">
      <div class="container" data-aos="zoom-out" data-aos-delay="100">
        <h1><span> {{ $slidedata['title'] }}</span></h1>
        <h2> {{ $slidedata['desc'] }}</h2> 
        <div class="d-flex">

          <a href="#about" class="btn-get-started scrollto">Get Started</a>
           </div>
      </div>
    </section><!-- End Hero -->
    @endsection --}}
@section('content')

<main id="main" data-aos="fade-up">

  <!-- ======= Breadcrumbs ======= -->
  <section class="breadcrumbs">
    <div class="container">

      <div class="d-flex justify-content-between align-items-center">
        <h2>{{Str::of( $category['tr_title'])->toHtmlString()}}</h2>
        <ol>
          <li><a href="index.html">Home</a></li>
          <li>Inner Page</li>
        </ol>
      </div>

    </div>
  </section><!-- End Breadcrumbs -->

  <section class="inner-page">
    <div class="container">
      {{Str::of( $category['tr_content'])->toHtmlString()}}      
    </div>
  </section>

</main><!-- End #main -->
@endsection