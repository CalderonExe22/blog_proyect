<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;

    //Define a many-to-many relationship.
    public function menus()
    {
        return $this->belongsToMany(Menu::class,'menu_rol','rol_id','menu_id');
    }

    //many-to-many relationship.
    public function users()
    {
        return $this->belongsToMany(User::class,'user_rol','rol_id','user_id');
    }
}
