package br.com.Acura.board_back.repositories;

import br.com.Acura.board_back.entities.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface IUsuarioRepository extends JpaRepository<Usuario, Long> {

    @Query("SELECT u from Usuario u where u.email = :email")
    Optional<Usuario> findByEmail(@Param("email")String email);

//    @Query("SELECT u from tb_usuarios " +
//            "LEFT JOIN FETCH u.capitulo c" +
//            "LEFT JOIN FETCH u.insigneas i" +
//            "LEFT JOIN FETCH i.etapa e" +
//            "LEFT JOIN FETCH e.modulos m" +
//            "LEFT JOIN FETCH m.capitulos mc" +
//            " where u.id = :id")
//    Optional<Usuario> findAllFieldsByIdWithInsignea(@Param("id") Long id);

    @Query("""
    SELECT DISTINCT u FROM Usuario u
    LEFT JOIN FETCH u.usuarioInsigneas ui
    LEFT JOIN FETCH ui.insignea i
    LEFT JOIN FETCH i.etapa e
    LEFT JOIN FETCH u.progressoUsuarios p
    LEFT JOIN FETCH p.capitulo c
    WHERE u.id = :id
""")

    Optional<Usuario> findAllByIdWithInsignea(@Param("id") Long id);



}
