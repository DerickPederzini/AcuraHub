package br.com.Acura.board_back.services;

import br.com.Acura.board_back.data.dtos.CreateUsuarioDTO;
import br.com.Acura.board_back.entities.Usuario;
import br.com.Acura.board_back.repositories.IUsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegistroService {

    @Autowired
    private IUsuarioRepository usuarioRepository;

    public void criar(CreateUsuarioDTO usuarioDTO) {
        Usuario usuario = new Usuario();
        toEntity(new Usuario(), usuarioDTO);

        usuarioRepository.save(usuario);
    }

    private void toEntity(Usuario usuario, CreateUsuarioDTO usuarioDTO) {

    }

}
