package br.com.Acura.board_back.data.dtos;

import br.com.Acura.board_back.entities.Etapa;
import br.com.Acura.board_back.entities.Tipo;

public record EtapaDTOResponse(Long id, String titulo, String descricao, Tipo tema, String urlImagem) {

    public EtapaDTOResponse(Etapa etapa) {
        this(etapa.getId(), etapa.getTitulo(), etapa.getDescricao(), etapa.getTema(), etapa.getUrlImagem());
    }

}


