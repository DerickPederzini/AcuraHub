package br.com.Acura.board_back.entities;

import jakarta.persistence.Entity;
import lombok.*;

import java.util.List;

@Entity(name = "tb_etapa")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "id")
public class Modulo {

    private Long id;
    private String title;
    private String description;
    private Integer progresso;
    private List<Capitulo> capitulos;

}
