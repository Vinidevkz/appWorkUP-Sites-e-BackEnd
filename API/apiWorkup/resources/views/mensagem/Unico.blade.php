<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Histórico de Mensagens</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Histórico de Mensagens</h1>

        <!-- Verificando se há uma mensagem de erro -->
        @if(isset($message))
            <p>{{ $message }}</p>
        @else
            <ul class="list-group">
                <!-- Iterando sobre as mensagens -->
                @foreach($mensagens as $mensagem)
                    <li class="list-group-item">
                        <strong>{{ $mensagem->usuario->nomeUsuario }} ({{ $mensagem->empresa->nomeEmpresa }}):</strong> 
                        {{ $mensagem->mensagem }} <br>
                        <small>Enviado em: {{ \Carbon\Carbon::parse($mensagem->created_at)->format('d/m/Y H:i') }}</small>
                    </li>
                @endforeach
            </ul>
        @endif
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
