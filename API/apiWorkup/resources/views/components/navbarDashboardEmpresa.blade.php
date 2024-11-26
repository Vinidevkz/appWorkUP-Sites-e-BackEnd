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
                        <a href="{{ route('empresas.edit', $empresa->idEmpresa) }}">{{ $empresa->nomeEmpresa }}</a>
                        <img src="{{$empresa->fotoEmpresa}}">
                    </div>

                    <div>
                        <button type="submit" class="text-light d-flex align-items-center" style="background-color: transparent; border: none;" data-bs-toggle="modal" data-bs-target="#sair">Sair
                            <span class="material-symbols-outlined text-light ms-1">logout</span>
                        </button>
                    </div>

                </div>
            </div>
            
        @endauth

    </div>
</header>

<!-- Modal -->

<div class="modal fade" id="sair" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content" style="height:225px;">
            <h1 class="modal-title fs-5 mt-4 fw-light" id="exampleModalLabel">Deseja realmente sair?</h1>
            <div class="modal-footer w-75 d-flex justify-content-center">
                <form action="/logout" method="POST" class="w-100 d-flex justify-content-between">
                    @csrf
                    <button type="button" class="botao-padrao text-light" style="background-color: var(--24); width: 5rem" data-bs-dismiss="modal">Não</button>
                    <button type="submit" class="botao-padrao botao-vaga" style="width: 5rem">Sair</button>
                </form>
            </div>
        </div>
    </div>
</div>