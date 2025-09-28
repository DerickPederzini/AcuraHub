# Acura Hub

## EurONBoarding! 
**Acura Grupo**

Este é o nosso projeto anual do terceiro ano na FIAP, em parceria com a Eurofarma. O objetivo é ajudar a organização a alcançar suas metas com mais eficiência. Para atingir esse objetivo, estamos desenvolvendo um aplicação que visa dar um novo ar ao processo de OnBoarding da Eurofarma!

Esta documentação tem como objetivo explicar o propósito da aplicação e como utilizá-lo.

Primeiramente, este é um aplicativo em **Flutter**, que utiliza **SpringBoot** e **H2Database**. Algumas partes do projeto estão hard coded, já que este é protótipo.

# Rodando a aplicação localmente

## Pré-requisitos
- Java (Versão 21)
- Flutter (^3.8.1)

## Passos
1. Clone o repositório
```
git clone <url-do-repositorio>
cd <nome-do-repositorio>
```
2. Instale as dependências (nas suas respectivas root)
```
flutter pub get
mvn install
```
4. Inicie a aplicação
```
mvnw spring-boot:run
flutter run
```

## Endpoints

### Token
- `POST /user/auth/registrar` → cadastra novo usuário;
- `POST /user/auth/login` → login de usuário existente;

### Usuários
- `GET /usuarios` → lista todos os usuários
- `GET /usuarios/perfil/{id}` → busca informações do perfil do usuário por ID;
- `POST /usuarios/perfil/insignias/{idUser}/{idInsignia}` → cria nova instância de insignia para o usuário;

### Insígneas
- `GET /insigneas` → lista todas as insígneas;
- `GET /user/{id}` → busca insígnias por usuário;

### Etapa
- `GET /etapas` → lista todas as etapas;
- `POST /etapas` → cria nova instância de etapa;

### Módulos
- `GET /modulos` → lista todos os módulos;
- `GET /modulos/etapa/{id}` → busca todos os módulos de uma etapa;
- `GET /modulos/etapa/{idEtapa}/user/{idUser}` → busca todos os módulos que estão em uma etapa por usuário;

### Capítulos
- `GET /capitlos` → lista todos os capitulos;
- `GET /capitlos/modulo/{id}` → busca todos os capítulos de um módulo;
- `POST /modulos/progresso/user/{idCapitulo}/{idUser}` → cria uma nova instância de progresso do usuário ao completar um capítulo;

# Explorando a Aplicação

O EurONBoarding foi pensado para otimizar o processo de On Boarding dos colaboradores da Eurofarma nas suas ferramentas digitais.

### 1 - Autenticação
Ao criar uma conta, você pode utilizar qualquer e-mail que se assemelhe a um e-mail válido, ou seja, ele deve conter um **@**(.)  
Exemplos:
- Correto: `exemplo@exemplo.com`

As senhas precisam ter pelo menos 6 caracteres. Fora isso, você pode criar a conta com qualquer dado de sua escolha.

---

## As Principais Telas

Aqui estão as quatro principais funcionalidades disponíveis para os colaboradores:

#### 1. Tela Inicial/ Feed de Notícias
Na tela inicial, o colaborador pode localizar exemplos de notícias disponibilizadas pela Eurofarma, podendo ser novas funções ou atualizações gerais.

#### 2. Onboarding
Aqui, o colaborador pode participar seu próprio processo de integração dentro da Eurofarma, podendo aprender sobre as principais ferramentas EurON.

#### 3. Desafios
Após completar um módulo do Onboarding, o colaborador poderá ganhar uma recompensa, como por exemplo insignias, que serão expostas em seu perfil.

#### 4. O Perfil
Aqui o colaborador pode encontrar suas informações pessoais, seu rank dentro do Onboarding, seus desafios e recompensas concluídas e as notícias que ele salvou.


## Melhorias Futuras

Estamos planejando as seguintes melhorias para as próximas versões do Natura Conecta:

- **Notícias responsívas:** Atualmente as notícias são mocadas, mas os planos são de adicioná-las ao banco e atribuí-las a usuários quando estes à favoritarem
- **Desafios com mais recompensas:** Adicionar mais itens de customização e novas recompensas personalizadas para cada usuário.
- **Melhor Integração:** Integrar de maneira mais eficiênte o atual sistema da Eurofarma ao app, com redirecionamentos mais precisos e integração com as ferramentas já existentes.
- **Perfil do Cliente:** Adicionar mais funcionalidades ao perfil do cliente, criadas a partir do desenvolvimento futuro do App.

---

## Feedback

Qualquer feedback sobre o projeto é bem-vindo! Sinta-se à vontade para contribuir e ajudar a melhorar o Natura Conecta.
