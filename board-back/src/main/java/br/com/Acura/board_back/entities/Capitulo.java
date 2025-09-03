package br.com.Acura.board_back.entities;

import jakarta.persistence.Entity;
import lombok.*;

@Entity(name = "tb_capitulo")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "id")
public class Capitulo {

    private Long id;
    private String titulo;
    private String body;
    private String videoURL;
    private boolean assistido;

}
