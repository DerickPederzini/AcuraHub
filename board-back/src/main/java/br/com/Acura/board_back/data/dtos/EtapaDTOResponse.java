package br.com.Acura.board_back.data.dtos;

import br.com.Acura.board_back.entities.Etapa;
import br.com.Acura.board_back.entities.Tipo;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class EtapaDTOResponse {
    Long id;
    String titulo;
    String descricao;
    Tipo tema;
    String urlImagem;
    Integer totalModulos;
    Integer totalCapitulos;
    Integer capitulosCompletos;

    public EtapaDTOResponse(Etapa etapa) {
        this.id = etapa.getId();
        this.titulo = etapa.getTitulo();
        this.descricao = etapa.getDescricao();
        this.tema = etapa.getTema();
        this.urlImagem = etapa.getUrlImagem();
    }

    public EtapaDTOResponse(Etapa etapa, Integer capitulosCompletos, Integer totalCapitulos) {
        this.id = etapa.getId();
        this.titulo = etapa.getTitulo();
        this.descricao = etapa.getDescricao();
        this.tema = etapa.getTema();
        this.urlImagem = etapa.getUrlImagem();
        this.totalModulos = etapa.getModulos().size();
        this.capitulosCompletos = capitulosCompletos;
        this.totalCapitulos = totalCapitulos;
    }


}


