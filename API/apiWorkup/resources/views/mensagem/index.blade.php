<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ url('assets/css/style-mensagem.css') }}">
    <link rel="stylesheet" href="{{ url('../assets/css/dashboardEmpresa.css') }}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <title>Mensagem</title>
    <style>
        /* Estilo global */
        body {
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
        }

        /* Estilo do container principal */
        .container {
            max-width: 90%;
            margin: 0 auto;
        }

        h1 {
            font-size: 28px;
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        /* Estilo para a lista de chats */
        .list-group-item {
            display: flex;
            align-items: center;
            padding: 15px;
            margin-bottom: 10px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .list-group-item:hover {
            background-color: #f0f0f0;
            cursor: pointer;
        }

        .list-group-item img {
            border-radius: 50%;
            margin-right: 15px; /* Espaçamento entre a imagem e o texto */
        }

        /* Estilo para o nome do candidato */
        strong {
            color: #007bff;
            margin-right: 2%; /* Distância entre o nome e a última mensagem */
            margin-left: 2%; /* Distância entre o nome e a última mensagem */
        }

        /* Estilo para a última mensagem */
        .last-message {
            max-width: 60%;  /* Limita a largura da última mensagem */
            overflow: hidden;  /* Oculta qualquer conteúdo que ultrapasse o limite */
            text-overflow: ellipsis;  /* Adiciona "..." no final se o texto for muito longo */
            margin-right: 10px; /* Espaço entre a última mensagem e a data/hora/link */
            white-space: nowrap;  /* Impede quebra de linha */
            flex-grow: 1; /* Faz com que a última mensagem ocupe o espaço disponível */
        }

        /* Container para hora e link */
        .time-link-container {
            display: flex;
            align-items: center;
            margin-left: 10px;
            white-space: nowrap; /* Garante que não quebre a linha */
        }

        /* Estilo para a data/hora da mensagem */
        small.text-muted {
            font-size: 12px;
            color: #999;
            margin-right: 10px; /* Distância entre a data/hora e o link */
        }

        /* Estilo para o link */
        a {
            color: #007bff;
            text-decoration: none;
            white-space: nowrap; /* Garante que não quebre a linha */
        }

        a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body style="background-color: #f4f4f4;">

@include('components.navbarDashboardEmpresa')

<br>
<div class="container mt-5">
    <h1>Chats</h1>

    @if(isset($message))
        <p>{{ $message }}</p>
    @else
        <ul class="list-group">
            <!-- Iterando sobre todos os chats -->
            @foreach($chats as $chat)
                <li class="list-group-item">
                    <img src="{{ $chat->usuario->fotoUsuario }}" alt="Foto do Usuário" width="50" height="50">
                    <strong>Candidato:</strong> {{ $chat->usuario->nomeUsuario }} <br>

                    <!-- Exibindo a última mensagem -->
                    @if ($chat->ultima_mensagem)
                        <div class="last-message">
                            <strong>Última mensagem:</strong> {{ $chat->ultima_mensagem->mensagem }}
                        </div>

                        <!-- Exibindo a data ou hora da última mensagem -->
                        @php
                            $dataMensagem = \Carbon\Carbon::parse($chat->ultima_mensagem->created_at);
                            $dataAtual = \Carbon\Carbon::now();

                            if ($dataMensagem->isToday()) {
                                // Se a mensagem foi enviada hoje, exibe a hora
                                $dataFormatada = $dataMensagem->format('H:i');  // Exibe como Hora:Minuto
                            } else {
                                // Se a mensagem foi de um dia anterior, exibe a data
                                $dataFormatada = $dataMensagem->format('d/m/Y');  // Exibe como Dia/Mês/Ano
                            }
                        @endphp

                        <div class="time-link-container">
                            <small class="text-muted">{{ $dataFormatada }}</small>
                            <a href="{{ route('mensagem.historico', ['idUsuario' => $chat->idUsuario, 'idEmpresa' => $empresa->idEmpresa]) }}" method="GET">
                                Ver histórico de mensagens
                            </a>
                        </div>
                    @else
                        <div class="last-message">
                            <strong>Última mensagem:</strong> Nenhuma mensagem ainda.
                        </div>
                    @endif
                </li>
            @endforeach
        </ul>
    @endif
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</body>
</html>
