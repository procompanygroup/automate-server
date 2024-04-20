<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\MediaProject;
use App\Models\Mediastore;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
class MediaStoreController extends Controller
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
    public function getbyid($id)
    {
        $item = Mediastore::select('id','name','caption','local_path','type')->find($id);
return response()->json($item);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }
    public function getgallery($id)
    {
        $List= MediaProject::with('mediastore')->where('project_id',$id)->get()  ;
         $List= $List->where('media_type','image');
        return view('admin.media.showgallery', ['List' => $List]);
     //   return  $List;
    }
    
    public function getvideo($id)
    {
        $List= MediaProject::with('mediastore')->where('project_id',$id)->get()  ;
         $List= $List->where('media_type','video');
        return view('admin.media.showvideo', ['List' => $List]);
     //   return  $List;
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
    public function destroyimage($id)
    {             
          $item = Mediastore::find($id);
          if (!( $item  === null)) {
            $oldimagename =  $item ->name;
          $strgCtrlr = new StorageController();
          $path ='';
          if($item->type=='image'){
            $path = $strgCtrlr->path['projects'];
          }else{
//video
            $path = $strgCtrlr->vidpath['projects'];
          }        
          Storage::delete("public/" .$path. '/' . $oldimagename);        
            MediaProject::where('media_id',$id)->delete();
            Mediastore::find($id)->delete();         
          }        
         
          return response()->json("ok");  
      
    }
}
