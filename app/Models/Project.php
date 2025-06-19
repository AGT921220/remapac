<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    protected $fillable = [
        'client_id',
        'name',
        'ubicacion',
        'responsable',
        'telefono',
    ];
    protected $table = 'projects';
    public function client()
    {
        return $this->belongsTo(User::class, 'client_id');
    }
}
