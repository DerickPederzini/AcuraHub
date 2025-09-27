package br.com.Acura.board_back.data.dtos;

import br.com.Acura.board_back.entities.Atuacao;
import br.com.Acura.board_back.entities.Etapa;
import br.com.Acura.board_back.entities.Insignea;
import br.com.Acura.board_back.entities.Usuario;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ResponsePerfilDTO {
    private String username;
    private Set<Etapa> etapas;
    @Enumerated(EnumType.STRING)
    private Atuacao atuacao;

    public ResponsePerfilDTO(Usuario usuario) {
        setUsername(usuario.getUsername());
        Set<Etapa> etapa = new HashSet<>();
        setAtuacao(usuario.getAtuacao());
        setEtapas(etapa);
    }


}
