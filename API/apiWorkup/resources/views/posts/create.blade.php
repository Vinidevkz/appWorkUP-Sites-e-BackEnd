<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{url('assets/css/style-criar-post.css')}}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title></title>
</head>

<body>

    <section id="criar-post">

        <div class="box-criar-post">

            @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif

            <form class="wrap-criar-post row" action="{{ route('posts.store') }}" method="POST"
                enctype="multipart/form-data">
                @csrf

                <h5>Criar post</h5>
                <div class="col-6 h-75 d-flex">
                    <div class="row-criar-post row d-flex flex-column justify-content-between w-100">
                        <div class="col col-12">
                            <label for="">Titulo:</label>
                            <input type="text" id="tituloPublicacao" name="tituloPublicacao" required></input>
                        </div>
                        <div class="col col-12">

                            @if (Auth::guard('empresa')->check())
                                @php
                                    $empresa = Auth::guard('empresa')->user();
                                @endphp
                                <input type="hidden" name="idEmpresa" value="{{ $empresa->idEmpresa }}">
                            @endif

                            <label for="estadoVaga" class="form__label">Selecione a vaga relacionada com o post:</label>
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
                        </div>
                        <div class="col col-12">
                            <label for="detalhePublicacao" class="form-label">Detalhes da Publicação</label>
                            <textarea id="detalhePublicacao" name="detalhePublicacao" required></textarea>
                        </div>
                    </div>
                </div>
                <div class="img-post col-6 h-75 d-flex flex-column justify-content-end" style="gap: 1rem">
                    <label for="fotoPublicacao" class="form__label">Foto da Publicação</label>
                    <div id="preview">
                        <img id="imagePreview" src="" alt="" style="display:none;">
                    </div>
                    <input type="file" id="fileInput" value="url" name="fotoPublicacao">
                    <input type="text" id="imageUrl" name="fotoUrl" hidden>
                </div>
                <div class="col-8 d-flex justify-content-between mt-4 footer-criar-post">
                    <a href="/empresa/dashboard">Voltar</a>
                    <button type="submit">Postar</button>
                </div>
            </form>

        </div>

    </section>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
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