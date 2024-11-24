<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="{{url('assets/img/adminImages/WU-icon.png')}}" type="image/x-icon">
    <link rel="stylesheet" href="{{url('../assets/css/estilo-padrao-workup.css')}}">

    <link rel="icon" href="/img/icons/android-chrome-192x192.png" type="image/x-icon">
    <title>WorkUP | Home</title>

    <!-- Fonts -->
    <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/bodyhomeW.css">
    <link rel="stylesheet" href="assets/css/cssHomeWup/navbarhomeW.css">
    <link rel="stylesheet" href="assets/css/cssHomeWup/footerhomeW.css">
    <link rel="stylesheet" href="{{url('../assets/css/dashboardEmpresa.css')}}">

</head>

<body class="d-flex flex-column min-vh-100">

    <!-- Sidebar -->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasSidebar">
        <div class="offcanvas-header">
            <a class="navbar-brand" href="#">
                <img src="{{url('/assets/img/home/workuplogo.png')}}" alt="Logo Desktop" class="logo-desktop">
                <img src="{{url('/assets/img/home/WUPlogo.png')}}" alt="Logo Mobile" class="logo-mobile">
            </a>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        <div class="offcanvas-body">
            <ul class="list-group">
                <li class="list-group-item"><a href="/homeAdmin">home Admin</a></li>
                <li class="list-group-item"><a href="/cadastrarAdmin">cadastrar admin</a></li>
                <li class="list-group-item"><a href="/cadastrarVaga">cadastrar vaga</a></li>
                <li class="list-group-item"><a href="/cadastrarEmpresa">cadastrar empresa</a></li>
            </ul>
        </div>
    </div>

    <!-- Navbar -->
    @include('components.navbarDashboardEmpresa')

    <main class="flex-grow-1">


        <!-- Cabeçalho -->
        <header class="quemsomosf bg-dark py-4">

            <div class="container px-5">

                <div class="row gx-5 align-items-center justify-content-center">
                    <div class="col-lg-6 col-xl-5">
                        <div class="my-4 text-center text-lg-start">
                            <img class="logoheader mb-3" src="{{url('/assets/img/home/workuplogo.png')}}" alt="Logoheader">
                            <p class="lead fw-normal text-white mb-4">Ligando mentes inovadoras a empresas brilhantes</p>
                            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                <a class="btn btn-success btn-lg px-4 me-sm-3" href="/login">Venha conosco</a>
                                <button type="button" class="btn btn-success btn-lg px-4" data-bs-toggle="modal" data-bs-target="#videoModal">Saiba mais</button>

                                <!-- Modal -->
                                <div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="videoModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <div class="embed-responsive embed-responsive-16by9">
                                                    <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/y-Kao78Ug8I" allowfullscreen style="width: 100%; height: 500px;"></iframe>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-5 col-xxl-4 d-none d-xl-block text-center">
                        <img class="img-fluid rounded-4 my-0" src="{{url('/assets/img/home/mkwup.png')}}" alt="imgHeader">
                    </div>
        </header>


        <!-- Funções -->
        <section class="funcoes py-4">
            <div class="container"></div>
            <h3 class="titulo-secao text-center mb-4">Aqui você pode:</h3>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 mb-4">
                    <div class="card-funcoes p-3 h-100">
                        <div class="header-card-funcoes d-flex align-items-center mb-3">
                            <i class="fa-solid fa-note-sticky me-2" style="color: #20dd77;"></i>
                            <h4>Publicar vagas</h4>
                        </div>
                        <div class="body-card-funcoes">
                            <p>Nosso foco principal é a publicação de vagas, onde jovens podem utilizar o aplicativo WorkUp para se inscreverem. Esta é a principal função desta página. As vagas disponíveis podem ser editadas e removidas posteriormente, garantindo que sempre tenhamos oportunidades atualizadas e relevantes para nossos usuários. Acreditamos que, ao facilitar o processo de inscrição e gestão de vagas, estamos ajudando os jovens a encontrar oportunidades de emprego adequadas às suas habilidades e interesses, contribuindo para seu desenvolvimento profissional.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 mb-4">
                    <div class="card-funcoes p-3 h-100">
                        <div class="header-card-funcoes d-flex align-items-center mb-3">
                            <i class="fa-solid fa-paper-plane me-2" style="color: #20dd77;"></i>
                            <h4>Mensagens</h4>
                        </div>
                        <div class="body-card-funcoes">
                            <p>Nosso sistema não se limita apenas à publicação de vagas. Também oferecemos a funcionalidade de enviar mensagens para os candidatos de forma rápida e segura. Isso permite uma comunicação eficiente entre empregadores e candidatos, facilitando a troca de informações e o acompanhamento dos processos seletivos. Com essa ferramenta, os empregadores podem enviar atualizações, convites para entrevistas e feedbacks diretamente aos candidatos, tornando o processo de recrutamento mais ágil e transparente. Além disso, essa comunicação direta ajuda a manter os candidatos informados e engajados, aumentando a eficácia das contratações.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 mb-4">
                    <div class="card-funcoes p-3 h-100">
                        <div class="header-card-funcoes d-flex align-items-center mb-3">
                            <i class="fa-solid fa-users me-2" style="color: #20dd77;"></i>
                            <h4>Compartilhe Conhecimento Profissional </h4>
                        </div>
                        <div class="body-card-funcoes">
                            <p>Além da publicação de vagas e comunicação com candidatos, nossa plataforma também oferece a funcionalidade de fazer posts com informações de cunho profissional. Compartilhe conteúdos valiosos como cursos e bootcamps gratuitos para ajudar a comunidade a se desenvolver e crescer na carreira. Mantenha-se atualizado com as melhores oportunidades de aprendizado e capacitação profissional!</p>
                        </div>
                    </div>
                </div>

            </div>
            </div>
        </section>

    </main>

   
    
    <footer class="text-center text-lg-start text-dark" style="background-color: #ECEFF1">
       
        <section class="d-flex justify-content-between p-4 text-black" style="background-color: #20dd77">
            
            <div class="me-5">
                <h5>Nos siga em nossas mídias sociais</h5>
            </div>
         
            <div>
                <a href="" class="text-white me-4">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fab fa-google"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fab fa-github"></i>
                </a>
            </div>
        </section>

        <section class="">
            <div class="container text-center text-md-start mt-5">

                <div class="row mt-3">

                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                    
                    <img class="logofooter mb-2" src="{{url('/assets/img/home/workuplogo.png')}}" alt="Logofooter" style="width: 200px; height: auto;"> 
                    
                        <p>
                            Sua plataforma de conexão com jovens talentos, onde você pode publicar vagas, enviar mensagens e conhecer os jovens talentos.
                        </p>
                    </div>


                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

                        <h6 class="text-uppercase fw-bold">Produtos</h6>
                        <hr class="mb-4 mt-0 d-inline-block mx-auto" style="width: 60px; background-color: #7c4dff; height: 2px" />
                        <p>
                            <a href="#!" class="text-dark">Postagens</a>
                        </p>
                        <p>
                            <a href="#!" class="text-dark">Usuarios</a>
                        </p>
                        <p>
                            <a href="#!" class="text-dark">Empresas</a>
                        </p>
                       
                    </div>


                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

                        <h6 class="text-uppercase fw-bold">Projetos Parceiros</h6>
                        <hr class="mb-4 mt-0 d-inline-block mx-auto" style="width: 60px; background-color: #7c4dff; height: 2px" />
                        <p>
                            <img src="{{url('/assets/img/home/conectec.jpeg')}}" alt="Sunset" class="logo-projeto" style="width: 100px; height: auto;">
                        </p>
                        <p>
                            <img src="{{url('/assets/img/home/acheaqui.png')}}" alt="Cronos" class="logo-projeto" style="width: 100px; height: auto;">
                        </p>
                        <p>
                            <img src="{{url('/assets/img/home/helphouse.jpeg')}}" alt="Seven" class="logo-projeto" style="width: 100px; height: auto;">
                        </p>
                        
                    </div>


                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

                        <h6 class="text-uppercase fw-bold">Contate-nos</h6>
                        <hr class="mb-4 mt-0 d-inline-block mx-auto" style="width: 60px; background-color: #7c4dff; height: 2px" />
                        <p><i class="fas fa-home mr-3"></i> São Paulo, SP, Brasil</p>
                        <p><i class="fas fa-envelope mr-3"></i> workup@gmail.com</p>
                        <p><i class="fas fa-phone mr-3"></i> 55 (11) 2567-7318</p>
                        <p><i class="fas fa-print mr-3"></i> 55 (11) 6881-3050</p>
                    </div>

                </div>

            </div>
        </section>


        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
        Copyright© 2024 by WorkUP - Todos os direitos reservados.
        </div>
    </footer>
 



    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://vlibras.gov.br/app/vlibras-plugin.js"></script>
    <script>
        new window.VLibras.Widget('https://vlibras.gov.br/app');
    </script>
    <script src="{{url('/assets/js/home.js')}}" async></script>


</body>

</html>