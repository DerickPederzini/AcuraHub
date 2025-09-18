package br.com.Acura.board_back.repositories;

import br.com.Acura.board_back.entities.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IUsuarioRepository extends JpaRepository<Usuario, Long> {
    Usuario findByEmailAndSenha(String email, String senha);

    Usuario findByEmail(String email);
}
