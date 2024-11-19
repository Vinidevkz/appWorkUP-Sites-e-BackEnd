<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{url('assets/css/style-editar-empresa.css')}}">
    <link rel="stylesheet" href="{{url('../assets/css/estilo-padrao-workup.css')}}">

    <link rel="stylesheet" href="{{url('../assets/css/dashboardEmpresa.css')}}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Editar empresa</title>
</head>

<body style="background-color: #f4f4f4;">

    <section id="editar-empresa">

        @include('components.navbarDashboardEmpresa')

        <div class="box-editar-empresa">
            <form method="POST" action="{{ route('empresas.update', $empresa->idEmpresa) }}"
                class="wrap-editar-empresa">

                @csrf
                @method('PUT')
                <div class="main-editar-empresa">

                    <h5>Editar perfil:</h5>

                    <div class="formImg d-flex flex-row">

                        <div class="body-editar-empresa">
                            <div class="row">
                                <div class="col-edit col-6">
                                    <label for="nomeEmpresa">Nome da empresa:</label>
                                    <input type="text" name="nomeEmpresa" placeholder="{{ $empresa->nomeEmpresa }}"
                                        value="{{ $empresa->nomeEmpresa }}" required>
                                    @error('nomeEmpresa')
                                        <div class="error-message">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="col-edit col-6">
                                    <label for="usernameEmpresa">Nome do usuário:</label>
                                    <input type="text" name="usernameEmpresa"
                                        placeholder="{{ $empresa->usernameEmpresa }}"
                                        value="{{ $empresa->usernameEmpresa }}" required>
                                    @error('usernameEmpresa')
                                        <div class="error-message">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-edit col-7">
                                    <label for="emailEmpresa">Email:</label>
                                    <input type="text" name="emailEmpresa" placeholder="{{ $empresa->emailEmpresa }}"
                                        value="{{ $empresa->emailEmpresa }}" required>
                                    @error('emailEmpresa')
                                        <div class="error-message">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="col-edit col-5">
                                    <label for="contatoEmpresa">Contato:</label>
                                    <input type="text" name="contatoEmpresa"
                                        placeholder="{{ $empresa->contatoEmpresa }}"
                                        value="{{ $empresa->contatoEmpresa }}" required>
                                    @error('contatoEmpresa')
                                        <div class="error-message">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-edit col-7">
                                    <label for="cidadeEmpresa">Cidade:</label>
                                    <input type="text" name="cidadeEmpresa" placeholder="{{ $empresa->cidadeEmpresa }}"
                                        value="{{ $empresa->cidadeEmpresa }}" required>
                                    @error('cidadeEmpresa')
                                        <div class="error-message">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="col-edit col-5">
                                    <label for="estadoEmpresa">Estado:</label>
                                    <input type="text" name="estadoEmpresa" placeholder="{{ $empresa->estadoEmpresa }}"
                                        value="{{ $empresa->estadoEmpresa }}" required>
                                    @error('estadoEmpresa')
                                        <div class="error-message">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="row">

                                <div class="col-edit col-4">
                                    <label for="cepEmpresa">CEP:</label>
                                    <input type="text" name="cepEmpresa" placeholder="{{ $empresa->cepEmpresa }}"
                                        value="{{ $empresa->cepEmpresa }}" required>
                                    @error('cepEmpresa')
                                        <div class="error-message">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="col-edit col-4">
                                    <label for="LogradouroEmpresa">Logradouro:</label>
                                    <input type="text" name="LogradouroEmpresa"
                                        placeholder="{{ $empresa->LogradouroEmpresa }}"
                                        value="{{ $empresa->LogradouroEmpresa }}" required>
                                    @error('LogradouroEmpresa')
                                        <div class="error-message">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="col-edit col-4">
                                    <label for="numeroLograEmpresa">Número:</label>
                                    <input type="text" name="numeroLograEmpresa"
                                        placeholder="{{ $empresa->numeroLograEmpresa }}"
                                        value="{{ $empresa->numeroLograEmpresa }}" required>
                                    @error('numeroLograEmpresa')
                                        <div class="error-message">{{ $message }}</div>
                                    @enderror
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-edit col-12">
                                    <label for="sobreEmpresa">Sobre:</label>
                                    <textarea name="sobreEmpresa" placeholder="{{ $empresa->sobreEmpresa }}" value="{{ $empresa->sobreEmpresa }}" required>{{ old('sobreEmpresa', $empresa->sobreEmpresa) }}</textarea>
                                </div>
                            </div>
                            <div class="row mt-3">
                            <label for="areas">Escolha as Áreas</label>
                            <div class="checkbox-container" style="max-height: 200px; overflow-y: auto; border: 1px solid #ccc; padding: 10px;">
                            <input type="hidden" name="idEmpresa" value="{{ $empresa->idEmpresa }}">
                                @foreach($areas as $area)
                                    <div>
                                        <input class="check-edit" type="checkbox" name="idArea[]" value="{{ $area->idArea }}"
                                               id="area_{{ $area->idArea }}"
                                               {{ in_array($area->idArea, $empresa->areas->pluck('idArea')->toArray()) ? 'checked' : '' }}>
                                        <label for="area_{{ $area->idArea }}">{{ $area->nomeArea }}</label>
                                    </div>
                                @endforeach
                            </div>
                            @error('idArea')
                            <div class="error-message">{{ $message }}</div>
                            @enderror
                        </div>
                        </div>

                        <div class="d-flex flex-column align-items-center justify-content-center w-50 ps-5">
                            <img src="{{$empresa->fotoEmpresa}}" id="imagePreview" class="mb-4"
                                style="height: 200px; width: 200px; object-fit: cover;" alt="">
                            <input type="file" id="fileInput" value="url" name="fotoPerfilBanner">
                            <input type="text" id="imageUrl" name="fotoUrl" hidden>
                            <div id="imagePreview" style="border-radius: 20rem">
                            </div>
                        </div>
                    </div>

                    <div class="footer-editar-empresa">
                        <button onclick="window.history.back()">Voltar</button>
                        <input type="submit" value="Confirmar"></input>
                    </div>

                </div>

            </form>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
    <script type="module">
        import { initializeApp } from "https://www.gstatic.com/firebasejs/10.13.2/firebase-app.js";
        import { getStorage, ref, uploadBytes, getDownloadURL } from "https://www.gstatic.com/firebasejs/10.13.2/firebase-storage.js";
        import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.13.2/firebase-analytics.js";

        const firebaseConfig = {
            apiKey: "AIzaSyA-QUFdmkri7tul4SYrErEivDaxBksa1Qc",
            authDomain: "workup-464af.firebaseapp.com",
            projectId: "workup-464af",
            storageBucket: "workup-464af.appspot.com",
            messagingSenderId: "623240730819",
            appId: "1:623240730819:web:28ca0c6e405ccd2d436a76",
            measurementId: "G-X1Y39ZHK8J"
        };

        const app = initializeApp(firebaseConfig);
        const storage = getStorage(app);

        let selectedFile = null;

        document.getElementById('fileInput').addEventListener('change', function (event) {
            selectedFile = event.target.files[0];

            if (selectedFile) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.getElementById('imagePreview');
                    img.src = e.target.result;
                    img.style.display = 'block';
                };
                reader.readAsDataURL(selectedFile);

                const storageRef = ref(storage, `publicacao/${selectedFile.name}`);
                uploadBytes(storageRef, selectedFile).then(() => {
                    console.log('Arquivo enviado com sucesso!');
                    getDownloadURL(storageRef).then((url) => {
                        document.getElementById('imageUrl').value = url;
                    }).catch((error) => {
                        console.error('Erro ao obter a URL da imagem:', error);
                    });
                }).catch((error) => {
                    console.error('Erro ao enviar o arquivo:', error);
                });
            }
        });
    </script>
</body>

</html>