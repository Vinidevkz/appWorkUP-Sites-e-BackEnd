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

    <style>
        /* Cabeçalho com foto e nome */
        .header {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            background-color: #25D366; /* Verde claro do WhatsApp */
            color: white;
            border-radius: 10px;
            margin-bottom: 0px; /* Remover margem para colar com as mensagens */
        }

        /* Foto do usuário */
        .header img {
            width: 45px; /* Tamanho da foto */
            height: 45px; /* Tamanho da foto */
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px; /* Ajuste do espaço à direita da foto */
        }

        /* Nome do usuário e status */
        .header .user-info {
            display: flex;
            flex-direction: column;
        }

        .header .user-info h5 {
            margin: 0;
            font-size: 1.2rem;
        }

        .header .user-info small {
            color: #d1d1d1;
            font-size: 0.9rem;
        }

        /* Estilo do contêiner de mensagens */
        .messages-container {
            padding: 10px 15px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-height: 500px;
            overflow-y: scroll; /* Rolagem apenas na área das mensagens */
            margin-bottom: 20px;
            display: flex;
            flex-direction: column-reverse; /* Exibe a mensagem mais nova primeiro */
            padding-bottom: 20px; /* Garantir que a última mensagem esteja visível */
        }

        /* Estilo para cada mensagem */
        .message {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        /* Estilo para as mensagens enviadas pela empresa (à direita) */
        .message.empresa {
            align-items: flex-end;
        }

        /* Estilo para as mensagens enviadas pelo usuário (à esquerda) */
        .message.usuario {
            align-items: flex-start;
        }

        /* Estilo para o balão de mensagem */
        .message-bubble {
            max-width: 70%;
            padding: 12px 20px;
            border-radius: 20px;
            margin-bottom: 10px;
            font-size: 1rem;
            line-height: 1.4;
            word-wrap: break-word;
            display: inline-block;
        }

        /* Balão da Empresa - Verde mais claro do WhatsApp */
        .message.empresa .message-bubble {
            background-color: #25D366; /* Verde mais claro */
            color: white;
            border-radius: 20px 20px 0 20px; /* Borda arredondada só do lado esquerdo */
            text-align: right;
            box-shadow: 0 2px 10px rgba(37, 211, 102, 0.2);
        }

        /* Balão do Usuário */
        .message.usuario .message-bubble {
            background-color: #e0e0e0; /* Cinza claro para o usuário */
            color: black;
            border-radius: 20px 20px 20px 0; /* Borda arredondada só do lado direito */
            text-align: left;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* Estilo para a hora da mensagem */
        .message small {
            font-size: 0.8rem;
            color: #777;
            text-align: right;
        }

        /* Estilo para o campo de entrada de mensagem */
        textarea {
            border-radius: 25px;
            width: 100%;
            padding: 10px 15px;
            resize: none;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            font-size: 1rem;
            line-height: 1.4;
            height: 50px;
            max-height: 100px;
        }

        /* Botão de envio */
        button {
            background-color: #25D366; /* Verde mais claro do WhatsApp */
            border: none;
            color: white;
            border-radius: 50%;
            padding: 12px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        /* Efeito ao passar o mouse sobre o botão de envio */
        button:hover {
            background-color: #128C7E; /* Um tom mais escuro de verde */
        }

        /* Estilo do formulário de mensagem */
        .campo-mensagem {
            position: sticky;
            bottom: 10px;
            left: 20px;
            right: 20px;
            background-color: #fff;
            padding: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            z-index: 999;
        }

        /* Responsividade */
        @media (max-width: 768px) {
            .campo-mensagem {
                bottom: 10px;
            }

            .messages-container {
                max-height: 400px;
            }

            .message-bubble {
                max-width: 80%;
            }
        }
    </style>
    
</head>
<body style="background-color: #f4f4f4;">
@include('components.navbarDashboardEmpresa')




<!-- Cabeçalho com foto e nome -->
<div class="header">
    <img src="{{ $candidato->fotoUsuario }}" alt="{{ $candidato->nomeUsuario }}">
    <div class="user-info">
        <h5>{{ $candidato->nomeUsuario }}</h5>
        <small>Online</small> <!-- Você pode alterar "Online" conforme o status do usuário -->
    </div>
</div>

<!-- Exibição do histórico de mensagens -->
<div class="container mt-5">
    <div class="messages-container">
        @foreach ($mensagens->reverse() as $mensagem)
            <div class="message {{ $mensagem->tipoEmissor === 'Empresa' ? 'empresa' : 'usuario' }}">
                <div class="message-bubble">
                    <strong>{{ $mensagem->tipoEmissor === 'Empresa' ? 'Você' : $candidato->nomeUsuario }}:</strong>
                    <p>{{ $mensagem->mensagem }}</p>
                </div>
                <small class="text-muted">{{ \Carbon\Carbon::parse($mensagem->created_at)->format('d/m/Y H:i') }}</small>
            </div>
        @endforeach
    </div>

    <!-- Formulário de envio de nova mensagem -->
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
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</body>
</html>
