<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
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
    public function mediaprojects(): HasMany
    {
        return $this->hasMany(MediaProject::class,'media_id');
    }
}
