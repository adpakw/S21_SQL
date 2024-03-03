--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Ubuntu 16.2-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.2 (Ubuntu 16.2-1.pgdg22.04+1)

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
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id bigint NOT NULL,
    pizzeria_id bigint NOT NULL,
    pizza_name character varying NOT NULL,
    price numeric DEFAULT 1 NOT NULL
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id bigint NOT NULL,
    name character varying NOT NULL,
    age integer DEFAULT 10 NOT NULL,
    gender character varying DEFAULT 'female'::character varying NOT NULL,
    address character varying,
    CONSTRAINT ch_gender CHECK (((gender)::text = ANY ((ARRAY['female'::character varying, 'male'::character varying])::text[])))
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: person_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person_order (
    id bigint NOT NULL,
    person_id bigint NOT NULL,
    menu_id bigint NOT NULL,
    order_date date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.person_order OWNER TO postgres;

--
-- Name: person_visits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person_visits (
    id bigint NOT NULL,
    person_id bigint NOT NULL,
    pizzeria_id bigint NOT NULL,
    visit_date date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.person_visits OWNER TO postgres;

--
-- Name: pizzeria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizzeria (
    id bigint NOT NULL,
    name character varying NOT NULL,
    rating numeric DEFAULT 0 NOT NULL,
    CONSTRAINT ch_rating CHECK (((rating >= (0)::numeric) AND (rating <= (5)::numeric)))
);


ALTER TABLE public.pizzeria OWNER TO postgres;

--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id, pizzeria_id, pizza_name, price) FROM stdin;
1	1	cheese pizza	900
2	1	pepperoni pizza	1200
3	1	sausage pizza	1200
4	1	supreme pizza	1200
5	6	cheese pizza	950
6	6	pepperoni pizza	800
7	6	sausage pizza	1000
8	2	cheese pizza	800
9	2	mushroom pizza	1100
10	3	cheese pizza	780
11	3	supreme pizza	850
12	4	cheese pizza	700
13	4	mushroom pizza	950
14	4	pepperoni pizza	1000
15	4	sausage pizza	950
16	5	cheese pizza	700
17	5	pepperoni pizza	800
18	5	supreme pizza	850
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, name, age, gender, address) FROM stdin;
1	Anna	16	female	Moscow
2	Andrey	21	male	Moscow
3	Kate	33	female	Kazan
4	Denis	13	male	Kazan
5	Elvira	45	female	Kazan
6	Irina	21	female	Saint-Petersburg
7	Peter	24	male	Saint-Petersburg
8	Nataly	30	female	Novosibirsk
9	Dmitriy	18	male	Samara
\.


--
-- Data for Name: person_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person_order (id, person_id, menu_id, order_date) FROM stdin;
1	1	1	2022-01-01
2	1	2	2022-01-01
3	2	8	2022-01-01
4	2	9	2022-01-01
5	3	16	2022-01-04
6	4	16	2022-01-07
7	4	17	2022-01-07
8	4	18	2022-01-07
9	4	6	2022-01-08
10	4	7	2022-01-08
11	5	6	2022-01-09
12	5	7	2022-01-09
13	6	13	2022-01-01
14	7	3	2022-01-03
15	7	9	2022-01-05
16	7	4	2022-01-05
17	8	8	2022-01-06
18	8	14	2022-01-07
19	9	18	2022-01-09
20	9	6	2022-01-10
\.


--
-- Data for Name: person_visits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person_visits (id, person_id, pizzeria_id, visit_date) FROM stdin;
1	1	1	2022-01-01
2	2	2	2022-01-01
3	2	1	2022-01-02
4	3	5	2022-01-03
5	3	6	2022-01-04
6	4	5	2022-01-07
7	4	6	2022-01-08
8	5	2	2022-01-08
9	5	6	2022-01-09
10	6	2	2022-01-09
11	6	4	2022-01-01
12	7	1	2022-01-03
13	7	2	2022-01-05
14	8	1	2022-01-05
15	8	2	2022-01-06
16	8	4	2022-01-07
17	9	4	2022-01-08
18	9	5	2022-01-09
19	9	6	2022-01-10
\.


--
-- Data for Name: pizzeria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizzeria (id, name, rating) FROM stdin;
1	Pizza Hut	4.6
2	Dominos	4.3
3	DoDo Pizza	3.2
4	Papa Johns	4.9
5	Best Pizza	2.3
6	DinoPizza	4.2
\.


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- Name: person_order person_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_order
    ADD CONSTRAINT person_order_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: person_visits person_visits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_visits
    ADD CONSTRAINT person_visits_pkey PRIMARY KEY (id);


--
-- Name: pizzeria pizzeria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzeria
    ADD CONSTRAINT pizzeria_pkey PRIMARY KEY (id);


--
-- Name: person_visits uk_person_visits; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_visits
    ADD CONSTRAINT uk_person_visits UNIQUE (person_id, pizzeria_id, visit_date);


--
-- Name: menu fk_menu_pizzeria_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT fk_menu_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(id);


--
-- Name: person_order fk_order_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_order
    ADD CONSTRAINT fk_order_menu_id FOREIGN KEY (menu_id) REFERENCES public.menu(id);


--
-- Name: person_order fk_order_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_order
    ADD CONSTRAINT fk_order_person_id FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: person_visits fk_person_visits_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_visits
    ADD CONSTRAINT fk_person_visits_person_id FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: person_visits fk_person_visits_pizzeria_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_visits
    ADD CONSTRAINT fk_person_visits_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(id);


--
-- PostgreSQL database dump complete
--

