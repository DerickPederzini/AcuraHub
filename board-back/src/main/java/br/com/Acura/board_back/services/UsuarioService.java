package br.com.Acura.board_back.services;

import br.com.Acura.board_back.data.dtos.LoginRequest;
import br.com.Acura.board_back.data.dtos.ResponseUsuarioDTO;
import br.com.Acura.board_back.entities.Usuario;
import br.com.Acura.board_back.repositories.IUsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {

    @Autowired
    IUsuarioRepository usuarioRepository;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    public ResponseUsuarioDTO findByEmailAndSenha(LoginRequest request) {
        Usuario usuario = usuarioRepository.findByEmaiL(request.email());

        if (!passwordEncoder.matches(request.senha(), usuario.getSenha())) {
            throw new RuntimeException();
        }

        return new ResponseUsuarioDTO(usuario);
    }

}
