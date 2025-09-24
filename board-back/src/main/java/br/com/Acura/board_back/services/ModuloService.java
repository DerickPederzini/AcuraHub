package br.com.Acura.board_back.services;

import br.com.Acura.board_back.data.dtos.EtapaDTOResponse;
import br.com.Acura.board_back.data.dtos.ModuleDTOResponse;
import br.com.Acura.board_back.entities.Capitulo;
import br.com.Acura.board_back.entities.Etapa;
import br.com.Acura.board_back.entities.Modulo;
import br.com.Acura.board_back.entities.ProgressoUsuario;
import br.com.Acura.board_back.repositories.IModuloRepository;
import br.com.Acura.board_back.repositories.IProgressoUsuarioRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    public List<ModuleDTOResponse> getByCourseId(Long idEtapa, Long idUsuario) {
        List<Modulo> modulo = moduloRepository.findAllByEtapaId(idEtapa);
        List<ProgressoUsuario> progressoUsuarios = new ArrayList<>();

        for (Modulo mod : modulo) {
            List<Capitulo> capitulos = mod.getCapitulos();
            for (Capitulo capitulo : capitulos) {
                progressoUsuarios = progressoUsuarioRepository.findByCapituloIdAndUsuarioId(idUsuario, capitulo.getId());
            }
        }
        List<ModuleDTOResponse> moduleDTOResponse = modulo.stream().map(ModuleDTOResponse::new).toList();
        for (ModuleDTOResponse mod : moduleDTOResponse) {
        }
        System.out.println(progressoUsuarios);

        return moduleDTOResponse;

    }



}
