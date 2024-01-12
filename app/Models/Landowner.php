<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Landowner extends Model
{
    use HasFactory;
    protected $table = 'landowners';
    protected $primaryKey = 'id';
    protected $fillable = 
    [
        'user_id',
        'phone_number',
        'owner_adress',
    ];
}
