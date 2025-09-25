package br.com.Acura.board_back.repositories;

import br.com.Acura.board_back.entities.ProgressoUsuario;
import br.com.Acura.board_back.entities.StatusCapitulo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IProgressoUsuarioRepository extends JpaRepository<ProgressoUsuario, Long> {

    @Query(value = "SELECT * FROM tb_progresso_usuario WHERE id_usuario = ? AND STATUS = 'TERMINADO'", nativeQuery = true)
    List<ProgressoUsuario> findByCapituloIdAndUsuarioId(Long usuarioId);

    @Query("SELECT p FROM ProgressoUsuario p WHERE p.usuario.id = :usuarioId AND p.capitulo.modulo.etapa.id = :etapaId")
    List<ProgressoUsuario> findAllByUsuarioAndEtapa(@Param("usuarioId") Long usuarioId, @Param("etapaId") Long etapaId);

    @Query("SELECT p FROM ProgressoUsuario p JOIN FETCH p.capitulo WHERE p.usuario.id = :usuarioId")
    List<ProgressoUsuario> findAllByUsuarioId(@Param("usuarioId") Long usuarioId);

    @Query("SELECT CASE WHEN COUNT(p) > 0 THEN true ELSE false END FROM ProgressoUsuario p WHERE p.id.usuarioId = :usuarioId AND p.id.capituloId = :capituloId")
    boolean existsByUsuarioIdAndCapituloId(@Param("usuarioId") Long usuarioId, @Param("capituloId") Long capituloId);

    @Modifying
    @Query("UPDATE ProgressoUsuario p SET p.status = :status WHERE p.id.usuarioId = :usuarioId AND p.id.capituloId = :capituloId")
    void updateStatus(@Param("usuarioId") Long usuarioId, @Param("capituloId") Long capituloId, @Param("status") StatusCapitulo status);


}
