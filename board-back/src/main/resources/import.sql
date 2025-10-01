INSERT INTO tb_etapa (titulo, tema, descricao, url_imagem) VALUES ('Plataforma Clic', 'INOVACAO', 'Aprenda uma das principais plataformas da Eurofarma, o Clic, onde suas ideias fazem diferença','/imagens/Clic1.png');
INSERT INTO tb_etapa (titulo, tema, descricao, url_imagem) VALUES ('Plataforma Kaizen', 'INOVACAO', 'Aprenda uma das principais plataformas da Eurofarma, o Kaizen, onde suas ideias podem fazer diferença', '/imagens/Kaizen1.png');
INSERT INTO tb_etapa (titulo, tema, descricao, url_imagem) VALUES ('Oficina Digital', 'DESENVOLVIMENTO', 'Utilize de ferramentas No Code em laboratórios para criar o que desejar', '/imagens/Oficina1.png');
INSERT INTO tb_etapa (titulo, tema, descricao, url_imagem) VALUES ('Vem Crescer', 'DESENVOLVIMENTO', 'Aprimore seus conhecimentos', '/imagens/Oficina1.png');

--Programa CLIC
--Módulos de 1 a 4
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Introdução', 'Aprenda o básico.', 1);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Avalicação de ideias', 'Venha compartilhar suas ideias!', 1);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Recompensas', 'Entenda as recompensas do programa Clic', 1);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Kaizen e feedback', 'Conversão da ideia e o feedback', 1);

--Programa Kaizen
--Módulos de 5 a 7
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Processos e Etapas do Programa Kaizen', 'Processos fundamentais do Kaizen', 2);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Incentivos e Reconhecimento', 'Reconhecimento das ideias aprovadas', 2);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Gestão da Iniciativa', 'Como funciona a gestão do Kaizen.', 2);

--Programa Oficina Digital
--Módulos de 8 a 10
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Apresentação e Estrutura do Programa', 'Aprenda o básico da oficina digital.', 3);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Jornada do Participante', 'Conheça a jornada do participante na oficina digital', 3);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Reconhecimento, Impacto e Resultados', 'Resultados da oficina digital', 3);

--Programa Vem Crescer
--Módulos de 11 a 13
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Visão Geral e Objetivos', 'Aprenda o básico sobre o programa Vem Crescer.', 4);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Etapas do Programa', 'Entenda melhor as etapas do prograna Vem Crescer', 4);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Reconhecimento, Incentivos e Gestão', 'Entenda melhor os incentivos e gestão do programa Vem Crescer', 4);


ALTER TABLE tb_capitulo ALTER COLUMN modulo_id TYPE BIGINT;

--Capitulos dos módulos do Programa Clic

