<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
class MediaProject extends Model
{
    use HasFactory;
    protected $table = 'media_projects';
    protected $fillable = [
        'project_id',
        'media_id',
        'sequence',
        'status',
        'notes',
              
    ];
    public function project(): BelongsTo
    {
        return $this->belongsTo(Project::class)->withDefault();
    }
    
    public function mediastore(): BelongsTo
    {
        return $this->belongsTo(Mediastore::class,'media_id')->withDefault();
    }
}
