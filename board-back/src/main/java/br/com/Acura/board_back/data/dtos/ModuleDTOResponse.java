package br.com.Acura.board_back.data.dtos;

import br.com.Acura.board_back.entities.Etapa;
import br.com.Acura.board_back.entities.Modulo;

public class ModuleDTOResponse {
    Long id;
    String title;
    String description;
    Double progresso;

    public ModuleDTOResponse(Modulo modulo) {
        this.id = modulo.getId();
        this.title = modulo.getTitle();
        this.description = modulo.getDescription();
    }


    public ModuleDTOResponse(Modulo modulo, double progresso) {
        this.id = modulo.getId();
        this.title = modulo.getTitle();
        this.description = modulo.getDescription();
        this.progresso = progresso;
    }

}
