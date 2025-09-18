package br.com.Acura.board_back.controllers;

import br.com.Acura.board_back.data.dtos.CapituloDTOResponse;
import br.com.Acura.board_back.data.dtos.EtapaDTORequest;
import br.com.Acura.board_back.data.dtos.EtapaDTOResponse;
import br.com.Acura.board_back.services.CapituloService;
import br.com.Acura.board_back.services.EtapaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/capitulos")
public class CapituloController {

    @Autowired
    private CapituloService capituloService;

    @GetMapping
    public ResponseEntity<List<CapituloDTOResponse>> getAllCapitulos() {
        return ResponseEntity.ok(capituloService.getAll());
    }

    @GetMapping("/modulo/{id}")
    public ResponseEntity<List<CapituloDTOResponse>> getAllCapitulosByModuloId(@PathVariable Long id) {
        return ResponseEntity.ok(capituloService.getAllCapitulosPorModulo(id));
    }

//    @PostMapping
//    public ResponseEntity<EtapaDTOResponse> createEtapa(@RequestBody @Valid EtapaDTORequest request) {
//        EtapaDTOResponse response = capituloService.create(request);
//        URI uri = ServletUriComponentsBuilder.
//                fromCurrentRequestUri()
//                .path("/{id}")
//                .buildAndExpand(response.id())
//                .toUri();
//        return ResponseEntity.created(uri).body(response);
//
//    }


}
