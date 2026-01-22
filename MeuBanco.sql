--
-- PostgreSQL database dump
--

\restrict gluh10BMwC9l8W5ZvAWCmaaF4i3MUARm06bmwMHqQevaEHTbX1RObAUXrwScaKg

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-21 21:24:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16451)
-- Name: administrador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrador (
    login character varying(50) NOT NULL,
    nivel_admin character varying(50),
    data_posse date
);


ALTER TABLE public.administrador OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16462)
-- Name: analista_mcom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.analista_mcom (
    login character varying(50) NOT NULL,
    matricula_funcional character varying(50),
    numero_portaria character varying(50),
    data_portaria date
);


ALTER TABLE public.analista_mcom OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16429)
-- Name: diretoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diretoria (
    id_diretoria integer NOT NULL,
    id_mantenedora integer,
    titulo_cargo character varying(50),
    descricao text,
    data_posse date
);


ALTER TABLE public.diretoria OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16428)
-- Name: diretoria_id_diretoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diretoria_id_diretoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diretoria_id_diretoria_seq OWNER TO postgres;

--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 221
-- Name: diretoria_id_diretoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diretoria_id_diretoria_seq OWNED BY public.diretoria.id_diretoria;


--
-- TOC entry 232 (class 1259 OID 16535)
-- Name: emissora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emissora (
    id_emissora integer NOT NULL,
    altura_da_antena numeric(10,2),
    localizacao text,
    area_coberta numeric(10,2),
    status_operacional character varying(50),
    potencia numeric(10,2),
    alcance_maximo numeric(10,2),
    latitude numeric(10,6),
    longitude numeric(10,6),
    hora_de_musicas_diarias integer,
    numero_processo integer
);


ALTER TABLE public.emissora OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16534)
-- Name: emissora_id_emissora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emissora_id_emissora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emissora_id_emissora_seq OWNER TO postgres;

--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 231
-- Name: emissora_id_emissora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emissora_id_emissora_seq OWNED BY public.emissora.id_emissora;


--
-- TOC entry 226 (class 1259 OID 16473)
-- Name: fiscal_anatel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fiscal_anatel (
    login character varying(50) NOT NULL,
    matricula_funcional character varying(50),
    unidade_anatel character varying(100)
);


ALTER TABLE public.fiscal_anatel OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16587)
-- Name: fiscalizacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fiscalizacao (
    id_fiscalizacao integer NOT NULL,
    data_hora_inicio timestamp without time zone,
    data_hora_fim timestamp without time zone,
    laudo text,
    status character varying(50),
    login character varying(50),
    id_emissora integer
);


ALTER TABLE public.fiscalizacao OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16586)
-- Name: fiscalizacao_id_fiscalizacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fiscalizacao_id_fiscalizacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fiscalizacao_id_fiscalizacao_seq OWNER TO postgres;

--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 237
-- Name: fiscalizacao_id_fiscalizacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fiscalizacao_id_fiscalizacao_seq OWNED BY public.fiscalizacao.id_fiscalizacao;


--
-- TOC entry 227 (class 1259 OID 16484)
-- Name: gestor_mantenedora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gestor_mantenedora (
    login character varying(50) NOT NULL,
    id_mantenedora integer
);


ALTER TABLE public.gestor_mantenedora OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16622)
-- Name: licenca_ecad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.licenca_ecad (
    id_licenca_ecad integer NOT NULL,
    data_de_emissao date,
    data_de_vencimento date,
    status character varying(50),
    valor numeric(10,2),
    id_emissora integer,
    login_gestor character varying(50)
);


ALTER TABLE public.licenca_ecad OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16621)
-- Name: licenca_ecad_id_licenca_ecad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.licenca_ecad_id_licenca_ecad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.licenca_ecad_id_licenca_ecad_seq OWNER TO postgres;

--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 241
-- Name: licenca_ecad_id_licenca_ecad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.licenca_ecad_id_licenca_ecad_seq OWNED BY public.licenca_ecad.id_licenca_ecad;


--
-- TOC entry 220 (class 1259 OID 16421)
-- Name: mantenedora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mantenedora (
    id_mantenedora integer NOT NULL,
    razao_social character varying(50),
    cnpj character varying(14),
    endereco character varying(50)
);


