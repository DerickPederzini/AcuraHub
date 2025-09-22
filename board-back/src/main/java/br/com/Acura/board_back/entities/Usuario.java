package br.com.Acura.board_back.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "tb_usuario")
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

    // Um usuário pode ter progresso em muitos capítulos
//    @OneToMany(mappedBy = "usuario")
//    private Set<ProgressoUsuario> progressos;
}