--Capítulo 1 - ID 1
INSERT INTO tb_capitulo (titulo, url_imagem, body, url_video, modulo_id) VALUES ('Introdução ao Programa CLIC e Submissão de Ideias', '/imagens/capitulos/introducao_clic.png','Objetivo do Programa CLIC:\n- Explicar o propósito do programa CLIC, que visa estimular a inovação e o engajamento dos colaboradores na melhoria contínua da empresa.\n- Como a participação ativa de todos pode gerar soluções criativas que beneficiem a organização de diversas formas.\n\nComo Funciona a Submissão de Ideias:\n- Descrição do processo simples de cadastrar ideias através do portal online ou QR code, facilitando a participação de qualquer colaborador.\n- O preenchimento do formulário: detalhamento do problema identificado e da solução sugerida.\n- Importante: A ideia não precisa ser implementada de imediato. O foco está na proposta conceitual, o que torna a etapa de submissão acessível para todos.\n',  '', 1);
--Capítulo 2 - ID 2
INSERT INTO tb_capitulo (titulo, url_imagem, body, url_video, modulo_id) VALUES ('Triagem Inicial, Envio ao Comitê CLIC e Avaliação de Potencial', '/imagens/capitulos/ideia_clic.png', 'Triagem Inicial das Ideias:\n- O time EurON Six Sigma realiza a triagem das ideias submetidas para garantir que se encaixem nos critérios do programa. Isso inclui avaliar aspectos como:\n  - Potencial produtivo\n  - Impacto financeiro\n  - Sustentabilidade\n  - Segurança\n  - Qualidade\n- Objetivo da Triagem: Garantir que as ideias sejam viáveis e alinhadas aos objetivos estratégicos da empresa.\n\nEnvio ao Comitê CLIC:\n- Após a triagem, as ideias validadas são encaminhadas ao Comitê CLIC, que é composto por especialistas de diversas áreas do negócio. O comitê tem a responsabilidade de avaliar a viabilidade técnica e estratégica de cada ideia.\n\nAvaliação e Priorização:\n- O Comitê avalia as ideias em termos de:\n  - Viabilidade técnica e estratégica\n  - Impacto: Como a ideia impacta a empresa, seja financeiramente, em termos de produtividade ou sustentabilidade.\n  - Escalabilidade e retorno esperado: Propostas com alto potencial são priorizadas para implementação, com o suporte necessário para garantir o sucesso.\n',  '', 2);
--Capítulo 3 - ID 3
INSERT INTO tb_capitulo (titulo, url_imagem, body, url_video, modulo_id) VALUES ('Implementação, Medição de Resultados e Reconhecimento', '/imagens/capitulos/recompensa_clic.png', 'Implementação e Medição de Resultados:\n- Uma vez selecionada para implementação, a ideia passa a ser acompanhada durante todo o processo, desde a execução até a medição dos resultados alcançados. A transparência nesse processo é essencial para o sucesso da iniciativa.\n- Monitoramento de Resultados: Garantir que os impactos das ideias sejam mensurados de forma clara, tanto em termos de benefícios financeiros quanto operacionais.\n\nReconhecimento e Premiação:\n- Quando uma ideia gera impacto relevante, seja financeiro ou operacional, o colaborador recebe reconhecimento formal:\n  - Premiação Financeira: Se o impacto financeiro for superior a R$ 1 milhão, o colaborador pode receber até 5% do valor economizado, com um limite de R$ 120 mil.\n  - Eventos de Reconhecimento: As soluções mais impactantes são apresentadas em eventos especiais, com a participação do CEO e líderes da empresa, garantindo visibilidade e valorização do colaborador.\n- Importância do Reconhecimento: Estimular a inovação e criar uma cultura de valorização dentro da organização.\n',  '', 3);
--Capítulo  4 - ID 4
INSERT INTO tb_capitulo (titulo, url_imagem, body, url_video, modulo_id) VALUES ('Conversão para o Kaizen e Feedback', '/imagens/capitulos/feedback_clic.png', 'Conversão para o Programa Kaizen:\n- Algumas ideias, embora não tragam retorno financeiro imediato, podem gerar melhorias significativas em áreas como segurança, qualidade e processos. Essas ideias podem ser convertidas para o Programa Kaizen, que foca na melhoria contínua e no aprimoramento de processos.\n- Reconhecimento no Kaizen: Ideias implementadas no Kaizen também são reconhecidas, pontuadas e valorizadas, embora não recebam a mesma premiação financeira.\n\nFeedback e Transparência:\n- O feedback estruturado é uma parte essencial do processo. Todos os colaboradores recebem uma devolutiva clara sobre suas ideias, seja por meio do gestor direto, do sistema da empresa ou pelo time CLIC.\n- Formas de Devolutiva: A devolutiva é feita com justificativas claras, permitindo que os colaboradores entendam os motivos da aceitação ou não da ideia.\n- Transparência: A comunicação aberta sobre o status das ideias garante que os colaboradores sintam que sua contribuição é valorizada, independentemente do resultado final.\n.',  '', 4);

--Capitulos dos módulos do Programa Kaizen

