<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Seguir;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\SeguirController;
use App\Models\Vaga;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
// app/Http/Controllers/PostController.php

public function index()
{
    // Recupera todas as postagens, sem filtrar por idEmpresa
    $posts = Post::all();

    // Log para verificar as postagens recuperadas
    Log::info('Postagens recuperadas: ', $posts->toArray());

    // Exibir as postagens
    return view('posts.index', compact('posts'));
}
  

    public function indexApp($idUsuario)
    {
        // Buscar as empresas que o usuário segue
        $empresasSeguidas = Seguir::where('idUsuario', $idUsuario)
                                  ->pluck('idEmpresa');  // Pega os IDs das empresas que o usuário segue

        // Se não encontrar empresas seguidas
        if ($empresasSeguidas->isEmpty()) {
            return response()->json(['message' => 'Usuário não segue nenhuma empresa.'], 404);
        }

        // Buscar as postagens dessas empresas
        $posts = Post::whereIn('idEmpresa', $empresasSeguidas)->get();

        // Se não encontrar postagens
        if ($posts->isEmpty()) {
            return response()->json(['message' => 'Nenhuma postagem encontrada para as empresas seguidas.'], 404);
        }

        // Retorna as postagens das empresas que o usuário segue
        return response()->json([
            'success' => true,
            'data' => $posts
        ]);
    }

    public function todosOsPosts()
    {
        $posts = Post::with('empresa')->get();

        return response()->json($posts);
    }

    public function postsPorEmpresa($id){
        $posts = Post::where('idEmpresa', '=', $id)->with('empresa')->get();

        return response()-> json($posts);
    }

    

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $empresaId = auth()->guard('empresa')->user()->idEmpresa;

        $vagas = Vaga::where('idEmpresa', $empresaId)->get();
        

        return view('posts.create', compact('empresaId', 'vagas'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
            // Validação
            $request->validate([
                'detalhePublicacao' => 'required|max:300',
             
            ]);


    // Criação da postagem
    $post = new Post();
    $post->tituloPublicacao = $request->tituloPublicacao;
    $post->detalhePublicacao = $request->detalhePublicacao;
    $post->idEmpresa = $request->idEmpresa;
    $post->idVaga = $request->idVaga;
    $post->fotoPublicacao = $request->fotoUrl;
    $post->created_at = now();
    $post->updated_at = now();

    $post->save();

    return redirect()->route('empresa.dashboard')->with('success', 'Postagem criada com sucesso!');
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


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     * 
     * 
     */

     public function edit($id)
    {
        $post = Post::find($id);

        if (!$post) {
            return redirect()->route('empresa.dashboard')->with('error', 'Postagem não encontrada.');
        }

        return view('posts.index', compact('post'));
    }

    public function update(Request $request, $id)
    {
        $post = Post::find($id);

        // Se a postagem não for encontrada
        if (!$post) {
            return redirect()->route('empresa.dashboard')->with('error', 'Postagem não encontrada.');
        }

        // Atualizar os dados da postagem
        $post->tituloPublicacao = $request->tituloPublicacao;
        $post->detalhePublicacao = $request->detalhePublicacao;
        $post->idEmpresa = $request->idEmpresa;
        $post->idVaga = $request->idVaga;
        $post->fotoPublicacao = $request->fotoUrl;

        // Salvar as alterações
        $post->save();

        // Retornar resposta de sucesso e redirecionar para a página de postagens
        return redirect()->route('empresa.dashboard')->with('success', 'Postagem atualizada com sucesso!');
    }

    /**
     * Remove a postagem.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Encontrar a postagem pelo ID
        $post = Post::find($id);

        // Se a postagem não for encontrada
        if (!$post) {
            return redirect()->route('empresa.dashboard')->with('error', 'Postagem não encontrada.');
        }

        // Excluir a postagem
        $post->delete();

        // Retornar resposta de sucesso e redirecionar para a página de postagens
        return redirect()->route('empresa.dashboard')->with('success', 'Postagem excluída com sucesso!');
    }
}
