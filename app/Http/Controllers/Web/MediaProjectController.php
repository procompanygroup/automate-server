<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Project;
 use Illuminate\Http\Request;
use App\Http\Requests\MediaProject\StoreImagesRequest;
use Illuminate\Support\Facades\Validator;
use App\Models\Mediastore;
 use App\Models\MediaProject;
 use Illuminate\Support\Str;
 use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;
use Illuminate\Support\Facades\Storage;
use File;
use App\Http\Requests\MediaProject\UpdateImageRequest;

class MediaProjectController extends Controller
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
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function storeimages(StoreImagesRequest $request,$id)//StoreImagesRequest
    {
       
    $formdata = $request->all();
    //return (dd( $formdata));
     $validator = Validator::make(
       $formdata,
       $request->rules(),
       $request->messages()
     );
 
     if ($validator->fails()) {
     
       return response()->json($validator);
 
     } else {
        //$modelpro=Project::find($id);
      //  return dd($request->all());
$caption= isset ($formdata["caption"]) ? $formdata["caption"] : '';
 
        foreach ($request->file('images') as $imagefile) {
            
            $newObj = new Mediastore;
           // $newObj->name='';
            $newObj->caption = $caption;
            $newObj->title='';
           $newObj->local_path='projects';
            $newObj->type='image';
           
            $newObj->save();
       $res=$this->storeImage($imagefile, $newObj->id);
          $mediaproj=new  MediaProject();
          $mediaproj->project_id=$id;
          $mediaproj->media_id=$newObj->id;
          $mediaproj->status=1;
          $mediaproj->save();        
          }  
       return response()->json("ok");
     }
    }
    public function update(UpdateImageRequest $request,$id)
    {
      $formdata = $request->all();
      //return (dd( $formdata));
       $validator = Validator::make(
         $formdata,
         $request->rules(),
         $request->messages()
       );
   
       if ($validator->fails()) {
       
         return response()->json($validator);
   
       } else {
          //$modelpro=Project::find($id);
        //  return dd($request->all());
  $caption= isset ($formdata["caption"]) ? $formdata["caption"] : '';
   
          foreach ($request->file('images') as $imagefile) {
              
              $newObj = new Mediastore;
             // $newObj->name='';
              $newObj->caption = $caption;
              $newObj->title='';
             $newObj->local_path='projects';
              $newObj->type='image';
             
              $newObj->save();
         $res=$this->storeImage($imagefile, $newObj->id);
            $mediaproj=new  MediaProject();
            $mediaproj->project_id=$id;
            $mediaproj->media_id=$newObj->id;
            $mediaproj->status=1;
            $mediaproj->save();        
            }  
         return response()->json("ok");
       }
    }
     

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
    public function storeImage($file, $id)
    {
      $imagemodel = Mediastore::find($id);
      $strgCtrlr = new StorageController();
      $path = $strgCtrlr->path['projects'];
      $oldimage = $imagemodel->name;
      $oldimagename = basename($oldimage);
    //  $oldimagepath = $path . '/' . $oldimagename;    
      $ext=$file->getClientOriginalExtension();
      if(Str::lower($ext)=='svg'){
        if ($file !== null) {          
            $ext=$file->getClientOriginalExtension();       
            $filename = rand(10000, 99999). $id .'.'.$ext;         
            Storage::delete("public/" .$path . '/' . $oldimagename);   
            $path = $file->storeAs($path ,$filename,'public');          
            Mediastore::find($id)->update([
              "name" => $filename
            ]);          
          }
      }else{

        if ($file !== null) {
       
            $filename = rand(10000, 99999) . $id . ".webp";
            $manager = new ImageManager(new Driver());
            $image = $manager->read($file);
            $image = $image->toWebp(75);
            if (!File::isDirectory(Storage::url('/' .$path))) {
              Storage::makeDirectory('public/' . $path);
            }
            $image->save(storage_path('app/public') . '/' . $path . '/' . $filename);
      
            Mediastore::find($id)->update([
              "name" => $filename
            ]);
            Storage::delete("public/" .$path . '/' . $oldimagename);
          }
      }
      //save photo
  
      return 1;
    }
  
}
