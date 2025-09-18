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
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;
    @ManyToOne
    @MapsId("capituloId")
    @JoinColumn(name = "capitulo_id")
    private Capitulo capitulo;
    private String status;

}
