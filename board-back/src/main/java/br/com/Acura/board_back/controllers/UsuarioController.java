package br.com.Acura.board_back.controllers;

import br.com.Acura.board_back.data.dtos.ResponsePerfilDTO;
import br.com.Acura.board_back.data.dtos.ResponseUsuarioDTO;
import br.com.Acura.board_back.services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping("/perfil")
    public ResponseEntity<ResponsePerfilDTO> findUsuarioByIdPerfil(@PathVariable Long id) {
        ResponsePerfilDTO usuario = usuarioService.findByIdPerfil(id);
        return ResponseEntity.ok(usuario);
    }




}
