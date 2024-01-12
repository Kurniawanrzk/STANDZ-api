<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Landreview extends Model
{
    use HasFactory;
    protected $table = 'land_reviews';
    protected $primaryKey = 'id';
    protected $fillable = 
    [
        'user_id',
        'rating',
        'land_id'
    ];
}
