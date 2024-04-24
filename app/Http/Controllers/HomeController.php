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
    public function index()
    {
        $sitedctrlr=new SiteDataController();
      $slidedata=  $sitedctrlr->getSlideData('home');
      
       
       return view('site.home',['slidedata'=> $slidedata]);
    }
}
