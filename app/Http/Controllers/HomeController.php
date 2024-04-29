<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Web\SiteDataController;
use App\Models\Language;
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
    public function error500()
    {
        return view('500');
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
      $transarr=$sitedctrlr->FillTransData($lang);
    //  $transarr['langs']->select('code')->get();
   //   return  $sitedctrlr->getlangscod()  ;
      //
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
    public function getcontent( $lang,$slug)
    {
     //  $formdata=$request->all();
     $langitem = Language::where('status',1)->where('code', $lang)->first();
        $sitedctrlr=new SiteDataController();
    //  $slidedata=  $sitedctrlr->getSlideData('home');
      $category=Category::where('slug',$slug)->first();
   $cat=   $sitedctrlr->getcatinfo( $langitem->id,$category->id);
   //    if(isset($formdata["lang"])){
        //$lang= $formdata["lang"];
     //   $transarr=$sitedctrlr->FillTransData( $lang);
       // $defultlang=$transarr['langs']->first();
        return view('site.content.about',['category'=>$cat,'lang'=>$lang ]);       
      
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
