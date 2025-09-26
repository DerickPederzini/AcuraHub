package br.com.Acura.board_back.services;


import br.com.Acura.board_back.data.dtos.CapituloDTOResponse;
import br.com.Acura.board_back.entities.Capitulo;
import br.com.Acura.board_back.entities.ProgressoUsuario;
import br.com.Acura.board_back.entities.StatusCapitulo;
import br.com.Acura.board_back.entities.Usuario;
import br.com.Acura.board_back.repositories.ICapituloRepository;
import br.com.Acura.board_back.repositories.IProgressoUsuarioRepository;
import br.com.Acura.board_back.repositories.IUsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CapituloService {

    @Autowired
    private ICapituloRepository capituloRepository;
    @Autowired
    private IProgressoUsuarioRepository progressoRepository;
    @Autowired
    private IUsuarioRepository usuarioRepository;     // to get references


    @Transactional(readOnly = true)
    public List<CapituloDTOResponse> getAllCapitulosPorModulo(Long id) {
        List<Capitulo> capitulos = capituloRepository.findAllByModuloId(id);
        return capitulos.stream().map(CapituloDTOResponse::new).toList();
    }

    public List<CapituloDTOResponse> getAll() {
        List<Capitulo> capitulos = capituloRepository.findAll();
        return capitulos.stream().map(CapituloDTOResponse::new).toList();
    }

    @Transactional
    public void finishCapitulo(Long idCapitulo, Long idUser) {
        if (!progressoRepository.existsByUsuarioIdAndCapituloId(idUser, idCapitulo)) {
            ProgressoUsuario progresso = new ProgressoUsuario();

            Usuario usuarioRef = usuarioRepository.getReferenceById(idUser);
            Capitulo capituloRef = capituloRepository.getReferenceById(idCapitulo);

            progresso.setUsuario(usuarioRef);
            progresso.setCapitulo(capituloRef);
            progresso.setStatus(StatusCapitulo.TERMINADO);

            progressoRepository.save(progresso);
        } else {
            progressoRepository.updateStatus(idUser, idCapitulo, StatusCapitulo.TERMINADO);
        }
    }
}
