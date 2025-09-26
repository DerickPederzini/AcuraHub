package br.com.Acura.board_back.controllers;

import br.com.Acura.board_back.data.dtos.InsigneasDTOResponse;
import br.com.Acura.board_back.services.InsigneaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/insignias")
public class InsigneaController {

    @Autowired
    private InsigneaService insigneaService;

    @GetMapping
    public ResponseEntity<List<InsigneasDTOResponse>> getAllInsigneas(@PathVariable Long id) {
        return ResponseEntity.ok(insigneaService.getAll());
    }

    @GetMapping("/user/{id}")
    public ResponseEntity<List<InsigneasDTOResponse>> getAllInsigneasByUser(@PathVariable Long id) {
        return ResponseEntity.ok(insigneaService.getAllInsigneasByUsuario(id));
    }

}
