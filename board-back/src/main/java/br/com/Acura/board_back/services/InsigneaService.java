package br.com.Acura.board_back.services;

import br.com.Acura.board_back.data.dtos.InsigneasDTORequest;
import br.com.Acura.board_back.data.dtos.InsigneasDTOResponse;
import br.com.Acura.board_back.entities.*;
import br.com.Acura.board_back.repositories.IInsigneaRepository;
import br.com.Acura.board_back.repositories.IProgressoUsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class InsigneaService {

    @Autowired
    private IInsigneaRepository insigneaRepository;
    @Autowired
    private IProgressoUsuarioRepository progressoUsuarioRepository;

    @Transactional(readOnly = true)
    public List<InsigneasDTOResponse> getAll() {
        List<Insignea> insigneas = insigneaRepository.findAll();
        return insigneas.stream().map(InsigneasDTOResponse::new).toList();
    }


    @Transactional
    public List<InsigneasDTOResponse> getAllInsigneasByUsuario(Long idUsuario) {
        List<Insignea> insigneas = insigneaRepository.findAll();

        List<ProgressoUsuario> progressoUsuarios =
                progressoUsuarioRepository.findAllByUsuarioId(idUsuario);

        Set<Long> capitulosConcluidosIds = progressoUsuarios.stream()
                .filter(p -> p.getStatus() == StatusCapitulo.TERMINADO)
                .map(p -> p.getCapitulo().getId())
                .collect(Collectors.toSet());

        return insigneas.stream().map(insignea -> {
            Etapa etapa = insignea.getEtapa();
            int totalCapitulos = 0;
            int capitulosCompletos = 0;

            if (etapa != null) {
                for (Modulo modulo : etapa.getModulos()) {
                    totalCapitulos += modulo.getCapitulos().size();
                    for (Capitulo capitulo : modulo.getCapitulos()) {
                        if (capitulosConcluidosIds.contains(capitulo.getId())) {
                            capitulosCompletos++;
                        }
                    }
                }
            }

            boolean concluida = (totalCapitulos > 0 && capitulosCompletos == totalCapitulos);

            return new InsigneasDTOResponse(
                    insignea.getId(),
                    insignea.getNome(),
                    insignea.getDescricao(),
                    insignea.getUrlInsigea(),
                    capitulosCompletos,
                    totalCapitulos,
                    concluida
            );
        }).collect(Collectors.toList());
    }

}
