package br.com.Acura.board_back.repositories;

import br.com.Acura.board_back.entities.ProgressoUsuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface IProgressoUsuarioRepository extends JpaRepository<ProgressoUsuario, Long> {

    @Query(value = "SELECT * FROM tb_progresso_usuario WHERE id_usuario = ? AND id_capitulo = ?", nativeQuery = true)
    List<ProgressoUsuario> findByCapituloIdAndUsuarioId(Long usuarioId, Long capituloId);

}
