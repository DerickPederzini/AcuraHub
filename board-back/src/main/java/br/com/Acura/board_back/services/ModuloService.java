package br.com.Acura.board_back.services;

import br.com.Acura.board_back.data.dtos.EtapaDTOResponse;
import br.com.Acura.board_back.data.dtos.ModuleDTOResponse;
import br.com.Acura.board_back.entities.Etapa;
import br.com.Acura.board_back.entities.Modulo;
import br.com.Acura.board_back.repositories.IModuloRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ModuloService {

    @Autowired
    private IModuloRepository moduloRepository;

    @Transactional
    public List<ModuleDTOResponse> getAll() {
        List<Modulo> modulos = moduloRepository.findAll();
        return modulos.stream().map(ModuleDTOResponse::new).toList();
    }

    public List<ModuleDTOResponse> getByCourseId(Long id) {
        List<Modulo> modulo = moduloRepository.findAllByEtapaId(id);



        return modulo.stream().map(ModuleDTOResponse::new).toList();

    }


}
