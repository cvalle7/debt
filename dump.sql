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
    money integer DEFAULT 0 NOT NULL,
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
    pay_id integer NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: debtuser
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
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
-- Data for Name: debts; Type: TABLE DATA; Schema: public; Owner: debtuser
--

COPY public.debts (id, money, name, created_at) FROM stdin;
20	300	debt1	2025-01-29 13:07:02.652
\.


--
-- Data for Name: pay_for; Type: TABLE DATA; Schema: public; Owner: debtuser
--

COPY public.pay_for (user_id, pay_id) FROM stdin;
26	51
27	51
28	52
26	52
27	52
\.


--
-- Data for Name: pays; Type: TABLE DATA; Schema: public; Owner: debtuser
--

COPY public.pays (id, name, amount, "payById", created_at) FROM stdin;
51	example	100	28	2025-01-30 13:44:22.119116
52	Example 2	200	26	2025-01-30 14:27:57.28945
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: debtuser
--

COPY public.users (id, name, created_at, "debtId") FROM stdin;
26	Joan	2025-01-29 13:07:02.664743	20
27	Pep	2025-01-29 13:07:02.668658	20
28	Cebi	2025-01-29 13:07:02.670424	20
\.


--
-- Name: debts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debtuser
--

SELECT pg_catalog.setval('public.debts_id_seq', 20, true);


--
-- Name: pays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debtuser
--

SELECT pg_catalog.setval('public.pays_id_seq', 52, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debtuser
--

SELECT pg_catalog.setval('public.users_id_seq', 28, true);


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
-- Name: pay_for FK_c1553efc1192ead9c7f4c7ddfa9; Type: FK CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.pay_for
    ADD CONSTRAINT "FK_c1553efc1192ead9c7f4c7ddfa9" FOREIGN KEY (pay_id) REFERENCES public.pays(id) ON DELETE CASCADE;


--
-- Name: pay_for FK_eaf70416053de3eb048027e5a91; Type: FK CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.pay_for
    ADD CONSTRAINT "FK_eaf70416053de3eb048027e5a91" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

