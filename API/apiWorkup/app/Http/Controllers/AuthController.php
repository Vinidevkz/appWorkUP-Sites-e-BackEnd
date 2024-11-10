<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\Empresa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        // Validação de entrada
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
    
        $email = $request->input('email');
        $password = $request->input('password');
    
        // Adicionar log para depuração do email
        Log::info('Tentativa de login com o email:', ['email' => $email]);
    
        // Verificar na tabela tb_empresa
        $empresa = Empresa::where('emailEmpresa', $email)->first();
        
        if ($empresa) {
            // Log para garantir que a empresa foi encontrada
            Log::info('Empresa encontrada:', ['empresa' => $empresa]);
    
            // Verifica o status da empresa
            $status = $empresa->idStatus;  // Verifique se o nome do campo é realmente 'idStatus' e não 'idstatus'
            
            // Verifica se a senha está correta
            if (Hash::check($password, $empresa->senhaEmpresa)) {
                // Lógica de verificação do status da empresa
                if ($status == 1) {
                    // Status 1: Permite o login
                    Auth::guard('empresa')->login($empresa);
                    return redirect('/empresa/dashboard');
                } elseif ($status == 2) {
                    // Status 2: Bloqueado por muitas denúncias
                    return redirect()->back()->with('error', 'Seu perfil foi bloqueado devido a denúncias. Entre em contato com a administração.');
                } elseif ($status == 3) {
                    // Status 3: Aguardando liberação da administração
                    return redirect()->back()->with('error', 'Seu perfil está aguardando a liberação da administração.');
                } else {
                    // Caso o status não seja 1, 2 ou 3 (status inesperado)
                    return redirect()->back()->with('error', 'Status de empresa desconhecido.');
                }
            } else {
                // Senha incorreta
                return redirect()->back()->with('error', 'Senha incorreta para empresa.');
            }
        }
    
        // Se a empresa não for encontrada, loga a falha
        Log::warning('Empresa não encontrada para o email:', ['email' => $email]);
    
        // Verificar na tabela tb_admin
        $admin = Admin::where('emailAdmin', $email)->first();
        if ($admin) {
            // Se a senha estiver correta, faça o login
            if (Hash::check($password, $admin->senhaAdmin)) {
                Auth::guard('admin')->login($admin);
                Log::info('Admin logged in:', ['email' => $email]);
                return redirect('/admin');  // Redireciona para o dashboard do admin
            } else {
                // Senha incorreta para admin
                return redirect()->back()->with('error', 'Senha incorreta para admin.');
            }
        }
    
        // Se nenhum usuário for encontrado (nem empresa nem admin)
        Log::warning('Credenciais inválidas para o email:', ['email' => $email]);
        return redirect()->back()->with('error', 'Credenciais inválidas.');
    }
    
    
    


    public function showFormLogin()
    {
        return view('login');
    }

    public function logout(Request $request)
    {

        if($request){
            if (Auth::guard('empresa')->check()) {
                Auth::guard('empresa')->logout();
            } elseif (Auth::guard('admin')->check()) {
                Auth::guard('admin')->logout();
            }
    
            return redirect()->route('login')->with('message', 'Logout realizado com sucesso.');

        }

    }
}

