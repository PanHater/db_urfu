CREATE DATABASE udb_Pigireychik;

CREATE TABLE public.example
(
    id serial,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.example
    OWNER to postgres;