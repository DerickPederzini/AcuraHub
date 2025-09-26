package br.com.Acura.board_back.repositories;

import br.com.Acura.board_back.entities.Insignea;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface IInsigneaRepository extends JpaRepository<Insignea, Long> {

}
