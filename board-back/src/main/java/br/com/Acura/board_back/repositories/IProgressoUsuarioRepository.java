package br.com.Acura.board_back.repositories;

import br.com.Acura.board_back.entities.ProgressoUsuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface IProgressoUsuarioRepository extends JpaRepository<ProgressoUsuario, Long> {

    @Query(value = "SELECT * FROM tb_progresso_usuario WHERE id_usuario = ? AND STATUS = 'TERMINADO'", nativeQuery = true)
    List<ProgressoUsuario> findByCapituloIdAndUsuarioId(Long usuarioId);

    @Query("SELECT p FROM ProgressoUsuario p WHERE p.usuario.id = :usuarioId AND p.capitulo.modulo.etapa.id = :etapaId")
    List<ProgressoUsuario> findAllByUsuarioAndEtapa(@Param("usuarioId") Long usuarioId, @Param("etapaId") Long etapaId);

    @Query("SELECT p FROM ProgressoUsuario p JOIN FETCH p.capitulo WHERE p.usuario.id = :usuarioId")
    List<ProgressoUsuario> findAllByUsuarioId(@Param("usuarioId") Long usuarioId);

}
