-- Database: udb_pigireychik

-- DROP DATABASE IF EXISTS udb_pigireychik;

CREATE DATABASE udb_pigireychik_AT-16
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C.UTF-8'
    LC_CTYPE = 'C.UTF-8'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

\c udb_pigireychik;

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


CREATE TABLE public.sales (
    stor_id character(4) NOT NULL,
    ord_num character varying(20) NOT NULL,
    ord_date timestamp without time zone NOT NULL,
    qty smallint NOT NULL,
    payterms character varying(12),
    title_id character varying(6) NOT NULL
);


ALTER TABLE public.sales OWNER TO postgres;


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


COPY public.sales (stor_id, ord_num, ord_date, qty, payterms, title_id) FROM stdin;



COPY public.titles (title_id, title, type, pub_id, price, advance, royalty, ytd_sales, notes, pubdate) FROM stdin;



ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (stor_id, ord_num, title_id);


ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (title_id);


ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_title_id_fkey FOREIGN KEY (title_id) REFERENCES public.titles(title_id);