--Capítulo 1 - ID 5
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Submissão de Ideias', '', '• Os colaboradores têm a oportunidade de registrar suas ideias em um quadro dedicado.\n• As ideias podem ser simples, focando em melhorias contínuas dentro dos processos existentes.\n',  '', 5);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Avaliação', '', 'Após a submissão, os gestores avaliam a viabilidade de cada ideia.\n• Se considerada viável, a ideia é implementada ou, caso necessário, melhorada.\n• A avaliação leva em conta aspectos como:\n - Viabilidade operacional\n - Potencial de melhoria de processos\n - Impacto em segurança, qualidade, ou produtividade.\n',  '', 5);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Premiação', '', '• Existe um sistema de pontos que recompensa os colaboradores:\n - 1 ponto por inscrever uma ideia válida.\n - 10 pontos caso a ideia seja implementada.\n• Os pontos podem ser trocados por brindes no catálogo da empresa, permitindo que os colaboradores escolham recompensas de acordo com seus interesses.\n',  '', 5);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Conversão para o Programa CLIC', '', '• Se a ideia tem um potencial significativo em termos de retorno financeiro, aumento de produtividade ou sustentabilidade (ex.: redução de CO2eq), ela pode ser convertida para o Programa CLIC.\n• Uma vez convertida, a ideia segue o processo de análise e avaliação do Comitê CLIC, com foco na implementação de resultados mensuráveis.\n',  '', 5);

--Capítulo 2 - ID 6
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Pontos e Brindes', '', '• Os pontos adquiridos através da inscrição e implementação de ideias podem ser trocados por uma variedade de brindes disponíveis no catálogo da empresa, proporcionando uma forma tangível de recompensa.\n• Este sistema de pontos ajuda a manter os colaboradores motivados e engajados na busca por melhorias contínuas.\n', '', 6);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Apresentação para a Alta Direção', '', '• Periodicamente, os colaboradores com as ideias mais relevantes são convidados a apresentar suas inovações para o CEO Global e a alta direção da empresa.\n• Essas apresentações são uma forma de reconhecimento e valorização das contribuições dos colaboradores, além de permitir que suas ideias impactem a empresa em nível estratégico.\n', '', 6);

--Capítulo 3 - ID 7
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Como funciona a gestão do programa Kaizen?', '', '• A gestão do programa Kaizen é realizada por meio de uma plataforma online, que facilita a inscrição e o acompanhamento das ideias.\n• A plataforma oferece uma visão clara de como as ideias estão sendo gerenciadas e quais ações estão sendo tomadas para implementá-las.\n• A liderança da empresa realiza ações pontuais para incentivar a participação ativa dos colaboradores, promovendo a cultura da inovação e a valorização daqueles que contribuem para o programa.\n• A comunicação contínua entre gestores e colaboradores é essencial para garantir que as melhores ideias sejam aproveitadas e que os colaboradores se sintam incentivados a continuar propondo melhorias.\n',  '', 7);

--Capitulos dos módulos do Programa Kaizen

--Capítulo 1 - ID 8
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Visão Geral', '', 'A Oficina Digital é uma iniciativa da Eurofarma que visa capacitar colaboradores no desenvolvimento de soluções digitais com foco em resultados práticos, como aumento de produtividade ou retorno financeiro.\n', '', 8);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Objetivo', '', 'Capacitar os colaboradores a transformar problemas operacionais em soluções digitais usando ferramentas acessíveis (Low Code), promovendo uma cultura de inovação e melhoria contínua.\n', '', 8);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Pré-requisito para Participação', '', 'Para participar, é necessário que o colaborador tenha um projeto ou problema real já identificado. Isso garante que o programa seja prático e aplicável desde o início.\n\nDuração e Modalidade\n• Duração: 2 semanas intensivas\n• Formato: Prático, com suporte técnico e mentoria especializada\n• Frequência: 4 vezes ao ano no Brasil e 2 vezes em âmbito global\n', '', 8);

--Capítulo 2 - ID 9
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Ferramentas Disponíveis', '', 'Os participantes escolhem uma das seguintes ferramentas digitais para desenvolver seu projeto:\n• Power Apps: Permite criar aplicativos personalizados para automatizar processos internos e aumentar a eficiência operacional.\n• Power BI: Permite a criação de dashboards e relatórios interativos, auxiliando na análise de dados e promovendo decisões baseadas em evidências.\n', '', 9);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Etapas do Programa', '', '1. Inscrição\nO colaborador indica o problema que deseja resolver em seu processo de trabalho.\n\n2. Avaliação\nAs ideias são analisadas com base em relevância e impacto. A aprovação depende também da validação pelas áreas de Tecnologia e Segurança da Informação.\n\n3. Capacitação (White Belt)\nOs participantes aprendem a:\n- Levantar dados do processo\n- Mapear e validar o problema\n- Desenvolver a solução digital (aplicativo ou dashboard)\nA capacitação é feita com ferramentas Low Code, não exigindo conhecimento técnico prévio.\n\n4. Desenvolvimento\nOs colaboradores constroem suas soluções com apoio de mentores, aplicando os conhecimentos adquiridos.\n\n5. Apresentação\nOs projetos são apresentados a uma banca de executivos da Eurofarma.\nOs melhores são selecionados para o evento Melhores do Ano, com apresentação ao CEO Global e à alta liderança.\n', '', 9);

