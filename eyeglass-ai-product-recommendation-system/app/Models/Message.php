<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasFactory;
    protected $fillable = ['content', 'user_id', 'type'];

    public function user(){
        return $this->hasOne(Product::class, 'id', 'user_id');
    }
}
