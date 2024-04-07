<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LangProject extends Model
{
    use HasFactory;
    protected $fillable = [
        'project_id',
        'lang_id',
        'title_trans',
        'content_trans',
            
    ];
}
