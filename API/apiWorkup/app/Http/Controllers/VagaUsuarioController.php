<?php

namespace App\Http\Controllers;

use App\Models\VagaUsuario;
use Illuminate\Http\Request;
use App\Models\Vaga;
use Illuminate\Support\Facades\Auth;

class VagaUsuarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $vagasUsuario = VagaUsuario::all();

        return $vagasUsuario;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Area');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate(
            [
                'idVaga' => 'required',
                'idUsuario' => 'required', // Adicione esta linha
            ],
            [
                'idVaga.required' => 'Escolha uma vaga',
                'idUsuario.required' => 'O ID do usuário é necessário', // Mensagem de erro personalizada
            ]
        );
        
    
        $vagasUsuario = new VagaUsuario();
        $vagasUsuario->idVaga = $request->idVaga;
        $vagasUsuario->idUsuario = $request->idUsuario;
        $vagasUsuario->idStatusVagaUsuario = 1;
    
        if ($vagasUsuario->save()) {
            return response()->json(['message' => 'Candidatura realizada com sucesso!'], 201);
        }
    
        return response()->json(['message' => 'Erro ao cadastrar candidatura.'], 500);
    }
    
    

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

    }



    public function verVagaCadastrada($idVaga)
    {
        // Encontre a vaga com o ID passado
        $vaga = Vaga::findOrFail($idVaga);

        $empresaId = Auth::guard('empresa')->id();
        if ($vaga->idEmpresa !== $empresaId) {
            return redirect()->route('home')->with('error', 'Você não tem permissão para ver os candidatos dessa vaga.');
        }
    
        // Busque os candidatos que se inscreveram para esta vaga, incluindo o status
        $candidatos = VagaUsuario::where('idVaga', $idVaga)
            ->with(['usuario', 'status']) // Inclui a relação status
            ->get();
            $empresa = Auth::guard('empresa')->user(); // Obter a empresa autenticada
        return view('verVagaCadastrada', compact('vaga', 'candidatos', 'empresa'));
    }


    public function aprovarCandidatura(Request $request, $id)
    {
        
        $vagaUsuario = VagaUsuario::findOrFail($id);
        
        
        $vagaUsuario->idStatusVagaUsuario = 2;

        // Verifique se foi enviado um motivo personalizado no formulário
        if ($request->has('motivoFeedback') && !empty($request->motivoFeedback)) {
            // Se houver um motivo, defina o motivoFeedback com o texto enviado
            $vagaUsuario->motivoFeedback = $request->motivoFeedback;
        } else {
            // Caso contrário, use a mensagem padrão de aprovação
            $vagaUsuario->motivoFeedback = 'Parabéns, você foi aprovado! Estamos aguardando sua disponibilidade para agendar a entrevista.';
        }
        
        
        $vagaUsuario->save();

        
        return redirect()->back()->with('success', 'Candidatura aprovada com sucesso.');
    }

    
    public function negarCandidatura(Request $request, $id)
    {
        
        $vagaUsuario = VagaUsuario::findOrFail($id);
        
        
        $vagaUsuario->idStatusVagaUsuario = 3;

        // Verifique se foi enviado um motivo personalizado no formulário
        if ($request->has('motivoNegacao') && !empty($request->motivoNegacao)) {
            // Se houver um motivo, defina o motivoFeedback com o texto enviado
            $vagaUsuario->motivoFeedback = $request->motivoNegacao;
        } else {
            // Caso contrário, use a mensagem padrão de negação
            $vagaUsuario->motivoFeedback = 'Infelizmente, não atendemos ao perfil desejado. No entanto, seu currículo será mantido em nosso banco de dados para futuras oportunidades.';
        }
        
        
        $vagaUsuario->save();

        
        return redirect()->back()->with('success', 'Candidatura negada com sucesso.');
    }


    

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($idUsuario, $idVaga, Request $request)
    {
        // Encontra a candidatura pelo ID da vaga e do usuário
        $vagaUsuario = VagaUsuario::where('idUsuario', $idUsuario)
            ->where('idVaga', $idVaga)
            ->firstOrFail();
    
        // Deleta a candidatura
        $vagaUsuario->delete();
    
        return response()->json(['message' => 'Candidatura cancelada com sucesso']);
    }
    

    public function verificarCandidatura($userId, $vagaId)
{
    // Consultar a tabela de candidaturas para verificar se o usuário já se candidatou à vaga
    $candidatura = VagaUsuario::where('idUsuario', $userId)
                              ->where('idVaga', $vagaId)
                              ->first();

    if ($candidatura) {
        return response()->json(['isCandidated' => true, 'message' => 'Usuário já se candidatou'], 200);
    } else {
        return response()->json(['isCandidated' => false, 'message' => 'Usuário não se candidatou'], 200);
    }
}


public function minhasVagas($userId)
{
    // Consulta as candidaturas do usuário, incluindo as relações vaga, empresa e status
    $candidaturas = VagaUsuario::where('idUsuario', $userId)
        ->with([
            'vaga.empresa' => function($query) {
                $query->select('idEmpresa', 'nomeEmpresa'); // Carrega apenas idEmpresa e nomeEmpresa
            },
            'status' => function($query) {
                $query->select('idStatusVagaUsuario', 'tipoStatusVaga'); // Carrega o tipoStatusVaga do status
            }
        ])
        ->get();

    return response()->json($candidaturas); // Retorna as candidaturas com os dados das vagas e status
}


public function notificacaoAprovado($userId) {
    // Carrega VagaUsuario, com as relações Vaga (e a Empresa dentro de Vaga)
    $notificacoes = VagaUsuario::where('idStatusVagaUsuario', 2) // Status 2 para aprovado
        ->where('idUsuario', $userId) // Filtra pelo usuário
        ->with(['vaga.empresa' => function($query) {
            $query->select('idEmpresa', 'nomeEmpresa'); // Carrega apenas os campos idEmpresa e nomeEmpresa
        }]) // Carrega a relação vaga -> empresa
        ->get();

    // Retorna as notificações em formato JSON
    return response()->json($notificacoes);
}




}










