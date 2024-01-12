<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Landphoto extends Model
{
    use HasFactory;
    protected $table = 'land_photos';
    protected $primaryKey = 'id';
    protected $fillable = 
    [

        'land_id',
        'file_name',
    ];
}
