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
</head>

<body style="background-color: #f4f4f4;">

@include('components.navbarDashboardEmpresa') 

    <div class="nav-footer">
        <a href="/empresa/dashboard"><i class="fa-solid fa-arrow-left"></i>Voltar</a>
        <ul>
            <li>Pendentes</li>
            <li>Aprovados</li>
            <li>Negados</li>
            <li>Denúncias</li>
        </ul>
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
                        <button class="perfil" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Ver perfil
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content d-flex justify-content-center">
                                    <div class="modal-candidato">
                                        <img src="{{$candidato->usuario->fotoBanner}}" alt="" class="banner-modal">
                                        <div class="d-flex header-modal">
                                            <img src="{{$candidato->usuario->fotoUsuario}}" alt="" style="width: 100px; height: 100px; border-radius: 5rem; align-self: start;">
                                            <div class="dados-modal">
                                                <div style="margin-top: 1.5rem">
                                                    <h5 class="w-100 text-break">{{ $candidato->usuario->nomeUsuario }}</h5>
                                                    <h6 class="mb-0 align-self-center username" style="color: #6a6a6a">{{ $candidato->usuario->usernameUsuario }}</h6>
                                                </div>
                                                <div class="d-flex flex-column sub-candidato">
                                                    <p>{{ $candidato->usuario->emailUsuario }}</p>
                                                    <p>Nasceu em:   {{ \Carbon\Carbon::parse($candidato->usuario->nascUsuario)->format('d/m/Y') }}</p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="conteudo-modal">
                                            <div class="sobre">
                                                <h5>Sobre mim:</h5>
                                                <p style="font-size: 0.8rem">
                                                    {{ $candidato->usuario->sobreUsuario }}
                                                </p>
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
                            <button type="button" class="aprovar" 
                                @if($candidato->status->idStatusVagaUsuario == 2) disabled @endif
                                data-bs-toggle="modal" data-bs-target="#aprovarModal">
                                Aprovar <i class="fa-solid fa-check"></i>
                            </button>

                            <!-- Modal para Aprovação -->
                            <div class="modal fade" id="aprovarModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="aprovarModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content p-5" style="height:20rem">
                                        <div class="modal-aprovar">
                                            <h5>Confirmar Aprovação do Candidato</h5>

                                            <p>Você tem certeza que deseja aprovar este candidato?</p>

                                            <form action="{{ route('candidaturas.aprovar', $candidato->idVagaUsuario) }}" method="POST">
                                                @csrf
                                                <input type="hidden" name="idVagaUsuario" value="{{ $candidato->idVagaUsuario }}">

                                                <!-- Caixa de texto com texto padrão de aprovação, que pode ser editado -->
                                                <div class="form-group">
                                                    <label for="motivoFeedback">Mensagem de Aprovação:</label>
                                                    <textarea name="motivoFeedback" id="motivoFeedback" class="form-control" rows="4" placeholder="Escreva uma mensagem de aprovação ou edite a mensagem padrão...">
                                                        Parabéns, você foi aprovado! Estamos aguardando sua disponibilidade para agendar a entrevista.
                                                    </textarea>
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    <input type="submit" value="Aprovar" class="btn btn-success">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Botão de Negação -->
                            <button type="button" class="negar" 
                                @if($candidato->status->idStatusVagaUsuario == 3) disabled @endif
                                data-bs-toggle="modal" data-bs-target="#negarModal">
                                Negar <i class="fa-solid fa-xmark"></i>
                            </button>

                            <!-- Modal para Negação -->
                            <div class="modal fade" id="negarModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="negarModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content p-5" style="height:20rem">
                                        <div class="modal-negar">
                                            <h5>Confirmar Negação da Candidatura</h5>

                                            <p>Você tem certeza que deseja negar este candidato?</p>

                                            <form action="{{ route('candidaturas.negar', $candidato->idVagaUsuario) }}" method="POST">
                                                @csrf
                                                <input type="hidden" name="idVagaUsuario" value="{{ $candidato->idVagaUsuario }}">

                                                <!-- Caixa de texto com texto padrão de negação, que pode ser editado -->
                                                <div class="form-group">
                                                    <label for="motivoNegacao">Motivo da Negação:</label>
                                                    <textarea name="motivoNegacao" id="motivoNegacao" class="form-control" rows="4" placeholder="Escreva o motivo da negação ou edite a mensagem padrão...">
                                                        Infelizmente, não atendemos ao perfil desejado. No entanto, seu currículo será mantido em nosso banco de dados para futuras oportunidades.
                                                    </textarea>
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    <input type="submit" value="Negar" class="btn btn-danger">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
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