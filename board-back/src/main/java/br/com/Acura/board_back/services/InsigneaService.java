package br.com.Acura.board_back.services;

import br.com.Acura.board_back.data.dtos.InsigneasDTOResponse;
import br.com.Acura.board_back.entities.Insignea;
import br.com.Acura.board_back.repositories.IInsigneaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class InsigneaService {

    @Autowired
    private IInsigneaRepository insigneaRepository;


    @Transactional(readOnly = true)
    public List<InsigneasDTOResponse> getAll() {
        List<Insignea> insigneas = insigneaRepository.findAll();
        return insigneas.stream().map(InsigneasDTOResponse::new).toList();
    }
}
