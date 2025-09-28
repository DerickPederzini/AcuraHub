package br.com.Acura.board_back.services;

import br.com.Acura.board_back.data.dtos.LoginRequest;
import br.com.Acura.board_back.data.dtos.ResponseInsigneasPerfilDTO;
import br.com.Acura.board_back.data.dtos.ResponsePerfilDTO;
import br.com.Acura.board_back.data.dtos.ResponseUsuarioDTO;
import br.com.Acura.board_back.entities.Insignea;
import br.com.Acura.board_back.entities.InsigneaUsuario;
import br.com.Acura.board_back.entities.InsigneaUsuarioId;
import br.com.Acura.board_back.entities.Usuario;
import br.com.Acura.board_back.repositories.IInsigneaRepository;
import br.com.Acura.board_back.repositories.IUsuarioInsigneaRepository;
import br.com.Acura.board_back.repositories.IUsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class UsuarioService {

    @Autowired
    IUsuarioRepository usuarioRepository;
    @Autowired
    IInsigneaRepository insigneaRepository;
    @Autowired
    IUsuarioInsigneaRepository usuarioInsigneaRepository;
    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    public ResponseUsuarioDTO findByEmailAndSenha(LoginRequest request) {
        Usuario usuario = usuarioRepository.findByEmail(request.email()).orElseThrow(() -> new RuntimeException("yeah"));

        if (!passwordEncoder.matches(request.senha(), usuario.getSenha())) {
            throw new RuntimeException();
        }
//        if (!request.senha().equalsIgnoreCase(usuario.getSenha())){
//            throw new RuntimeException("yes");
//        }
        return new ResponseUsuarioDTO(usuario);
    }


    @Transactional()
    public String registerInsigneaForUser(Long idUser, Long idInsignia) {
        InsigneaUsuarioId id = new InsigneaUsuarioId(idUser, idInsignia);

        if (usuarioInsigneaRepository.existsById(id)) {
            return "Insignea já existe";
        }

        Usuario usuario = usuarioRepository.findById(idUser)
                .orElseThrow(() -> new IllegalArgumentException("Usuario não encontrado ID: " + idUser));

        Insignea insignea = insigneaRepository.findById(idInsignia)
                .orElseThrow(() -> new IllegalArgumentException("Insignea não com encontrada ID: " + idInsignia));

        InsigneaUsuario insigneaUsuario = new InsigneaUsuario();
        insigneaUsuario.setId(id);
        insigneaUsuario.setUsuario(usuario);
        insigneaUsuario.setInsignea(insignea);
        insigneaUsuario.setClaimedAt(LocalDateTime.now());

//        usuario.getUsuarioInsigneas().add(insigneaUsuario);
//        insignea.getUsuarioInsigneas().add(insigneaUsuario);

        usuarioInsigneaRepository.save(insigneaUsuario);

        return "Insignea adquirida";
    }

    @Transactional(readOnly = true)
    public Set<ResponseInsigneasPerfilDTO> fetchInsigneasForUsuario(Long id) {
        Usuario usuario = usuarioRepository.findByIdWithInsigneas(id)
                .orElseThrow(() -> new RuntimeException("Usuário não encontrado"));

        Set<InsigneaUsuario> insigneas = usuario.getUsuarioInsigneas();

        Set<Insignea> apenasInsigneas = insigneas.stream()
                .map(InsigneaUsuario::getInsignea)
                .collect(Collectors.toSet());
        Set<ResponseInsigneasPerfilDTO> ins = new HashSet<>();
        for (var insignea : apenasInsigneas) {
            ins.add(new ResponseInsigneasPerfilDTO(insignea));
        }
        return ins;
    }

    public ResponsePerfilDTO findByIdPerfil(Long id) {
        Usuario usuario = usuarioRepository.findAllByIdWithInsignea(id).orElseThrow(() -> new RuntimeException("errro"));
        return new ResponsePerfilDTO(usuario);
    }


    public List<ResponseUsuarioDTO> getAll() {
        return usuarioRepository.findAll().stream().map(ResponseUsuarioDTO::new).toList();
    }
}
