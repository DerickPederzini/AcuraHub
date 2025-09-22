package br.com.Acura.board_back.repositories;

import br.com.Acura.board_back.entities.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface IUsuarioRepository extends JpaRepository<Usuario, Long> {
    Usuario findByEmailAndSenha(String email, String senha);

    Usuario findByEmail(String email);

    @Query("SELECT u from tb_usuarios " +
            "LEFT JOIN FETCH u.capitulo c" +
            "LEFT JOIN FETCH u.insigneas i" +
            "LEFT JOIN FETCH i.etapa e" +
            "LEFT JOIN FETCH e.modulos m" +
            "LEFT JOIN FETCH m.capitulos mc" +
            " where u.id = :id")
    Optional<Usuario> findAllFieldsByIdWithInsignea(@Param("id") Long id);

    @Query("SELECT u from tb_usuarios " +
            "LEFT JOIN FETCH u.capitulo c" +
            "LEFT JOIN FETCH u.insigneas i" +
            "LEFT JOIN FETCH i.etapa e" +
            " where u.id = :id")
    Optional<Usuario> findAllByIdWithInsignea(@Param("id") Long id);

    @Query("""
            SELECT COUNT(i) FROM usiario u
            JOIN u.insigneas i
            WHERE u.id = :id
            """)
    long countInsigneasFromUsuario(@Param("id") Long id);


    @Query("""
                SELECT COUNT(e) FROM etapa e
                WHERE e.modulo.id = :moduloId
            """)
    long countTotalModulosInEtapa(@Param("moduloId") Long moduloId);


}
