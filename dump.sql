--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: debts; Type: TABLE; Schema: public; Owner: debtuser
--

CREATE TABLE public.debts (
    id integer NOT NULL,
    money integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.debts OWNER TO debtuser;

--
-- Name: debts_id_seq; Type: SEQUENCE; Schema: public; Owner: debtuser
--

ALTER TABLE public.debts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.debts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pay_for; Type: TABLE; Schema: public; Owner: debtuser
--

CREATE TABLE public.pay_for (
    user_id integer NOT NULL,
    pay_id integer NOT NULL,
    "paysId" integer,
    "usersId" integer
);


ALTER TABLE public.pay_for OWNER TO debtuser;

--
-- Name: pays; Type: TABLE; Schema: public; Owner: debtuser
--

CREATE TABLE public.pays (
    id integer NOT NULL,
    name character varying NOT NULL,
    amount integer NOT NULL,
    "payById" integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.pays OWNER TO debtuser;

--
-- Name: pays_id_seq; Type: SEQUENCE; Schema: public; Owner: debtuser
--

ALTER TABLE public.pays ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: debtuser
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    debt_id integer NOT NULL,
    "debtId" integer
);


ALTER TABLE public.users OWNER TO debtuser;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: debtuser
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: debts; Type: TABLE DATA; Schema: public; Owner: debtuser
--

COPY public.debts (id, money, name, created_at) FROM stdin;
\.


--
-- Data for Name: pay_for; Type: TABLE DATA; Schema: public; Owner: debtuser
--

COPY public.pay_for (user_id, pay_id, "paysId", "usersId") FROM stdin;
\.


--
-- Data for Name: pays; Type: TABLE DATA; Schema: public; Owner: debtuser
--

COPY public.pays (id, name, amount, "payById", created_at) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, name, created_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: debtuser
--

COPY public.users (id, name, created_at, debt_id, "debtId") FROM stdin;
\.


--
-- Name: debts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debtuser
--

SELECT pg_catalog.setval('public.debts_id_seq', 1, false);


--
-- Name: pays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debtuser
--

SELECT pg_catalog.setval('public.pays_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debtuser
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: debts debts_pkey; Type: CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.debts
    ADD CONSTRAINT debts_pkey PRIMARY KEY (id);


--
-- Name: pay_for pay_for_pkey; Type: CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.pay_for
    ADD CONSTRAINT pay_for_pkey PRIMARY KEY (pay_id, user_id);


--
-- Name: pays pays_pkey; Type: CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.pays
    ADD CONSTRAINT pays_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users FK_413be968c829d58976045593787; Type: FK CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_413be968c829d58976045593787" FOREIGN KEY ("debtId") REFERENCES public.debts(id) ON DELETE CASCADE;


--
-- Name: pays FK_68c6901e6768f0e33a8669b2a02; Type: FK CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.pays
    ADD CONSTRAINT "FK_68c6901e6768f0e33a8669b2a02" FOREIGN KEY ("payById") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: pay_for FK_b73b34ce2809dce7f906d301bf8; Type: FK CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.pay_for
    ADD CONSTRAINT "FK_b73b34ce2809dce7f906d301bf8" FOREIGN KEY ("usersId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: pay_for FK_cf15326ac9fc81ff3bc42453b67; Type: FK CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.pay_for
    ADD CONSTRAINT "FK_cf15326ac9fc81ff3bc42453b67" FOREIGN KEY ("paysId") REFERENCES public.pays(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

