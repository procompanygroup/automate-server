<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Post;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Http\Requests\Post\UpdateFooterRequest;
use App\Http\Requests\Post\StorePostRequest;

use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
    
    
    }
    public function createwithcatid($id)
    {
        $item=Category::find($id);
        return view('admin.post.create', ["category" => $item]);
    }
    public function storepost(StorePostRequest $request)
    {
        $formdata = $request->all();
   // return  $formdata;
    // return redirect()->back()->with('success_message', $formdata);
    $validator = Validator::make(
      $formdata,
      $request->rules(),
      $request->messages()
    );

    if ($validator->fails()) {
      /*
                           return  redirect()->back()->withErrors($validator)
                           ->withInput();
                           */
      // return response()->withErrors($validator)->json();
      return response()->json($validator);

    } else {

        $tmpslug="";
        // if ($formdata["slug"] == "" || empty($formdata["slug"])) {
            $tmpslug = $formdata["title"];
        // } else {
        //     $tmpslug = $formdata["slug"];
        // }
        $promodel=Post::where('slug', $tmpslug )->first();
        if (!is_null($promodel)) {
            // error
           return response()->json([
             "errors" =>  ["slug" => [__('messages.this field exist',[],'en')]]          
           ], 422);      
        
         } else{        
            
          $newObj = new Post;
         
          $newObj->title = $formdata['title'];
          $newObj->category_id = $formdata['category_id'];
          $newObj->slug =Str::slug($tmpslug);;  
         // $newObj->metakey = $formdata['metakey'];   
          $newObj->status = isset ($formdata["status"]) ? 1 : 0;
        
          $newObj->save();   
    
          return response()->json("ok");

         }

    }
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
    public function edit($id)
    {
        $item = Post::with(['category',
            'mediaposts' => function ($q) use ($id) {
                $q->with('mediastore');
            }
        ])->find($id);
        $lang_list = Language::orderByDesc('is_default')->with(
            [
                'langposts' => function ($q) use ($id) {
                    $q->where('post_id', $id);
                }
            ]
        )->get();
        //
        //   return $item;
        return view("admin.design.section.footer.edit", ["item" => $item, 'lang_list' => $lang_list]);
    }
    public function editfooter($id)
    {
        $item = Post::with([
            'mediaposts' => function ($q) use ($id) {
                $q->with('mediastore');
            }
        ])->find($id);
        $lang_list = Language::orderByDesc('is_default')->with(
            [
                'langposts' => function ($q) use ($id) {
                    $q->where('post_id', $id);
                }
            ]
        )->get();
        //
        //   return $item;
        return view("admin.design.section.footer.edit", ["item" => $item, 'lang_list' => $lang_list]);
    }

    public function editpost($id)
    {
        $item = Post::with([
            'mediaposts' => function ($q) use ($id) {
                $q->with('mediastore');
            }
        ])->find($id);
        $lang_list = Language::orderByDesc('is_default')->with(
            [
                'langposts' => function ($q) use ($id) {
                    $q->where('post_id', $id);
                }
            ]
        )->get();
        //
        //   return $item;
        return view("admin.post.edit", ["item" => $item, 'lang_list' => $lang_list]);
    }
    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateFooterRequest $request,$id)
    {
        $formdata = $request->all();
    $validator = Validator::make(
      $formdata,
      $request->rules(),
      $request->messages()
    );
    if ($validator->fails()) {

      return response()->json($validator);

    } else {
        //check if slug exist
        $tmpslug="";
        if ($formdata["slug"] == "" || empty($formdata["slug"])) {
            $tmpslug = $formdata["title"];
        } else {
            $tmpslug = $formdata["slug"];
        }
        $promodel=Post::where('slug', $tmpslug )->whereNot('id',$id)->first();
        if (!is_null($promodel)) {
            // error
           return response()->json([
             "errors" =>  ["slug" => [__('messages.this field exist',[],'en')]]          
           ], 422);      
        
         } else{
 
 
   Post::find($id)->update([
     //'user_name'=>$formdata['user_name'],
     'title' => $formdata['title'],
     'metakey' => $formdata['metakey'],
     'slug' =>Str::slug($tmpslug),
   
     'status' => isset ($formdata["status"]) ? 1 : 0,      
   ]);

   return response()->json("ok");
         }
   
    }
    }
    public function updatepost(UpdateFooterRequest $request,$id)
    {
        $formdata = $request->all();
    $validator = Validator::make(
      $formdata,
      $request->rules(),
      $request->messages()
    );
    if ($validator->fails()) {

      return response()->json($validator);

    } else {
        //check if slug exist
        $tmpslug="";
      //  if ($formdata["slug"] == "" || empty($formdata["slug"])) {
            $tmpslug = $formdata["title"];
        // } else {
        //     $tmpslug = $formdata["slug"];
        // }
        $promodel=Post::where('slug', $tmpslug )->whereNot('id',$id)->first();
        if (!is_null($promodel)) {
            // error
           return response()->json([
             "errors" =>  ["slug" => [__('messages.this field exist',[],'en')]]          
           ], 422);      
        
         } else{
 
 
   Post::find($id)->update([
     //'user_name'=>$formdata['user_name'],
     'title' => $formdata['title'],
   //  'metakey' => $formdata['metakey'],
     'slug' =>Str::slug($tmpslug),
   
     'status' => isset ($formdata["status"]) ? 1 : 0,      
   ]);

   return response()->json("ok");
         }
   
    }
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy( $id)
    {
         //delete user
      $item = Post::find($id);
      //delete image
      /*
      $oldimagename =  $item ->image;
      $strgCtrlr = new StorageController();
      $path = $strgCtrlr->path['projects'];
      Storage::delete("public/" .$path. '/' . $oldimagename);
      */
      if (!( $item  === null)) {
        Post::find($id)->delete();
      }
      return redirect()->back();
  
    }

    public function updatefooter(UpdateFooterRequest $request,$id)
    {
        $formdata = $request->all();
    $validator = Validator::make(
      $formdata,
      $request->rules(),
      $request->messages()
    );
    if ($validator->fails()) {

      return response()->json($validator);

    } else {
        //check if slug exist
        // $tmpslug="";
        // if ($formdata["slug"] == "" || empty($formdata["slug"])) {
        //     $tmpslug = $formdata["title"];
        // } else {
        //     $tmpslug = $formdata["slug"];
        // }
        // $promodel=Post::where('slug', $tmpslug )->whereNot('id',$id)->first();
        // if (!is_null($promodel)) {
        //     // error
        //    return response()->json([
        //      "errors" =>  ["slug" => [__('messages.this field exist',[],'en')]]          
        //    ], 422);      
        
        //  } else
       //  {
 
 
   Post::find($id)->update([
     //'user_name'=>$formdata['user_name'],
    // 'title' => $formdata['title'],
   //  'metakey' => $formdata['metakey'],
   //  'slug' =>Str::slug($tmpslug),
   
     'status' => isset ($formdata["status"]) ? 1 : 0,      
   ]);

   return response()->json("ok");
         }
   
   // }
    }
    public function showbycatid($id)
    {
      //  $strgCtrlr = new StorageController(); 
        //$path= $strgCtrlr->SitePath('image');
        //etfootersections
      
//temp
$category=Category::find($id);
          $list = Post::where('category_id',$id)->get();       
              
         return view("admin.post.show", [          
         "list"=>   $list,    "category"=>   $category,          
         ]);
      
     


        
    }
}
