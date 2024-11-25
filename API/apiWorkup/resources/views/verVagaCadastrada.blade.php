<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{url('../assets/css/style-candidatos.css')}}">
    <link rel="stylesheet" href="{{url('assets/css/estilo-padrao-workup.css')}}">
    <link rel="stylesheet" href="{{url('../assets/css/dashboardEmpresa.css')}}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <title>Candidatos</title>
</head>

<body style="background-color: #f4f4f4;">

@include('components.navbarDashboardEmpresa') 
<div class="nav-footer">
<a href="/empresa/dashboard"><i class="fa-solid fa-arrow-left"></i>Voltar</a>

<form method="GET" action="{{ route('verVagaCadastrada', $vaga->idVaga) }}">
  
        <ul>
            <li><button type="submit" name="filtro" value="Todos" class="btn btn-link">Todos</button></li>
            <li><button type="submit" name="filtro" value=1 class="btn btn-link">Pendentes</button></li>
            <li><button type="submit" name="filtro" value=2 class="btn btn-link">Aprovados</button></li>
            <li><button type="submit" name="filtro" value=3 class="btn btn-link">Reprovados</button></li>
            <li><button type="submit" name="filtro" value="Denuncias" class="btn btn-link">Denúncias</button></li>
        </ul>
    </form>
