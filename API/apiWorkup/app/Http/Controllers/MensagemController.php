<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Mensagem;
use App\Models\Chat;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Models\Vaga;
use Illuminate\Support\Facades\Auth;
use App\Models\VagaUsuario;
use App\Models\Usuario;

class MensagemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($idUsuario, $idEmpresa)
    {
        // Certifique-se de que os parâmetros estão corretos


        $empresa = Auth::guard('empresa')->user();

        // Se a empresa não estiver autenticada, pode ser interessante redirecionar ou retornar erro
        if (!$empresa) {
            return redirect()->route('login'); // ou qualquer outro tratamento de erro
        }

        // Verificar se o idUsuario foi passado corretamente
        if ($idUsuario) {
            // Verificar se já existe um chat entre a empresa e o usuário
            $chat = Chat::where('idEmpresa', $idEmpresa)
                ->where('idUsuario', $idUsuario)
                ->first();

            // Se não existir, cria um novo chat
            if (!$chat) {
                $chat = Chat::create([
                    'idEmpresa' => $idEmpresa,
                    'idUsuario' => $idUsuario,
                ]);
            }

            // Pega as mensagens
            $mensagens = Mensagem::where('idChat', $chat->idChat)
                ->orderBy('created_at', 'asc')
                ->get();

            // Encontra o candidato (usuário)
            $candidato = Usuario::find($idUsuario);
        } else {
            $mensagens = collect();
            $candidato = null;
        }

        // Carregar todos os chats da empresa
        $chats = Chat::where('idEmpresa', $idEmpresa)
            ->with(['usuario', 'empresa'])
            ->get();

        // Adiciona a última mensagem a cada chat
        $chats->each(function ($chat) {
            $ultimaMensagem = Mensagem::where('idChat', $chat->idChat)
                ->orderBy('created_at', 'desc')
                ->first();
            $chat->ultima_mensagem = $ultimaMensagem;
        });

        // Retorna a view com os dados
        return view('mensagem.chat', compact('chats', 'idEmpresa', 'mensagens', 'candidato', 'idUsuario'));
    }

    public function showConversation($idUsuario, $idEmpresa)
    {
        $mensagens = Mensagem::where('idUsuario', $idUsuario)
            ->where('idEmpresa', $idEmpresa)
            ->orderBy('created_at', 'asc')
            ->get();

        return view('mensagem.partial-messages', compact('mensagens'));
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

    public function pegarMensagemMaisRecente($idUsuario, $idEmpresa)
    {
        $mensagem = DB::table('tb_mensagem')
        ->where('idUsuario', $idUsuario)
        ->where('idEmpresa', $idEmpresa)
        ->orderBy('created_at', 'desc')
        ->first();

        return response()->json($mensagem);
    }






    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($idUsuario, $idEmpresa)
    {
        // Encontre o candidato (assumindo que você tem a relação entre vaga, candidato e usuário)
        $candidato = VagaUsuario::where('idUsuario', $idUsuario)->first();
        $empresa = Auth::guard('empresa')->user(); // Pega a empresa autenticada

        // Passar as variáveis para a view
        return view('mensagem.chat', compact('idUsuario', 'idEmpresa', 'candidato', 'empresa'));
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
        Log::info('Dados recebidos:', ['dados' => $request->all()]);

        // Validação dos dados recebidos
        $request->validate([
            'idUsuario' => 'required|exists:tb_usuario,idUsuario',
            'idEmpresa' => 'required|exists:tb_empresa,idEmpresa',
            'mensagem' => 'required|string',
            'tipoEmissor' => 'required|string',
        ]);

        // Verifica se já existe um chat entre o usuário e a empresa
        $chat = Chat::firstOrCreate([
            'idUsuario' => $request->idUsuario,
            'idEmpresa' => $request->idEmpresa,
        ]);

        // Cria a mensagem
        $mensagem = Mensagem::create([
            'idUsuario' => $request->idUsuario,
            'idEmpresa' => $request->idEmpresa,
            'mensagem' => $request->mensagem,
            'tipoEmissor' => $request->tipoEmissor,
            'idChat' => $chat->idChat,
        ]);

        // Redireciona para a conversa, passando tanto o idUsuario quanto o idEmpresa
        return redirect()->route('mensagem.index', [
            'idUsuario' => $request->idUsuario,
            'idEmpresa' => $request->idEmpresa,
        ]);
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
