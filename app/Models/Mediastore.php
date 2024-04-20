<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use App\Http\Controllers\Web\StorageController;
class Mediastore extends Model
{
    use HasFactory;
    protected $table = 'mediastore';
    protected $fillable = [
        'name',
        'caption',
        'title',
        'local_path',
        'type',
        'sequence',
                
    ];

    protected $appends= ['image_path' ];
    public function getImagePathAttribute(){
        $conv="";
        $strgCtrlr = new StorageController(); 
        if($this->type=='image'){
            if(is_null($this->name) ){
                $conv =$strgCtrlr->DefaultPath('image'); 
            }else if($this->name==''){
                $conv =$strgCtrlr->DefaultPath('image'); 
            } else {
                if($this->local_path=='projects'){
                    $url = $strgCtrlr->ProjectPath($this->type);
                    $conv =  $url.$this->name;
                }         
            }   
        }else{
            //video
            if(is_null($this->name) ){
                $conv =''; 
            }else {
                $url = $strgCtrlr->ProjectPath($this->type);
                $conv =  $url.$this->name;
            }
        }
       
            return  $conv;
     }
    public function mediaprojects(): HasMany
    {
        return $this->hasMany(MediaProject::class,'media_id');
    }
}
