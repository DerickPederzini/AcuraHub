package br.com.Acura.board_back.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity(name = "tb_perguntas")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Perguntas {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String pergunta;
    private String resposta;

    @ManyToOne
    @JoinColumn(name = "id_capitulo")
    private Capitulo capitulo;

}
