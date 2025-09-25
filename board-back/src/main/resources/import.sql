INSERT INTO tb_etapa (titulo, tema, descricao, url_imagem) VALUES ('Plataforma Clic', 'INOVACAO', 'Aprenda uma das principais plataformas da Eurofarma, o Clic, onde suas ideias fazem diferença','https://media.licdn.com/dms/image/sync/v2/D4D27AQHuANrUxz-R9g/articleshare-shrink_800/articleshare-shrink_800/0/1711896888135?e=2147483647&v=beta&t=NVQaXRXRfaioyhP4dxVB5xRTCpc65l4pMDcQKFCAwHY');
INSERT INTO tb_etapa (titulo, tema, descricao, url_imagem) VALUES ('Plataforma Kaizen', 'INOVACAO', 'Aprenda uma das principais plataformas da Eurofarma, o Clic, onde suas ideias podem fazer diferença', 'https://eurofarma.com.br/storage/files/euron%20release.jpg');
INSERT INTO tb_etapa (titulo, tema, descricao, url_imagem) VALUES ('Programa EVA', 'INOVACAO', 'Aprenda sobre o robô queridinho da Eurofarma o EVA, seu parceiro para todos os momentos', 'https://eurofarma.com.br/storage/files/euron%20release.jpg');
INSERT INTO tb_etapa (titulo, tema, descricao, url_imagem) VALUES ('Oficina Digital', 'DESENVOLVIMENTO', 'Utilize de ferramentas No Code em laboratórios para criar o qued desejar', 'https://eurofarma.com.br/storage/files/euron%20release.jpg');

INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Introdução', 'Aprenda o básico.', 1);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Como participar', 'Venha compartilhar suas ideias!', 1);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Geração de ideias', 'Como criar um ideia corretamente.', 1);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Melhores práticas', 'Como pensar de maneira efetiva.', 1);

INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Introdução', 'Aprenda o básico.', 2);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('O Processo de ideias', 'Libere seus pensamentos!', 2);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Melhores práticas', 'Como pensar de maneira efetiva.', 2);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Libere seu potencial', 'Receba a gnose!', 2);

INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Introdução', 'Aprenda o básico.', 3);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Uma assistente especial', 'Venha conhecer sua assistente para toda ocasião', 3);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Como aproveitar o EVA', 'Divirta-se com a tecnologia!', 3);

INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Introdução', 'Aprenda o básico.', 4);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Uma iniciativa para você', 'Crie resultados que fazem a diferença', 4);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Melhores práticas', 'Como desenvolver de maneira efetiva.', 4);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Finalização', 'Venha fazer ser futuro!', 4);


ALTER TABLE tb_capitulo ALTER COLUMN modulo_id TYPE BIGINT;

INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Introdução', 'O Programa CLIC é uma iniciativa estratégica da Eurofarma voltada a fomentar uma cultura de inovação participativa e contínua em toda a organização. O propósito central é democratizar o surgimento de ideias para a melhoria dos processos, operações e produtos, abrindo espaço para que todos os colaboradores, de qualquer área ou nível hierárquico, possam contribuir com sugestões – desde soluções simples para o dia a dia até propostas disruptivas que impactem diretamente o negócio.',  '', 1);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Filosofia Clic', 'A filosofia do CLIC valoriza a escuta ativa: toda ideia importa. Seja para aprimorar rotinas, sugerir novos produtos ou endereçar desafios operacionais, a premissa é que todos podem ser agentes de mudança, com foco em ganhos de produtividade, resultados financeiros, sustentabilidade e impacto positivo na cultura da empresa.',  '', 1);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Como funciona?', 'Qualquer colaborador Eurofarma pode cadastrar uma ideia em poucos cliques pelo portal online ou por QR code, preenchendo um formulário simplificado detalhando o problema identificado e a solução sugerida.\nNão é necessária a implementação imediata – basta apresentar o conceito e a proposta.',  '', 2);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Triagem inicial', 'O time EurON Six Sigma faz uma triagem para garantir que a sugestão se enquadre nos critérios do programa (potencial produtivo, financeiro, sustentável, segurança, qualidade etc).',  '', 2);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Quais ideias são bem-vindas', 'A resposta é muito simples! Qualquer ideia que desejar, pense de maneira inovadora, nossos funcionários ficarão muito felizes em poder avaliar suas ideias e lhe dar o que voê merece.',  '', 3);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Suas premiações.', 'Mas oque seria isso?\n\n Se comprovado impacto relevante (financeiro, produtividade, sustentabilidade), o colaborador recebe premiação em eventos especiais, conduzidos pelo CEO Global e alta liderança, apresentando sua solução à diretoria e Grupo Executivo. Ideias que geram ganho financeiro superior a R$ 1 milhão podem render ao proponente até 5% do valor economizado, limitado a R$ 120 mil.',  '', 3);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Por que Participar', 'O CLIC representa uma oportunidade real para cada colaborador transformar sua visão em ação, colaborar ativamente para a evolução da Eurofarma e ser reconhecido por seu papel inovador. Compartilhe sua ideia e faça parte do movimento que impulsiona resultados, inspira pessoas e molda o futuro da Eurofarma!',  '', 4);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Gestão e Comunicão', 'O programa é gerido por uma equipe dedicada do Six Sigma, responsável pelo acompanhamento de ideias, resultados, comunicação de status e articulação com o Comitê CLIC. As comunicações são realizadas por canais estratégicos: intranet, TV corporativa, Teams, revista Panorama, Engage (rede social interna), além da produção de vídeos de reconhecimento—ampliando o engajamento e a cultura de valorização das ideias.',  '', 4);

INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('O que é o Kaizen?', 'A Submissão de Ideias em um quadro é um método simples e eficaz Permite a democratização da inovação, dando voz a todos, independentemente de sua posição Essa prática fomenta um ambiente onde a criatividade flui livremente, gerando um fluxo constante de novas propostas Essas ideias, uma vez analisadas, podem se transformar em melhorias significativas e soluções disruptivas, impulsionando o crescimento e a competitividade da empresa É a base para uma cultura de inovação contínuad',  '', 5);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Como funciona o processo?', 'Avaliação: Gestores avaliam e, se viável, implementam Premiação: Existe um programa de pontos onde o colaborador ganha 1 ponto ao inscrever uma ideia válida e 10 pontos se a ideia for implementada. Esses pontos podem ser trocados por brindes no catálogo da companhia Conversão: Se a ideia tem potencial de retorno financeiro, aumento de produtividade ou   sustentabilidade (CO2eq) ela e convertida em ideia Clic e segue o fluxo de análise de resultados pelo comitê de ideias CLIC.',  '', 6);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Incentivos do processo', 'Incentivos: Pontos e Brindes: Os pontos podem ser trocados por brindes no catálogo da companhia. Apresentação: Periodicamente, os idealizadores mais relevantes apresentam suas ideias implementadas para o CEO Global e a alta direção.',  '', 6);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Como submeter boas ideias', 'O sucesso da submissão de ideias em um quadro colaborativo depende de algumas práticas essenciais que transformam um simples mural em uma verdadeira ferramenta de inovação. A primeira regra é a objetividade. As ideias devem ser apresentadas de forma clara e concisa, focando no problema a ser resolvido e na solução proposta. Em vez de longos textos, use frases curtas e diretas.\nEm seguida, a identificação do impacto é crucial. Ao propor uma ideia, o colaborador deve indicar o benefício que ela pode trazer para a empresa, como a redução de custos, a otimização de um processo ou a melhoria da experiência do cliente. Isso ajuda a valorizar a proposta e a demonstrar seu potencial;',  '', 7);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('O que não fazer', 'Para que um sistema de submissão de ideias em quadro funcione de forma eficaz, é crucial saber o que evitar. Em primeiro lugar, evite ser vago ou excessivamente prolixo. Textos longos e cheios de jargão tendem a ser ignorados e não comunicam a essência da proposta. A clareza e a concisão são fundamentais. Além disso, jamais critique as ideias dos outros de forma destrutiva. O objetivo é colaborar e construir, não demolir. Em vez de dizer "Isso não vai funcionar", procure sugerir melhorias de forma construtiva.',  '', 7);

INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Introdução pt1', 'd',  'DJMIOSAIJODSAO', 8);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Introdução pt1', 'd',  'DJMIOSAIJODSAO', 9);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Introdução pt1', 'd',  'DJMIOSAIJODSAO', 10);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Introdução pt1', 'd',  'DJMIOSAIJODSAO', 11);

INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Introdução pt1', '2',  'JDIOASIJDSAIOL', 12);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Introdução pt1', '2',  'JDIOASIJDSAIOL', 13);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Introdução pt1', '2',  'JDIOASIJDSAIOL', 14);
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Introdução pt1', '2',  'JDIOASIJDSAIOL', 15);

INSERT INTO tb_usuario (cpf, email, username, senha) VALUES ('52702190855', 'deri@g', 'Derick', '1234');
INSERT INTO tb_usuario (cpf, email, username, senha) VALUES ('52702190855', 'nick@g', 'Nicolas', '1234');
INSERT INTO tb_usuario (cpf, email, username, senha) VALUES ('52702190855', 'jose@g', 'Edu', '1234');

INSERT INTO tb_progresso_usuario (id_usuario, id_capitulo, status) VALUES (1, 1, 'TERMINADO');
INSERT INTO tb_progresso_usuario (id_usuario, id_capitulo, status) VALUES (1, 2, 'TERMINADO');
INSERT INTO tb_progresso_usuario (id_usuario, id_capitulo, status) VALUES (2, 1, 'TERMINADO');
INSERT INTO tb_progresso_usuario (id_usuario, id_capitulo, status) VALUES (3, 1, 'TERMINADO');

INSERT INTO tb_insignia (nome, descricao) VALUES ('Desafio 1', 'Tororororo XD');
INSERT INTO tb_insignia (nome, descricao) VALUES ('Desafio 1', 'Tororororo XD');
INSERT INTO tb_insignia (nome, descricao) VALUES ('Seja Bem-vindo(a)!', 'Este é o seu primeiro acesso. Estamos muito felizes em ter você começando esta jornada conosco.');
INSERT INTO tb_insignia (nome, descricao) VALUES ('Mestre das Perguntas', 'Já fez 5 perguntas ao nosso chatbot. Você sabe exatamente como encontrar as respostas que precisa.');
INSERT INTO tb_insignia (nome, descricao) VALUES ('Amigo do Assistente', 'Você interagiu 10 vezes com o chatbot. Ele já te considera um(a) grande parceiro(a) de conversa.');
INSERT INTO tb_insignia (nome, descricao) VALUES ('Sempre Presente', 'Uma semana inteira de acessos! Seu comprometimento com o desenvolvimento é inspirador.');
INSERT INTO tb_insignia (nome, descricao) VALUES ('Trilha Finalizada', 'Você completou uma trilha de aprendizado inteira. Sinta orgulho da sua dedicação e do conhecimento adquirido.');
INSERT INTO tb_insignia (nome, descricao) VALUES ('Certificação de Onboarding', 'Missão completa! Você finalizou todo o conteúdo de integração e está oficialmente pronto(a) para decolar conosco.');
INSERT INTO tb_insignia (nome, descricao) VALUES ('Curiosidade em Ação', 'Você explorou um conteúdo opcional. Sua iniciativa em aprender mais é um grande diferencial.');


