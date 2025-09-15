package br.com.Acura.board_back.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@Entity
@Table(name = "tb_usuarios")
@Getter
@Setter
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String email;
    private String senha;

    // Um usuário pode ter progresso em muitos capítulos
//    @OneToMany(mappedBy = "usuario")
//    private Set<ProgressoUsuario> progressos;
}