ALTER TABLE public.mantenedora OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16420)
-- Name: mantenedora_id_mantenedora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mantenedora_id_mantenedora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mantenedora_id_mantenedora_seq OWNER TO postgres;

--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 219
-- Name: mantenedora_id_mantenedora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mantenedora_id_mantenedora_seq OWNED BY public.mantenedora.id_mantenedora;


--
-- TOC entry 240 (class 1259 OID 16607)
-- Name: multa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.multa (
    id_multa integer NOT NULL,
    data_de_vencimento date,
    status character varying(50),
    valor numeric(10,2),
    tipo character varying(100),
    descricao text,
    id_fiscalizacao integer
);


ALTER TABLE public.multa OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16606)
-- Name: multa_id_multa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.multa_id_multa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.multa_id_multa_seq OWNER TO postgres;

--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 239
-- Name: multa_id_multa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.multa_id_multa_seq OWNED BY public.multa.id_multa;


--
-- TOC entry 230 (class 1259 OID 16518)
-- Name: outorga; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outorga (
    numero_processo integer NOT NULL,
    data_concessao date,
    data_vencimento date,
    status character varying(50),
    id_mantenedora integer,
    numero_solicitacao integer
);


ALTER TABLE public.outorga OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16575)
-- Name: radio_comunitaria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.radio_comunitaria (
    id_emissora integer NOT NULL,
    modulacao character varying(20),
    frequencia numeric(10,2)
);


ALTER TABLE public.radio_comunitaria OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16550)
-- Name: retransmissora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retransmissora (
    id_retransmissora integer NOT NULL,
    poluicao character varying(100),
    latitude numeric(10,6),
    longitude numeric(10,6),
    localizacao text,
    status_operacional character varying(50),
    id_emissora integer
);


ALTER TABLE public.retransmissora OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16549)
-- Name: retransmissora_id_retransmissora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.retransmissora_id_retransmissora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.retransmissora_id_retransmissora_seq OWNER TO postgres;

--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 233
-- Name: retransmissora_id_retransmissora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.retransmissora_id_retransmissora_seq OWNED BY public.retransmissora.id_retransmissora;


--
-- TOC entry 229 (class 1259 OID 16501)
-- Name: solicitacao_outorga; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solicitacao_outorga (
    numero_solicitacao integer NOT NULL,
    login_gestor character varying(50),
    login_admin character varying(50),
    data_expedicao date,
    status_final character varying(50)
);


ALTER TABLE public.solicitacao_outorga OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16500)
-- Name: solicitacao_outorga_numero_solicitacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solicitacao_outorga_numero_solicitacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solicitacao_outorga_numero_solicitacao_seq OWNER TO postgres;

--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 228
-- Name: solicitacao_outorga_numero_solicitacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solicitacao_outorga_numero_solicitacao_seq OWNED BY public.solicitacao_outorga.numero_solicitacao;


--
-- TOC entry 235 (class 1259 OID 16564)
-- Name: tv_comunitaria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tv_comunitaria (
    id_emissora integer NOT NULL,
    resolucao character varying(50),
    canal_fisico character varying(10),
    canal character varying(10),
    padrao_de_transmissao character varying(50)
);


ALTER TABLE public.tv_comunitaria OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16443)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    login character varying(50) NOT NULL,
    email character varying(50),
    nome character varying(50),
    senha character varying(50)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 4823 (class 2604 OID 16432)
-- Name: diretoria id_diretoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diretoria ALTER COLUMN id_diretoria SET DEFAULT nextval('public.diretoria_id_diretoria_seq'::regclass);


--
-- TOC entry 4825 (class 2604 OID 16538)
-- Name: emissora id_emissora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissora ALTER COLUMN id_emissora SET DEFAULT nextval('public.emissora_id_emissora_seq'::regclass);


--
-- TOC entry 4827 (class 2604 OID 16590)
-- Name: fiscalizacao id_fiscalizacao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscalizacao ALTER COLUMN id_fiscalizacao SET DEFAULT nextval('public.fiscalizacao_id_fiscalizacao_seq'::regclass);


--
-- TOC entry 4829 (class 2604 OID 16625)
-- Name: licenca_ecad id_licenca_ecad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licenca_ecad ALTER COLUMN id_licenca_ecad SET DEFAULT nextval('public.licenca_ecad_id_licenca_ecad_seq'::regclass);


