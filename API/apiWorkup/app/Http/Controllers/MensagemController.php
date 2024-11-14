<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Mensagem;
use App\Models\Chat;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class MensagemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($idUsuario, $idEmpresa)
    {
        // Busca os chats entre o usuário e a empresa
        $chats = Chat::where('idUsuario', $idUsuario)
            ->where('idEmpresa', $idEmpresa)
            ->with(['usuario', 'empresa'])  // Carrega as relações do usuário e da empresa
            ->get();
    
        // Se não encontrar chats, retorna uma mensagem de erro
        if ($chats->isEmpty()) {
            return view('mensagem.index', ['message' => 'Nenhum chat encontrado']);
        }
    
        // Passa o idUsuario para a view junto com os dados dos chats
        return view('mensagem.index', compact('chats', 'idUsuario'));
    }
    
    
    

    

    

    public function indexUsuario($idUsuario)
    {
        // Buscando as mensagens que o usuário recebeu
        $mensagens = DB::table('tb_chat')
            ->join('tb_Mensagem', 'tb_chat.idMensagem', '=', 'tb_Mensagem.idMensagem')
            ->join('tb_Empresa', 'tb_chat.idEmpresa', '=', 'tb_Empresa.idEmpresa') // Junta com a tabela de empresas
            ->where('tb_chat.idUsuario', $idUsuario) // Filtra mensagens recebidas pelo usuário
            ->select('tb_Mensagem.mensagem', 'tb_Empresa.nomeEmpresa as empresaNome', 'tb_chat.created_at')
            ->orderBy('tb_chat.created_at', 'desc')
            ->get();

        return response()->json($mensagens);
    }

    public function indexUsuarioUnico($idUsuario)
    {
        // Buscando as mensagens que o usuário específico enviou ou recebeu
        $mensagens = DB::table('tb_chat')
            ->join('tb_Mensagem', 'tb_chat.idMensagem', '=', 'tb_Mensagem.idMensagem')
            ->join('tb_Empresa', 'tb_chat.idEmpresa', '=', 'tb_Empresa.idEmpresa')
            ->where('tb_chat.idUsuario', $idUsuario)
            ->select('tb_Mensagem.mensagem', 'tb_Empresa.nomeEmpresa as empresaNome', 'tb_chat.created_at')
            ->orderBy('tb_chat.created_at', 'desc')
            ->get();

        return response()->json($mensagens);
    }

    public function pegarMensagens($idUsuario, $idEmpresa)
    {
        // Busca todas as mensagens diretamente da tabela 'tb_Mensagem'
        $mensagens = DB::table('tb_Mensagem')
            ->join('tb_Empresa', 'tb_Mensagem.idEmpresa', '=', 'tb_Empresa.idEmpresa') // Junta com a tabela de empresas
            ->where('tb_Mensagem.idUsuario', $idUsuario) // Filtro pelo idUsuario
            ->where('tb_Mensagem.idEmpresa', $idEmpresa) // Filtro pelo idEmpresa
            ->select(
                'tb_mensagem.mensagem',
                'tb_mensagem.created_at as mensagemData',
                'tb_Empresa.nomeEmpresa',
                'tb_mensagem.tipoEmissor',
            )
            ->orderBy('tb_Mensagem.created_at', 'desc') // Ordena pela data de criação das mensagens
            ->get(); // Recupera todos os registros encontrados
    
        // Verifique se existem mensagens
        if ($mensagens->isEmpty()) {
            return response()->json(['message' => 'Nenhuma mensagem encontrada'], 404);
        }
    
        // Retorna as mensagens em formato JSON
        return response()->json($mensagens);
    }
    
    
    
    
    

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($idUsuario, $idEmpresa)
    {
        return view('mensagem.mensagem', compact('idUsuario', 'idEmpresa'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            // Logando os dados recebidos
            Log::info('Dados recebidos:', ['dados' => $request->all()]);
    
            // Validando os dados
            $request->validate([
                'idUsuario' => 'required|exists:tb_usuario,idUsuario',
                'idEmpresa' => 'required|exists:tb_empresa,idEmpresa',
                'mensagem' => 'required|string',
                'tipoEmissor' => 'required|string',
                'idChat' => 'required|exists:tb_chat,idChat',
            ]);
    
            // Criando a mensagem
            $mensagem = Mensagem::create([
                'idUsuario' => $request->idUsuario,
                'idEmpresa' => $request->idEmpresa,
                'mensagem' => $request->mensagem,
                'tipoEmissor' => $request->tipoEmissor,
                'idChat' => $request->idChat,
            ]);
    
            // Retornando a resposta
            return response()->json($mensagem, 200);
        } catch (\Exception $e) {
            // Logando o erro
            Log::error('Erro no servidor: ' . $e->getMessage());
    
            // Retornando erro 500
            return response()->json(['error' => 'Erro no servidor', $e->getMessage()], 500);
        }
    }

    public function storeWeb(Request $request)
    {
        // Logando os dados recebidos
        Log::info('Dados recebidos:', ['dados' => $request->all()]);

        // Validando os dados
        $request->validate([
            'idUsuario' => 'required|exists:tb_usuario,idUsuario',
            'idEmpresa' => 'required|exists:tb_empresa,idEmpresa',
            'mensagem' => 'required|string',
            'tipoEmissor' => 'required|string',
        ]);

        // Verificando se já existe um chat entre o usuário e a empresa
        $chat = Chat::where('idUsuario', $request->idUsuario)
            ->where('idEmpresa', $request->idEmpresa)
            ->first();

        if (!$chat) {
            // Se não existe chat, cria um novo
            $chat = Chat::create([
                'idUsuario' => $request->idUsuario,
                'idEmpresa' => $request->idEmpresa,
            ]);
        }

        // Criando a mensagem
        $mensagem = Mensagem::create([
            'idUsuario' => $request->idUsuario,
            'idEmpresa' => $request->idEmpresa,
            'mensagem' => $request->mensagem,
            'tipoEmissor' => $request->tipoEmissor,
            'idChat' => $chat->idChat, // Atribuindo o idChat para a mensagem
        ]);

        // Recuperando todos os chats da empresa com seus usuários e empresas relacionadas
        $mensagens = Mensagem::where('idEmpresa', $request->idEmpresa)
            ->with(['chat.usuario', 'chat.empresa'])  // Carrega os dados do usuário e da empresa associados ao chat
            ->get();

        // Retornando a view com as mensagens
        return view('mensagem.index', compact('mensagens'));
    }

    public function showWeb($idUsuario, $idEmpresa)
{
    // Recupera todas as mensagens entre o usuário e a empresa específica
    $mensagens = Mensagem::where('idUsuario', $idUsuario)
        ->where('idEmpresa', $idEmpresa)
        ->with(['usuario', 'empresa']) // Carrega as relações do usuário e empresa
        ->orderBy('created_at', 'asc') // Ordena as mensagens pela data
        ->get();

    // Se não houver mensagens, retorna uma mensagem informando
    if ($mensagens->isEmpty()) {
        return view('mensagem.unico', ['message' => 'Nenhuma mensagem encontrada entre o usuário e esta empresa.']);
    }

    // Retorna a view com as mensagens encontradas
    return view('mensagem.unico', compact('mensagens'));
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
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $idMensagem)
    {

        $mensagem = Mensagem::findOrFail($idMensagem);
    

        $request->validate([
            'mensagem' => 'required|string',
        ]);

        $mensagem->update($request->only('mensagem'));
    
 
        return response()->json(['message' => 'Mensagem atualizada com sucesso']);
    }
    

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
