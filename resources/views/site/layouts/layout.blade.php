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
    @endphp
 

 
 
<?php try{ ?> 
  @include('site.layouts.head') 
  @include('site.layouts.header') 
  @yield('mainslide')
  @yield('content')
  @include('site.layouts.footer')
<?php }catch(\Exception $e){ ?>
    {{ abort(404)}}  
<?php } ?>
</html>
