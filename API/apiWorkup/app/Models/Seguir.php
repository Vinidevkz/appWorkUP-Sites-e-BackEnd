<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Seguir extends Model
{
    use HasFactory;
    protected $table = 'tb_Seguir';
    protected $primaryKey = 'idSeguir';

    protected $fillable = [
        'idUsuario',
        'idEmpresa',
    ];
    // Seguir.php
public function empresa()
{
    return $this->belongsTo(Empresa::class, 'idEmpresa', 'idEmpresa');
}


    public $timestamps = false;
}