--
-- TOC entry 4822 (class 2604 OID 16424)
-- Name: mantenedora id_mantenedora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenedora ALTER COLUMN id_mantenedora SET DEFAULT nextval('public.mantenedora_id_mantenedora_seq'::regclass);


--
-- TOC entry 4828 (class 2604 OID 16610)
-- Name: multa id_multa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multa ALTER COLUMN id_multa SET DEFAULT nextval('public.multa_id_multa_seq'::regclass);


--
-- TOC entry 4826 (class 2604 OID 16553)
-- Name: retransmissora id_retransmissora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retransmissora ALTER COLUMN id_retransmissora SET DEFAULT nextval('public.retransmissora_id_retransmissora_seq'::regclass);


--
-- TOC entry 4824 (class 2604 OID 16504)
-- Name: solicitacao_outorga numero_solicitacao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitacao_outorga ALTER COLUMN numero_solicitacao SET DEFAULT nextval('public.solicitacao_outorga_numero_solicitacao_seq'::regclass);


--
-- TOC entry 5035 (class 0 OID 16451)
-- Dependencies: 224
-- Data for Name: administrador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrador (login, nivel_admin, data_posse) FROM stdin;
\.


--
-- TOC entry 5036 (class 0 OID 16462)
-- Dependencies: 225
-- Data for Name: analista_mcom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.analista_mcom (login, matricula_funcional, numero_portaria, data_portaria) FROM stdin;
\.


--
-- TOC entry 5033 (class 0 OID 16429)
-- Dependencies: 222
-- Data for Name: diretoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diretoria (id_diretoria, id_mantenedora, titulo_cargo, descricao, data_posse) FROM stdin;
\.


--
-- TOC entry 5043 (class 0 OID 16535)
-- Dependencies: 232
-- Data for Name: emissora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emissora (id_emissora, altura_da_antena, localizacao, area_coberta, status_operacional, potencia, alcance_maximo, latitude, longitude, hora_de_musicas_diarias, numero_processo) FROM stdin;
1	45.00	\N	30.00	Ativa	50.50	\N	-23.550000	-46.630000	\N	10012024
2	50.00	\N	100.00	Ativa	25.00	\N	-23.550000	-46.630000	\N	10012024
3	60.00	\N	150.00	Ativa	100.00	\N	-15.794400	-47.882800	\N	10012024
4	35.50	\N	80.00	Ativa	30.00	\N	-19.916700	-43.933300	\N	10012024
\.


--
-- TOC entry 5037 (class 0 OID 16473)
-- Dependencies: 226
-- Data for Name: fiscal_anatel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fiscal_anatel (login, matricula_funcional, unidade_anatel) FROM stdin;
carlos.fiscal	ANATEL-9901	Unidade São Paulo
ana.silva	ANATEL-8802	Unidade Rio de Janeiro
\.


--
-- TOC entry 5049 (class 0 OID 16587)
-- Dependencies: 238
-- Data for Name: fiscalizacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fiscalizacao (id_fiscalizacao, data_hora_inicio, data_hora_fim, laudo, status, login, id_emissora) FROM stdin;
12	2026-01-20 10:00:00	2026-01-20 12:00:00	Equipamentos testados e aprovados.	Concluída	ana.silva	4
15	2026-01-19 15:00:00	\N	Antena com inclinação fora do padrão técnico.	Irregular	carlos.fiscal	4
14	2026-01-19 09:15:00	2026-01-19 11:00:00	Verificação de rotina sem pendências.	Concluída	ana.silva	3
17	2026-01-18 16:00:00	\N	Aguardando documentação do engenheiro.	Em Andamento	carlos.fiscal	3
16	2026-01-18 10:00:00	2026-01-18 12:30:00	Troca de cabos realizada com sucesso.	Concluída	ana.silva	2
19	2026-01-17 14:00:00	\N	Potência acima do limite de 50kW.	Irregular	carlos.fiscal	4
18	2026-01-17 08:45:00	2026-01-17 10:15:00	Fiscalização de espectro concluída.	Concluída	ana.silva	1
20	2026-01-16 11:30:00	2026-01-16 13:00:00	Documentos de outorga validados.	Concluída	ana.silva	2
10	2024-02-05 14:00:00	\N	Verificando potência	Em Andamento	ana.silva	1
9	2024-02-01 09:00:00	2024-02-01 11:30:00	Tudo OK	Concluída	carlos.fiscal	1
\.


