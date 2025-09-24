package br.com.Acura.board_back.data.dtos;

import br.com.Acura.board_back.entities.Modulo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ModuleDTOResponse {
    Long id;
    String title;
    String description;
    Double progresso = 0.0;

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
