package br.com.Acura.board_back.repositories;

import br.com.Acura.board_back.entities.InsigneaUsuario;
import br.com.Acura.board_back.entities.InsigneaUsuarioId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IUsuarioInsigneaRepository extends JpaRepository<InsigneaUsuario, Long> {
    boolean existsById(InsigneaUsuarioId id);
}
