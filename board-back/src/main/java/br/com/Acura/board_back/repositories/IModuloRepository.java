package br.com.Acura.board_back.repositories;

import br.com.Acura.board_back.entities.Modulo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IModuloRepository extends JpaRepository<Modulo, Long> {

    @Query(value = "SELECT * FROM tb_modulo WHERE etapa_id = ?", nativeQuery = true)
    List<Modulo> findAllByEtapaId(Long id);

    @Query("SELECT m FROM tb_modulo m JOIN FETCH m.capitulos WHERE m.etapa.id = :etapaId")
    List<Modulo> findAllByEtapaIdWithCapitulos(@Param("etapaId") Long etapaId);


}
