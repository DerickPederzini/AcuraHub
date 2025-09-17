package br.com.Acura.board_back.repositories;

import br.com.Acura.board_back.entities.Modulo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IModuloRepository extends JpaRepository<Modulo, Long> {

    @Query(value = "SELECT * FROM tb_modulo WHERE etapa_id = ?", nativeQuery = true)
    List<Modulo> findAllByEtapaId(Long id);

}
