<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Land extends Model
{
    use HasFactory;
    protected $table = 'lands';
    protected $primaryKey = 'id';
    protected $fillable = 
    [
        'land_name',
        'location',
        'surface_area',
        'deskripsi',
        'rental_price',
        'landowner_id',
        'provinsi',
        'kota',
        'kecamatan',
        'batas_tagihan',
        'kelurahan',
        "slug"
    ];

    public function reviews()
    {
        return $this->hasMany(Landreview::class, 'land_id');
    }

    public function photos()
    {
        return $this->hasMany(Landphoto::class, 'land_id');
    }

    public function owner()
    {
        return $this->belongsTo(User::class, 'landowner_id');
    }
}
