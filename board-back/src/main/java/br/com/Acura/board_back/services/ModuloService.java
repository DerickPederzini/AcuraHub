package br.com.Acura.board_back.services;

import br.com.Acura.board_back.data.dtos.EtapaDTOResponse;
import br.com.Acura.board_back.data.dtos.ModuleDTOResponse;
import br.com.Acura.board_back.entities.*;
import br.com.Acura.board_back.repositories.IModuloRepository;
import br.com.Acura.board_back.repositories.IProgressoUsuarioRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class ModuloService {

    @Autowired
    private IModuloRepository moduloRepository;
    @Autowired
    private IProgressoUsuarioRepository progressoUsuarioRepository;

    @Transactional
    public List<ModuleDTOResponse> getAll() {
        List<Modulo> modulos = moduloRepository.findAll();
        return modulos.stream().map(ModuleDTOResponse::new).toList();
    }

    public List<ModuleDTOResponse> getByCourseId(Long id) {
        List<Modulo> modulo = moduloRepository.findAllByEtapaId(id);

        return modulo.stream().map(ModuleDTOResponse::new).toList();

    }

    @Transactional
    public List<ModuleDTOResponse> getByCourseId(Long idEtapa, Long idUsuario) {
//        List<Modulo> modulos = moduloRepository.findAllByEtapaId(idEtapa);
        List<ProgressoUsuario> progressoUsuarios = new ArrayList<>();


        List<Modulo> modulos = moduloRepository.findAllByEtapaIdWithCapitulos(idEtapa);
        List<ProgressoUsuario> allProgressosByEtapa = progressoUsuarioRepository.findAllByUsuarioAndEtapa(idUsuario, idEtapa);

//        progressoUsuarios = progressoUsuarioRepository.findByCapituloIdAndUsuarioId(idUsuario);

        Set<Long> todosCapitulosCompletados = allProgressosByEtapa
                .stream()
                .filter(p -> p.getStatus() == StatusCapitulo.TERMINADO)
                .map(p -> p.getCapitulo().getId())
                .collect(Collectors.toSet());

        return modulos.stream().map(modulo -> {
            long completedCount = modulo.getCapitulos().stream().filter(capitulo -> todosCapitulosCompletados.contains(capitulo.getId())).count();

            return new ModuleDTOResponse(modulo, completedCount);
        }).collect(Collectors.toList());

//        List<ModuleDTOResponse> moduleDTOResponse = modulo.stream().map(ModuleDTOResponse::new).toList();
//
//        List<Integer> max = new ArrayList<>();
//
//        for (var mod : modulo) {
//            max.add(mod.getCapitulos().size());
//        }
//
//        return moduleDTOResponse;

    }


}
