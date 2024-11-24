<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="{{url('assets/img/adminImages/WU-icon.png')}}" type="image/x-icon">
    <link rel="stylesheet" href="{{url('assets/css/style-vaga.css')}}">
    <link rel="stylesheet" href="{{url('../assets/css/estilo-padrao-workup.css')}}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity=" sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title>Empresa | Cadastrar vaga</title>

</head>

<body style="margin-top: 0">

    @include('components.navbarDashboardEmpresa')

    <section id="vaga">

        <div class="row row-vaga" style="height: 100%">
            <div class="col-7 col-vaga-1">
                <div class="box-vaga">
                    <form action="/vaga/cadastrar" method="POST" class="vaga-wrap">
                        @csrf
                            <h4 class="mb-5" style="font-weight: 400;">Cadastro de vaga</h4>
                            <div class="wrap-body">
                                <div class="row">
                                    <div class="col col-6">
                                        <label for="nomeVaga" >Nome da Vaga</label>
                                        <input class="input-padrao" type="text" name="nomeVaga" value="{{ old('nomeVaga') }}">
                                        @error('nomeVaga')
                                            <div style="background-color: #fff;" class="error-message">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    <div class="col-3 d-flex align-items-center">
                                        <div class="form__group field">
                                            @error('idModalidadeVaga')
                                                <div style="background-color: #fff;" class="error-message">{{ $message }}</div>
                                            @enderror
                                            <div class="input-container">
                                                <label for="estadoVaga">Modalidade:</label>
                                                <!-- Esta parte precisa ficar pode tirar o select contato que de o mesmo nome ao campo -->
                                                <select name="idModalidadeVaga">
                                                    <option value="">Selecionar</option>
                                                    @foreach($modalidades as $modalidade)
                                                        <option value="{{ $modalidade->idModalidadeVaga }}" {{ old('idModalidadeVaga') == $modalidade->idModalidadeVaga ? 'selected' : '' }}>
                                                            {{ $modalidade->descModalidadeVaga }}
                                                            <!-- Supondo que há um campo nomeModalidade na tabela -->
                                                        </option>
                                                    @endforeach
                                                    <!-- Esta parte precisa ficar -->
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 d-flex align-items-center">
                                        <div class="form__group field">
                                            @error('idModalidadeVaga')
                                                <div style="background-color: #fff;" class="error-message">{{ $message }}
                                                </div>
                                            @enderror
                                            <div class="input-container">
                                                <label for="estadoVaga" >Área:</label>

                                                <!-- Esta parte precisa ficar pode tirar o select contato que de o mesmo nome ao campo -->
                                                <select name="idArea">
                                                    <option value="">Selecionar</option>
                                                    @foreach($areas as $area)
                                                        <option value="{{ $area->idArea }}" {{ old('idArea') == $area->idArea ? 'selected' : '' }}>
                                                            {{ $area->nomeArea }}
                                                            <!-- Supondo que há um campo nomeModalidade na tabela -->
                                                        </option>
                                                    @endforeach
                                                    <!-- Esta parte precisa ficar -->
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form__group field">
                                            @error('idModalidadeVaga')
                                                <div style="background-color: #fff;" class="error-message">{{ $message }}
                                                </div>
                                            @enderror
                                            <div class="input-container">
                                                <label for="estadoVaga" >Carga horária:</label>

                                                <!-- Esta parte precisa ficar pode tirar o select contato que de o mesmo nome ao campo -->
                                                <select name="idArea">
                                                    <option value="">Selecionar</option>
                                                    @foreach($areas as $area)
                                                        <option value="{{ $area->idArea }}" {{ old('idArea') == $area->idArea ? 'selected' : '' }}>
                                                            {{ $area->nomeArea }}
                                                            <!-- Supondo que há um campo nomeModalidade na tabela -->
                                                        </option>
                                                    @endforeach
                                                    <!-- Esta parte precisa ficar -->
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-6">
                                        <div class="form__group field">
                                            @error('idModalidadeVaga')
                                                <div style="background-color: #fff;" class="error-message">{{ $message }}
                                                </div>
                                            @enderror
                                            <div class="input-container">
                                                <label for="estadoVaga" >Tipo de contrato:</label>

                                                <!-- Esta parte precisa ficar pode tirar o select contato que de o mesmo nome ao campo -->
                                                <select name="idArea">
                                                    <option value="">Selecionar</option>
                                                    @foreach($areas as $area)
                                                        <option value="{{ $area->idArea }}" {{ old('idArea') == $area->idArea ? 'selected' : '' }}>
                                                            {{ $area->nomeArea }}
                                                            <!-- Supondo que há um campo nomeModalidade na tabela -->
                                                        </option>
                                                    @endforeach
                                                    <!-- Esta parte precisa ficar -->
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-7">
                                        @error('cidadeVaga')
                                            <div style="background-color: #fff;" class="error-message">{{ $message }}</div>
                                        @enderror
                                        <label for="cidadeVaga" >Cidade da Vaga</label>
                                        <input class="input-padrao" type="text" name="cidadeVaga" value="{{ old('cidadeVaga') }}">
                                    </div>
                                    <div class="col col-5">
                                        @error('estadoVaga')
                                            <div style="background-color: #fff;" class="error-message">{{ $message }}</div>
                                        @enderror
                                        <label for="estadoVaga" >Estado da Vaga</label>
                                        <input class="input-padrao" type="text" name="estadoVaga" value="{{ old('estadoVaga') }}">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-12">
                                        @error('diferencialVaga')
                                            <div style="background-color: #fff;" class="error-message">{{ $message }}</div>
                                        @enderror
                                        <label for="diferencialVaga" >Diferencial Vaga</label>
                                        <input class="input-padrao" type="text" name="diferencialVaga" placeholder="Ex: curso técnico" value="{{ old('diferencialVaga') }}">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-12">
                                        <label for="descricaoVaga" >Descrição da Vaga</label>
                                        <input class="input-padrao" type="text" name="descricaoVaga" placeholder="Ex: Vaga para aqueles que querem crecer na empresa" value="{{ old('descricaoVaga') }}">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-12">
                                    @error('beneficiosVaga')
                                            <div style="background-color: #fff;" class="error-message">{{ $message }}</div>
                                        @enderror
                                        <label for="">Benefícios:</label>
                                        <input class="input-padrao" type="text" name="beneficiosVaga" placeholder="Como VR, Vale transporte e etc" value="{{ old('beneficiosVaga') }}">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-5">
                                        <label for="salarioVaga" >Salário da Vaga</label>
                                        <input class="input-padrao" type="text" name="salarioVaga" value="{{ old('salarioVaga') }}">
                                    </div>
                                    <div class="col col-7">
                                        @error('prazoVaga')
                                            <div style="background-color: #fff;" class="error-message">{{ $message }}</div>
                                        @enderror
                                        <label for="">Expira em:</label>
                                        <input class="input-padrao" type="text" name="prazoVaga" value="{{ old('prazoVaga') }}" placeholder="dd/mm/yyyy" pattern="\d{2}/\d{2}/\d{4}" data-mask="00/00/0000" required>
                                    </div>
                                </div>
                            </div>

                            <div class="wrap-footer">
                                <input class="botao-padrao enviar" type="submit" value="Enviar">
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </div>
                    </form>
                </div>
            </div>
            <div class="col-5 col-vaga-2">
                <div class="box-lembrete">
                    <h4>Lembre-se!</h4>
                    <p class="w-75" style="font-size: 0.8rem">Todas e quaisquer características da vaga podem ser
                        editadas posteriormente! Então não se preocupe
                        caso algum dado seja preenchido incorretamente</p>
                </div>
            </div>
        </div>
    </section>
    <script src="{{url('assets/js/script.js')}}"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
           <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- jQuery Mask Plugin -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

</body>

</html>