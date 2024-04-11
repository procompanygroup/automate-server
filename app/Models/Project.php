<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;

    protected $fillable = [
    
'title',
'slug',
'content',
'sequence',
'status',
'category_id',
'notes',
'metakey',
    ];
    protected $appends= ['status_conv'];
    public function getStatusConvAttribute(){
        $conv="";
       if($this->status==1){
        $conv=__('general.active',[],'en');
       }else{
        $conv=__('general.notactive',[],'en');
       }      
            return  $conv;
     }
}
