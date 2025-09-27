package br.com.Acura.board_back.controllers;

import br.com.Acura.board_back.data.dtos.ResponseInsigneasPerfilDTO;
import br.com.Acura.board_back.data.dtos.ResponsePerfilDTO;
import br.com.Acura.board_back.data.dtos.ResponseUsuarioDTO;
import br.com.Acura.board_back.services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping("/perfil/{id}")
    public ResponseEntity<ResponsePerfilDTO> findUsuarioByIdPerfil(@PathVariable Long id) {
        ResponsePerfilDTO usuario = usuarioService.findByIdPerfil(id);
        return ResponseEntity.ok(usuario);
    }

    @GetMapping("/perfil/insignias/{id}")
    public ResponseEntity<Set<ResponseInsigneasPerfilDTO>> findInsiginasUsuario(@PathVariable Long id) {
        Set<ResponseInsigneasPerfilDTO> usuarioInsignias = usuarioService.fetchInsigneasForUsuario(id);
        return ResponseEntity.ok(usuarioInsignias);
    }

    @PostMapping("/perfil/insignias/{idUser}/{idInsignia}")
    public ResponseEntity<String> createInsiginasUsuario(@PathVariable Long idUser, @PathVariable Long idInsignia) {
        usuarioService.registerInsigneaForUser(idUser, idInsignia);
        return ResponseEntity.ok("Adicionado Insignia");
    }



}
