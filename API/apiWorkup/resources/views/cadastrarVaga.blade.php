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
                                        <div class="d-flex flex-row">
                                            <label for="nomeVaga" >Título</label>
                                            @error('nomeVaga')
                                                <div class="text-danger ps-1">{{ $message }}</div>
                                            @enderror
                                        </div>
                                        <input class="input-padrao" type="text" name="nomeVaga" value="{{ old('nomeVaga') }}">
                                    </div>

                                    <div class="col-3 d-flex align-items-center">
                                        <div class="form__group field">
                                            <div class="input-container">
                                                <div class="d-flex flex-row">
                                                    <label for="estadoVaga">Modalidade:</label>
                                                    @error('idModalidadeVaga')
                                                        <div class="text-danger ps-1">{{ $message }}</div>
                                                    @enderror
                                                </div>
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
                                            <div class="input-container">
                                                <div class="d-flex flex-row">
                                                    <label for="estadoVaga" >Área:</label>
                                                    @error('idModalidadeVaga')
                                                        <div class="text-danger ps-1">{{ $message }}</div>
                                                    @enderror
                                                </div>

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
                                            <div class="input-container">
                                                <div class="d-flex flex-row">
                                                    <label for="horarioVaga" >Carga horária</label>
                                                    @error('horarioVaga')
                                                        <div class="text-danger ps-1">{{ $message }}</div>
                                                    @enderror
                                                </div>

                                                <select name="horarioVaga">
                                                    <option value="">Selecionar</option>
                                                   
                                                    <option value="">Selecionar</option>
                                                    <option value="44h/Sem" {{ old('horarioVaga') == '44h/Sem' ? 'selected' : '' }}>44h/Sem</option>
                                                    <option value="40h/Sem" {{ old('horarioVaga') == '40h/Sem' ? 'selected' : '' }}>40h/Sem</option>
                                                    <option value="30h/Sem" {{ old('horarioVaga') == '30h/Sem' ? 'selected' : '' }}>30h/Sem</option>
                                                    <option value="20h/Sem" {{ old('horarioVaga') == '20h/Sem' ? 'selected' : '' }}>20h/Sem</option>
                                                    <option value="Flexível (negociada)" {{ old('horarioVaga') == 'Flexível (negociada)' ? 'selected' : '' }}>Flexível (negociada)</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-6">
                                        <div class="form__group field">
                                            
                                            <div class="input-container">
                                                <div class="d-flex flex-row">
                                                    <label for="contratoVaga" >Tipo de contrato</label>
                                                    @error('contratoVaga')
                                                        <div class="text-danger ps-1">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                                <select name="contratoVaga">
                                                <option value="">Selecionar</option>
                                                <option value="CLT" {{ old('contratoVaga') == 'CLT' ? 'selected' : '' }}>CLT</option>
                                                <option value="Estágio (Superior)" {{ old('contratoVaga') == 'Estágio (Superior)' ? 'selected' : '' }}>Estágio (Superior)</option>
                                                <option value="Estágio (Médio)" {{ old('contratoVaga') == 'Estágio (Médio)' ? 'selected' : '' }}>Estágio (Médio)</option>
                                                <option value="PJ (Pessoa Jurídica)" {{ old('contratoVaga') == 'PJ (Pessoa Jurídica)' ? 'selected' : '' }}>PJ (Pessoa Jurídica)</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-7">
                                        <div class="d-flex flex-row">
                                            <label for="cidadeVaga" >Cidade</label>
                                            @error('cidadeVaga')
                                                <div class="text-danger ps-1">{{ $message }}</div>
                                            @enderror
                                        </div>
                                        <input class="input-padrao" type="text" name="cidadeVaga" value="{{ old('cidadeVaga') }}">
                                    </div>
                                    <div class="col col-5">
                                        <div class="d-flex flex-row">
                                            <label for="estadoVaga" >Estado</label>
                                            @error('estadoVaga')
                                                <div class="text-danger ps-1">{{ $message }}</div>
                                            @enderror
                                        </div>
                                        <input class="input-padrao" type="text" name="estadoVaga" value="{{ old('estadoVaga') }}">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-12">
                                        <div class="d-flex flex-row">
                                            <label for="diferencialVaga" >Diferencial</label>
                                            @error('diferencialVaga')
                                                <div class="text-danger ps-1">{{ $message }}</div>
                                            @enderror
                                        </div>
                                        <input class="input-padrao" type="text" name="diferencialVaga" placeholder="Ex: curso técnico" value="{{ old('diferencialVaga') }}">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col col-12">
                                        <div class="d-flex flex-row">
                                            <label for="descricaoVaga" >Descrição</label>
                                            @error('beneficiosVaga')
                                                <div class="text-danger ps-1">{{ $message }}</div>
                                            @enderror
                                        </div>
                                        <input class="input-padrao" type="text" name="descricaoVaga" placeholder="Ex: Vaga para aqueles que querem crecer na empresa" value="{{ old('descricaoVaga') }}">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col col-12">
                                        <label for="">Benefícios</label>
                                        <input class="input-padrao" type="text" name="beneficiosVaga" placeholder="Como VR, Vale transporte e etc" value="{{ old('beneficiosVaga') }}">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col col-5">
                                        <div class="d-flex flex-row">
                                            <label for="salarioVaga" >Salário</label>
                                            @error('salarioVaga')
                                                <div class="text-danger ps-1">{{ $message }}</div>
                                            @enderror
                                        </div>
                                        <input class="input-padrao" type="text" name="salarioVaga" value="{{ old('salarioVaga') }}">
                                    </div>
                                    <div class="col col-7">
                                        <div class="d-flex flex-row">
                                            <label for="">Expira em</label>
                                            @error('prazoVaga')
                                                <div class="text-danger ps-1">{{ $message }}</div>
                                            @enderror
                                        </div>
                                        <input class="input-padrao" type="text" name="prazoVaga" value="{{ old('prazoVaga') }}" placeholder="dd/mm/yyyy" pattern="\d{2}/\d{2}/\d{4}" data-mask="00/00/0000" required>
                                    </div>
                                </div>
                            </div>

                            <div class="wrap-footer">
                                <input class="botao-padrao enviar" type="submit" value="Enviar">
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