--
-- TOC entry 5038 (class 0 OID 16484)
-- Dependencies: 227
-- Data for Name: gestor_mantenedora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gestor_mantenedora (login, id_mantenedora) FROM stdin;
\.


--
-- TOC entry 5053 (class 0 OID 16622)
-- Dependencies: 242
-- Data for Name: licenca_ecad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.licenca_ecad (id_licenca_ecad, data_de_emissao, data_de_vencimento, status, valor, id_emissora, login_gestor) FROM stdin;
\.


--
-- TOC entry 5031 (class 0 OID 16421)
-- Dependencies: 220
-- Data for Name: mantenedora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mantenedora (id_mantenedora, razao_social, cnpj, endereco) FROM stdin;
5	Rede Alpha de Comunicação	11222333000199	Av. Paulista, 1000
\.


--
-- TOC entry 5051 (class 0 OID 16607)
-- Dependencies: 240
-- Data for Name: multa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.multa (id_multa, data_de_vencimento, status, valor, tipo, descricao, id_fiscalizacao) FROM stdin;
\.


--
-- TOC entry 5041 (class 0 OID 16518)
-- Dependencies: 230
-- Data for Name: outorga; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outorga (numero_processo, data_concessao, data_vencimento, status, id_mantenedora, numero_solicitacao) FROM stdin;
10012024	2020-01-15	2030-01-15	\N	\N	\N
\.


--
-- TOC entry 5047 (class 0 OID 16575)
-- Dependencies: 236
-- Data for Name: radio_comunitaria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.radio_comunitaria (id_emissora, modulacao, frequencia) FROM stdin;
\.


--
-- TOC entry 5045 (class 0 OID 16550)
-- Dependencies: 234
-- Data for Name: retransmissora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.retransmissora (id_retransmissora, poluicao, latitude, longitude, localizacao, status_operacional, id_emissora) FROM stdin;
\.


--
-- TOC entry 5040 (class 0 OID 16501)
-- Dependencies: 229
-- Data for Name: solicitacao_outorga; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solicitacao_outorga (numero_solicitacao, login_gestor, login_admin, data_expedicao, status_final) FROM stdin;
\.


--
-- TOC entry 5046 (class 0 OID 16564)
-- Dependencies: 235
-- Data for Name: tv_comunitaria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tv_comunitaria (id_emissora, resolucao, canal_fisico, canal, padrao_de_transmissao) FROM stdin;
\.


--
-- TOC entry 5034 (class 0 OID 16443)
-- Dependencies: 223
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (login, email, nome, senha) FROM stdin;
carlos.fiscal	carlos@anatel.gov.br	Carlos Andrade	123456
ana.silva	ana.silva@anatel.gov.br	Ana Silva	senha789
\.


--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 221
-- Name: diretoria_id_diretoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diretoria_id_diretoria_seq', 1, false);


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 231
-- Name: emissora_id_emissora_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emissora_id_emissora_seq', 2, true);


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 237
-- Name: fiscalizacao_id_fiscalizacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fiscalizacao_id_fiscalizacao_seq', 21, true);


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 241
-- Name: licenca_ecad_id_licenca_ecad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.licenca_ecad_id_licenca_ecad_seq', 1, false);


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 219
-- Name: mantenedora_id_mantenedora_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mantenedora_id_mantenedora_seq', 5, true);


--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 239
-- Name: multa_id_multa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.multa_id_multa_seq', 1, false);


--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 233
-- Name: retransmissora_id_retransmissora_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.retransmissora_id_retransmissora_seq', 1, false);


--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 228
-- Name: solicitacao_outorga_numero_solicitacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solicitacao_outorga_numero_solicitacao_seq', 1, false);


-- Completed on 2026-01-21 21:24:58

--
-- PostgreSQL database dump complete
--

\unrestrict gluh10BMwC9l8W5ZvAWCmaaF4i3MUARm06bmwMHqQevaEHTbX1RObAUXrwScaKg

