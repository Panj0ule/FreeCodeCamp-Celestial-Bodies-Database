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
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    mass numeric,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    galaxy_type text,
    number_of_star integer,
    number_of_planet integer,
    has_life boolean,
    has_blackhole boolean
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
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    mass numeric,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    temperature integer,
    has_life boolean,
    is_spherical boolean
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    object_id integer,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    mass numeric,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    temperature integer,
    has_life boolean,
    is_spherical boolean
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
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    mass numeric,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    temperature integer,
    has_life boolean,
    is_spherical boolean
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
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 1, 'Milky Way', 856000000000, 13000, 25000, 'Spiral', 200000000, 1000000000, true, true);
INSERT INTO public.galaxy VALUES (2, 2, 'Andromeda', 1230000000000, 14000, 27500, 'Spiral', 300000000, 1200000000, false, false);
INSERT INTO public.galaxy VALUES (3, 3, 'Triangulum', 67800000000, 9000, 23000, 'Irregular', 50000000, 500000000, false, false);
INSERT INTO public.galaxy VALUES (4, 4, 'Messier 87', 3450000000000, 20000, 60000, 'Elliptical', 100000000, 800000000, false, true);
INSERT INTO public.galaxy VALUES (5, 5, 'Sombrero', 267000000000, 11000, 33000, 'Spiral', 80000000, 600000000, true, false);
INSERT INTO public.galaxy VALUES (6, 6, 'Pinwheel', 189000000000, 10000, 27000, 'Spiral', 60000000, 400000000, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 73420000000000000000000, 4500, 384400, 220, false, true);
INSERT INTO public.moon VALUES (2, 1, 'Phobos', 10659000000000000, 4500, 9376, 233, false, false);
INSERT INTO public.moon VALUES (3, 1, 'Deimos', 1476200000000000, 4500, 23460, 233, false, false);
INSERT INTO public.moon VALUES (4, 2, 'Europa', 48000000000000000000000, 4500, 670900, 102, false, true);
INSERT INTO public.moon VALUES (5, 2, 'Titan', 134550000000000000000000, 4500, 1220000, 94, false, true);
INSERT INTO public.moon VALUES (6, 2, 'Callisto', 107590000000000000000000, 4500, 1882000, 134, false, true);
INSERT INTO public.moon VALUES (7, 3, 'Io', 89319000000000000000000, 4500, 421700, 110, false, true);
INSERT INTO public.moon VALUES (8, 3, 'Ganymede', 148190000000000000000000, 4500, 1070000, 152, false, true);
INSERT INTO public.moon VALUES (9, 4, 'Luna', 73420000000000000000000, 5000, 384400, 220, false, true);
INSERT INTO public.moon VALUES (10, 4, 'Enceladus', 108000000000000000000, 5000, 238040, 75, false, true);
INSERT INTO public.moon VALUES (11, 4, 'Rhea', 2310000000000000000000, 5000, 527040, 99, false, true);
INSERT INTO public.moon VALUES (12, 5, 'Triton', 21400000000000000000000, 5000, 354800, 38, false, true);
INSERT INTO public.moon VALUES (13, 5, 'Nereid', 31000000000000000000, 5000, 5513822, 49, false, true);
INSERT INTO public.moon VALUES (14, 5, 'Proteus', 50600000000000000000, 5000, 117647, 51, false, true);
INSERT INTO public.moon VALUES (15, 6, 'Charon', 1586000000000000000000, 5000, 19571, 53, false, true);
INSERT INTO public.moon VALUES (16, 6, 'Hydra', 42000000000000000, 5000, 64738, 51, false, false);
INSERT INTO public.moon VALUES (17, 6, 'Nix', 45000000000000000, 5000, 48694, 51, false, false);
INSERT INTO public.moon VALUES (18, 6, 'Styx', 7500000000000000, 5000, 42164, 51, false, false);
INSERT INTO public.moon VALUES (19, 6, 'Kerberos', 16500000000000000, 5000, 57886, 51, false, false);
INSERT INTO public.moon VALUES (20, 6, 'Dysnomia', 1500000000000000000, 5000, 65000, 51, false, false);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 1, 'Milky Way', 'The Milky Way is the galaxy that contains our Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky.');
INSERT INTO public.more_info VALUES (2, 2, 'Andromeda', 'Andromeda is a spiral galaxy approximately 2.537 million light-years from Earth, making it the nearest spiral galaxy to the Milky Way.');
INSERT INTO public.more_info VALUES (3, 3, 'Triangulum', 'Triangulum is a smaller spiral galaxy also known as Messier 33. It is the third-largest member of the Local Group of galaxies, which includes the Milky Way, Andromeda, and about 54 other smaller galaxies.');
INSERT INTO public.more_info VALUES (4, 4, 'Messier 87', 'Messier 87 is a supergiant elliptical galaxy in the constellation Virgo. It is notable for containing a supermassive black hole at its center, which was the first black hole to be directly imaged by the Event Horizon Telescope in 2019.');
INSERT INTO public.more_info VALUES (5, 5, 'Sombrero', 'The Sombrero Galaxy is an unbarred spiral galaxy in the constellation Virgo. It is notable for its bright nucleus, which gives it the appearance of a Mexican hat.');
INSERT INTO public.more_info VALUES (6, 6, 'Pinwheel', 'The Pinwheel Galaxy is a face-on spiral galaxy located in the constellation Ursa Major. It is one of the most prominent spiral galaxies in the sky, known for its well-defined spiral arms and bright core.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 1, 'Earth', 5972000000000000000000000, 4500, 149600000, 288, true, true);
INSERT INTO public.planet VALUES (2, 1, 2, 'Mars', 641700000000000000000000, 4500, 227900000, 218, false, true);
INSERT INTO public.planet VALUES (3, 2, 3, 'Proxima Centauri b', 73270000000000000000000000, 5600, 4.24, 234, false, true);
INSERT INTO public.planet VALUES (4, 2, 4, 'Proxima Centauri c', 9321000000000000000000000, 5600, 4.24, 211, false, true);
INSERT INTO public.planet VALUES (5, 3, 5, 'Venus', 4867000000000000000000000, 4500, 108200000, 737, false, true);
INSERT INTO public.planet VALUES (6, 3, 6, 'Mercury', 328500000000000000000000, 4500, 57900000, 440, false, true);
INSERT INTO public.planet VALUES (7, 4, 7, 'Jupiter', 1898000000000000000000000000, 5000, 778600000, 165, false, true);
INSERT INTO public.planet VALUES (8, 4, 8, 'Saturn', 568300000000000000000000000, 5000, 1430000000, 134, false, true);
INSERT INTO public.planet VALUES (9, 5, 9, 'Neptune', 102400000000000000000000000, 5000, 4500000000, 72, false, true);
INSERT INTO public.planet VALUES (10, 5, 10, 'Uranus', 86810000000000000000000000, 5000, 2880000000, 53, false, true);
INSERT INTO public.planet VALUES (11, 6, 11, 'Pluto', 13090000000000000000000, 5000, 5900000000, 44, false, true);
INSERT INTO public.planet VALUES (12, 6, 12, 'Ceres', 938300000000000000000, 5000, 414000000, 167, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 1, 'Sun', 1989000000000000000000000000000, 4500, 149600000, 5778, true, true);
INSERT INTO public.star VALUES (2, 1, 2, 'Proxima Centauri', 244700000000000000000000000000, 5600, 4.24, 3042, false, true);
INSERT INTO public.star VALUES (3, 2, 3, 'Alpha Centauri A', 2192000000000000000000000000000, 6500, 4.37, 5790, true, true);
INSERT INTO public.star VALUES (4, 2, 4, 'Alpha Centauri B', 1773000000000000000000000000000, 6000, 4.37, 5260, true, true);
INSERT INTO public.star VALUES (5, 3, 5, 'Barnard''s Star', 394200000000000000000000000000, 10000, 5.96, 3134, false, false);
INSERT INTO public.star VALUES (6, 3, 6, 'Wolf 359', 178000000000000000000000000000, 5000, 7.78, 2800, false, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 6, true);


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
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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
-- Name: galaxy galaxy_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

