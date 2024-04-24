<!DOCTYPE html>
<html lang="en">
    @php
     $sitedataCtrlr=new App\Http\Controllers\Web\SiteDataController();
    $mainarr=$sitedataCtrlr->FillStaticData();
   $sittitle= $mainarr['title'];
   $sitdesc= $mainarr['desc'];
  @endphp
    @include('site.layouts.head')
@include('site.layouts.header') 
@yield('mainslide')
@yield('content')
@include('site.layouts.footer')

</html>
