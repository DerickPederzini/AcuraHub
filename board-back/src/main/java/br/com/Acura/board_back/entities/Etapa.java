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
public class Etapa {

    private Long id;
    private String titulo;
    private Integer progresso;
    private List<Modulo> modulos;

}
