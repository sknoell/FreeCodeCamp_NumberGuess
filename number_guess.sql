--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    player_id integer NOT NULL,
    guesses integer NOT NULL
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
    username character varying(22),
    games_played integer,
    best_game integer
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

INSERT INTO public.games VALUES (49, 37, 46);
INSERT INTO public.games VALUES (50, 37, 260);
INSERT INTO public.games VALUES (51, 38, 512);
INSERT INTO public.games VALUES (52, 38, 840);
INSERT INTO public.games VALUES (53, 37, 541);
INSERT INTO public.games VALUES (54, 37, 919);
INSERT INTO public.games VALUES (55, 37, 429);
INSERT INTO public.games VALUES (56, 39, 11);
INSERT INTO public.games VALUES (57, 40, 488);
INSERT INTO public.games VALUES (58, 40, 625);
INSERT INTO public.games VALUES (59, 41, 520);
INSERT INTO public.games VALUES (60, 41, 762);
INSERT INTO public.games VALUES (61, 40, 283);
INSERT INTO public.games VALUES (62, 40, 496);
INSERT INTO public.games VALUES (63, 40, 559);
INSERT INTO public.games VALUES (64, 42, 815);
INSERT INTO public.games VALUES (65, 42, 460);
INSERT INTO public.games VALUES (66, 43, 120);
INSERT INTO public.games VALUES (67, 43, 113);
INSERT INTO public.games VALUES (68, 42, 517);
INSERT INTO public.games VALUES (69, 42, 868);
INSERT INTO public.games VALUES (70, 42, 239);
INSERT INTO public.games VALUES (71, 39, 10);
INSERT INTO public.games VALUES (72, 44, 528);
INSERT INTO public.games VALUES (73, 44, 199);
INSERT INTO public.games VALUES (74, 45, 958);
INSERT INTO public.games VALUES (75, 45, 630);
INSERT INTO public.games VALUES (76, 44, 804);
INSERT INTO public.games VALUES (77, 44, 942);
INSERT INTO public.games VALUES (78, 44, 864);
INSERT INTO public.games VALUES (79, 46, 571);
INSERT INTO public.games VALUES (80, 46, 189);
INSERT INTO public.games VALUES (81, 47, 139);
INSERT INTO public.games VALUES (82, 47, 344);
INSERT INTO public.games VALUES (83, 46, 672);
INSERT INTO public.games VALUES (84, 46, 172);
INSERT INTO public.games VALUES (85, 46, 775);
INSERT INTO public.games VALUES (86, 48, 460);
INSERT INTO public.games VALUES (87, 48, 315);
INSERT INTO public.games VALUES (88, 49, 662);
INSERT INTO public.games VALUES (89, 49, 964);
INSERT INTO public.games VALUES (90, 48, 626);
INSERT INTO public.games VALUES (91, 48, 806);
INSERT INTO public.games VALUES (92, 48, 735);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (38, 'user_1702069500024', 2, 512);
INSERT INTO public.players VALUES (47, 'user_1702069793411', 2, 139);
INSERT INTO public.players VALUES (37, 'user_1702069500025', 5, 46);
INSERT INTO public.players VALUES (46, 'user_1702069793412', 5, 172);
INSERT INTO public.players VALUES (41, 'user_1702069595524', 2, 520);
INSERT INTO public.players VALUES (49, 'user_1702069966938', 2, 662);
INSERT INTO public.players VALUES (40, 'user_1702069595525', 5, 283);
INSERT INTO public.players VALUES (48, 'user_1702069966939', 5, 315);
INSERT INTO public.players VALUES (43, 'user_1702069639076', 2, 113);
INSERT INTO public.players VALUES (42, 'user_1702069639077', 5, 239);
INSERT INTO public.players VALUES (39, 'max', 2, 10);
INSERT INTO public.players VALUES (45, 'user_1702069705049', 2, 630);
INSERT INTO public.players VALUES (44, 'user_1702069705050', 5, 199);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 92, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 49, true);


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
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--


