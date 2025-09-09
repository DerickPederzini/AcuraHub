package br.com.Acura.board_back.services;

import br.com.Acura.board_back.data.dtos.EtapaDTORequest;
import br.com.Acura.board_back.data.dtos.EtapaDTOResponse;
import br.com.Acura.board_back.repositories.IEtapaRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EtapaService {

    @Autowired
    private IEtapaRepository etapaRepository;

    public List<EtapaDTOResponse> getAll() {
        return null;
    }

    public EtapaDTOResponse create(EtapaDTORequest request) {
        return null;
    }
}
