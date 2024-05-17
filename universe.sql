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
    name character varying(50) NOT NULL,
    distance_in_light_years integer,
    diameter_in_light_years integer,
    age_in_billion_years numeric(4,2),
    is_visible boolean,
    is_spiral boolean,
    galaxy_description text
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
-- Name: gravity; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.gravity (
    gravity_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_gravity_high boolean
);


ALTER TABLE public.gravity OWNER TO freecodecamp;

--
-- Name: gravity_gravity_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.gravity_gravity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gravity_gravity_id_seq OWNER TO freecodecamp;

--
-- Name: gravity_gravity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.gravity_gravity_id_seq OWNED BY public.gravity.gravity_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    radius numeric(4,2) NOT NULL,
    age integer,
    distance_from_planet_ly integer,
    is_visible boolean,
    is_alive boolean,
    planet_id integer,
    moon_description text
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
    name character varying(50) NOT NULL,
    age_in_billions integer,
    radius numeric(4,2),
    has_rings boolean,
    no_of_moons integer,
    star_id integer NOT NULL,
    oxygen boolean,
    planet_description text
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    radius numeric(5,3) NOT NULL,
    color character varying(20),
    is_alive boolean,
    age integer,
    visible_from_earth boolean,
    galaxy_id integer NOT NULL,
    distance_from_earth_in_ly integer,
    star_description text
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
-- Name: gravity gravity_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gravity ALTER COLUMN gravity_id SET DEFAULT nextval('public.gravity_gravity_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 100000, 13.60, true, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 200000, 200000, 10.10, false, false, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 300000, 200000, 5.70, true, false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 400000, 400000, 12.50, false, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Messier 82', 500000, 500000, 11.40, true, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 600000, 600000, 9.20, false, true, NULL);


--
-- Data for Name: gravity; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.gravity VALUES (1, 'abc', NULL);
INSERT INTO public.gravity VALUES (2, 'def', NULL);
INSERT INTO public.gravity VALUES (3, 'ghi', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1.74, 450000, 0, true, true, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Europa', 1.56, 550000, 0, true, false, 2, NULL);
INSERT INTO public.moon VALUES (3, 'Ganymede', 2.63, 450000, 0, false, false, 2, NULL);
INSERT INTO public.moon VALUES (4, 'Callisto', 2.41, 450000, 0, true, false, 2, NULL);
INSERT INTO public.moon VALUES (5, 'Phobos', 0.01, 450000, 0, false, true, 3, NULL);
INSERT INTO public.moon VALUES (6, 'Deimos', 0.01, 450000, 0, true, true, 3, NULL);
INSERT INTO public.moon VALUES (7, 'Titan', 2.57, 450000, 0, true, true, 2, NULL);
INSERT INTO public.moon VALUES (8, 'Rhea', 1.53, 450000, 0, false, false, 2, NULL);
INSERT INTO public.moon VALUES (9, 'Iapetus', 1.47, 450000, 0, true, true, 2, NULL);
INSERT INTO public.moon VALUES (10, 'Dione', 1.12, 450000, 0, false, true, 2, NULL);
INSERT INTO public.moon VALUES (11, 'Sirius A Moon', 0.50, 250000, 1, true, true, 5, NULL);
INSERT INTO public.moon VALUES (12, 'Proxima b Moon', 0.40, 790000, 1, false, true, 6, NULL);
INSERT INTO public.moon VALUES (13, 'Alpha Centauri Bb Moon', 0.30, 600000, 1, true, false, 7, NULL);
INSERT INTO public.moon VALUES (14, 'Alpha Centauri Cc Moon', 0.25, 600000, 1, true, true, 8, NULL);
INSERT INTO public.moon VALUES (15, 'Aldebaran b Moon', 0.20, 800000, 1, true, true, 9, NULL);
INSERT INTO public.moon VALUES (16, 'Aldebaran c Moon', 0.15, 800000, 1, true, false, 10, NULL);
INSERT INTO public.moon VALUES (17, 'Vega b Moon', 0.10, 100000, 1, false, true, 11, NULL);
INSERT INTO public.moon VALUES (18, 'Vega c Moon', 0.05, 100000, 1, true, false, 12, NULL);
INSERT INTO public.moon VALUES (19, 'Titania', 0.79, 450000, 0, true, false, 2, NULL);
INSERT INTO public.moon VALUES (20, 'Oberon', 0.76, 4500000, 0, true, true, 2, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4, 6.37, false, 1, 1, true, NULL);
INSERT INTO public.planet VALUES (2, 'Jupiter', 4, 69.91, true, 79, 1, false, NULL);
INSERT INTO public.planet VALUES (3, 'Mars', 4, 3.39, false, 2, 1, false, NULL);
INSERT INTO public.planet VALUES (4, 'Venus', 4, 6.05, false, 0, 1, false, NULL);
INSERT INTO public.planet VALUES (5, 'Sirius b', 0, 0.01, false, 0, 2, false, NULL);
INSERT INTO public.planet VALUES (6, 'Proxima b', 4, 1.07, false, 0, 4, true, NULL);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri Bb', 6, 1.12, false, 0, 3, true, NULL);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Cc', 6, 0.51, false, 0, 3, false, NULL);
INSERT INTO public.planet VALUES (9, 'Aldebaran b', 0, 0.38, true, 0, 5, false, NULL);
INSERT INTO public.planet VALUES (10, 'Aldebaran c', 0, 0.45, true, 0, 5, false, NULL);
INSERT INTO public.planet VALUES (11, 'Vega b', 0, 1.20, false, 0, 6, false, NULL);
INSERT INTO public.planet VALUES (12, 'Vega c', 0, 0.85, false, 0, 6, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.098, 'Yellow', true, 5, true, 1, 0, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 1.711, 'White', true, 0, true, 2, 86, NULL);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1.227, 'Yellow', true, 6, true, 3, 437, NULL);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 0.141, 'Red', true, 6, true, 4, 424, NULL);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 8.870, 'Red', true, 0, true, 5, 643, NULL);
INSERT INTO public.star VALUES (6, 'Rigel', 7.890, 'Blue', true, 0, true, 6, 860, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: gravity_gravity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.gravity_gravity_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: gravity gravity_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gravity
    ADD CONSTRAINT gravity_name_key UNIQUE (name);


--
-- Name: gravity gravity_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gravity
    ADD CONSTRAINT gravity_pkey PRIMARY KEY (gravity_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

