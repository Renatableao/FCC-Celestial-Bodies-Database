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
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    constellation text NOT NULL,
    distance_from_earth_mm_ly numeric,
    diameter_in_kpc numeric
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    year_of_discovery integer,
    mass_in_solarmass numeric,
    orbital_period_days numeric(6,3),
    diameter_km integer
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    planet_type text,
    mass_in_solarmass numeric,
    orbital_period_years numeric(6,1),
    moons integer NOT NULL,
    rings boolean DEFAULT false NOT NULL
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
-- Name: satallite_galaxies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satallite_galaxies (
    satallite_galaxies_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    year_of_discovery integer NOT NULL,
    absolute_magnitude numeric(4,1)
);


ALTER TABLE public.satallite_galaxies OWNER TO freecodecamp;

--
-- Name: satallite_galaxies_satallite_galaxies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satallite_galaxies_satallite_galaxies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satallite_galaxies_satallite_galaxies_id_seq OWNER TO freecodecamp;

--
-- Name: satallite_galaxies_satallite_galaxies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satallite_galaxies_satallite_galaxies_id_seq OWNED BY public.satallite_galaxies.satallite_galaxies_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    apparent_magnitude numeric,
    mass_in_solarmass numeric,
    temperature_in_kelvin integer
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
-- Name: satallite_galaxies satallite_galaxies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satallite_galaxies ALTER COLUMN satallite_galaxies_id SET DEFAULT nextval('public.satallite_galaxies_satallite_galaxies_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'barred spiral', 'Andromeda', 2.45, 46.56);
INSERT INTO public.galaxy VALUES (2, 'Cartwheel', 'spiral', 'Sculptor', 500, 44.23);
INSERT INTO public.galaxy VALUES (3, 'Condor', 'barred spiral', 'Pavo', 212, 160);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'spiral', 'Sagittarius', 0, 30);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'spiral', 'Triangulum', 3.2, 18.74);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'spiral', 'Canes Venatici', 31, 23.30);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, 0.0123, 27.322, 3476);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1877, 5.36, 0.318, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1877, 7.42, 1.263, 12);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1610, 0.0150, 1.769, 3630);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1610, 0.00804, 3.551, 3138);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1610, 0.0248, 7.155, 5262);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1610, 0.0180, 16.689, 4800);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 1789, 0.00000628, 0.942, 394);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 1789, 0.0000181, 1.370, 502);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 1684, 0.000103, 1.888, 1048);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1684, 0.000183, 2.737, 1120);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1672, 0.000386, 4.518, 1530);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 1655, 0.0225, 15.945, 5150);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1671, 0.000302, 79.322, 1435);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 1948, 0.0000110, 1.414, 471);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 1851, 0.000226, 2.520, 1160);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1851, 0.00020, 4.144, 1190);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 1787, 0.00059, 8.706, 1610);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 1787, 0.000505, 13.460, 1150);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 1846, 0.00358, 5.877, 2720);
INSERT INTO public.moon VALUES (21, 'Charon', 10, 1978, 0.000255, 6.387, 1200);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4, 'terrestrial', 0.06, 0.2, 0, false);
INSERT INTO public.planet VALUES (2, 'Venus', 4, 'terrestrial', 0.81, 0.6, 0, false);
INSERT INTO public.planet VALUES (3, 'Earth', 4, 'terrestrial', 1.00, 1.0, 1, false);
INSERT INTO public.planet VALUES (4, 'Mars', 4, 'terrestrial', 0.11, 1.9, 2, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4, 'gas giant', 317.83, 11.9, 80, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 4, 'gas giant', 95.16, 29.5, 83, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 4, 'ice giant', 14.54, 84.0, 27, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 4, 'ice giant', 17.15, 164.8, 14, true);
INSERT INTO public.planet VALUES (9, 'Ceres', 4, 'dwarf', 0.00016, 4.6, 0, false);
INSERT INTO public.planet VALUES (10, 'Pluto', 4, 'dwarf', 0.0022, 247.9, 5, false);
INSERT INTO public.planet VALUES (11, 'Haumea', 4, 'dwarf', 0.0007, 283.8, 2, true);
INSERT INTO public.planet VALUES (12, 'Makemake', 4, 'dwarf', 0.0005, 306.2, 1, false);


--
-- Data for Name: satallite_galaxies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satallite_galaxies VALUES (1, 'Antlia 2', 4, 2018, -8.5);
INSERT INTO public.satallite_galaxies VALUES (2, 'Sagittarius Dwarf', 4, 1994, -13.5);
INSERT INTO public.satallite_galaxies VALUES (3, 'Crater II', 4, 2016, -8.2);
INSERT INTO public.satallite_galaxies VALUES (4, 'Canes Venatici I', 4, 2006, -8.6);
INSERT INTO public.satallite_galaxies VALUES (5, 'Canis Major Dwarf', 4, 2003, NULL);
INSERT INTO public.satallite_galaxies VALUES (6, 'Boötes III', 4, 2009, -5.8);
INSERT INTO public.satallite_galaxies VALUES (7, 'Ursa Minor Dwarf', 4, 1954, -8.8);
INSERT INTO public.satallite_galaxies VALUES (8, 'Leo IV', 4, 2006, -5.8);
INSERT INTO public.satallite_galaxies VALUES (9, 'Cetus III', 4, 2017, -2.4);
INSERT INTO public.satallite_galaxies VALUES (10, 'M32', 1, 1749, NULL);
INSERT INTO public.satallite_galaxies VALUES (11, 'M110', 1, 1773, -16.5);
INSERT INTO public.satallite_galaxies VALUES (12, 'Andromeda I', 1, 1970, -11.8);
INSERT INTO public.satallite_galaxies VALUES (13, 'Pegasus Dwarf Spheroidal', 1, 1998, -11.5);
INSERT INTO public.satallite_galaxies VALUES (14, 'Andromeda XXXI', 1, 2013, NULL);
INSERT INTO public.satallite_galaxies VALUES (15, 'Pegasus V galaxy', 1, 2022, -6.3);
INSERT INTO public.satallite_galaxies VALUES (16, 'Triangulum I', 5, 2009, NULL);
INSERT INTO public.satallite_galaxies VALUES (17, 'Pisces Dwarf', 5, 1976, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 1, 2.07, 3.8, 13000);
INSERT INTO public.star VALUES (2, 'R Sculptoris', 2, 5.77, 1.3, 3306);
INSERT INTO public.star VALUES (3, 'Alpha Pavonis', 3, 1.94, 5.91, 17711);
INSERT INTO public.star VALUES (4, 'Sun', 4, -26.74, 1, 5778);
INSERT INTO public.star VALUES (5, 'Beta Trianguli', 5, 3.00, 2.5, 8020);
INSERT INTO public.star VALUES (6, 'Tuiren', 6, 12.26, 1.02, 5580);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satallite_galaxies_satallite_galaxies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satallite_galaxies_satallite_galaxies_id_seq', 17, true);


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
-- Name: satallite_galaxies satallite_galaxies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satallite_galaxies
    ADD CONSTRAINT satallite_galaxies_name_key UNIQUE (name);


--
-- Name: satallite_galaxies satallite_galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satallite_galaxies
    ADD CONSTRAINT satallite_galaxies_pkey PRIMARY KEY (satallite_galaxies_id);


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
-- Name: satallite_galaxies satallite_galaxies_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satallite_galaxies
    ADD CONSTRAINT satallite_galaxies_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

