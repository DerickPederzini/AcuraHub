package br.com.Acura.board_back.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tb_insignia")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Insignea {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String urlInsigea;
    private String nome;
    private String descricao;


    @OneToOne
    @JoinColumn(name = "etapa_id")
    private Etapa etapa;

    @ManyToMany(mappedBy = "insigneas")
    private Set<Usuario> usuarios = new HashSet<>();
}