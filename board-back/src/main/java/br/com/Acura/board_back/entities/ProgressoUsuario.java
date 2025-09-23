package br.com.Acura.board_back.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "tb_progresso_usuario")
@Getter
@Setter
public class ProgressoUsuario {

    @EmbeddedId
    private ProgressoUsuarioIds id;
    @ManyToOne
    @MapsId("usuarioId")
    @JoinColumn(name = "id_usuario")
    private Usuario usuario;
    @ManyToOne
    @MapsId("capituloId")
    @JoinColumn(name = "id_capitulo")
    private Capitulo capitulo;
    private String status;

}
