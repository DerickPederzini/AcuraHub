package br.com.Acura.board_back.data.dtos;

import br.com.Acura.board_back.entities.Usuario;

public record ResponseUsuarioDTO(String cpf) {

    public ResponseUsuarioDTO(Usuario usuario) {
        this(usuario.getEmail());
    }
}
