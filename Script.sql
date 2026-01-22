CREATE TABLE Mantenedora (
    ID_Mantenedora SERIAL PRIMARY KEY,
    razao_social VARCHAR(50), 
    CNPJ VARCHAR(14),
    endereco VARCHAR(50)
);

CREATE TABLE Diretoria (
    ID_Diretoria SERIAL PRIMARY KEY,
    ID_Mantenedora INT,
    titulo_cargo VARCHAR(50),
    descricao TEXT,
    data_posse DATE,
    FOREIGN KEY (ID_Mantenedora) REFERENCES Mantenedora(ID_Mantenedora)
);

CREATE TABLE Usuario (
    login VARCHAR(50) PRIMARY KEY,
    email VARCHAR(50) UNIQUE,
    nome VARCHAR(50),
    senha VARCHAR(50)
);

CREATE TABLE Administrador (
    login VARCHAR(50) PRIMARY KEY,
    nivel_admin VARCHAR(50),
    data_posse DATE,
    FOREIGN KEY (login) REFERENCES Usuario(login)
);

CREATE TABLE Analista_MCOM (
    login VARCHAR(50) PRIMARY KEY,
    matricula_funcional VARCHAR(50),
    numero_portaria VARCHAR(50),
    data_portaria DATE,
    FOREIGN KEY (login) REFERENCES Usuario(login)
);

CREATE TABLE Fiscal_ANATEL (
    login VARCHAR(50) PRIMARY KEY,
    matricula_funcional VARCHAR(50),
    unidade_anatel VARCHAR(100),
    FOREIGN KEY (login) REFERENCES Usuario(login)
);  

CREATE TABLE Gestor_mantenedora (
    login VARCHAR(50) PRIMARY KEY,
    ID_Mantenedora INT, 
    FOREIGN KEY (login) REFERENCES Usuario(login),
    FOREIGN KEY (ID_Mantenedora) REFERENCES Mantenedora(ID_Mantenedora)
);

CREATE TABLE Solicitacao_Outorga (
    numero_solicitacao SERIAL PRIMARY KEY,
    login_gestor VARCHAR(50) REFERENCES Gestor_mantenedora(login),
    login_admin VARCHAR(50) REFERENCES Administrador(login),
    data_expedicao DATE,
    status_final VARCHAR(50)
);

CREATE TABLE Outorga (
    numero_processo INT PRIMARY KEY,
    data_concessao DATE,
    data_vencimento DATE,
    status VARCHAR(50),
    ID_Mantenedora INT REFERENCES Mantenedora(ID_Mantenedora),
    numero_solicitacao INT REFERENCES Solicitacao_Outorga(numero_solicitacao)
);

CREATE TABLE Emissora (
    ID_Emissora SERIAL PRIMARY KEY,
    altura_da_antena NUMERIC(10,2),
    localizacao TEXT,
    area_coberta NUMERIC(10,2),
    status_operacional VARCHAR(50),
    potencia NUMERIC(10,2),
    alcance_maximo NUMERIC(10,2),
    latitude NUMERIC(10,6),
    longitude NUMERIC(10,6),
    hora_de_musicas_diarias INT,
    numero_processo INT REFERENCES Outorga(numero_processo)
);

CREATE TABLE Retransmissora (
    ID_Retransmissora SERIAL PRIMARY KEY,
    poluicao VARCHAR(100),
    latitude NUMERIC(10,6),
    longitude NUMERIC(10,6),
    localizacao TEXT,
    status_operacional VARCHAR(50),
    ID_Emissora INT REFERENCES Emissora(ID_Emissora)
);

CREATE TABLE TV_Comunitaria (
    ID_Emissora INT PRIMARY KEY REFERENCES Emissora(ID_Emissora),
    resolucao VARCHAR(50),
    canal_fisico VARCHAR(10),
    canal VARCHAR(10),
    padrao_de_transmissao VARCHAR(50)
);

CREATE TABLE Radio_Comunitaria (
    ID_Emissora INT PRIMARY KEY REFERENCES Emissora(ID_Emissora),
    modulacao VARCHAR(20),
    frequencia NUMERIC(10,2)
);

CREATE TABLE Fiscalizacao (
    ID_Fiscalizacao SERIAL PRIMARY KEY,
    data_hora_inicio TIMESTAMP,
    data_hora_fim TIMESTAMP,
    laudo TEXT,
    status VARCHAR(50),
    login VARCHAR(50) REFERENCES Fiscal_ANATEL(login),
    ID_Emissora INT REFERENCES Emissora(ID_Emissora)
);

