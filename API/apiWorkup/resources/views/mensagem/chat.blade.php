<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
    <link rel="stylesheet" href="{{ url('assets/css/style-mensagem.css') }}">
    <link rel="stylesheet" href="{{url('../assets/css/estilo-padrao-workup.css')}}">

    <link rel="stylesheet" href="{{ url('../assets/css/dashboardEmpresa.css') }}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <style>
        .chat-container {
            display: flex;
            height: 100vh;
        }

        .chat-list {
            width: 30%;
            background-color: #f4f4f4;
            overflow-y: auto;
            border-right: 1px solid #ddd;
        }

        .chat-messages {
            width: 70%;
            display: flex;
            flex-direction: column;
            margin-top: 60px;
            overflow: hidden;
        }

        .header {
            padding: 10px 15px;
            background-color: #25D366;
            color: white;
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
        }

        .header img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .messages-container {
            flex: 1;
            overflow-y: auto;
            padding: 15px;
            background-color: #fff;
            display: flex;
            flex-direction: column;
        }

        .campo-mensagem {
            padding: 10px 15px;
            background-color: #f4f4f4;
            border-top: 1px solid #ddd;
            display: flex;
            align-items: center;
        }

        .campo-mensagem textarea {
            flex: 1;
            border-radius: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            resize: none;
            height: 40px;
        }

        .campo-mensagem button {
            margin-left: 10px;
            background-color: #25D366;
            border: none;
            color: white;
            border-radius: 50%;
            padding: 10px;
            cursor: pointer;
            font-size: 18px;
        }

        .campo-mensagem button:hover {
            background-color: #128C7E;
        }

        .list-group-item {
            display: flex;
            align-items: center;
            padding: 15px;
            margin-bottom: 5px;
            background-color: white;
            border-radius: 8px;
            cursor: pointer;
        }

        .list-group-item img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .message {
            display: flex;
            margin-bottom: 15px;
        }

        .message.usuario {
            justify-content: flex-start;
        }

        .message.empresa {
            justify-content: flex-end;
        }

        .message-bubble {
            max-width: 60%;
            padding: 10px 15px;
            border-radius: 15px;
            font-size: 1rem;
            line-height: 1.4;
        }

        .message.usuario .message-bubble {
            background-color: #e0e0e0;
            color: black;
            border-radius: 15px 15px 15px 0;
        }

        .message.empresa .message-bubble {
            background-color: #25D366;
            color: white;
            border-radius: 15px 15px 0 15px;
        }

        .message small {
            font-size: 0.8rem;
            color: #777;
        }
    </style>
</head>
<body>
    @include('components.navbarDashboardEmpresa')

    <div class="chat-container">
        <div class="chat-list">
            <h3 class="text-center mt-3">Chats</h3>
            <ul class="list-group">
                @foreach($chats as $chat)
                <li class="list-group-item" onclick="window.location='{{ route('mensagem.index', ['idUsuario' => $chat->idUsuario, 'idEmpresa' => $idEmpresa]) }}'">
                        <img src="{{ $chat->usuario->fotoUsuario }}" alt="Foto do Usuário">
                        <div>
                            <strong>{{ $chat->usuario->nomeUsuario }}</strong>
                            <div class="last-message">
                                {{ $chat->ultima_mensagem ? $chat->ultima_mensagem->mensagem : 'Nenhuma mensagem ainda.' }}
                            </div>
                            <small class="text-muted">
                                @php
                                    $dataMensagem = \Carbon\Carbon::parse($chat->ultima_mensagem->created_at ?? $chat->created_at);
                                    $dataAtual = \Carbon\Carbon::now();

                                    if ($dataMensagem->isToday()) {
                                        $dataFormatada = $dataMensagem->format('H:i');
                                    } else {
                                        $dataFormatada = $dataMensagem->format('d/m/Y');
                                    }
                                @endphp
                                {{ $dataFormatada }}
                            </small>
                        </div>
                    </li>
                @endforeach
            </ul>
        </div>

        <div class="chat-messages">
            @if(isset($candidato))
                <div class="header">
                    <img src="{{ $candidato->fotoUsuario }}" alt="{{ $candidato->nomeUsuario }}">
                    <div>
                        <h5>{{ $candidato->nomeUsuario }}</h5>

                    </div>
                </div>

                <div class="messages-container">
    @if($mensagens->count() > 0)
        @foreach ($mensagens as $mensagem)
            <div class="message {{ $mensagem->tipoEmissor === 'Empresa' ? 'empresa' : 'usuario' }}">
                <div class="message-bubble">
                    <p>{{ $mensagem->mensagem }}</p>
                    <small class="text-muted">{{ \Carbon\Carbon::parse($mensagem->created_at)->format('d/m/Y H:i') }}</small>
                </div>
            </div>
        @endforeach
    @else
        <p class="text-center">Nenhuma mensagem ainda.</p>
    @endif
</div>

<form action="{{ route('mensagem.store') }}" method="POST">
    @csrf
    <input type="hidden" name="idUsuario" value="{{ $idUsuario }}">
    <input type="hidden" name="idEmpresa" value="{{ $idEmpresa }}">
    <input type="hidden" name="tipoEmissor" value="Empresa">

    <div class="campo-mensagem">
        <textarea name="mensagem" id="mensagem" placeholder="Digite sua mensagem"></textarea>
        <button type="submit"><i class="fa-solid fa-paper-plane"></i></button>
    </div>
</form>

            @else
                <div class="d-flex justify-content-center align-items-center" style="height: 100%;">
                    <p>Selecione um chat para iniciar uma conversa.</p>
                </div>
            @endif
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
