<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DenunciaUsuario;
use Illuminate\Support\Facades\DB;

class DenunciaUsuarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        // Obtendo todas as denúncias com o nome da empresa
        $denuncias = DenunciaUsuario::with(['usuario', 'empresa', 'status'])->get();

        return view('admin.denuncias.denunciaUsuario', compact('denuncias'));
    }
    

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'idUsuario' => 'required|integer',
            'motivo' => 'required|string|max:255',
            'idEmpresa' => 'required|integer', // Adicione a validação para o ID da empresa
        ]);
    
        try {
            DenunciaUsuario::create([
                'idUsuario' => $request->idUsuario,
                'Motivo' => $request->motivo,
                'idStatus' => 4,
                'idEmpresa' => $request->idEmpresa, // Salve o ID da empresa
            ]);
    
            return redirect()->back()->with('success', 'Denúncia registrada com sucesso.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Erro ao registrar a denúncia: ' . $e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $denuncias = DenunciaUsuario::where('idDenunciaUsuario', $id)->with(['usuario', 'empresa', 'status'])->firstOrFail(); // Retorna 404 se não encontrar
        

        return view('admin.denuncias.allDenunciaUsuario', ['denuncia'=>$denuncias]);
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
    public function destroy($id)
{
    // Encontre a denúncia pelo ID
    $denunciaUsuario = DenunciaUsuario::find($id);

    if ($denunciaUsuario) {
        // Exclua a denúncia
        $denunciaUsuario->delete();
        return redirect()->back()->with('success', 'Denúncia excluída com sucesso!');
    }

    return redirect()->back()->with('error', 'Denúncia não encontrada!');
}

}
