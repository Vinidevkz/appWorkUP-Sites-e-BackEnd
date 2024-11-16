<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Mensagem;
use App\Models\Empresa;
use App\Models\Usuario;


class Chat extends Model
{

    use HasFactory;
    public $timestamps = false;
    protected $table = 'tb_Chat';
    protected $primaryKey = 'idChat';


    protected $fillable = [

        'idUsuario',
        'idEmpresa',

    ];

    public function mensagem()
    {
        return $this->hasMany(Mensagem::class, 'idChat', 'idChat'); // Correção: chave estrangeira é 'idChat'
    }
    
    public function ultimaMensagem()
    {
        return $this->hasOne(Mensagem::class, 'idChat', 'idChat')->latest('created_at'); // Última mensagem com base no 'created_at'
    }
    

    public function empresa()
    {
        return $this->belongsTo(Empresa::class, 'idEmpresa');
    }

    public function usuario()
    {
        return $this->belongsTo(Usuario::class, 'idUsuario');
    }
    

}
