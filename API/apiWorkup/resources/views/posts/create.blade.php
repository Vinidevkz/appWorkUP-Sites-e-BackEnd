<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="{{url('assets/img/adminImages/WU-icon.png')}}" type="image/x-icon">
    <title>Empresa | Criar Postagem</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{url('../assets/css/areapost.css')}}">
</head>
<body>
    <div class="d-flex justify-content-center align-items-center vh-100">
        <div class="card w-50">
            <div class="card-body">
                @include('components.navbarDashboardEmpresa')

                <div class="container mt-5 p-5">
                    <h2>Criar Postagem</h2>

                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    <form action="{{ route('posts.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="mb-3">
                            <label for="tituloPublicacao" class="form-label">Titulo da Publicação</label>
                            <input type="text" id="tituloPublicacao" name="tituloPublicacao" class="form-control" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="detalhePublicacao" class="form-label">Detalhe da Publicação</label>
                            <textarea id="detalhePublicacao" name="detalhePublicacao" class="form-control" required></textarea>
                        </div>
                        <div class="mb-3">
                            <div class="form__group field">
                                <label for="fotoPublicacao" class="form__label">Foto da Publicação</label>
                                <input type="file" id="fileInput" class="form-control custom-input" value="url" name="fotoPublicacao">
                                <input type="text" id="imageUrl" name="fotoUrl" hidden>
                                <div id="preview">
                                    <img id="imagePreview" src="" alt="" style="display:none; max-width: 300px; max-height: 300px;">
                                </div>
                            </div>
                        </div>

                        <!-- ID da Empresa (campo oculto) -->
                        @if (Auth::guard('empresa')->check())
                            @php
                                $empresa = Auth::guard('empresa')->user();
                            @endphp
                            <input type="hidden" name="idEmpresa" value="{{ $empresa->idEmpresa }}">
                        @endif

                        <label for="estadoVaga" class="form__label">Selecione a vaga que estara relacionada com o post:</label>
                        <select name="idVaga">
                                    <option value="">Selecionar</option>
                                    @foreach($vagas as $vaga)
                                        <option value="{{ $vaga->idVaga }}" {{ old('idaVaga') == $vaga->idaVaga ? 'selected' : '' }}>
                                            {{ $vaga->nomeVaga }}
                                            <!-- Supondo que há um campo nomeModalidade na tabela -->
                                        </option>
                                    @endforeach
                                    <!-- Esta parte precisa ficar -->
                        </select>

                        <button type="submit" class="btn btn-success">Enviar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Firebase App (SDK) -->
    <script src="https://www.gstatic.com/firebasejs/10.13.2/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/10.13.2/firebase-storage.js"></script>
    <script src="https://www.gstatic.com/firebasejs/10.13.2/firebase-analytics.js"></script>

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

        document.getElementById('fileInput').addEventListener('change', function(event) {
            selectedFile = event.target.files[0];

            if (selectedFile) {
                const reader = new FileReader();
                reader.onload = function(e) {
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
