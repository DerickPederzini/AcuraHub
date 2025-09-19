package br.com.Acura.board_back.data.dtos;

import jakarta.validation.constraints.Email;
import org.hibernate.validator.constraints.br.CPF;

public record RegisterRequest(
        @Email
        String email,
        String username,
        String senha,
        @CPF
        String cpf) {
}
