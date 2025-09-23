package br.com.Acura.board_back.data.dtos;

import br.com.Acura.board_back.entities.Usuario;

public record ResponseUsuarioDTO(Long id, String cpf, String username, String email) {

    public ResponseUsuarioDTO(Usuario usuario) {
        this(usuario.getId(), usuario.getEmail(), usuario.getUsername(), usuario.getEmail());
    }
}
