package br.com.Acura.board_back.entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity(name = "tb_capitulo")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "id")
public class Capitulo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String titulo;
    private String body;
    private String videoURL;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "modulo_id")
    private Modulo modulo;

}
