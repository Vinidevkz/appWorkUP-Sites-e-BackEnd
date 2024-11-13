<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />

<header class="fixed-top">
    <div class="header-wrap">

        <div class="wrap-logo">
            <a href="{{ route('empresa.dashboard') }}">
                <img src="{{ url('assets/img/dashboardEmpresa/logo-reduzida.png') }}" alt="">
            </a>
        </div>
        @auth
        <ul>
            <a href="{{route('empresa.dashboard')}}">Home</a>
            <a href="#vagas">Vagas</a>
            <a href="#publicacoes">Postagens</a>
        </ul>
        


        <div class="wrap-user">
            <div>
                <!-- Verifique se $empresa não é null antes de exibir os dados -->
                <div class="d-flex flex-row">
                    <a href="{{ route('empresas.edit', $empresa->idEmpresa) }}">{{ $empresa->usernameEmpresa }}</a>
                    <img src="{{$empresa->fotoEmpresa}}">
                </div>

                <div>
                    <button type="submit" class="text-light d-flex align-items-center" style="background-color: transparent; border: none;" data-bs-toggle="modal" data-bs-target="#sair">
                        Sair
                        <span class="material-symbols-outlined text-light ms-1">
                            logout
                        </span>
                    </button>

                </div>


                @endauth

            </div>
        </div>
    </div>
</header>

<!-- Modal -->

<div class="modal fade" id="sair" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content " style="margin: 0; padding:0; height:200px;">
            <div class="modal-header">
            </div>
            <div class="modal-body" style="margin: 0; padding:0">
                <h1 class="modal-title fs-5" id="exampleModalLabel"> Deseja realmente sair? </h1>
            </div>
            <div class="modal-footer">
                <form action="/logout" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col mx-3 m-0 p-0 " style="width:100px"><button type="button" class="botao-card text-light" style="background-color:#303030" data-bs-dismiss="modal">Não</button></div>
                        <div class="col mx-3 m-0 p-0"> <button type="submit" class="botao-card botao-vaga">Sair</button></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


