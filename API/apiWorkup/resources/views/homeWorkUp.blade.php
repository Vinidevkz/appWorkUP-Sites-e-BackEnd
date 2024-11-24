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
        <link rel="icon" href="/img/icons/android-chrome-192x192.png" type="image/x-icon">
        <title>Document</title>
    </head>

    <body style="background-color: var(--ed);">
        
        @include('components.navbarDashboardEmpresa')

        <section id="card-header">
            <div class="saudacoes">
                <p>Seja Bem vindo(a)</p>
                <h3>Venha fazer parte da equipe WorkUp!</h3>
                <a href="/login" class="botao-padrao">Entrar</a>
            </div>
        </section>

        <section id="funcoes">

            <h5 class="mt-5">Aqui você pode:</h5>

            <div class="wrap-funcoes">

                <div class="row">
                    <div class="col">
                        <div class="card-funcoes">
                            <h5><i class="me-2 fa-solid fa-window-maximize"></i> Publicar vagas</h5>
                            <div class="conteudo-funcoes">
                                <p>Nosso foco principal é a publicação de vagas. As vagas disponíveis podem ser editadas e removidas posteriormente, garantindo que sempre tenhamos oportunidades atualizadas e relevantes para nossos usuários.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-funcoes">
                            <h5><i class="me-2 fa-solid fa-comment"></i> Conversar com candidatos</h5>
                            <div class="conteudo-funcoes">
                                <p>Nosso sistema não se limita apenas à publicação de vagas, oferecendo a função de enviar mensagens para os candidatos de forma rápida e segura, permitindo uma comunicação eficiente entre empregadores e candidatos.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
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



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://vlibras.gov.br/app/vlibras-plugin.js"></script>
        <script src="{{url('/assets/js/home.js')}}" async></script>

    </body>

</html>