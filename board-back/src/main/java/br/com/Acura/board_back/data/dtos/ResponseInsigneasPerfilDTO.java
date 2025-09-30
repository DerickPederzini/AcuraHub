package br.com.Acura.board_back.data.dtos;

import br.com.Acura.board_back.entities.Insignea;
import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ResponseInsigneasPerfilDTO {
    private Long id;
    private String urlInsigea;
    private String nome;
    private String descricao;

    public ResponseInsigneasPerfilDTO(Insignea insignea) {
        this.id = insignea.getId();
        this.urlInsigea = insignea.getUrlInsigea();
        this.nome = insignea.getNome();
        this.descricao = insignea.getDescricao();
    }
}
