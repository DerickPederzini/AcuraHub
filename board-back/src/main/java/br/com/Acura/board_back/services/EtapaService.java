package br.com.Acura.board_back.services;

import br.com.Acura.board_back.data.dtos.EtapaDTORequest;
import br.com.Acura.board_back.data.dtos.EtapaDTOResponse;
import br.com.Acura.board_back.data.dtos.RegisterRequest;
import br.com.Acura.board_back.entities.Etapa;
import br.com.Acura.board_back.entities.Usuario;
import br.com.Acura.board_back.repositories.IEtapaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EtapaService {

    @Autowired
    private IEtapaRepository etapaRepository;

    @Transactional
    public List<EtapaDTOResponse> getAll() {
        List<Etapa> etapas = etapaRepository.findAll();
        return etapas.stream().map(EtapaDTOResponse::new).toList();
    }

    @Transactional
    public EtapaDTOResponse getById(Long id) {
        Etapa etapa = etapaRepository.findById(id).orElseThrow(() -> new RuntimeException("haha"));
        return new EtapaDTOResponse(etapa);
    }

    public EtapaDTOResponse create(EtapaDTORequest request) {
        Etapa etapa = new Etapa();
        toEntity(etapa, request);
        etapa = etapaRepository.save(etapa);
        return new EtapaDTOResponse(etapa);

    }

    private void toEntity(Etapa etapa, EtapaDTORequest dto) {
        etapa.setId(dto.id());
        etapa.setTitulo(dto.title());
    }

}
