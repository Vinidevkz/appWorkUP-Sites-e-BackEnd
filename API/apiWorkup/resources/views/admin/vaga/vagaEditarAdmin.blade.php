<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{url('assets/css/style-visualVaga.css')}}">
    <link rel="stylesheet" href="{{url('../assets/css/estilo-padrao-workup.css')}}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="shortcut icon" href="{{url('assets/img/adminImages/WU-icon.png')}}" type="image/x-icon">
    <title>Empresa | Editar Vaga</title>
</head>

<body>

    @include('components.navbarDashboardEmpresa')

    <section id="editar-vaga">

        <form method="POST" action="{{ route('vagas.update', $vaga->idVaga) }}">
            @csrf
            @method('PUT')


            <div class="box-vaga">
                <form class="wrap-vaga" method="POST" action="{{ route('vagas.update', $vaga->idVaga) }}">
                    @csrf
                    @method('PUT')

                    <h4>Editando a vaga</h4>
                    <div class="body-vaga">
                        <div class="row">
                            <div class="col col-6">
                                <div>
                                    <label for="nomeVaga">Título da vaga:</label>
                                    <input class="input-padrao" type="text" name="nomeVaga"
                                        placeholder="{{ $vaga->nomeVaga }}" value="{{ $vaga->nomeVaga }}" required>
                                </div>
                                @error('nomeVaga')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="col col-6">
                                <div>
                                    <label for="">Modalidade:</label>
                                    <select class="input-padrao" name="idModalidadeVaga">
                                        <option value="">Selecione a Modalidade</option>
                                        @foreach($modalidades as $modalidade)
                                            <option value="{{ $modalidade->idModalidadeVaga }}" {{ old('idModalidadeVaga', $vaga->idModalidadeVaga) == $modalidade->idModalidadeVaga ? 'selected' : '' }}>
                                                {{ $modalidade->descModalidadeVaga }}
                                            </option>
                                        @endforeach
                                    </select>

                                </div>
                                @error('idModalidadeVaga')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="row">
                            <div class="col col-6">
                                <div>
                                    <label for="salarioVaga">Salário:</label>
                                    <input class="input-padrao" type="text" name="salarioVaga"
                                        placeholder="{{ $vaga->salarioVaga }}" value="{{ $vaga->salarioVaga }}"
                                        required>
                                </div>
                                @error('salarioVaga')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror

                            </div>
                            <div class="col col-6">
                                <div>
                                    <label for="">Área:</label>
                                    <select class="input-padrao" name="idArea">
                                        <option value="">Selecione a Área</option>
                                        @foreach($areas as $area)
                                            <option value="{{ $area->idArea }}" {{ old('idArea', $vaga->idArea) == $area->idArea ? 'selected' : '' }}>
                                                {{ $area->nomeArea }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                @error('idVaga')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror
                            </div>



                            <div class="col col-6">
    <div>
        <label for="horarioVaga">Carga horária:</label>
        <select class="input-padrao" name="horarioVaga">
            <option value="44h/Sem" {{ old('horarioVaga', $vaga->horarioVaga) == '44h/Sem' ? 'selected' : '' }}>44h/Sem</option>
            <option value="40h/Sem" {{ old('horarioVaga', $vaga->horarioVaga) == '40h/Sem' ? 'selected' : '' }}>40h/Sem</option>
            <option value="30h/Sem" {{ old('horarioVaga', $vaga->horarioVaga) == '30h/Sem' ? 'selected' : '' }}>30h/Sem</option>
            <option value="20h/Sem" {{ old('horarioVaga', $vaga->horarioVaga) == '20h/Sem' ? 'selected' : '' }}>20h/Sem</option>
            <option value="Flexível (negociada)" {{ old('horarioVaga', $vaga->horarioVaga) == 'Flexível (negociada)' ? 'selected' : '' }}>Flexível (negociada)</option>
        </select>
    </div>
    @error('horarioVaga')
        <div class="error-message">{{ $message }}</div>
    @enderror
</div>

<div class="col col-6">
    <div>
        <label for="contratoVaga">Tipo de contrato:</label>
        <select class="input-padrao" name="contratoVaga">
            <option value="CLT" {{ old('contratoVaga', $vaga->contratoVaga) == 'CLT' ? 'selected' : '' }}>CLT</option>
            <option value="Estágio (Superior)" {{ old('contratoVaga', $vaga->contratoVaga) == 'Estágio (Superior)' ? 'selected' : '' }}>Estágio (Superior)</option>
            <option value="Estágio (Médio)" {{ old('contratoVaga', $vaga->contratoVaga) == 'Estágio (Médio)' ? 'selected' : '' }}>Estágio (Médio)</option>
            <option value="PJ (Pessoa Jurídica)" {{ old('contratoVaga', $vaga->contratoVaga) == 'PJ (Pessoa Jurídica)' ? 'selected' : '' }}>PJ (Pessoa Jurídica)</option>
        </select>
    </div>
    @error('contratoVaga')
        <div class="error-message">{{ $message }}</div>
    @enderror
</div>



                        </div>

                        <div class="row">
                            <div class="col col-6">
                                <div>
                                    <label for="cidadeVaga">Cidade:</label>
                                    <input class="input-padrao" type="text" name="cidadeVaga"
                                        placeholder="{{ $vaga->cidadeVaga }}" value="{{ $vaga->cidadeVaga }}" required>
                                </div>
                                @error('cidadeVaga')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="col col-6">
                                <div>
                                    <label for="estadoVaga">Estado:</label>
                                    <input class="input-padrao" type="text" name="estadoVaga"
                                        placeholder="{{ $vaga->estadoVaga }}" value="{{ $vaga->estadoVaga }}" required>
                                </div>
                                @error('estadoVaga')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="row">
                            <div class="col col-6">
                                <div>
                                    <label for="diferencialVaga">Diferencial:</label>
                                    <input class="input-padrao" type="text" name="diferencialVaga"
                                        placeholder="{{ $vaga->diferencialVaga }}" value="{{ $vaga->diferencialVaga }}"
                                        required>
                                </div>
                                @error('diferencialVaga')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror
                            </div>
                        <div class="col col-6">
                            <div>
                                <label for="prazoVaga">Prazo</label>
                                <input class="input-padrao" type="text" name="prazoVaga"
                                    placeholder="{{ $vaga->prazoVaga }}" pattern="\d{2}/\d{2}/\d{4}"
                                    value="{{ \Carbon\Carbon::parse($vaga->prazoVaga)->format('d/m/Y') }}" required>
                            </div>
                            @error('prazoVaga')
                                <div class="error-message">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <div class="row">
                        <div class="col col-12">
                            <div>
                                <label for="">Benefícios:</label>
                                <input class="input-padrao" type="text" class="input-padrao" name="beneficiosVaga" placeholder="{{ $vaga->beneficiosVaga }}" value="{{ $vaga->beneficiosVaga }}" required>
                            </div>
                            @error('beneficiosVaga')
                                <div class="error-message">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col col-12">
                            <div>
                                <label for="">Descrição:</label>
                                <input class="input-padrao" type="text" class="form-control custom-input class=" input-padrao"" name="descricaoVaga" placeholder="{{ $vaga->descricaoVaga }}" value="{{ $vaga->descricaoVaga }}" required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-between" style="width: 65%">
                    <button class="botao-padrao voltar" style="width: 40%"
                        onclick="window.history.back()">Voltar</button>
                    <button class="botao-padrao registrar" style="width: 40%">Registrar</button>
                </div>
        </form>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>

</body>

</html>