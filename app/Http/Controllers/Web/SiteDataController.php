<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\Web\StorageController;
use App\Models\Setting;
use App\Models\LocationSetting;
use App\Models\Language;
use App\Models\Category;
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
    //mainmenu
    public function getmainmenu($lang_id)
    {
        $Dblist= LocationSetting::wherehas('location', function ($query)  {
            $query->where('name','main-menu');
          })->
          wherehas('post', function ($query)  {
            $query->where('status',1);
          })
          ->
          orWhereHas('category', function ($query)  {
            $query->where('status',1);
          })
          ->with(['location',
            'post.langposts' => function ($q) use ($lang_id) {
               $q->where('lang_id', $lang_id) ;
           },
            'category.langposts' => function ($q) use ($lang_id) {
               $q->where('lang_id', $lang_id) ;
           }])->  orderBy('sequence')->get();   

    
        $List = $Dblist->map(function ($locPost) use($lang_id){
//if($locPost->post && $locPost->post->langposts->first()){
    $tr_title='';
    $tr_content ='';
    $slug ='';
    $sons=[];
    $code='';
    if($locPost->category_id>0 && $locPost->category->langposts->first()){
        $tr_title=$locPost->category->langposts->first()->title_trans;
        $slug=$locPost->category->slug;
        $code=$locPost->category->code;
      //  $tr_content =$locPost->category->langposts->first()->content_trans;
   $sons=  $this->mapcategorylist($locPost->category->sons->where('status',1),$lang_id);
    }else if($locPost->post_id>0 && $locPost->post->langposts->first()){
        $tr_title=$locPost->post->langposts->first()->title_trans;
        $slug=$locPost->post->slug;
        $code=$locPost->post->code;
    //    $tr_content =$locPost->post->langposts->first()->content_trans;
    } 
    return [
        'id' => $locPost->id,
        'category_id' => $locPost->category_id,
        'post_id' => $locPost->post_id,
        'loc_name' => $locPost->location->name,
        'tr_title' => $tr_title,
       // 'tr_content' => $locPost->post->langposts->first()->content_trans,                 
        'sequence' => $locPost->sequence, 
        'sons' =>$sons, 
        'slug' => $slug,
        'code'=> $code,
       
    ];
 
        
        });

        return $List;
    }
    public function mapcategorylist($Dblist,$lang_id)
    {
        $List = $Dblist->map(function ($category) use($lang_id){
         
                $tr_title='';
                $tr_content ='';
                $transcat=$category->langposts->where('lang_id',$lang_id)->first();
                if($transcat){
                    $tr_title=$transcat->title_trans;
                  //  $tr_content =$locPost->category->langposts->first()->content_trans;
                } 
                $slug=$category->slug;
                $sons=$this->mapcategorylist($category->sons->where('status',1),$lang_id);
                return [
                    'id' =>0,
                    'category_id' => $category->id,
                    'post_id' => 0,
                    'loc_name' =>'',
                    'tr_title' => $tr_title,
                   // 'tr_content' => $locPost->post->langposts->first()->content_trans,                 
                    'sequence' => 0, 
                    'sons' => $sons, 
                    'slug' => $slug, 
                    'code'=>$category->code,
                ];
            
                    
                    });
            
                    return $List;
    }
    public function getcatinfo($lang_id,$slug)
    {
        $Dbitem= Category::with([ 
            'langposts' => function ($q) use ($lang_id) {
               $q->where('lang_id', $lang_id) ;
           },'sons'])->orderBy('sequence')->where('slug',$slug)->first();   

           $item =$this->mapcategory($Dbitem,$lang_id);
        //   return $item;
     
        return  $item;
    }

    public function mapcategory($category,$lang_id){
        $tr_title='';
$tr_content='';
        if( $category->langposts->first()){
            $tr_title= $category->langposts->first()->title_trans;
            $tr_content= $category->langposts->first()->content_trans;
        }
 
$sons=$this->mapcategorylist($category->sons,$lang_id);
        return [
            'id' =>$category->id,
            'title'=>$category->title,
            'slug'=>$category->slug,
            'desc'=>$category->desc,
            'meta_key'=>$category->meta_key,
            'parent_id'=>$category->parent_id,
            'sequence'=>$category->sequence,
            'status'=>$category->status,             
            'notes'=>$category->notes,    
            'code'=>$category->code,
            'tr_title' => $tr_title,
            'tr_content' =>$tr_content,                 
           
            'sons' => $sons, 
           
        ];
    }
public $mainpathArr =[];
    //getpath
    public function getpath($lang_code,$slug)
    {
        $curentlang=Language::where('code',$lang_code)->first();
        $lang_id=$curentlang->id;
        $homecatdb=Category::with([ 
            'langposts' => function ($q) use ($lang_id) {
               $q->where('lang_id', $lang_id) ;
           }])->where('code','home')->first();
           $homecat=$this->mapcategoryPath( $homecatdb,$lang_id,$curentlang->code);

        $Dbitem= Category::with([ 
            'langposts' => function ($q) use ($lang_id) {
               $q->where('lang_id', $lang_id) ;
           }])->where('slug',$slug)->first();

           while($Dbitem->code!='main-menu'){
            $parentid=$Dbitem->parent_id;
            $item =$this->mapcategoryPath($Dbitem,$lang_id,$curentlang->code);
            $this->mainpathArr[]=  $item;
            $Dbitem=$this->getbyid($parentid,$lang_id);
           }     
           $this->mainpathArr[]=$homecat ;  
           $this->mainpathArr=  array_reverse($this->mainpathArr)   ; 
        //   return $item;     
        return  $this->mainpathArr;
    }
    public function getbyid($category_id,$lang_id){
        $Dbitem= Category::with([ 
            'langposts' => function ($q) use ($lang_id) {
               $q->where('lang_id', $lang_id) ;
           }])->where('id',$category_id)->first();
           return  $Dbitem;
    }
 public function mapcategoryPath($category,$lang_id,$lang_code){
        $tr_title='';
        $urlpath='#';
        $is_link=0;
        if( $category->langposts->first()){
            $tr_title= $category->langposts->first()->title_trans;
         //   $tr_content= $category->langposts->first()->content_trans;
        }
 if($category->code=='home'){
$urlpath=url('lang',$lang_code);
$is_link=1;
 }else{

 }
 
        return [
            'id' =>$category->id,
          //  'title'=>$category->title,
            'slug'=>$category->slug,
         //   'desc'=>$category->desc,
         //   'meta_key'=>$category->meta_key,
            'parent_id'=>$category->parent_id,
          //  'sequence'=>$category->sequence,
         //   'status'=>$category->status,             
          //  'notes'=>$category->notes,    
            'code'=>$category->code,
            'tr_title' => $tr_title,
          //  'tr_content' =>$tr_content,                 
           'urlpath'=>$urlpath,
           'is_link'=>$is_link,
           
        ];
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
