<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tb_admin')->insert( [[ 
            'nomeAdmin' => 'Admin',
            'usernameAdmin' => 'admin',
            'emailAdmin' => 'admin@admin.com',
            'contatoAdmin' => '(11)9 9999-9999',
            'senhaAdmin' => Hash::make('123'),
            'fotoAdmin' => 'fc29c16347cac127de9ef3d04cd20f68.jpg',
            'idStatus' => 1,
            'created_at' =>Carbon::now('America/Sao_Paulo'),
            'updated_at' =>Carbon::now('America/Sao_Paulo'),
        ],[
            'nomeAdmin' => 'Danilo da Silva',
            'usernameAdmin' => 'Danilo',
            'emailAdmin' => 'danilo@gmail.com',
            'contatoAdmin' => '(11)9 1111-1111',
            'senhaAdmin' => Hash::make('123'),
            'fotoAdmin' => 'fc29c16347cac127de9ef3d04cd20f68.jpg',
            'idStatus' => 1,
            'created_at' =>Carbon::now('America/Sao_Paulo'),
            'updated_at' =>Carbon::now('America/Sao_Paulo'),
        ],
        [ 
            'nomeAdmin' => 'Vitor Augusto',
            'usernameAdmin' => 'Vitor',
            'emailAdmin' => 'vitor@gmail.com',
            'contatoAdmin' => '(11)9 1111-1111',
            'senhaAdmin' => Hash::make('123'),
            'fotoAdmin' => 'fc29c16347cac127de9ef3d04cd20f68.jpg',
            'idStatus' => 1,
            'created_at' =>Carbon::now('America/Sao_Paulo'),
            'updated_at' =>Carbon::now('America/Sao_Paulo'),
        ],
        ]
        );
    }
}
