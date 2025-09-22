package br.com.Acura.board_back.services;

import br.com.Acura.board_back.data.dtos.LoginRequest;
import br.com.Acura.board_back.data.dtos.ResponsePerfilDTO;
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
        Usuario usuario = usuarioRepository.findByEmail(request.email()).orElseThrow(() -> new RuntimeException("yeah"));

//        if (!passwordEncoder.matches(request.senha(), usuario.getSenha())) {
//            throw new RuntimeException();
//        }
        if (!request.senha().equalsIgnoreCase(usuario.getSenha())){
            throw new RuntimeException("yes");
        }

        return new ResponseUsuarioDTO(usuario);
    }


    public ResponsePerfilDTO findByIdPerfil(Long id) {
        Usuario usuario = usuarioRepository.findAllByIdWithInsignea(id).orElseThrow(() -> new RuntimeException("errro"));
        return new ResponsePerfilDTO(usuario);
    }
}
