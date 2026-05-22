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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    asteroid_spectral_type text,
    year_discovered integer,
    discovered_by text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    name_origin text,
    constellation text NOT NULL,
    type text NOT NULL,
    magnitude_m numeric(5,2)
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
    roman_num_designation text,
    year_discovered integer,
    discovered_by text,
    is_spherical boolean,
    planet_id integer NOT NULL
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
    planet_type text,
    moon_number integer,
    has_rings boolean,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    star_type text,
    spectral_type text,
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '1 Ceres', 'G', 1801, 'Giuseppe Piazzi');
INSERT INTO public.asteroid VALUES (2, '4 Vesta', 'V', 1807, 'Heinrich Wilhelm Matthias Olbers');
INSERT INTO public.asteroid VALUES (3, '2 Pallas', 'B', 1802, 'Heinrich Wilhelm Matthias Olbers');
INSERT INTO public.asteroid VALUES (4, '10 Hygiea', 'C', 1849, 'Annibale de Gasparis');
INSERT INTO public.asteroid VALUES (5, '704 Interamnia', 'F', 1910, 'Vincenzo Cerulli');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'The galaxy gets its name from the area of the sky in which it appears, the constellation of Andromeda', 'Andromeda', 'Barred Spiral', 3.44);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The appearance from Earth of the galaxy—a band of light', 'Sagittarius', 'Barred Spiral', NULL);
INSERT INTO public.galaxy VALUES (2, 'Alcyoneus', 'The galaxy was named after the giant Alcyoneus from Greek mythology', 'Lynx', 'Radio', NULL);
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation', 'Centaurus', 'Unbarred Spiral', 12.60);
INSERT INTO public.galaxy VALUES (5, 'Bear Paw Galaxy', 'It resembles the appearance of a bear claw', 'Lynx', 'Dwarf', 12.30);
INSERT INTO public.galaxy VALUES (6, 'Fried Egg Galaxy', 'Due to its similar appearance to a fried egg', 'Pegasus', 'Unbarred Spiral', NULL);
INSERT INTO public.galaxy VALUES (7, 'Godzilla', 'Its extremely large size', 'Perseus', 'Barred Spiral', NULL);
INSERT INTO public.galaxy VALUES (8, 'Grasshopper', 'Named after its appearance to a grasshopper', 'Lynx', 'Interacting', NULL);
INSERT INTO public.galaxy VALUES (9, 'Eye of Sauron', 'Due to its resemblance to the Eye of Sauron from The Lord of the Rings', 'Canes Venatici', 'Immediate Spiral', 11.50);
INSERT INTO public.galaxy VALUES (10, 'Small Magellanic Cloud', 'Named after Ferdinand Magellan', 'Tucana', 'Dwarf', 2.70);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth I', NULL, NULL, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars I', 1877, 'Asaph Hall III', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars II', 1877, 'Asaph Hall III', false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter I', 1610, 'Galileo Galilei', true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter II', 1610, 'Galileo Galilei', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Jupiter III', 1610, 'Galileo Galilei', true, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Jupiter V', 1892, 'Edward Emerson Barnard', false, 5);
INSERT INTO public.moon VALUES (9, 'Mimas', 'Saturn I', 1789, 'Frederick William Herschel', true, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Saturn II', 1789, 'Frederick William Herschel', true, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Saturn V', 1673, 'Giovanni Domenico Cassini', true, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Saturn III', 1684, 'Giovanni Domenico Cassini', true, 6);
INSERT INTO public.moon VALUES (14, 'Titan', 'Saturn VI', 1656, 'Christiaan Huygens', true, 6);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter IV', 1610, 'Galileo Galilei', true, 5);
INSERT INTO public.moon VALUES (12, 'Dione', 'Saturn IV', 1684, 'Giovanni Domenico Cassini', true, 6);
INSERT INTO public.moon VALUES (15, 'Ariel', 'Uranus I', 1851, 'William Lassell', true, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'Uranus II', 1851, 'William Lassell', true, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 'Uranus III', 1787, 'Frederick William Herschel', true, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 'Uranus IV', 1787, 'Frederick William Herschel', true, 7);
INSERT INTO public.moon VALUES (19, 'Miranda', 'Uranus V', 1949, 'Gerard Peter Kuiper', true, 7);
INSERT INTO public.moon VALUES (20, 'Cordelia', 'Uranus VI', 1986, 'Richard John Terrile', false, 7);
INSERT INTO public.moon VALUES (21, 'Triton', 'Neptune I', 1846, 'William Lassell', true, 8);
INSERT INTO public.moon VALUES (22, 'Nereid', 'Neptune II', 1949, 'Gerard Peter Kuiper', false, 8);
INSERT INTO public.moon VALUES (23, 'Naiad', 'Neptune III', 1989, 'Richard John Terrile', false, 8);
INSERT INTO public.moon VALUES (24, 'Thalassa', 'Neptune IV', 1989, 'Richard John Terrile', false, 8);
INSERT INTO public.moon VALUES (26, 'Despina', 'Neptune V', 1989, 'Stephen P. Synnott', false, 8);
INSERT INTO public.moon VALUES (27, 'Charon', 'Pluto I', 1978, 'James Walter Christy', true, 9);
INSERT INTO public.moon VALUES (30, 'Dysnomia', 'Eris I', 2005, 'Brown, Rabinowitz, Trujillo', true, 13);
INSERT INTO public.moon VALUES (28, 'Hiʻiaka', 'Haumea I', 2005, 'Brown', true, 11);
INSERT INTO public.moon VALUES (29, 'S/2015 (136472) 1', 'NULL', 2016, 'Parker', true, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial Planet', 0, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial Planet', 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial Planet', 1, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial Planet', 2, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 115, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 292, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 29, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 16, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf Planet', 5, false, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 'Dwarf Planet', 0, false, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Dwarf Planet', 2, true, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 'Dwarf Planet', 1, NULL, 1);
INSERT INTO public.planet VALUES (13, 'Eris', 'Dwarf Planet', 1, NULL, 1);
INSERT INTO public.planet VALUES (14, 'Alpha Centauri Ab', 'Gas Giant', NULL, NULL, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Yellow Star', 'G2V', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'Yellow Star', 'G2V', 1);
INSERT INTO public.star VALUES (3, 'Wolf 359', 'Red Dwarf', 'M6.5 Ve', 1);
INSERT INTO public.star VALUES (4, 'Sirius A', 'White-Blue Star', 'A0mA1 Va', 1);
INSERT INTO public.star VALUES (5, 'Epsilon Eridani', 'Orange Star', 'K2 V', 1);
INSERT INTO public.star VALUES (6, 'Procyon A', 'Subgiant', 'F5IV', 1);
INSERT INTO public.star VALUES (7, 'Alpheratz', NULL, 'B9p', 3);
INSERT INTO public.star VALUES (8, 'Mirach', 'Red Giant', 'M0 III', 3);
INSERT INTO public.star VALUES (9, 'HD 2421', NULL, 'A2Vs', 3);
INSERT INTO public.star VALUES (10, 'GO And', 'Variable Star', 'A3VpSiSrCrEuKsn', 3);
INSERT INTO public.star VALUES (11, 'HV 2112', 'Variable Star', 'M5.5 II', 10);
INSERT INTO public.star VALUES (12, 'HV 11417', NULL, 'M5Ie', 10);
INSERT INTO public.star VALUES (13, 'HD 5980', 'Luminous Blue Variable', 'LBV', 10);
INSERT INTO public.star VALUES (14, 'HV 11423', 'Red Supergiant', 'M0 Iab', 10);
INSERT INTO public.star VALUES (15, 'AT 2017be', NULL, NULL, 5);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

