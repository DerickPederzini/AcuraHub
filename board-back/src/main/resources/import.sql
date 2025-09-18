INSERT INTO tb_etapa (titulo, tema, url_imagem) VALUES ('Plataforma Clic', 'INOVACAO', 'https://media.licdn.com/dms/image/sync/v2/D4D27AQHuANrUxz-R9g/articleshare-shrink_800/articleshare-shrink_800/0/1711896888135?e=2147483647&v=beta&t=NVQaXRXRfaioyhP4dxVB5xRTCpc65l4pMDcQKFCAwHY');
INSERT INTO tb_etapa (titulo, tema, url_imagem) VALUES ('Plataforma Kaizen', 'INOVACAO', 'https://eurofarma.com.br/storage/files/euron%20release.jpg');

INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Introdução', 'Aprenda o básico', 1);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Como participar', 'Aprenda o básico', 1);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Geração de ideias', 'Aprenda o básico', 1);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Melhores práticas', 'Aprenda o básico', 1);
INSERT INTO tb_modulo (title, description, etapa_id) VALUES ('Finalização', 'Aprenda o básico', 1);

ALTER TABLE tb_capitulo ALTER COLUMN modulo_id TYPE BIGINT;

INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Introdução pt1', 'dsa',  'JHUIHRIUSDHI', 1)
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Introdução pt1', 'das',  'KDJSAIOHDIUSA', 2)
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Introdução pt1', 'd',  'DJMIOSAIJODSAO', 3)
INSERT INTO tb_capitulo (titulo, body, url_video, modulo_id) VALUES ('Introdução pt1', '2',  'JDIOASIJDSAIOL', 4)



