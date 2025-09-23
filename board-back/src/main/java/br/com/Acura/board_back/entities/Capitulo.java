package br.com.Acura.board_back.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.util.ArrayList;
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
    @Column(name = "body", length = 2000)
    private String body;
    @Column(name = "url_video")
    private String videoURL;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "modulo_id")
    private Modulo modulo;

    @OneToMany(mappedBy = "capitulo")
    private List<ProgressoUsuario> progressoUsuarios;

    @OneToMany(mappedBy = "capitulo", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Perguntas> perguntas = new ArrayList<>();


}
