package br.com.Acura.board_back.data.dtos;

import br.com.Acura.board_back.entities.Etapa;
import br.com.Acura.board_back.entities.Modulo;

public record ModuleDTOResponse(Long id, String title, String description) {
    public ModuleDTOResponse(Modulo modulo) {
        this(modulo.getId(), modulo.getTitle(), modulo.getDescription());
    }

}
