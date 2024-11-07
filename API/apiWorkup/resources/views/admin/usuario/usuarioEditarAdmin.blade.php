<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário com Imagem</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .error-message {
            color: red;
            font-size: 0.875rem;
        }

        .input-container {
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }

        .input-container i {
            margin-right: 0.5rem;
        }

        .form-container {
            background-color: #f9f9f9;
            border-radius: 10px;
            padding: 1rem;
            box-shadow: 0 4px 65px rgba(0, 0, 0, 1);
            max-width: 600px;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .image-container img {
            max-width: 100%;
            border-radius: 10px;
            margin-left: 50px;
        }
        .form-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 50px;
        }

        .btn-custom {
            border-radius: 30px;
            padding: 10px 20px;
            font-size: 16px;
            transition: background-color 0.3s ease;
            height: 40px;
            
        }

        .btn-primary-custom {
            background-color: #00eb00;
            color: rgb(14, 14, 14);
            border: none;
        }

        .btn-primary-custom:hover {
            background-color: #c8ec8d;
        }

        .btn-success-custom {
            background-color: #00ff00;
            color: rgb(0, 0, 0);
            border: none;
            margin-top: 10px;
        }

        .cardsform {
            background-image: url('/assets/img/login/formss.png');
        }

        .text {
            font-weight: 600;
            margin-left: 20px;
        }

        .panel-heading {
            background-color: #18e47e;
            height: 10px;
            color: rgb(26, 25, 25);
            padding: 5px;
        }

        .btn-block {
            width: 120px;
            margin-left: 30px;
            margin-top: 10px;
        }

        /* Estilo de placeholder */
        .form__group {
            position: relative;
            padding: 20px 0 0;
            width: 100%;
        }

        .custom-input {
            font-family: inherit;
            width: 100%;
            border: none;
            border-bottom: 2px solid #9b9b9b;
            outline: 0;
            font-size: 17px;
            color: #000;
            padding: 7px 0;
            background: transparent;
            transition: border-color 0.2s;
        }

        .custom-input::placeholder {
            color: transparent;
        }

        .custom-input:placeholder-shown ~ .form__label {
            font-size: 17px;
            cursor: text;
            top: 20px;
        }
        .form__label {
            position: absolute;
            top: 0;
            display: block;
            transition: 0.2s;
            font-size: 17px;
            color: #9b9b9b;
            pointer-events: none;
        }

        .custom-input:focus {
            padding-bottom: 6px;
            font-weight: 700;
            border-width: 3px;
            border-image: linear-gradient(to right, #116399, #38caef);
            border-image-slice: 1;
        }

        .custom-input:focus ~ .form__label {
            position: absolute;
            top: 0;
            display: block;
            transition: 0.2s;
            font-size: 17px;
            color: #38caef;
            font-weight: 700;
        }

        /* reset input */
        .custom-input:required,
        .custom-input:invalid {
            box-shadow: none;
        }
    </style>
</head>
<body id="boo">
    <main class="cardsform">
        <div class="container mt-2 mb-3">
            <div class="row form-wrapper">
                <!-- Coluna do formulário -->
                <div class="col-md-8 form-container">
                    <div class="panel-heading text mb-5">
                        Editar Usuario
                    </div>

                    <form method="POST" action="{{ route('usuarios.update', $usuario->idUsuario) }}">
                        @csrf
                        @method('PUT')

                        <div class="row">
                            <!-- Primeira Coluna -->
                            <div class="col-md-6">
                                @error('nomeUsuario')
                                <div class="error-message">{{ $message }}</div>
                                @enderror
                                <div class="form__group field">
                                    <input type="text" class="form-control custom-input" name="nomeUsuario" placeholder="{{ $usuario->nomeUsuario }}" value="{{ $usuario->nomeUsuario }}" required>
                                    <label for="nomeUsuario" class="form__label">Nome do Usuario</label>
                                </div>

                                @error('usernameUsuario')
                                <div class="error-message">{{ $message }}</div>
                                @enderror
                                <div class="form__group field">
                                    <input type="text" class="form-control custom-input" name="usernameUsuario" placeholder="{{ $usuario->usernameUsuario }}" value="{{ $usuario->usernameUsuario }}" required>
                                    <label for="usernameUsuario" class="form__label">Username</label>
                                </div>

                                @error('nascUsuario')
                                <div class="error-message">{{ $message }}</div>
                                @enderror
                                <div class="form__group field">
                                    <input type="text" class="form-control custom-input" name="nascUsuario" placeholder="{{ $usuario->nascUsuario }}" value="{{ $usuario->nascUsuario }}" required>
                                    <label for="nascUsuario" class="form__label">nasUsuario</label>
                                </div>

                                @error('contatoUsuario')
                                <div class="error-message">{{ $message }}</div>
                                @enderror
                                <div class="form__group field">
                                    <input type="text" class="form-control custom-input" name="contatoUsuario" placeholder="{{ $usuario->contatoUsuario }}" value="{{ $usuario->contatoUsuario }}" required>
                                    <label for="contatoUsuario" class="form__label">Contato</label>
                                </div>
                            </div>

                            <!-- Segunda Coluna -->
                            <div class="col-md-6">

                                <div class="form__group field">
                                    <input type="text" class="form-control custom-input" name="sobreUsuario" placeholder="{{ $usuario->sobreUsuario }}" value="{{ $usuario->sobreUsuario }}" required>
                                    <label for="sobreUsuario" class="form__label">Sobre</label>
                                </div>


                            </div>
                        </div>

                        <button class="btn btn-primary-custom btn-block" >
                            Registrar
                        </button>
                    </form>

                </div>


                
            </div>
        </div>
    </main>
     <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 

</body>

</html>