package br.com.Acura.board_back.entities;

import jakarta.persistence.Embeddable;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Embeddable
@Getter
@Setter
@EqualsAndHashCode(of = {"usuarioId", "capituloId"})
public class ProgressoUsuarioIds {

    private Long usuarioId;
    private Long capituloId;

}
