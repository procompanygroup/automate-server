<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
class LocationSetting extends Model
{
    use HasFactory;
    protected $table = 'location_settings';
    public $timestamps = false;
    protected $fillable = [
        'location_id',
        'setting_id',
        'type',
        'dep',
        'sequence',
        'is_active',                     
    ];

    public function location(): BelongsTo
    {
        return $this->belongsTo(Location::class,'location_id')->withDefault();
    }
    public function setting(): BelongsTo
    {
        return $this->belongsTo(Setting::class,'setting_id')->withDefault();
    }

}
