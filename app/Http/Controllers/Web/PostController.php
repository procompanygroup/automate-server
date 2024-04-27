<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Http\Requests\Post\UpdateFooterRequest;
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
    public function edit($id)
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

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
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
}
