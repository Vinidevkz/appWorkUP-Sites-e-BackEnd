@dd($posts)

@if($posts->count() > 0)
@dd($posts)

    <div class="row">
        @foreach($posts as $post)
            @dd($post)  <!-- Verifique os dados de cada postagem -->
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Detalhe da Postagem</h5>
                        <p class="card-text">{{ $post->detalhePublicacao ?? 'Sem descrição disponível' }}</p>
                        <small class="text-muted">Postado em: {{ $post->created_at->format('d/m/Y H:i') }}</small>
                        <div class="mt-3">
                            <a href="{{ route('posts.edit', $post->idPublicacao) }}" class="btn btn-warning btn-sm">Editar</a>

                            <!-- Formulário de exclusão -->
                            <form action="{{ route('posts.destroy', $post->idPublicacao) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm">Excluir</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
@else
    <div class="alert alert-warning" role="alert">
        Nenhuma postagem encontrada.
    </div>
@endif
