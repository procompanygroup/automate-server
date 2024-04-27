<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\Web\StorageController;
use App\Models\Setting;
use App\Models\LocationSetting;
use App\Models\Language;

//use Illuminate\Support\Facades\View;
class SiteDataController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }
    // public function getlangscod()
    // {
    //     $List = Language::select('code')->get('code');
    //     return $List;
    // }
   
    public function FillStaticData()
    {
        $strgCtrlr = new StorageController();
        $path = $strgCtrlr->SitePath('image');
        $List = Setting::select(
            'id',
            'name1',
            'value1',
            'name2',
            'value2',
            'name3',
            'value3',
            'category',
            'dep',
            'sequence',
            'section',
            'location',
            'is_active',
        )->where('category', 'site-info')
            ->orWhere('category', 'header-info')
            ->get();
        $titlerow = $List->where('category', 'site-info')->where('dep', 'title')->first();
        $title = $titlerow->value1;
        $desc = $titlerow->value2;
        $meta = $titlerow->value3;
        $logorow = $List->where('category', 'site-info')->where('dep', 'logo')->first();
        $favicon = $strgCtrlr->getPath($logorow->value1, $path);
        $favicon = ($favicon == '' ? $strgCtrlr->DefaultPath('image') : $favicon);
        $logo = $strgCtrlr->getPath($logorow->value2, $path);
        $logo = ($logo == '' ? $strgCtrlr->DefaultPath('image') : $logo);
        //header  info
        $phonerow = $List->where('category', 'header-info')->where('dep', 'phone')->first();

        $emailrow = $List->where('category', 'header-info')->where('dep', 'email')->first();

        $h_social_list = $this->getSocialbyLocation('header-social');
        $f_social_list = $this->getSocialbyLocation('footer-social');


        $mainarr = [
            "title" => $title,
            "desc" => $desc,
            "meta" => $meta,
            "favicon" => $favicon,
            "logo" => $logo,

            "phonerow" => $phonerow,
            "emailrow" => $emailrow,

            "h_social_list" => $h_social_list,
            "f_social_list" => $f_social_list,

        ];

        //View::share('sitetitle', $title);
        return $mainarr;

    }
    public function FillTransData($lang=null){
$langs=$this->getlangs($lang);
$transarr=[
    "langs" =>$langs,
];

 return$transarr;
    }
    public function getSocialbyLocation($loc)
    {
        $Dblist = LocationSetting::wherehas('location', function ($query) use ($loc) {
            $query->where('name', $loc);
        })->wherehas('setting', function ($query) {
            $query->where('is_active', 1);
        })->with('location', 'setting')->orderBy('sequence')->get();
        $List = $Dblist->map(function ($locSetting) {
            return [
                'id' => $locSetting->id,
                'name' => $locSetting->setting->value1,
                'code' => $locSetting->setting->value2,
                'link' => $locSetting->setting->value3,
                'sequence' => $locSetting->sequence,
            ];
        });

        return $List;
    }

    public function getSlideData($loc)
    {
        $slidedata = [];
        if ($loc == 'home') {
            $titlerow = Setting::where('category', 'site-info')->where('dep', 'title')->first();
            $title = $titlerow->value1;
            $desc = $titlerow->value2;

            $slidedata = [
                'title' => $title,
                'desc' => $desc
            ];
        } else {
            $slidedata = [
                'title' => '',
                'desc' => ''
            ];
        }
        return $slidedata;
    }

    public function getlangs($current_lang_code=null)
    {

        if($current_lang_code==null){
            $List = Language::where('status',1)->orderByDesc('is_default')->get();
        }else{
            $List = Language::where('status',1)->whereNot('code',$current_lang_code)->orderByDesc('is_default')->get();
            $selected = Language::where('status',1)->where('code',$current_lang_code)->first();
            $List->prepend($selected );
        }
   
        return  $List ;
    }

    //footer
    public function getfooterLocation($lang_id)
    {
        $Dblist= LocationSetting::wherehas('location', function ($query)  {
            $query->where('name','footer-social-title')
            ->orwhere('name','footer-bottom')
            ->orWhere('name','Like', '%footer-sec-%');
          })->
          wherehas('post', function ($query)  {
            $query->where('status',1);
          })
          ->with(['location',
            'post.langposts' => function ($q) use ($lang_id) {
               $q->where('lang_id', $lang_id) ;
           }])->  orderBy('sequence')->get();   

    
        $List = $Dblist->map(function ($locPost) {
if($locPost->post && $locPost->post->langposts->first()){
    return [
        'id' => $locPost->id,
        'loc_name' => $locPost->location->name,
        'tr_title' => $locPost->post->langposts->first()->title_trans,
        'tr_content' => $locPost->post->langposts->first()->content_trans,                 
        'sequence' => $locPost->sequence, 
    ];
}else{
    return [
        'id' => $locPost->id,
        'loc_name' => $locPost->location->name,
        'tr_title' => "",
        'tr_content' => "",                 
        'sequence' => $locPost->sequence, 
    ];
}
        
        });

        return $List;
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
