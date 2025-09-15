package br.com.Acura.board_back.entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity(name = "tb_etapa")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "id")
public class Etapa {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String titulo;
    private String urlImagem;
    @OneToMany(mappedBy = "etapa", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Modulo> modulos;

}
