package br.com.Acura.board_back.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "tb_insignea")
public class Insignea {
    private Long id;
    private String urlInsigea;
    private String nome;

    @OneToOne
    @JoinColumn(name = "etapa_id")
    private Etapa etapa;

    @ManyToMany(mappedBy = "insigneas")
    private Set<Usuario> usuarios = new HashSet<>();


}
