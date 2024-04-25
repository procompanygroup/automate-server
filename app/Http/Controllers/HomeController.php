<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Web\SiteDataController;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
     // $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return 'Illuminate\View\View'
     */
    public function index(Request $request, $lang=null)
    {
        $formdata=$request->all();
     
        $sitedctrlr=new SiteDataController();
      $slidedata=  $sitedctrlr->getSlideData('home');
     if(isset($formdata['lang']))
     {
        $lang=$formdata['lang'];
     } 
       if(isset($lang)){
      //  $lang= $formdata["lang"];
      $transarr=$sitedctrlr->FillTransData($lang);
      $defultlang=$transarr['langs']->first();
        return view('site.home',['slidedata'=> $slidedata,'lang'=>$lang, 'transarr'=>$transarr,'defultlang'=>$defultlang]);
       }else{
        $transarr=$sitedctrlr->FillTransData();
        $defultlang=$transarr['langs']->first();
        return view('site.home',['slidedata'=> $slidedata,'transarr'=>$transarr,'defultlang'=>$defultlang]);
       }
      
    }
    public function about( $lang=null)
    {
     //  $formdata=$request->all();
     
        $sitedctrlr=new SiteDataController();
      $slidedata=  $sitedctrlr->getSlideData('home');
      if(isset($lang)){
   //    if(isset($formdata["lang"])){
        //$lang= $formdata["lang"];
        $transarr=$sitedctrlr->FillTransData( $lang);
        $defultlang=$transarr['langs']->first();
        return view('site.company.about',['slidedata'=> $slidedata,'lang'=>$lang,'transarr'=>$transarr,'defultlang'=>$defultlang]);
       }else{
        $transarr=$sitedctrlr->FillTransData();
        $defultlang=$transarr['langs']->first();
        return view('site.company.about',['slidedata'=> $slidedata,'transarr'=>$transarr,'defultlang'=>$defultlang]);
       }
      
    }
    public function changelang($lang)
    {
        $sitedctrlr=new SiteDataController();
        $slidedata=  $sitedctrlr->getSlideData('home');
      // return redirect()->back()->with(['lang'=>$lang]);
       return view('site.home',['slidedata'=> $slidedata,'lang'=>$lang]);
     //  return view('site.home',['slidedata'=> $slidedata]);
    }
}
