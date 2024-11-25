<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
    <link rel="stylesheet" href="{{ url('assets/css/style-mensagem.css') }}">
    <link rel="stylesheet" href="{{url('../assets/css/estilo-padrao-workup.css')}}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body>
    @include('components.navbarDashboardEmpresa')

    <div class="chat-container">
        <div class="chat-list">
            <h4>Chats</h4>
            <ul>
                @foreach($chats as $chat)
                    <li class="card-mensagem" onclick="window.location='{{ route('mensagem.index', ['idUsuario' => $chat->idUsuario, 'idEmpresa' => $idEmpresa]) }}'">
                        <img src="{{ $chat->usuario->fotoUsuario }}" alt="Foto do Usuário">
                        <div>
                            <h5>{{ $chat->usuario->nomeUsuario }}</h5>
                            <div class="last-message m-0">
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
                        <p>{{ $candidato->usernameUsuario }}</p>
                    </div>
                </div>

                <div class="messages-container">
                    @if($mensagens->count() > 0)
                        @foreach ($mensagens as $mensagem)
                            <div class="message {{ $mensagem->tipoEmissor === 'Empresa' ? 'empresa' : 'usuario' }}">
                                <div class="message-bubble">
                                    <p class="text-truncate">{{ $mensagem->mensagem }}</p>
                                    <small
                                        class="text-muted">{{ \Carbon\Carbon::parse($mensagem->created_at)->format('d/m/Y H:i') }}</small>
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
                        <textarea name="mensagem" id="mensagem" class="input-padrao" placeholder="Digite sua mensagem"></textarea>
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