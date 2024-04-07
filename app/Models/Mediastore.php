<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mediastore extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'caption',
        'title',
        'local_path',
        'type',
        'sequence',
                
    ];
}
