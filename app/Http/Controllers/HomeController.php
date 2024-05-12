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
      $homearr= $sitedctrlr->gethomedata( $defultlang->id);
        return view('site.home',['slidedata'=> $slidedata,'lang'=>$lang, 'transarr'=>$transarr,'defultlang'=>$defultlang,'homearr'=> $homearr]);
       }else{
        $transarr=$sitedctrlr->FillTransData();
        $defultlang=$transarr['langs']->first();
        $homearr= $sitedctrlr->gethomedata( $defultlang->id);
        return view('site.home',['slidedata'=> $slidedata,'transarr'=>$transarr,'defultlang'=>$defultlang,'homearr'=> $homearr]);
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
     $sitedctrlr=new SiteDataController();    
     $langitem = Language::where('status',1)->where('code', $lang)->first();
     $catmodel= Category::where('slug',$slug)->select('id','code')->first();
     $current_path=$sitedctrlr->getpath($lang,$slug); 
if($catmodel->code=='projects'){
   $cat= $sitedctrlr->getcatwithposts( $langitem->id,$slug);
   return view('site.content.project',['category'=>$cat,'lang'=>$lang ,'current_path'=>$current_path]);  
}else if($catmodel->code=='contacts'){
 
   $cat= $sitedctrlr->getcontactinfo( $langitem->id,$slug);

   return view('site.content.contact',['category'=>$cat,'lang'=>$lang ,'current_path'=>$current_path]);  
}else{
  
   $cat= $sitedctrlr->getcatinfo( $langitem->id,$slug);
    
        return view('site.content.about',['category'=>$cat,'lang'=>$lang ,'current_path'=>$current_path]);  
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
