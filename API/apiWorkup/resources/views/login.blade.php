<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{url('assets/css/estilo-padrao-workup.css')}}">
    <link rel="stylesheet" href="{{url('assets/css/login.css')}}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Bem Vindo(a) a Workup</title>
</head>
<body>

    <section id="login">

        <div class="row h-100">
            <div class="col-login-1 col-5">
                <div class="imgs-login">
                    <div class="d-flex flex-column align-items-center">
                        <img id="logo" src="{{url('assets/img/login/WorkUp-Logo.png')}}" alt="">
                        <p class="text-light fw-medium">Seja Bem Vindo ao nosso site!</p>
                    </div>
                    <img id="notebook" src="{{url('assets/img/login/notebook-teste-2.png')}}" alt="">
                </div>
            </div>
            <div class="col-login-2 col-7">
                <div class="box-login">
                    <form action="/login" method="POST" class="wrap-box-login" action="">
                        @csrf
                        <h3>Fazer login</h3>
                        @if (session('success'))
                            <div class="alert alert-success" id="success-alert">
                                {{ session('success') }}
                            </div>
                        @endif
                        <div class="row body-box-login">
                            <div class="col-12">
                                <label class="label-padrao" for="">E-mail:</label>
                                <input type="email" name="email" class="input-padrao" required placeholder="Digite seu e-mail"></p>
                            </div>
                            <div class="col-12">
                                <label class="label-padrao" for="">Senha:</label>
                                <input type="password" name="password" class="input-padrao" required placeholder="Digite sua senha">
                            </div>
                        </div>
                        <div class="footer-box-login">
                            @if(session('error'))
                                <p style="align-self: center; color: #ff0505; font-size: 0.8rem">{{ session('error') }}</p>
                            @endif
                            <input type="submit" href="/home" id="logar" class="botao-padrao" value="Entrar">
                            </form>
                            <button type="button" class="botao-padrao"><a href="/cadastrarEmpresa" id="cadastrar" style="text-decoration: none; color: #242424">Cadastrar-se</a></button>
                        </div>
                </div>
            </div>
        </div>  
    </section>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
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