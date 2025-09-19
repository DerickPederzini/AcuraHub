package br.com.Acura.board_back.services;

import br.com.Acura.board_back.data.dtos.RegisterRequest;
import br.com.Acura.board_back.entities.Usuario;
import br.com.Acura.board_back.repositories.IUsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegistroService {

    @Autowired
    private IUsuarioRepository usuarioRepository;

    public void criar(RegisterRequest request) {
        Usuario usuario = new Usuario();
        toEntity(usuario, request);

        usuario = usuarioRepository.save(usuario);

        usuarioRepository.save(usuario);
    }

    private void toEntity(Usuario usuario, RegisterRequest usuarioDTO) {
        usuario.setEmail(usuarioDTO.email());
        usuario.setSenha(usuarioDTO.senha());
        usuario.setCpf(usuarioDTO.cpf());
        usuario.setUsername(usuarioDTO.username());
    }

}
