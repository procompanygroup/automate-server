<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Project;
use File;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\Project\StoreProjectRequest;
use App\Http\Requests\Project\UpdateProjectRequest;
use Illuminate\Support\Str;
class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $List = Project::get();
        return view('admin.project.show', ['List' => $List]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.project.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreProjectRequest $request)
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
        if ($formdata["slug"] == "" || empty($formdata["slug"])) {
            $tmpslug = $formdata["title"];
        } else {
            $tmpslug = $formdata["slug"];
        }
        
      $newObj = new Project;
   
      $newObj->title = $formdata['title'];
      $newObj->slug =Str::slug($tmpslug);;  
      $newObj->metakey = $formdata['metakey'];   
      $newObj->status = isset ($formdata["status"]) ? 1 : 0;
    
      $newObj->save();


      return response()->json("ok");
    }
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
        $item = Project::find($id);
 
        //
        return view("admin.project.edit", ["item" => $item]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateProjectRequest $request,$id)
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
      if ($request->hasFile('image')) {
        $file = $request->file('image');
        // $filename= $file->getClientOriginalName();                
        $this->storeImage($file, $id);
      }
      //reset all to 0
  $isdefault=0;
  if(isset ($formdata["is_default"])){
    $isdefault=1;
    Project::query()->update([       
        'is_default' =>0,
      ]);
  }
      Project::find($id)->update([
        //'user_name'=>$formdata['user_name'],
        'code' => $formdata['code'],
        'name' => $formdata['name'],
        'status' => isset ($formdata["status"]) ? 1 : 0,
        'is_default' => $isdefault,
      ]);
  
      return response()->json("ok");
    }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
    
      //delete user
      $item = Project::find($id);
      //delete image
      /*
      $oldimagename =  $item ->image;
      $strgCtrlr = new StorageController();
      $path = $strgCtrlr->path['projects'];
      Storage::delete("public/" .$path. '/' . $oldimagename);
      */
      if (!( $item  === null)) {
        Project::find($id)->delete();
      }
      return redirect()->route('project.index');
  
    }

    public function storeImage($file, $id)
    {
      $imagemodel = Project::find($id);
      $strgCtrlr = new StorageController();
      $path = $strgCtrlr->path['projects'];
      $oldimage = $imagemodel->image;
      $oldimagename = basename($oldimage);
    //  $oldimagepath = $path . '/' . $oldimagename;
      //save photo
  
      if ($file !== null) {
        //  $filename= rand(10000, 99999).".".$file->getClientOriginalExtension();
        $ext=$file->getClientOriginalExtension();
     //  $filename =  $imagemodel->code . $id . ".webp";
        $filename =  $imagemodel->code . $id .'.'.$ext;
        /*
        $manager = new ImageManager(new Driver());
        $image = $manager->read($file);
        $image = $image->toWebp(75);
        */
        Storage::delete("public/" .$path . '/' . $oldimagename);
/*
        if (!File::isDirectory(Storage::url('/' .$path))) {
          Storage::makeDirectory('public/' . $path);
        }
        */
      //  $image->save(storage_path('app/public') . '/' . $path . '/' . $filename);
        $path = $file->storeAs($path ,$filename,'public');
        //   $url = url('storage/app/public' . '/' . $path . '/' . $filename);
        Project::find($id)->update([
          "image" => $filename
        ]);
      //  Storage::delete("public/" .$path . '/' . $oldimagename);
      }
      return 1;
    }
}