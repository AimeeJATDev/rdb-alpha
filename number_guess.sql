--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: score_board; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.score_board (
    id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.score_board OWNER TO freecodecamp;

--
-- Name: score_board_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.score_board_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.score_board_id_seq OWNER TO freecodecamp;

--
-- Name: score_board_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.score_board_id_seq OWNED BY public.score_board.id;


--
-- Name: score_board id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.score_board ALTER COLUMN id SET DEFAULT nextval('public.score_board_id_seq'::regclass);


--
-- Data for Name: score_board; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.score_board VALUES (81, 'user_1792518068507', 2, 9);
INSERT INTO public.score_board VALUES (80, 'user_1792518068508', 5, 9);
INSERT INTO public.score_board VALUES (83, 'user_1792518620387', 2, 9);
INSERT INTO public.score_board VALUES (82, 'user_1792518620388', 5, 9);
INSERT INTO public.score_board VALUES (79, 'Aimee', 21, 9);


--
-- Name: score_board_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.score_board_id_seq', 83, true);


--
-- Name: score_board score_board_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.score_board
    ADD CONSTRAINT score_board_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

