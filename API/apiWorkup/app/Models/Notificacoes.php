<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use App\Models\Empresa;

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

    public function empresa() : BelongsTo
    {
        return $this->belongsTo(Empresa::class, 'idEmpresa');
    }

    public function vagas()
{
    return $this->belongsTo(Vaga::class, 'idVaga');
}
}
