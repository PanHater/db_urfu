--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-11-17 00:51:10 +05

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
-- TOC entry 215 (class 1259 OID 16548)
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    stor_id character(4) NOT NULL,
    ord_num character varying(20) NOT NULL,
    ord_date timestamp without time zone NOT NULL,
    qty smallint NOT NULL,
    payterms character varying(12),
    title_id character varying(6) NOT NULL
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16551)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    title_id character varying(6) NOT NULL,
    title character varying(80) NOT NULL,
    type character(12) DEFAULT 'UNDECIDED'::bpchar NOT NULL,
    pub_id character(4),
    price money,
    advance money,
    royalty integer,
    ytd_sales integer,
    notes character varying(200),
    pubdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 3261 (class 2606 OID 16593)
-- Name: titles titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (title_id);


-- Completed on 2024-11-17 00:51:10 +05

--
-- PostgreSQL database dump complete
--

