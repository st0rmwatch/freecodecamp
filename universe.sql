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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    comment text,
    rating integer,
    tp integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    dia_in_km numeric(7,2),
    has_atmosphere boolean,
    rating integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_type integer,
    has_atmosphere boolean,
    rating integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: rating; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rating (
    rating_id integer NOT NULL,
    name character varying(10) NOT NULL,
    xt character varying(10)
);


ALTER TABLE public.rating OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    brightness integer,
    galaxy_id integer,
    rating integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Home to earth and other planets', 10, 5);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Another galaxy', 7, 4);
INSERT INTO public.galaxy VALUES (3, 'Phoebe', 'Far Far away...', 4, 3);
INSERT INTO public.galaxy VALUES (4, 'Filburt', 'Huh??', 5, 2);
INSERT INTO public.galaxy VALUES (5, 'PennyWise', 'OMG I do not want to go here', 1, 8);
INSERT INTO public.galaxy VALUES (6, 'WhoVille', 'Really Dr.? really?', 6, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 7000.00, false, 1, 7);
INSERT INTO public.moon VALUES (2, 'Moon1', 6543.00, false, 1, 4);
INSERT INTO public.moon VALUES (3, 'Moon2', 8234.00, false, 2, 5);
INSERT INTO public.moon VALUES (4, 'Moon3', 9023.00, true, 4, 1);
INSERT INTO public.moon VALUES (5, 'Moon4', 8933.00, false, 1, 2);
INSERT INTO public.moon VALUES (6, 'Moon5', 7000.00, false, 1, 7);
INSERT INTO public.moon VALUES (7, 'Moon6', 6543.00, false, 1, 4);
INSERT INTO public.moon VALUES (8, 'Moon7', 8234.00, false, 2, 5);
INSERT INTO public.moon VALUES (9, 'Moon8', 9023.00, true, 4, 1);
INSERT INTO public.moon VALUES (10, 'Moon9', 8933.00, false, 1, 2);
INSERT INTO public.moon VALUES (11, 'Moon10', 7000.00, false, 1, 7);
INSERT INTO public.moon VALUES (12, 'Moon11', 6543.00, false, 1, 4);
INSERT INTO public.moon VALUES (13, 'Moon12', 8234.00, false, 2, 5);
INSERT INTO public.moon VALUES (14, 'Moon13', 9023.00, true, 4, 1);
INSERT INTO public.moon VALUES (15, 'Moon14', 8933.00, false, 1, 2);
INSERT INTO public.moon VALUES (16, 'Moon15', 7000.00, false, 1, 7);
INSERT INTO public.moon VALUES (17, 'Moon16', 6543.00, false, 1, 4);
INSERT INTO public.moon VALUES (18, 'Moon17', 8234.00, false, 2, 5);
INSERT INTO public.moon VALUES (19, 'Moon18', 9023.00, true, 4, 1);
INSERT INTO public.moon VALUES (20, 'Moon19', 8933.00, false, 1, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Pluto', 0, false, 2, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 2, true, 5, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, 1, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 0, false, 1, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 2, false, 1, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 0, false, 1, 1);
INSERT INTO public.planet VALUES (7, 'Earth', 9, true, 9, 1);
INSERT INTO public.planet VALUES (8, 'Bob', 0, false, 2, 2);
INSERT INTO public.planet VALUES (9, 'Susan', 2, true, 5, 3);
INSERT INTO public.planet VALUES (10, 'Veldon', 1, false, 1, 6);
INSERT INTO public.planet VALUES (11, 'Sheldon', 0, false, 1, 4);
INSERT INTO public.planet VALUES (12, 'Praxis', 2, false, 1, 5);


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rating VALUES (1, 'Low', '4');
INSERT INTO public.rating VALUES (2, 'Medium', '2');
INSERT INTO public.rating VALUES (3, 'High', '6');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 90, 1, 4);
INSERT INTO public.star VALUES (2, 'Sirrus A', 50, 1, 4);
INSERT INTO public.star VALUES (3, 'Prycyon', 75, 1, 4);
INSERT INTO public.star VALUES (4, 'Blahzay', 90, 1, 4);
INSERT INTO public.star VALUES (5, 'X1-r4', 50, 1, 4);
INSERT INTO public.star VALUES (6, 'Lyco 3', 175, 1, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: rating rating_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_name_key UNIQUE (name);


--
-- Name: rating rating_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (rating_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

