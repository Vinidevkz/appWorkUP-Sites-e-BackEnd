<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Chats</h1>

        <!-- Verificando se há uma mensagem de erro -->
        @if(isset($message))
            <p>{{ $message }}</p>
        @else
            <ul class="list-group">
                <!-- Iterando sobre a coleção de chats -->
                @foreach($chats as $chat)
                    <li class="list-group-item">
                        <strong>Usuário:</strong> {{ $chat->usuario->nomeUsuario }} <br>

                        <img src="{{ $chat->usuario->fotoUsuario }}" alt="Foto do Usuário" width="50" height="50"> <br>
                        <strong>Empresa:</strong> {{ $chat->empresa->nomeEmpresa }} <br>

                        <!-- Exibindo a última mensagem -->
                        @if ($chat->ultima_mensagem)
                            <strong>Última mensagem:</strong> {{ $chat->ultima_mensagem->mensagem }}
                        @else
                            <strong>Última mensagem:</strong> Nenhuma mensagem ainda.
                        @endif

                        <!-- Link para ver histórico de mensagens -->
                         <br>
                        <a href="{{ route('mensagens.show', ['idUsuario' => $idUsuario, 'idEmpresa' => $chat->empresa->idEmpresa]) }}">
                            Ver histórico de mensagens
                        </a>
                    </li>
                @endforeach
            </ul>
        @endif
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
