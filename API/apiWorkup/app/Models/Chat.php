<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Mensagem;
use App\Models\Empresa;


class Chat extends Model
{

    use HasFactory;
    public $timestamps = false;
    protected $table = 'tb_Chat';
    protected $primaryKey = 'idChat';


    protected $fillable = [
        'idmensagem',
        'idUsuario',
        'idEmpresa',

    ];

    public function mensagem()
    {
        return $this->hasMany(Mensagem::class, 'idMensagem');
    }

    public function empresa()
    {
        return $this->belongsTo(Empresa::class, 'idEmpresa');
    }
    

}
