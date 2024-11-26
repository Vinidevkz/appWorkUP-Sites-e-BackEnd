<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="{{url('assets/img/adminImages/WU-icon.png')}}" type="image/x-icon">
        <link rel="stylesheet" href="{{url('../assets/css/estilo-padrao-workup.css')}}">
        <link rel="stylesheet" href="{{url('../assets/css/style-home-workup.css')}}">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="icon" href="/img/icons/android-chrome-192x192.png" type="image/x-icon">  
        <title>Document</title>
        <style>
            @media (max-width: 767px) {
                #funcoes, #objetivos {
                    margin-bottom: 6rem;
                }
                .cards-objetivos {
                    display: grid;
                    grid-template-columns: repeat(1, 1fr);
                    grid-gap: 2rem;
                    max-height: 300px;
                    overflow-y: auto;
                }
            }
        </style>
    </head>

    <body style="background-color: var(--ed);">
        
        @include('components.navbarDashboardEmpresa')

        <section id="card-header">
            <div class="saudacoes">
                <img src="{{url('assets/img/login/workup-verde-branco.png')}}" alt="" style="width: 8rem;">
                <p>Seja Bem vindo(a)</p>
                <h3>Venha fazer parte da equipe WorkUp!</h3>
                <a href="/login" class="botao-padrao">Entrar</a>
            </div>
        </section>

        <section id="funcoes">

            <h5 class="mt-5">Aqui você pode:</h5>

            <div class="wrap-funcoes">

                <div class="row">
                    <div class="col-12 col-md-4">
                        <div class="card-funcoes">
                            <h5><i class="me-2 fa-solid fa-window-maximize"></i> Publicar vagas</h5>
                            <div class="conteudo-funcoes">
                                <p>Nosso foco principal é a publicação de vagas. As vagas disponíveis podem ser editadas e removidas posteriormente, garantindo que sempre tenhamos oportunidades atualizadas e relevantes para nossos usuários.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="card-funcoes">
                            <h5><i class="me-2 fa-solid fa-comment"></i> Conversar com candidatos</h5>
                            <div class="conteudo-funcoes">
                                <p>Nosso sistema não se limita apenas à publicação de vagas, oferecendo a função de enviar mensagens para os candidatos de forma rápida e segura, permitindo uma comunicação eficiente entre empregadores e candidatos.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="card-funcoes">
                            <h5><i class="me-2 fa-solid fa-share-nodes"></i> Compartilhar informações</h5>
                            <div class="conteudo-funcoes">
                                <p>Além da publicação de vagas e comunicação com candidatos, nossa plataforma conta com posts que podem ser publicados por você empresa. Compartilhe conteúdos valiosos como cursos e bootcamps para ajudar a comunidade a se desenvolver profissionalmente.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </section>

        <section id="objetivos">
            <h5 class="mt-5">Nossos valores e objetivos:</h5>

            <div class="cards-objetivos row mt-5">
                <div class="col-12 col-md-4">
                    <div class="card-objetivos">
                        <div class="header-card-objetivos">
                            <h5>Fornecer uma comunicação assertiva:</h5>
                            <img src="{{url('assets/img/home/chat-home-asset.png')}}" alt="">
                        </div>
                        <div class="body-card-objetivos">
                            <p>"Nosso objetivo é conectar recrutadores com jovens talentos promissores e qualificados que estão prontos para contribuir com suas habilidades e energia no mercado de trabalho."</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="card-objetivos">
                        <div class="header-card-objetivos">
                        <h5>Auxiliar no ingresso de jovens:</h5>
                        <img src="{{url('assets/img/home/auxilio-home-asset.png')}}" alt="">
                            

                        </div>
                        <div class="body-card-objetivos">
                        <p>"Recrutadores têm acesso a um banco de dados extenso e ferramentas avançadas para facilitar a busca e seleção de jovens talentos. Garantimos um processo de recrutamento ágil e assertivo."</p>
                            
                            
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="card-objetivos">
                        <div class="header-card-objetivos">
                        <h5>Promovendo Diversidade e Inclusão:</h5>
                        <img src="{{url('assets/img/home/diversidade-home-asset.png')}}" alt="">

                        </div>
                        <div class="body-card-objetivos">
                        <p>"Estamos comprometidos em promover a diversidade e inclusão no ambiente de trabalho, candidatos diversos que tragam novas perspectivas e inovação para sua empresa."</p>
                            
                        </div>
                    </div>
                </div>
            </div>

        </section>


        <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 py-5 my-5 text-light px-5" style="background-color: #0c0c0c; margin: 0 !important">
            <div class="col">
                <img src="{{url('assets/img/login/workup-verde-branco.png')}}" alt="" style="width: 8rem;">
                <p>WorkUp construindo sonhos de jovens talentos e linkando-os ha grandes empresas.</p>
            </div>
            <div class="col mb-3"></div>
            <div class="col mb-3"></div>
            <div class="col mb-3">
                <h5>Contate-nos</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2">
                        email; workup@projetos.com
                    </li>
                    <li class="nav-item mb-2">
                        tel; (11) 99999-9999
                    </li>
                    <li class="nav-item mb-2">
                        sac; (11) 99999-9999
                    </li>
                    <li class="nav-item mb-2">
                        fax; (11) 99999-9999
                    </li>
                   
                </ul>
            </div>
            <div class="col mb-3">
                <h5>Endereços</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2">
                        São Paulo - SP
                    </li>
                    <li class="nav-item mb-2">
                        Natal - RN
                    </li>
                    <li class="nav-item mb-2">
                        Curitiba - PR
                    </li>
                    <li class="nav-item mb-2">
                        Manaus -- AM
                    </li>
                    
                </ul>
            </div>

        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://vlibras.gov.br/app/vlibras-plugin.js"></script>
        <script src="{{url('/assets/js/home.js')}}" async></script>
    </body>
</html>