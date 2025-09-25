package br.com.Acura.board_back.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "tb_usuario")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_usuario")
    private Long id;
    private String username;
    private String cpf;
    private String email;
    private String senha;
    @Column(name = "atuacao")
    @Enumerated(EnumType.STRING)
    private Atuacao atuacao;

    @OneToMany(mappedBy = "usuario")
    private List<ProgressoUsuario> progressoUsuarios;

    @ManyToMany
    @JoinTable(
            name = "usuario_insignea",
            joinColumns = @JoinColumn(name = "id_usuario"),
            inverseJoinColumns = @JoinColumn(name = "id_insignea")
    )
    private Set<Insignea> insigneas = new HashSet<>();


}
