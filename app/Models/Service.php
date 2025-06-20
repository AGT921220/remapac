<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    protected $table = 'services';

    public function ServiceDetails()
    {
        return $this->hasMany(ServiceDetail::class, 'service_id');
    }
}