</div>
    <section class="candidatos">

        <h4 style="font-size: 1.3rem; font-weight: 400;">Candidatos a vaga: {{ $vaga->nomeVaga }}</h4>

        <div class="box-candidatos row">

        @if (session('success'))
            <div class="alert alert-success" id="success-alert">
                {{ session('success') }}
            </div>
        @endif

            @foreach($candidatos as $candidato)
            @if(request('filtro') == 'Denuncias')
            <div class="col">
                <div class="card-candidato">
                    <div style="display: flex; flex-direction: row; width: 40%; align-items: center;">
                        <div class="dados-candidato">
                            <img src="{{$candidato->usuario->fotoUsuario}}" class="img-candidato">
                            <div>
                                <h5 class="text-truncate">{{$candidato->usuario->nomeUsuario}}</h5>
                                <p>{{ $candidato->usuario->emailUsuario }}</p>
                            </div>
                        </div>

                        <p class="mx-4" style="color: #505050">{{ $candidato->status->tipoStatusVaga }}</p>
                        <button class="perfil" data-bs-toggle="modal" data-bs-target="#verdenuncia{{$candidato->usuario->idUsuario}}">
                            Ver Denuncia
                        </button>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="verdenuncia{{$candidato->usuario->idUsuario}}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="aprovarModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content p-5" style="height:20rem">
                        @foreach($candidato->usuario->denuncias as $denuncia)  <!-- Acessando as denúncias do usuário -->
                            <p>{{ $denuncia->motivo }}</p>
                        @endforeach
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>

                    </div>
                </div>
            </div>
        @endif

        @if(request('filtro') != 'Denuncias')
                <div class="col">

                    <div class="card-candidato">
                        <div style="display: flex; flex-direction: row; width: 40%; align-items: center;">
                            <div class="dados-candidato">
                                <img src="{{$candidato->usuario->fotoUsuario}}" class="img-candidato">
                                <div>
                                    <h5 class="text-truncate">{{$candidato->usuario->nomeUsuario}}</h5>
                                    <p>{{ $candidato->usuario->emailUsuario }}</p>
                                </div>
                            </div>
                            <button class="perfil botao-padrao ms-3" data-bs-toggle="modal" data-bs-target="#verperfil{{$candidato->usuario->idUsuario}}">Perfil</button>

                            <!-- Modal -->
                            <div class="modal fade" id="verperfil{{$candidato->usuario->idUsuario}}" tabindex="-1" aria-labelledby="exampleModalLabel"
                                aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-md">
                                    <div class="modal-content d-flex justify-content-center">
                                        <div class="modal-candidato">
                                            <img src="{{$candidato->usuario->fotoBanner}}" alt="" class="banner-modal">
                                            <div class="d-flex header-modal">
                                                <img src="{{$candidato->usuario->fotoUsuario}}" alt="" class="foto-perfil-usuario">
                                                <div class="dados-modal">
                                                    <div class="user-info-modal">
                                                        <h5 class="w-100 text-break">{{ $candidato->usuario->nomeUsuario }}</h5>
                                                        <h6 class="align-self-center">{{ $candidato->usuario->usernameUsuario }}</h6>
                                                    </div>
                                                    <div class="d-flex flex-column sub-candidato">
                                                        <h6>{{ $candidato->usuario->emailUsuario }}</h6>
                                                        <p>Nasceu em: {{ \Carbon\Carbon::parse($candidato->usuario->nascUsuario)->format('d/m/Y') }}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="conteudo-modal">
                                                <div class="sobre">
                                                    <h6 class="mb-2">Sobre mim:</h6>
                                                    <p style="font-size: 0.8rem">{{ $candidato->usuario->sobreUsuario }}</p>
                                                </div>
                                                <div class="info-adicional">
                                                    <div class="row d-flex flex-column">
                                                        <div class="col">
                                                            <h6>Contato:</h6>
                                                            <p>{{ $candidato->usuario->contatoUsuario }}</p>
                                                        </div>
                                                        <div class="col">
                                                            <h6>Escolaridade:</h6>
                                                            <p>{{ $candidato->usuario->ensinoMedio }}</p>
                                                        </div>
                                                        <div class="col">
                                                            <h6>Cidade:</h6>
                                                            <p>{{ $candidato->usuario->cidadeUsuario }}</p>
                                                        </div>
                                                        <div class="col">
                                                            <h6>Estado:</h6>
                                                            <p>{{ $candidato->usuario->estadoUsuario }}</p>
                                                        </div>
                                                        <div class="col">
                                                            <h6>Extra:</h6>
                                                            <p>{{ $candidato->usuario->formacaoCompetenciaUsuario }}</p>
                                                        </div>
                                                        <div class="col">
                                                            <h6>Término:</h6>
                                                            
                                                            <p>{{ \Carbon\Carbon::parse($candidato->usuario->dataFormacaoCompetenciaUsuario)->format('d/m/Y') }}</p>
                                                        </div>  
                                                        
                                                        <div class="col">
                                                            <h6>Habilidade:</h6>
                                                            <p>{{ $candidato->usuario->skillUsuario }}</p>
                                                            <p>{{ $candidato->usuario->skill2Usuario }}</p>
                                                            <p>{{ $candidato->usuario->skill3Usuario }}</p>
                                                            <p>{{ $candidato->usuario->skill4Usuario }}</p>
                                                            <p>{{ $candidato->usuario->skill5Usuario }}</p>
                                                        </div>


                                                    </div>                                        
                                                </div>                                         
                                            </div>
                                        </div>                                       
                                    </div>                                   
                                </div>
                            </div>
                            <p class="mx-4" style="color: #505050">{{ $candidato->status->tipoStatusVaga }}</p>
                        </div>

                        <div class="opcoes-candidato">
                            <div class="botoes-candidato">

                            <form action="{{ route('mensagem.index', ['idUsuario' => $candidato->idUsuario, $empresa->idEmpresa ]) }}" method="GET">
    @csrf
    <button class="mensagem" value="mensagem"><i class="fa-solid fa-comment"></i>Mensagem</button>
