<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notificacoes extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'tb_Notificacoes';
    protected $primaryKey = 'idNotifcacao';

    protected $fillable = [
        'idEmpresa',
        'idUsuario',
        'idVaga',
    ];
}
