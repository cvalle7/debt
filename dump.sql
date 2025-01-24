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
    name character(1) NOT NULL,
    money integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
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
-- Name: debts_users; Type: TABLE; Schema: public; Owner: debtuser
--

CREATE TABLE public.debts_users (
    debt_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.debts_users OWNER TO debtuser;

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
    debt_id integer NOT NULL,
    name character varying NOT NULL,
    amount integer NOT NULL,
    pay_by integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
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
    created_at timestamp with time zone DEFAULT now() NOT NULL
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

COPY public.debts (id, name, money, created_at) FROM stdin;
\.


--
-- Data for Name: debts_users; Type: TABLE DATA; Schema: public; Owner: debtuser
--

COPY public.debts_users (debt_id, user_id) FROM stdin;
\.


--
-- Data for Name: pay_for; Type: TABLE DATA; Schema: public; Owner: debtuser
--

COPY public.pay_for (user_id, pay_id) FROM stdin;
\.


--
-- Data for Name: pays; Type: TABLE DATA; Schema: public; Owner: debtuser
--

COPY public.pays (id, debt_id, name, amount, pay_by, created_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: debtuser
--

COPY public.users (id, name, created_at) FROM stdin;
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
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debtuser
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: debts debts_pkey; Type: CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.debts
    ADD CONSTRAINT debts_pkey PRIMARY KEY (id);


--
-- Name: debts_users debts_users_pkey; Type: CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.debts_users
    ADD CONSTRAINT debts_users_pkey PRIMARY KEY (debt_id, user_id);


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
-- Name: debts_users debts_users_debts_fk; Type: FK CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.debts_users
    ADD CONSTRAINT debts_users_debts_fk FOREIGN KEY (debt_id) REFERENCES public.debts(id) ON DELETE CASCADE;


--
-- Name: debts_users debts_users_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.debts_users
    ADD CONSTRAINT debts_users_users_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: pay_for pay_for_pays_fk; Type: FK CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.pay_for
    ADD CONSTRAINT pay_for_pays_fk FOREIGN KEY (pay_id) REFERENCES public.pays(id) ON DELETE CASCADE;


--
-- Name: pay_for pay_for_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.pay_for
    ADD CONSTRAINT pay_for_user_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: pays pays_debt_fk; Type: FK CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.pays
    ADD CONSTRAINT pays_debt_fk FOREIGN KEY (debt_id) REFERENCES public.debts(id) ON DELETE CASCADE;


--
-- Name: pays pays_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: debtuser
--

ALTER TABLE ONLY public.pays
    ADD CONSTRAINT pays_users_fk FOREIGN KEY (pay_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