</form>



                                <!-- Botão de Aprovação -->
                            <button type="button" class="aprovar" data-bs-toggle="modal" data-bs-target="#aprovarModal{{$candidato->usuario->idUsuario}}">
                                Aprovar <i class="fa-solid fa-check"></i>
                            </button>

                            <!-- Modal para Aprovação -->
                            <div class="modal fade" id="aprovarModal{{$candidato->usuario->idUsuario}}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="aprovarModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-md">
                                    <div class="modal-content modal-aprovar" style="height: 28rem">
                                        <div class="d-flex align-items-center flex-column">
                                            <h5>Confirmar Aprovação do Candidato</h5>
                                            <p>Deseja aprovar {{$candidato->usuario->nomeUsuario}}?</p>
                                        </div>

                                        <form action="{{ route('candidaturas.aprovar', $candidato->idVagaUsuario) }}" method="POST" style="width: 75%">
                                            @csrf
                                            <input type="hidden" name="idVagaUsuario" value="{{ $candidato->idVagaUsuario }}">

                                            <!-- Caixa de texto com texto padrão de aprovação, que pode ser editado -->
                                            <div class="d-flex flex-column">
                                                <label for="motivoFeedback">Mensagem de Aprovação:</label>
                                                <textarea name="motivoFeedback" id="motivoFeedback" class="input-padrao" rows="4" style="resize: none;" placeholder="Escreva uma mensagem de aprovação">Parabéns, você foi aprovado! Estamos aguardando sua disponibilidade para agendar a entrevista.</textarea>
                                            </div>

                                            <div class="modal-footer d-flex justify-content-between">
                                                <input type="submit" value="Aprovar" class="botao-padrao btn-verde">
                                                <button type="button" class="botao-padrao w-100" data-bs-dismiss="modal">Cancelar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>


                                                            

                            <!-- Botão de Negação -->
                            <button type="button" class="negar" data-bs-toggle="modal" data-bs-target="#negarModal{{$candidato->usuario->idUsuario}}">
                                Negar <i class="fa-solid fa-xmark"></i>
                            </button>

                            <!-- Modal para Negação -->
                            <div class="modal fade" id="negarModal{{$candidato->usuario->idUsuario}}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria labelledby="negarModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-md">
                                    <div class="modal-content modal-negar" style="height: 28rem">
                                        <div class="d-flex align-items-center flex-column">
                                            <h5>Confirmar rejeição do Candidato</h5>
                                            <p>Deseja negar {{$candidato->usuario->nomeUsuario}}?</p>
                                        </div>

                                        <form action="{{ route('candidaturas.negar', $candidato->idVagaUsuario) }}" method="POST" style="width: 80%">
                                            @csrf
                                            <input type="hidden" name="idVagaUsuario" value="{{ $candidato->idVagaUsuario }}">

                                            <!-- Caixa de texto com texto padrão de rejeição, que pode ser editado -->
                                            <div class="d-flex flex-column">
                                                <label for="motivoFeedback">Mensagem de rejeição:</label>
                                                <textarea name="motivoNegacao" id="motivoNegacao" class="input-padrao" rows="4" placeholder="Escreva o motivo da rejeição" style="resize: none">Infelizmente, não atendemos ao perfil desejado. No entanto, seu currículo será mantido em nosso banco de dados para futuras oportunidades.</textarea>
                                            </div>

                                            <div class="modal-footer d-flex justify-content-between">
                                                <input type="submit" value="Negar" class="botao-padrao text-light w-100" style="background-color: #ff6565">
                                                <button type="button" class="botao-padrao w-100" data-bs-dismiss="modal">Cancelar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            </div>
                            <button class="denunciar" data-bs-toggle="modal" data-bs-placement="top" data-bs-target="#staticBackdrop">
                                <i class="fa-solid fa-flag"></i>
                            </button>

                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-md">
                                    <div class="modal-content p-5" style="height:20rem">
                                        <div class="modal-denuncia">
                                            <h5>Denunciar candidato</h5>


                                            <form action="{{ route('denunciar.store') }}" method="POST" class="denuncia-body">
                                            @csrf
                                            <input type="hidden" name="idUsuario" value="{{ $candidato->usuario->idUsuario }}">
                    
                                            <input type="hidden" name="idEmpresa" value="{{ $empresa->idEmpresa  }}"> <!-- Aqui estou assumindo que a empresa está autenticada com Auth -->


                                            
                                                <div class="denuncia-input">
                                                    <label for="">Motivo:</label>
                                                    <textarea class="input-padrao" name="motivo" id="motivo" placeholder="Detalhe o motivo da denúncia"></textarea>
                                                </div>
                                                <div class="denuncia-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                                                    <input type="submit" value="Denunciar">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
                @endif

            @endforeach
        </div>

    </section>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
    <script>
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
    </script>

<script>
    // Define o tempo em milissegundos (exemplo: 3000 ms = 3 segundos)
    setTimeout(function() {
        // Seleciona o elemento do alerta e o esconde
        const alert = document.getElementById('success-alert');
            if (alert) {
                alert.style.transition = "opacity 0.5s ease";
                alert.style.opacity = "0";  // Faz o alerta desaparecer suavemente
                setTimeout(() => alert.remove(), 500); // Remove o alerta do DOM após a transição
            }
        }, 2500); // Tempo de exibição do alerta em milissegundos
    </script>
</body>

</html>