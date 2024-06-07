<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Menu extends Model
{
    use HasFactory;
    
    public function roles()
    {
        return $this->belongsToMany(Role::class,'menu_rol','menu_id','rol_id');
    }

    public function parent()
    {
        return $this->belongsTo(Menu::class, 'id_padre');
    }

    public function children()
    {
        return $this->hasMany(Menu::class,'id_padre');
    }
}