CREATE TABLE Multa (
    ID_Multa SERIAL PRIMARY KEY,
    data_de_vencimento DATE,
    status VARCHAR(50),
    valor NUMERIC(10,2),
    tipo VARCHAR(100),
    descricao TEXT,
    ID_Fiscalizacao INT REFERENCES Fiscalizacao(ID_Fiscalizacao)
);

CREATE TABLE Licenca_ECAD (
    ID_Licenca_ECAD SERIAL PRIMARY KEY,
    data_de_emissao DATE,
    data_de_vencimento DATE,
    status VARCHAR(50),
    valor NUMERIC(10,2),
    ID_Emissora INT REFERENCES Emissora(ID_Emissora),
    login_gestor VARCHAR(50) REFERENCES Gestor_mantenedora(login)
);

-- USUÁRIOS
INSERT INTO Usuario (login, senha, nome, email) VALUES 
('carlos.fiscal', '123456', 'Carlos Andrade', 'carlos@anatel.gov.br'),
('ana.silva', 'senha789', 'Ana Silva', 'ana.silva@anatel.gov.br');

-- FISCAIS
INSERT INTO Fiscal_ANATEL (login, matricula_funcional, unidade_anatel) VALUES 
('carlos.fiscal', 'ANATEL-9901', 'Unidade São Paulo'),
('ana.silva', 'ANATEL-8802', 'Unidade Rio de Janeiro');

-- MANTENEDORAS E OUTORGAS
INSERT INTO Mantenedora (CNPJ, razao_social, endereco, telefone) VALUES 
('11222333000199', 'Rede Alpha de Comunicação', 'Av. Paulista, 1000', '1133334444');

INSERT INTO Outorga (numero_processo, data_emissao, data_vencimento, ID_Mantenedora) VALUES 
(10012024, '2020-01-15', '2030-01-15', 1);

-- EMISSORAS
INSERT INTO Emissora (status_operacional, potencia, frequencia, latitude, longitude, altura_da_antena, area_coberta, numero_processo) VALUES 
('Ativa', 50.5, 98.1, -23.55, -46.63, 45.0, 'Grande SP', 10012024),
('Ativa', 25.0, 92.3, -23.55, -46.63, 50.0, 'Zona Sul SP', 10012024);

-- FISCALIZAÇÕES 
INSERT INTO Fiscalizacao (data_hora_inicio, data_hora_fim, laudo, status, login, ID_Emissora) VALUES 
('2024-02-01 09:00:00', '2024-02-01 11:30:00', 'Equipamentos OK', 'Concluída', 'carlos.fiscal', 1),
('2024-02-05 14:00:00', NULL, 'Potência acima do permitido', 'Irregular', 'ana.silva', 1),
('2024-02-10 10:00:00', NULL, 'Vistoria em andamento', 'Em Andamento', 'carlos.fiscal', 2);
('2026-01-21 08:00:00', NULL, 'Monitoramento de sinal iniciado.', 'Em Andamento', 'carlos.fiscal', 3),
('2026-01-20 10:00:00', '2026-01-20 12:00:00', 'Equipamentos testados e aprovados.', 'Concluída', 'ana.silva', 4),
('2026-01-20 14:30:00', NULL, 'Suspeita de transmissor clandestino.', 'Irregular', 'carlos.fiscal', 1),
('2026-01-19 09:15:00', '2026-01-19 11:00:00', 'Verificação de rotina sem pendências.', 'Concluída', 'ana.silva', 3),
('2026-01-19 15:00:00', NULL, 'Antena com inclinação fora do padrão técnico.', 'Irregular', 'carlos.fiscal', 4),
('2026-01-18 10:00:00', '2026-01-18 12:30:00', 'Troca de cabos realizada com sucesso.', 'Concluída', 'ana.silva', 2),
('2026-01-18 16:00:00', NULL, 'Aguardando documentação do engenheiro.', 'Em Andamento', 'carlos.fiscal', 3),
('2026-01-17 08:45:00', '2026-01-17 10:15:00', 'Fiscalização de espectro concluída.', 'Concluída', 'ana.silva', 1),
('2026-01-17 14:00:00', NULL, 'Potência acima do limite de 50kW.', 'Irregular', 'carlos.fiscal', 4),
('2026-01-16 11:30:00', '2026-01-16 13:00:00', 'Documentos de outorga validados.', 'Concluída', 'ana.silva', 2);