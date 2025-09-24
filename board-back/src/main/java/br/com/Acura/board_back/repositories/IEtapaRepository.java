package br.com.Acura.board_back.repositories;

import br.com.Acura.board_back.entities.Etapa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface IEtapaRepository extends JpaRepository<Etapa, Long> {

    @Query("SELECT e FROM Etapa e " +
            "LEFT JOIN FETCH e.modulos m " +
            "LEFT JOIN FETCH m.capitulos " +
            "WHERE e.id = :etapaId")
    List<Etapa> findByIdWithModulesAndChapters(@Param("etapaId") Long etapaId);

    @Query("SELECT DISTINCT e FROM Etapa e " +
            "LEFT JOIN FETCH e.modulos m " +
            "LEFT JOIN FETCH m.capitulos")
    List<Etapa> findAllWithModulesAndChapters();


}