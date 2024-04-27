<!DOCTYPE html>
<html lang="en">
  @php
  
 
     $sitedataCtrlr=new App\Http\Controllers\Web\SiteDataController();
    $mainarr=$sitedataCtrlr->FillStaticData();
     
  if(isset($lang)){
    $transarr=$sitedataCtrlr->FillTransData( $lang);
  }else{
    $transarr=$sitedataCtrlr->FillTransData();
  }
  
   $defultlang=$transarr['langs']->first();
   $fsectionsarr=$sitedataCtrlr->getfooterLocation($defultlang->id);  
    @endphp
  
  @include('site.layouts.head') 
  @include('site.layouts.header') 
  @yield('mainslide')
  @yield('content')
  @include('site.layouts.footer')
 
 
</html>
