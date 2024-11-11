<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Chat;
use App\Models\Usuario;
use App\Models\Empresa;

class Mensagem extends Model
{
    use HasFactory;

    public $timestamps = true;
    protected $table = 'tb_Mensagem';
    protected $primaryKey = 'idMensagem';

    protected $fillable = [
        'idUsuario',
        'idEmpresa',
        'mensagem',
        'tipoEmissor',
        'idChat',  // Incluindo idChat aqui
        'created_at',
        'updated_at',
    ];

// No modelo Mensagem
public function usuario()
{
    return $this->belongsTo(Usuario::class, 'idUsuario');
}

public function empresa()
{
    return $this->belongsTo(Empresa::class, 'idEmpresa');
}

public function chat()
{
    return $this->belongsTo(Chat::class, 'idChat');
}

}

