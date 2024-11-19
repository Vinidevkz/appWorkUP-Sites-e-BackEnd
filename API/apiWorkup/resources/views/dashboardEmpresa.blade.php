<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{url('../assets/css/estilo-padrao-workup.css')}}">
    <link rel="stylesheet" href="{{url('../assets/css/dashboardEmpresa.css')}}">
    <link rel="shortcut icon" href="{{url('assets/img/adminImages/WU-icon.png')}}" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet integrity="
        sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <title>Empresa | Home</title>
</head>

<body>

    @include('components.navbarDashboardEmpresa')
    
    <section class="card rounded-0">
        <div class="row">
            <div class="col-12 col-md-6 d-flex align-items-center justify-content-center">
                <div class="txt-card-wrap text-center text-md-start p-3">
                    <p>Seja bem-vindo(a) {{ $empresa->nomeEmpresa }}!</p>
                    <h3>
                        Nos ajude nessa jornada de transformar a carreira de diversas pessoas
                    </h3>
                    <div
                        class="botoes-card d-flex flex-column flex-md-row justify-content-center justify-content-md-start">
                        <a href="{{ route('cadastrarVaga') }}"
                            class="botao-card botao-vaga mb-2 mb-md-0 me-md-2">Publicar vaga</a>
                        <a href="{{ route('post.create', $empresa->idEmpresa) }}" class="botao-card botao-post">Fazer
                            post</a>

                            
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6">
                <!-- Imagem ou conteúdo adicional pode ser adicionado aqui -->
            </div>
        </div>
    </section>

    <section class="funcoes">
        <h4 class="mb-5" style="align-self: center">Aqui você pode:</h4>
        <div class="row align-self-center linha-funcoes" style="width: 95%">
            <div class="col-funcoes col-4">
                <div class="card-funcoes">
                    <div class="header-card-funcoes d-flex align-items-center mb-3">
                        <i class="fa-solid fa-note-sticky me-2" style="color: #20dd77;"></i>
                        <h5>Publicar vagas</h5>
                    </div>
                    <div class="body-card-funcoes">
                        <p>O nosso foco é a publicação de vagas, podendo ser editadas e removidas posteriormente.</p>
                    </div>
                </div>
            </div>
            <div class="col-funcoes col-4">
                <div class="card-funcoes">
                    <div class="header-card-funcoes d-flex align-items-center mb-3">
                        <i class="fa-solid fa-paper-plane me-2" style="color: #20dd77;"></i>
                        <h5>Mensagens</h5>
                    </div>
                    <div class="body-card-funcoes">
                        <p>Enviar menssagens aos candidatos de forma rapida e segura .</p>
                    </div>
                </div>
            </div>
            <div class="col-funcoes col-4">
                <div class="card-funcoes">
                    <div class="header-card-funcoes d-flex align-items-center mb-3">
                        <i class="fa-solid fa-users me-2" style="color: #20dd77;"></i>
                        <h5>Conhecer os jovens talentos</h5>
                    </div>
                    <div class="body-card-funcoes">
                        <p>Aqui você pode se conectar estudantes de diferentes áreas, promovendo a troca de
                            conhecimento e networking.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section id="vagas" class="vagas">
        <div class="d-flex justify-content-start mt-5">
            <h4 class="mb-5">Vagas publicadas</h4>
        </div>

        <div class="wrap-carrossel position-relative">
            <img src="{{url('assets/img/dashboardEmpresa/bckBtn.png')}}" class="btn-carrossel position-absolute start-0"
                id="backBtn">

            <div class="carrossel">
                @if($vagas->isEmpty())
                    <div class="alert alert-warning" role="alert">
                        Nenhuma vaga publicada.
                    </div>
                @else
                    @foreach($vagas as $vaga)
                        <div class="col-12 col-sm-4 col-md-4 col-lg-3 d-flex justify-content-center mb-4 col-vaga">
                            <div class="vaga">
                                <div class="wrap-vaga">
                                    <div class="header-vaga">
                                        <h5 class="text-truncate">{{$vaga->nomeVaga}}</h5>
                                        <div>
                                            <p>Publicada em {{ \Carbon\Carbon::parse($vaga->created_at)->format('d/m/Y')}}</p>
                                            <p>Aberta até {{ \Carbon\Carbon::parse($vaga->prazoVaga)->format('d/m/Y') }}</p>
                                        </div>
                                    </div>
                                    <div class="opt-vaga">
                                        <p class="text-truncate my-1">Descrição: {{ $vaga->descricaoVaga }}</p>
                                        <p class="text-truncate my-1">Salário: R${{ $vaga->salarioVaga }}</p>
                                        <p class="text-truncate mb-1">Área: {{ $vaga->area->nomeArea }}</p>
                                        <p class="text-truncate mb-1">Estado: {{ $vaga->estadoVaga }}</p>
                                        <p class="text-truncate mb-1">Candidatos: {{  $vaga->candidatos_count ?? 0 }}</p>
                                    </div>

                                    <div class="footer-vaga">
                                        <button type="button" class="btn-verde botao-padrao" data-bs-toggle="modal"
                                            data-bs-target="#modalVaga{{$vaga->idVaga}}">Detalhes<i
                                                class="fa-solid fa-clipboard-list"></i></button>

                                        <a href="{{ route('verVagaCadastrada', $vaga->idVaga) }}" class="btn-vazado botao-padrao w-50">Candidatos<i class="fa-solid fa-user"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach

                    @foreach($vagas as $vaga)
                        <!-- Modal para cada vaga -->
                        <div class="modal fade" id="modalVaga{{ $vaga->idVaga }}" tabindex="-1"
                            aria-labelledby="modalVagaLabel{{ $vaga->idVaga }}" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="header-modal-vaga">
                                        <div>
                                            <h5>{{ $vaga->nomeVaga }}</h5>
                                            <p class="text mb-3" style="font-weight: 400">
                                                Candidatos: {{  $vaga->candidatos_count ?? 0 }}</p>
                                        </div>
                                    </div>
                                    <div class="opt-vaga">
                                        <p class="text-truncate my-1">Descrição: {{ $vaga->descricaoVaga }}</p>
                                        <p class="text my-1">Salário: R${{ $vaga->salarioVaga }}</p>
                                        <p class="text mb-1">Área: {{ $vaga->nomeVaga }}</p>
                                        <p class="text mb-1">Modalidade: {{ $vaga->modalidade->descModalidadeVaga }}</p>
                                        <p class="text mb-1">Cidade: {{ $vaga->cidadeVaga }}</p>
                                        <p class="text mb-1">Estado: {{ $vaga->estadoVaga }}</p>
                                        <p class="text mb-1">Diferencial: {{ $vaga->diferencialVaga }}</p>
                                    </div>
                                    <div class="modal-footer d-flex justify-content-between w-75 align-self-center">
                                        <a href="{{ route('vagas.edit', $vaga->idVaga) }}"
                                            class="btn-vagas btn-verde w-100">Editar<i class="fa-solid fa-pen-to-square"
                                                style="color: #ffffff;"></i></a>
                                        <button type="button" class="btn-vagas w-100" data-bs-dismiss="modal"
                                            style="background-color: #ededed; color: black">Voltar</button>
                                        <a href="{{ route('verVagaCadastrada', $vaga->idVaga) }}" class="btn-vazado botao-padrao w-50">Candidatos<i class="fa-solid fa-user"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach

                @endif
            </div>

            <img id="nextBtn" src="{{url('assets/img/dashboardEmpresa/nextBtn.png')}}"
                class="btn-carrossel position-absolute end-0" id="nextBtn">
        </div>
    </section>

  

    <section id="publicacoes" class="publicacoes">
        <h4 class="mb-5">Publicações</h4>
        <div class="wrap-carrossel-publ position-relative">
    <img src="{{url('assets/img/dashboardEmpresa/bckBtn.png')}}" class="btn-carrossel position-absolute start-0"
        id="backBtn">

    <div class="carrossel-publ">
        @if($posts->isEmpty())
        <div class="alert alert-warning" style="align-self: center" role="alert">
            Nenhuma postagem encontrada.
        </div>
        @else
        @foreach($posts as $post)
        <div class="col-12 col-sm-4 col-md-4 col-lg-4 d-flex justify-content-center">
            <div class="publ">

            <div class="empresa-publ">
                    <img src="{{ $empresa->fotoEmpresa }}" alt="">
                    <div>
                        <h5>{{ $empresa->nomeEmpresa }}</h5>
                        <p>{{ $empresa->usernameEmpresa }}</p>
                    </div>
                    
                </div>

                <div class="col conteudo-publ">
                    <p>{{ $post->detalhePublicacao }}</p>
                </div>
                    <img src="{{$post -> fotoPublicacao}}" class="img-publ" alt="">
            </div>
        </div>
        @endforeach
        @endif
    </div>

    <img id="nextBtn" src="{{url('assets/img/dashboardEmpresa/nextBtn.png')}}"
        class="btn-carrossel position-absolute end-0" id="nextBtn">
</div>

    </section>

    <footer class="py-3" style="background-color: #1b1b1b">
        <ul class="nav justify-content-center border-bottom pb-3 mb-3" style="gap: 2rem;">
            <li class="nav-item">
                <a href=""><i class="fa-brands fa-github"></i></a>
            </li>
            <li class="nav-item">
                <a href=""><i class="fa-brands fa-square-x-twitter"></i></a>
            </li>
            <li class="nav-item">
                <a href=""><i class="fa-brands fa-square-instagram"></i></a>
            </li>
        </ul>
        <p class="text-center text-light">
            @ Todos os direitos reservados a Dynamo inc.
        </p>
    </footer>

    <script src="{{url('assets/js/carrossel-vagas.js')}}"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>

    <script>
        function toggleDenunciaForm(userId) {
            var form = document.getElementById('denunciaForm' + userId);
            if (form.style.display === "none") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        }
    </script>

</body>

</html>