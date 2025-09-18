package br.com.Acura.board_back.services;


import br.com.Acura.board_back.data.dtos.CapituloDTOResponse;
import br.com.Acura.board_back.entities.Capitulo;
import br.com.Acura.board_back.repositories.ICapituloRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CapituloService {

    @Autowired
    private ICapituloRepository capituloRepository;

    @Transactional(readOnly = true)
    public List<CapituloDTOResponse> getAllCapitulosPorModulo(Long id) {
        List<Capitulo> capitulos = capituloRepository.findAllByModuloId(id);
        return capitulos.stream().map(CapituloDTOResponse::new).toList();
    }

    public List<CapituloDTOResponse> getAll() {
        List<Capitulo> capitulos = capituloRepository.findAll();
        return capitulos.stream().map(CapituloDTOResponse::new).toList();
    }
}
