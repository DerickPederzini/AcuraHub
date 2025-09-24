package br.com.Acura.board_back.repositories;

import br.com.Acura.board_back.entities.Capitulo;
import br.com.Acura.board_back.entities.StatusCapitulo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ICapituloRepository extends JpaRepository<Capitulo, Long> {

    @Query(value = "SELECT * FROM tb_capitulo WHERE modulo_id = ?", nativeQuery = true)
    List<Capitulo> findAllByModuloId(Long id);

    @Query(value = "INSERT INTO tb_progresso_usuario (id_usuario, id_capitulo, status) VALUES (?, ?, ?)", nativeQuery = true)
    void terminaCapituloDoUsuario(Long id, Long userId, StatusCapitulo status );
}
