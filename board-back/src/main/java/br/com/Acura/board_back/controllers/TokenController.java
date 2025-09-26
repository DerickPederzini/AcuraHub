package br.com.Acura.board_back.controllers;

import br.com.Acura.board_back.data.dtos.LoginRequest;
import br.com.Acura.board_back.data.dtos.LoginResponse;
import br.com.Acura.board_back.data.dtos.RegisterRequest;
import br.com.Acura.board_back.services.RegistroService;
import br.com.Acura.board_back.services.UsuarioService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.jwt.JwtClaimsSet;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.JwtEncoderParameters;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;

@RestController
@RequestMapping("/user/auth")
public class TokenController {
    @Autowired
    private UsuarioService usuarioService;
    @Autowired
    private RegistroService registroService;
    @Autowired
    private JwtEncoder jwtEncoder;

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest request) {
        var usuario = usuarioService.findByEmailAndSenha(request);

        long expira = 3600;

        var claims = JwtClaimsSet.builder()
                .issuer("EurONBoarding")
                .subject(usuario.cpf())
                .expiresAt(Instant.now().plusSeconds(expira))
                .issuedAt(Instant.now())
                .claim("id", usuario.id())
                .claim("username", usuario.username())
                .claim("email", usuario.email())
                .claim("atuacao", usuario.atuacao())
                .build();

        String jwtValue = jwtEncoder.encode(JwtEncoderParameters.from(claims)).getTokenValue();
        return ResponseEntity.ok(new LoginResponse(jwtValue, expira));
    }

    @PostMapping("/registrar")
    public ResponseEntity<String> createUsuario(@Valid @RequestBody RegisterRequest request) {
        try {
            registroService.criar(request);

            return ResponseEntity.ok("Você foi cadastrado!");
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }


}
