package br.com.Acura.board_back.data.dtos;

import br.com.Acura.board_back.entities.Capitulo;
import br.com.Acura.board_back.entities.Etapa;

public record CapituloDTOResponse (Long id, String body, String titulo, String videoUrl) {
    public CapituloDTOResponse(Capitulo capitulo) {
        this(capitulo.getId(), capitulo.getBody(), capitulo.getTitulo(), capitulo.getVideoURL());
    }

}
