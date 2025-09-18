package br.com.Acura.board_back.controllers;


import br.com.Acura.board_back.data.dtos.EtapaDTORequest;
import br.com.Acura.board_back.data.dtos.EtapaDTOResponse;
import br.com.Acura.board_back.services.EtapaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/etapas")
public class EtapaController {

    @Autowired
    private EtapaService etapaService;

    @GetMapping
    public ResponseEntity<List<EtapaDTOResponse>> getAllEtapas() {
        return ResponseEntity.ok(etapaService.getAll());
    }

    @PostMapping
    public ResponseEntity<EtapaDTOResponse> createEtapa(@RequestBody @Valid EtapaDTORequest request) {
        EtapaDTOResponse response = etapaService.create(request);
        URI uri = ServletUriComponentsBuilder.
                fromCurrentRequestUri()
                .path("/{id}")
                .buildAndExpand(response.id())
                .toUri();
        return ResponseEntity.created(uri).body(response);

    }


}
