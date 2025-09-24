package br.com.Acura.board_back.services;

import br.com.Acura.board_back.data.dtos.EtapaDTORequest;
import br.com.Acura.board_back.data.dtos.EtapaDTOResponse;
import br.com.Acura.board_back.data.dtos.ModuleDTOResponse;
import br.com.Acura.board_back.data.dtos.RegisterRequest;
import br.com.Acura.board_back.entities.*;
import br.com.Acura.board_back.repositories.IEtapaRepository;
import br.com.Acura.board_back.repositories.IProgressoUsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class EtapaService {

    @Autowired
    private IEtapaRepository etapaRepository;
    @Autowired
    private IProgressoUsuarioRepository progressoUsuarioRepository;


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

    @Transactional
    public List<EtapaDTOResponse> getAllEtapasByUsuario(Long idUsuario) {
        List<Etapa> allEtapas = etapaRepository.findAllWithModulesAndChapters();

        List<ProgressoUsuario> progressoUsuarios = progressoUsuarioRepository.findAllByUsuarioId(idUsuario);

        Set<Long> capitulosConcluidosIds = progressoUsuarios.stream()
                .filter(p -> p.getStatus() == StatusCapitulo.TERMINADO)
                .map(p -> p.getCapitulo().getId())
                .collect(Collectors.toSet());

        return allEtapas.stream().map(etapa -> {
           int totalCapitulosDaEtapa = 0;
           int capitulosCompletos = 0;

           for (Modulo modulo : etapa.getModulos()) {
               totalCapitulosDaEtapa += modulo.getCapitulos().size();
               for (Capitulo capitulo : modulo.getCapitulos()) {
                   if (capitulosConcluidosIds.contains(capitulo.getId())) {
                       capitulosCompletos++;
                   }
               }
           }
               return new EtapaDTOResponse(etapa, totalCapitulosDaEtapa, capitulosCompletos);
        }).collect(Collectors.toList());

    }

    private void toEntity(Etapa etapa, EtapaDTORequest dto) {
        etapa.setId(dto.id());
        etapa.setTitulo(dto.title());
    }

}
