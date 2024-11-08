<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tb_notificacoes', function (Blueprint $table) {
            $table->id('idNotificacoes'); // Chave primária
            $table->string('idEmpresa'); // Nome da escola
            $table->string('idUsuario'); // Nome da escola
            $table->string('idVaga'); // Nome da escola
            $table->timestamps(); // created_at e updated_at
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
};