--Capítulo 3 - ID 10
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Certificação e Premiação', '', '• Todos os participantes que entregarem seus projetos recebem uma certificação oficial e um badge digital.\n• Os projetos de maior destaque recebem premiações em cartões presente.\n', '', 10);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Resultados Esperados', '', '• Aplicação de soluções digitais com impacto direto na operação\n• Melhoria em produtividade, eficiência e economia de recursos\n• Estímulo à cultura de dados e inovação interna\n', '', 10);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Integração com Outros Programas', '', 'Projetos com alto potencial de impacto financeiro, aumento de produtividade ou sustentabilidade (ex: CO2eq) podem ser convertidos para o Programa CLIC e seguir o fluxo de avaliação e priorização por comitês técnicos.\n', '', 10);

--Capitulos dos módulos do Programa Vem Crescer

--Capítulo 1 - ID 11
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Visão Geral', '', 'O Programa Vem Crescer é uma oportunidade exclusiva para os estagiários da Eurofarma, voltada ao desenvolvimento de competências técnicas e comportamentais por meio da liderança de projetos reais.\nDurante o programa, os participantes são imersos na metodologia Lean Six Sigma e outras abordagens práticas que incentivam a inovação, a melhoria contínua e a resolução de problemas com base em dados e tecnologia.\n', '', 11);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Objetivos do Programa', '', 'Desenvolver habilidades de liderança e gestão de processos.\n- Estimular a criatividade e inovação nos estagiários.\n- Aplicar metodologias consagradas, como Lean Six Sigma, no ambiente real de trabalho.\n- Incentivar o uso de ferramentas digitais e a transformação de processos.\n- Reconhecer talentos e promover a cultura de melhoria contínua.\n', '', 11);

--Capítulo 2 - ID 12
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Inscrição e Capacitação', '', 'O programa é destinado exclusivamente a estagiários e oferece uma jornada de aprendizado estruturada com os seguintes componentes:\nLean Six Sigma – Yellow Belt: Introdução à metodologia para análise e solução de problemas de processo.\nLego® Serious Play®: Técnica de facilitação para estimular criatividade e construção colaborativa de ideias.\nTécnicas de Apresentação: Treinamentos focados em comunicação clara e eficaz para defesa de projetos.\nOficina Digital: Desenvolvimento de apps e dashboards aplicáveis à rotina das áreas de atuação.\n', '', 12);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Desenvolvimento de Projetos', '', 'Durante o programa, os estagiários:\n- Identificam problemas reais em suas áreas.\n- Propõem soluções digitais ou de processo.\n- Aplicam metodologias aprendidas com suporte técnico e gerencial.\n- Desenvolvem o projeto completo, desde a ideação até a entrega de resultados mensuráveis.\n', '', 12);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Apresentação Final', '', 'Ao final do ciclo, todos os participantes apresentam seus projetos a uma banca de executivos da Eurofarma.\nOs melhores projetos são selecionados para apresentação no evento Melhores do Ano, diretamente ao CEO Global e à alta liderança.\n', '', 12);

--Capítulo 3 - ID 13
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Certificação e Reconhecimento', '', 'Os participantes que finalizam o programa com entrega de projeto recebem:\n- A certificação oficial de Yellow Belt.\n- Um badge digital reconhecido pela empresa, que pode ser utilizado em currículos e redes profissionais.\n', '', 13);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Premiação', '', 'Os projetos de maior destaque recebem premiações em forma de cartão presente, como forma de valorização da entrega.\n', '', 13);
INSERT INTO tb_capitulo (titulo, url_imagem ,body, url_video, modulo_id) VALUES ('Gestão e Acompanhamento', '', 'A iniciativa é acompanhada de forma estruturada por meio de:\n- Monitoramento contínuo do progresso dos projetos.\n- Comunicação estruturada com os participantes ao longo de toda a jornada.\n- Acompanhamento individual por mentores e líderes das áreas.\n- Avaliação final realizada por uma banca de executivos, que define os destaques do programa.\n', '', 13);

