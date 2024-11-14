<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{url('assets/css/style-mensagem.css')}}">
    <link rel="stylesheet" href="{{url('../assets/css/dashboardEmpresa.css')}}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <title>Mensagem</title>
</head>
<body style="background-color: #f4f4f4;">

@include('components.navbarDashboardEmpresa') 

    <form action="{{ route('mensagem.store') }}" method="POST">
    @csrf
        <input type="hidden" name="idUsuario" value="{{ $idUsuario }}">
        <input type="hidden" name="idEmpresa" value="{{ $idEmpresa }}">
        <input type="hidden" name="tipoEmissor" value="Empresa">
            <div class="perfil-user">
            <img src="{{$candidato->usuario->fotoUsuario}}" alt="">
                <div>
                    <h5>{{ $candidato->usuario->nomeUsuario }}</h5>
                    <p>{{ $candidato->usuario->usernameUsuario }}</p>
                    
                    
                </div>
            </div>

            <div class="campo-mensagem fixed-bottom">
                <div>
                    <textarea name="mensagem" id="mensagem"></textarea>
                    <button type="submit"><i class="fa-solid fa-paper-plane" style="color: #fff;"></i></button>
                </div>
            </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</body>
</html>