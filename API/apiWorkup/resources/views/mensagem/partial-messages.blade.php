@foreach ($mensagens as $mensagem)
    <div class="message {{ $mensagem->tipoEmissor === 'Empresa' ? 'empresa' : 'usuario' }}">
        <p>{{ $mensagem->mensagem }}</p>
        <small>{{ \Carbon\Carbon::parse($mensagem->created_at)->format('d/m/Y H:i') }}</small>
    </div>
@endforeach