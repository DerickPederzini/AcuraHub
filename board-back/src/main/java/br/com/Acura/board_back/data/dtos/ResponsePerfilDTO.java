package br.com.Acura.board_back.data.dtos;

import br.com.Acura.board_back.entities.Etapa;
import br.com.Acura.board_back.entities.Insignea;
import br.com.Acura.board_back.entities.Usuario;
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
    private String email;
    private Set<Etapa> etapas;
    private Set<Insignea> insigneas;

    public ResponsePerfilDTO(Usuario usuario) {
        setEmail(usuario.getEmail());
        setInsigneas(usuario.getInsigneas());
        setUsername(usuario.getUsername());
        Set<Insignea> insignea = usuario.getInsigneas();
        Set<Etapa> etapa = new HashSet<>();
        for(Insignea insignea1 : insignea) {
            etapa.add(insignea1.getEtapa());
        }
        setEtapas(etapa);
    }


}
