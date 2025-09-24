package br.com.Acura.board_back.entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity(name = "tb_modulo")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "id")
public class Modulo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "etapa_id")
    private Etapa etapa;

    @OneToMany(mappedBy = "modulo", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Capitulo> capitulos;

}
