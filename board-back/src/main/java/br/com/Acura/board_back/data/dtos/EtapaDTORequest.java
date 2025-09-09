package br.com.Acura.board_back.data.dtos;

import br.com.Acura.board_back.entities.Tipo;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;

public record EtapaDTORequest(Long id,
                              String title,
                              @Enumerated(EnumType.STRING) Tipo tipo
) {
}
