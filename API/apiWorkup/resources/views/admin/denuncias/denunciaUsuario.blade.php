<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="shortcut icon" href="{{url('assets/img/adminImages/WU-icon.png')}}" type="image/x-icon">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="{{ url('assets/css/navbarAdmin.css') }}">
  <link rel="stylesheet" href="{{ url('assets/css/admin.css') }}">
  
  <title>Administrador | Usuários</title>
</head>

<body>

<div class="row">

@include('components.asideAdmin')
    

 
  <div class="col-7" style="max-height: 700px; overflow-y: auto; overflow-x: hidden;">

  <div class="container md-4 mt-3">

<div class="d-flex  align-items-center">
<h5 class="p-0 m-0 ">Usuários denunciados</h5>
<i class="bi bi-ban ms-2 text-danger fs-4"></i>

</div>




@forelse($denuncias as $denuncia)
<div class="alert alert-tertiary border border-1 linhas-denuncia" role="alert" data-nome="{{ $denuncia->usuario->nomeUsuario }}">


<div class="row ">
<div class="col-3 fw-bold nome">
<p>{{ $denuncia->usuario->nomeUsuario }}</p>
</div>
<div class="col-6"></div>
<div class="col-3 fw-medium">
<p>{{ $denuncia->created_at }}</p>
</div>
</div>

<div class="row">
<div class="col ms-4">
<p>{{$denuncia->motivo}}</p>
</div>
</div>


<div class="row">
<div class="col-5">
<i class="bi bi-info-circle fs-6 pe-2 text-dark fw-bold" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>

</div>
<div class="col-3"></div>
<div class="col-2">
<button type="button" class="btn btn-danger btn-sm"><i class="bi bi-envelope-slash"></i>&nbsp;E-mail</button>
</div>

<div class="col-2 ps-1">
<button type="button" class="btn btn-primary btn-sm"><i class="bi bi-trash3"></i>&nbsp;Descartar</button>
</div>
</div>


</div>
@empty
@endforelse


                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Sobre denúncias</h5>
                            <i class="bi bi-megaphone-fill text-danger fs-5 ps-1"></i>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body d-flex flex-column">
                            <h5 class="alert-heading">Atenção!</h5>
                            <p class="">
                              Esta seção é dedicada ao monitoramento de denúncias de usuários. Aqui, você pode visualizar os relatos de comportamentos inadequados ou abusivos dentro da plataforma. É fundamental que todas as denúncias sejam tratadas com seriedade e imparcialidade.
                            </p>
                             
                          </div>
                      
                        </div>
                      </div>
                    </div>

</div>


  </div>
  
  <div class="col-3 mt-5 ">
  <input type="text" placeholder="Buscar por nome..." id="searchInput2" class="col-6"> 

  <div id="userInfo" class="mt-3 me-2"></div>
  </div>

  <script>
  document.getElementById('searchInput2').addEventListener('input', function () {
    const searchValue = this.value.toLowerCase();
    const alerts = document.querySelectorAll('.linhas-denuncia');

    alerts.forEach(alert => {
      const userName = alert.getAttribute('data-nome').toLowerCase();
      if (userName.includes(searchValue)) {
        alert.style.display = ''; // Mostra o elemento
      } else {
        alert.style.display = 'none'; // Esconde o elemento
      }
    });
  });
</script>

<script>
  document.getElementById('searchInput2').addEventListener('input', function () {
    const searchValue = this.value.toLowerCase();
    const alerts = document.querySelectorAll('.linhas-denuncia');
    const userInfoContainer = document.getElementById('userInfo'); // Div para exibir as informações do usuário

    // Filtrar os alerts existentes
    alerts.forEach(alert => {
      const userName = alert.getAttribute('data-nome').toLowerCase();
      if (userName.includes(searchValue)) {
        alert.style.display = ''; // Mostra o elemento
      } else {
        alert.style.display = 'none'; // Esconde o elemento
      }
    });

    // Requisição AJAX para buscar informações do usuário
    if (searchValue.trim() !== '') {
      fetch(`/buscar-usuario?nome=${searchValue}`)
        .then(response => response.json())
        .then(data => {
          if (data.status === 'success') {
            const usuario = data.usuario;
            userInfoContainer.innerHTML = `
         <div class="card mt-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-3">
                    <img src="${usuario.fotoUsuario}" alt=""  width="50px" height="50px" class="rounded-pill"/>

                    </div>
                    <div class="col">
                    <h5 class="card-title m-0">${usuario.nomeUsuario}</h5>
                    </div>
                  </div>
                  <p class="card-text mt-3"><span class="fw-bold">Email:</span> ${usuario.emailUsuario}</p>
                  <p class="card-text "><span class="fw-bold">Criado em:</span> ${new Date(usuario.created_at).toLocaleDateString()}</p>
                  <p class="card-text "><span class="fw-bold">Contato:</span> ${usuario.contatoUsuario}</p>
                </div>
              </div>
            `;
          } else {
            userInfoContainer.innerHTML = `<p class="text-danger">${data.message}</p>`;
          }
        })
        .catch(error => {
          console.error('Erro ao buscar informações do usuário:', error);
          userInfoContainer.innerHTML = `<p class="text-danger">Erro ao buscar informações do usuário</p>`;
        });
    } else {
      userInfoContainer.innerHTML = ''; // Limpa se o campo de busca estiver vazio
    }
  });
</script>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</body>
</html>

