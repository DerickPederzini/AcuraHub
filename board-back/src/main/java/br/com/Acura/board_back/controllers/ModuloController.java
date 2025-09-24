package br.com.Acura.board_back.controllers;

import br.com.Acura.board_back.data.dtos.EtapaDTORequest;
import br.com.Acura.board_back.data.dtos.EtapaDTOResponse;
import br.com.Acura.board_back.data.dtos.ModuleDTOResponse;
import br.com.Acura.board_back.services.EtapaService;
import br.com.Acura.board_back.services.ModuloService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/modulos")
public class ModuloController {

    @Autowired
    private ModuloService moduloService;

    @GetMapping
    public ResponseEntity<List<ModuleDTOResponse>> getAllModulos() {
        return ResponseEntity.ok(moduloService.getAll());
    }

    @GetMapping("/etapa/{id}")
    public ResponseEntity<List<ModuleDTOResponse>> getAllModulos(@PathVariable Long id) {
        return ResponseEntity.ok(moduloService.getByCourseId(id));
    }

    @GetMapping("/etapa/{idEtapa}/user/{idUser}")
    public ResponseEntity<List<ModuleDTOResponse>> getAllModulosWithUser(@PathVariable Long idEtapa, @PathVariable Long idUser) {
        List<ModuleDTOResponse> dto = moduloService.getByCourseId(idEtapa, idUser);
        return ResponseEntity.ok(dto);
    }


//    @PostMapping
//    public ResponseEntity<EtapaDTOResponse> createEtapa(@RequestBody @Valid EtapaDTORequest request) {
//        EtapaDTOResponse response = moduloService.create(request);
//        URI uri = ServletUriComponentsBuilder.
//                fromCurrentRequestUri()
//                .path("/{id}")
//                .buildAndExpand(response.id())
//                .toUri();
//        return ResponseEntity.created(uri).body(response);
//
//    }


}
