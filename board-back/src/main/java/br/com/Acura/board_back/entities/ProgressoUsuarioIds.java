package br.com.Acura.board_back.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Embeddable
@Getter
@Setter
@EqualsAndHashCode(of = {"usuarioId", "capituloId"})
public class ProgressoUsuarioIds implements Serializable {
    @Column(name = "id_usuario")
    private Long usuarioId;
    @Column(name = "id_capitulo")
    private Long capituloId;

}