--Usuários para teste
INSERT INTO tb_usuario (cpf, atuacao, email, username, senha) VALUES ('52702190855', 'DESENVOLVEDOR', 'deri@g', 'Derick', '$2a$10$38nR5/Vb6Jxa7.dtZ1MD0OWE1FBln/E22CtdtdyJD3HW2IFddizhG');
INSERT INTO tb_usuario (cpf, atuacao, email, username, senha) VALUES ('52702190855', 'MARKETING', 'nick@g', 'Nicolas', '$2a$10$38nR5/Vb6Jxa7.dtZ1MD0OWE1FBln/E22CtdtdyJD3HW2IFddizhG');
INSERT INTO tb_usuario (cpf, atuacao, email, username, senha) VALUES ('52702190855', 'GESTOR', 'jose@g', 'Edu', '$2a$10$38nR5/Vb6Jxa7.dtZ1MD0OWE1FBln/E22CtdtdyJD3HW2IFddizhG');

INSERT INTO tb_progresso_usuario (id_usuario, id_capitulo, status) VALUES (1, 1, 'TERMINADO');
INSERT INTO tb_progresso_usuario (id_usuario, id_capitulo, status) VALUES (1, 2, 'TERMINADO');
INSERT INTO tb_progresso_usuario (id_usuario, id_capitulo, status) VALUES (2, 1, 'TERMINADO');
INSERT INTO tb_progresso_usuario (id_usuario, id_capitulo, status) VALUES (3, 1, 'TERMINADO');

INSERT INTO tb_insignia (url_insignia, nome, descricao) VALUES ('assets/icons/medal.png', 'Seja Bem-vindo(a)!', 'Este é o seu primeiro acesso. Estamos muito felizes em ter você começando esta jornada conosco.');
INSERT INTO tb_insignia (url_insignia, nome, descricao, etapa_id) VALUES ('assets/icons/medal.png', 'Mestre do Clic', 'Complete o curso do Clic', 1);
INSERT INTO tb_insignia (url_insignia, nome, descricao, etapa_id) VALUES ('assets/icons/medal.png', 'Guerreiro Kaizen', 'Complete o curso do Kaizen', 2);
INSERT INTO tb_insignia (url_insignia, nome, descricao, etapa_id) VALUES ('assets/icons/medal.png', 'Companheiro EVA', 'Complete o curso do EVA', 3);
INSERT INTO tb_insignia (url_insignia, nome, descricao, etapa_id) VALUES ('assets/icons/medal.png', 'Dono da Oficina', 'Complete o curso da Oficina Digital', 4);
INSERT INTO tb_insignia (url_insignia, nome, descricao) VALUES ('assets/icons/medal.png','Mestre das Perguntas', 'Já fez 5 perguntas ao nosso chatbot. Você sabe exatamente como encontrar as respostas que precisa.');
INSERT INTO tb_insignia (url_insignia, nome, descricao) VALUES ('assets/icons/medal.png' ,'Amigo do Assistente', 'Você interagiu 10 vezes com o chatbot. Ele já te considera um(a) grande parceiro(a) de conversa.');
INSERT INTO tb_insignia (url_insignia, nome, descricao) VALUES ('assets/icons/medal.png' ,'Sempre Presente', 'Uma semana inteira de acessos! Seu comprometimento com o desenvolvimento é inspirador.');
INSERT INTO tb_insignia (url_insignia, nome, descricao) VALUES ('assets/icons/medal.png' ,'Trilha Finalizada', 'Você completou uma trilha de aprendizado inteira. Sinta orgulho da sua dedicação e do conhecimento adquirido.');
INSERT INTO tb_insignia (url_insignia, nome, descricao) VALUES ('assets/icons/medal.png' ,'Certificação de Onboarding', 'Missão completa! Você finalizou todo o conteúdo de integração e está oficialmente pronto(a) para decolar conosco.');
INSERT INTO tb_insignia (url_insignia, nome, descricao) VALUES ('assets/icons/medal.png','Curiosidade em Ação', 'Você explorou um conteúdo opcional. Sua iniciativa em aprender mais é um grande diferencial.');


