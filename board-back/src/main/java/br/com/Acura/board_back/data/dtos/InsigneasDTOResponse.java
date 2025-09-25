package br.com.Acura.board_back.data.dtos;


import br.com.Acura.board_back.entities.Etapa;
import br.com.Acura.board_back.entities.Insignea;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class InsigneasDTOResponse {
    Long id;
    String nome;
    String descricao;


    public InsigneasDTOResponse(Insignea insignea) {
        this.id = insignea.getId();
        this.nome = insignea.getNome();
        this.descricao = insignea.getDescricao();
    }
}
