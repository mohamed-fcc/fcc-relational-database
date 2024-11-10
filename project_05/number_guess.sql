--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_to_guess integer NOT NULL,
    guesses_number integer,
    player_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (29, 686, NULL, 10);
INSERT INTO public.games VALUES (30, 632, NULL, 10);
INSERT INTO public.games VALUES (31, 280, NULL, 11);
INSERT INTO public.games VALUES (32, 411, NULL, 11);
INSERT INTO public.games VALUES (33, 103, NULL, 10);
INSERT INTO public.games VALUES (34, 67, NULL, 10);
INSERT INTO public.games VALUES (35, 581, NULL, 10);
INSERT INTO public.games VALUES (36, 716, NULL, 12);
INSERT INTO public.games VALUES (37, 73, NULL, 13);
INSERT INTO public.games VALUES (38, 498, NULL, 13);
INSERT INTO public.games VALUES (39, 148, NULL, 14);
INSERT INTO public.games VALUES (40, 373, NULL, 14);
INSERT INTO public.games VALUES (41, 992, NULL, 13);
INSERT INTO public.games VALUES (42, 693, NULL, 13);
INSERT INTO public.games VALUES (43, 210, NULL, 13);
INSERT INTO public.games VALUES (44, 844, NULL, 1);
INSERT INTO public.games VALUES (45, 351, NULL, 15);
INSERT INTO public.games VALUES (46, 378, NULL, 15);
INSERT INTO public.games VALUES (47, 464, NULL, 16);
INSERT INTO public.games VALUES (48, 289, NULL, 16);
INSERT INTO public.games VALUES (49, 529, NULL, 15);
INSERT INTO public.games VALUES (50, 754, NULL, 15);
INSERT INTO public.games VALUES (51, 790, NULL, 15);
INSERT INTO public.games VALUES (52, 854, NULL, 1);
INSERT INTO public.games VALUES (53, 561, 562, 17);
INSERT INTO public.games VALUES (54, 231, 232, 17);
INSERT INTO public.games VALUES (55, 228, 229, 18);
INSERT INTO public.games VALUES (56, 492, 493, 18);
INSERT INTO public.games VALUES (57, 147, 150, 17);
INSERT INTO public.games VALUES (58, 681, 683, 17);
INSERT INTO public.games VALUES (59, 850, 851, 17);
INSERT INTO public.games VALUES (60, 494, 9, 1);
INSERT INTO public.games VALUES (61, 745, NULL, 1);
INSERT INTO public.games VALUES (62, 368, 9, 1);
INSERT INTO public.games VALUES (63, 223, 4, 1);
INSERT INTO public.games VALUES (64, 182, NULL, 1);
INSERT INTO public.games VALUES (65, 903, 904, 19);
INSERT INTO public.games VALUES (66, 226, 227, 19);
INSERT INTO public.games VALUES (67, 391, 392, 20);
INSERT INTO public.games VALUES (68, 945, 946, 20);
INSERT INTO public.games VALUES (69, 36, 39, 19);
INSERT INTO public.games VALUES (70, 761, 763, 19);
INSERT INTO public.games VALUES (71, 742, 743, 19);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'zouh');
INSERT INTO public.players VALUES (2, 'zo');
INSERT INTO public.players VALUES (4, 'aa');
INSERT INTO public.players VALUES (5, 'zzzz');
INSERT INTO public.players VALUES (6, 'user_1731270075397');
INSERT INTO public.players VALUES (7, 'user_1731270075396');
INSERT INTO public.players VALUES (8, 'user_1731270139154');
INSERT INTO public.players VALUES (9, 'user_1731270139153');
INSERT INTO public.players VALUES (10, 'user_1731270182454');
INSERT INTO public.players VALUES (11, 'user_1731270182453');
INSERT INTO public.players VALUES (12, 'zzzzz');
INSERT INTO public.players VALUES (13, 'user_1731270227822');
INSERT INTO public.players VALUES (14, 'user_1731270227821');
INSERT INTO public.players VALUES (15, 'user_1731270334281');
INSERT INTO public.players VALUES (16, 'user_1731270334280');
INSERT INTO public.players VALUES (17, 'user_1731270446559');
INSERT INTO public.players VALUES (18, 'user_1731270446558');
INSERT INTO public.players VALUES (19, 'user_1731270952107');
INSERT INTO public.players VALUES (20, 'user_1731270952106');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 71, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 20, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--

