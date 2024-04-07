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
    ];
}
