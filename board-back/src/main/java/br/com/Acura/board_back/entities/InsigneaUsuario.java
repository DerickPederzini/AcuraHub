package br.com.Acura.board_back.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "tb_usuario_insignea")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class InsigneaUsuario {

    @EmbeddedId
    private InsigneaUsuarioId id;

    @ManyToOne
    @MapsId("usuarioId")
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

    @ManyToOne
    @MapsId("insigneaId")
    @JoinColumn(name = "insignea_id")
    private Insignea insignea;

    private LocalDateTime claimedAt;
}
