package br.com.Acura.board_back.data.dtos;

import br.com.Acura.board_back.entities.Etapa;

public record EtapaDTOResponse(Long id, String title) {

    public EtapaDTOResponse(Etapa etapa) {
        this(etapa.getId(), etapa.getTitulo());
    }

}
