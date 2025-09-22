package br.com.Acura.board_back.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tb_usuarios")
@Getter
@Setter
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String cpf;
    private String email;
    private String senha;

    @ManyToMany
    @JoinTable(
            name = "usuario_insignea",
            joinColumns = @JoinColumn(name = "id_insignea"),
            inverseJoinColumns = @JoinColumn(name = "id_insignea")
    )
    private Set<Insignea> insigneas = new HashSet<>();


}
