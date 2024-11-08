<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;


class EmpresaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tb_admin')->insert([
            'idAdmin'=> 1,
            'nomeAdmin' => 'Danilo',
            'usernameAdmin' => 'Dan',
            'emailAdmin' => 'danilo@example.com',
            'contatoAdmin' => '(11)9 1111-1111',
            'senhaAdmin' => Hash::make('123'),
            'fotoAdmin' => 'fc29c16347cac127de9ef3d04cd20f68.png',
            'idStatus' => 1,
            'created_at' =>Carbon::now('America/Sao_Paulo'),
            'updated_at' =>Carbon::now('America/Sao_Paulo'),
        ],
        // Para a criação de admins utilize esta seed, assim como acima adicione os campos e seus respectivos valores nas chaves abaixo, e logo após rode o comando:
        // php artisan db:seed --class=AdminSeeder
        // Descomente para prosseguir com a criação de um admin: [ ],
        );
    }
}
