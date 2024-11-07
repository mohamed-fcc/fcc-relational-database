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
    description text,
    age_in_millions_of_years integer,
    mass_in_trillion_solar_mass numeric(5,1),
    stars_count_in_billions integer,
    has_life boolean NOT NULL,
    is_active boolean NOT NULL,
    galaxy_type_id integer NOT NULL
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(20)
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_planet integer,
    average_orbital_speed numeric(10,4),
    percentage_of_oxygen numeric(2,2),
    mass numeric(20,1),
    is_visible_from_earth boolean,
    is_dead boolean,
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
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    distance_from_sun integer,
    average_orbital_speed numeric(10,4),
    mass numeric(20,1),
    moons_count integer,
    has_life boolean NOT NULL,
    is_visible_from_earth boolean NOT NULL,
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
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    percentage_of_oxygen numeric(2,2),
    mass numeric(20,1),
    is_visible_from_earth boolean,
    is_dead boolean,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'The galaxy that contains our Solar System, a barred spiral galaxy.', 13000, 1.5, 100, true, true, 1);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'The nearest spiral galaxy to the Milky Way, expected to collide with it in 4.5 billion years.', 10000, 1.1, 220, true, true, 1);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'A member of the Local Group, smaller than the Milky Way.', 3000, 0.5, 40, true, true, 1);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'A classic spiral galaxy known for its distinct arms.', 10000, 1.0, 150, true, true, 1);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 'Famous for its bright nucleus and a prominent dust lane.', 10000, 1.0, 800, true, true, 1);
INSERT INTO public.galaxy VALUES (8, 'Centaurus A', 'An active galaxy with a supermassive black hole at its center.', 10000, 0.5, 100, false, true, 3);
INSERT INTO public.galaxy VALUES (9, 'Messier 87', 'Known for its supermassive black hole and being the first galaxy to have its black hole imaged.', 13000, 6.0, 1200, false, true, 2);
INSERT INTO public.galaxy VALUES (10, 'Cartwheel Galaxy', 'A ring galaxy resulting from a collision with another galaxy.', 2000, 0.2, 15, false, true, 4);
INSERT INTO public.galaxy VALUES (11, 'NGC 1300', 'A barred spiral galaxy noted for its well-defined bar structure.', 7000, 0.3, 30, true, true, 1);
INSERT INTO public.galaxy VALUES (12, 'Pinwheel Galaxy', 'A spiral galaxy that is one of the largest galaxies in the M81 group.', 10000, 0.6, 80, true, true, 1);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', NULL);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', NULL);
INSERT INTO public.galaxy_type VALUES (3, 'Lenticular', NULL);
INSERT INTO public.galaxy_type VALUES (4, 'Irregular ', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The only natural satellite of the Earth, the fifth-largest moon in the Solar System.', 4500, 0, 1.0220, NULL, 0.1, true, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A small, irregularly shaped moon of Mars.', 4500, 0, 2.1380, NULL, 0.0, false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and more distant moon of Mars.', 4500, 0, 1.3510, NULL, 0.0, false, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'The most geologically active moon, with over 400 active volcanoes.', 4500, 0, 17.3340, NULL, 0.1, false, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'A moon with an icy surface, possibly harboring an ocean beneath.', 4500, 1, 13.7400, NULL, 0.0, false, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System, even bigger than Mercury.', 4500, 1, 10.8800, NULL, 0.2, false, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered moon with an ancient surface.', 4500, 2, 8.2040, NULL, 0.1, false, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'The largest moon of Saturn, with a thick nitrogen-rich atmosphere.', 4500, 1, 5.5700, NULL, 0.1, false, false, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'An icy moon known for its geysers, which eject water into space.', 4500, 0, 12.6400, NULL, 0.0, false, false, 6);
INSERT INTO public.moon VALUES (10, 'Miranda', 'A moon with an unusual and diverse geological surface.', 4500, 0, 6.6100, NULL, 0.0, false, false, 7);
INSERT INTO public.moon VALUES (11, 'Titania', 'The largest moon of Uranus, with an icy and rocky composition.', 4500, 0, 3.6400, NULL, 0.0, false, false, 7);
INSERT INTO public.moon VALUES (12, 'Triton', 'A large moon with a retrograde orbit, possibly a captured object from the Kuiper belt.', 4500, 0, 4.3900, NULL, 0.2, false, false, 8);
INSERT INTO public.moon VALUES (13, 'Centauri Alpha', 'A moon with a thin atmosphere orbiting Alpha Centauri b.', 3000, 0, 3.5000, NULL, 0.0, false, false, 9);
INSERT INTO public.moon VALUES (14, 'Sirius Prime', 'A rocky moon orbiting Sirius b, with large ice deposits.', 2000, 0, 5.2300, NULL, 0.0, false, false, 10);
INSERT INTO public.moon VALUES (15, 'Inferno', 'A volcanic moon constantly bombarded by radiation of Betelgeuse.', 1000, 0, 2.1000, NULL, 0.0, false, true, 11);
INSERT INTO public.moon VALUES (16, 'Astra', 'A moon with a barren, cratered surface orbiting M31 Alpha I.', 2500, 0, 3.0000, NULL, 0.0, false, false, 12);
INSERT INTO public.moon VALUES (17, 'Whirlwind', 'A stormy moon with frequent cyclones due to atmospheric instability.', 1200, 0, 4.0000, NULL, 0.0, false, false, 13);
INSERT INTO public.moon VALUES (18, 'Primean', 'A large moon with towering mountain ranges and deep valleys.', 4000, 0, 2.8000, NULL, 0.1, false, false, 14);
INSERT INTO public.moon VALUES (19, 'Vega Minor', 'A small, icy moon with little to no atmosphere.', 2000, 0, 1.9000, NULL, 0.0, false, true, 15);
INSERT INTO public.moon VALUES (20, 'Frostbite', 'A moon completely covered in ice, with subsurface oceans.', 700, 0, 4.1000, NULL, 0.0, false, false, 16);
INSERT INTO public.moon VALUES (21, 'Molten', 'A molten moon with lava rivers and constant volcanic activity.', 1000, 0, 6.5000, NULL, 0.1, false, true, 17);
INSERT INTO public.moon VALUES (22, 'Omega Max', 'A gas-rich moon orbiting Pinwheel Omega, with swirling clouds.', 1500, 0, 5.7000, NULL, 0.0, false, false, 18);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest and innermost planet in the Solar System, with a thin atmosphere.', 4500, 92, 58, 47.3620, 0.3, 0, false, true, 4);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the Sun, known for its thick, toxic atmosphere and high surface temperatures.', 4500, 41, 108, 35.0200, 4.9, 0, false, true, 4);
INSERT INTO public.planet VALUES (3, 'Earth', 'The third planet from the Sun and the only known planet to harbor life.', 4500, 0, 150, 29.7800, 6.0, 1, true, true, 4);
INSERT INTO public.planet VALUES (4, 'Mars', 'The fourth planet from the Sun, known as the Red Planet due to its iron oxide surface.', 4500, 78, 228, 24.0770, 0.6, 2, false, true, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System, a gas giant with a strong magnetic field and over 79 moons.', 4500, 629, 778, 13.0700, 1898.0, 79, false, true, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The second-largest planet, known for its stunning ring system and numerous moons.', 4500, 1275, 1427, 9.6900, 568.0, 83, false, true, 4);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a tilted axis, giving it extreme seasons and a ring system.', 4500, 2724, 2871, 6.8100, 86.8, 27, false, false, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The farthest known planet in the Solar System, with strong winds and a deep blue color.', 4500, 4351, 4495, 5.4300, 102.0, 14, false, false, 4);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri b', 'An exoplanet orbiting Proxima Centauri, potentially Earth-like.', 5000, 4, 10, 30.1200, 6.0, 0, false, false, 2);
INSERT INTO public.planet VALUES (10, 'Sirius b', 'A gas giant orbiting Sirius, with a high atmospheric pressure and thick clouds.', 3000, 9, 150, 13.5000, 317.8, 16, false, false, 1);
INSERT INTO public.planet VALUES (11, 'Betelgeuse c', 'A super-Earth with a high temperature due to its proximity to Betelgeuse.', 1000, 642, 1500, 35.4000, 10.5, 2, false, false, 3);
INSERT INTO public.planet VALUES (12, 'M31 Alpha I', 'A desert planet with large temperature variations, orbiting M31 Star Alpha.', 3000, 2500, 900, 18.5000, 1.0, 1, false, false, 5);
INSERT INTO public.planet VALUES (13, 'Whirlpool Delta', 'A gas giant with a striking ring system, orbiting Whirlpool Gamma.', 500, 2300, 1200, 8.9000, 200.0, 8, false, false, 6);
INSERT INTO public.planet VALUES (14, 'Sombrero Prime', 'A rocky planet orbiting Sombrero Epsilon, with a thin atmosphere.', 4000, 2900, 1200, 25.4000, 3.2, 0, false, false, 7);
INSERT INTO public.planet VALUES (15, 'Vega d', 'An icy world with rings and several large moons, orbiting Vega.', 2000, 25000, 200, 10.8000, 80.0, 10, false, false, 8);
INSERT INTO public.planet VALUES (16, 'Triangulum X', 'A frozen world far from its parent star, with an icy surface.', 700, 3000, 1500, 5.5000, 10.8, 3, false, false, 9);
INSERT INTO public.planet VALUES (17, 'M87 Zeta Prime', 'A volcanic planet with frequent eruptions, orbiting M87 Zeta.', 1000, 5000, 1700, 28.5000, 2.4, 0, false, false, 10);
INSERT INTO public.planet VALUES (18, 'Pinwheel Omega', 'A gas giant orbiting Pinwheel Iota, known for its large rings.', 1500, 2100, 1200, 10.3000, 317.5, 14, false, false, 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'The brightest star in the night sky, part of the Canis Major constellation.', 200, 9, 0.00, NULL, true, false, 3);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The closest known star to the Sun, part of the Alpha Centauri star system.', 4500, 4, 0.00, NULL, true, false, 3);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant star in the Orion constellation, known for its variability.', 100, 642, 0.00, NULL, true, false, 3);
INSERT INTO public.star VALUES (4, 'Sun', 'The star at the center of the Solar System, providing light and heat to the Earth.', 4600, 0, 0.00, NULL, true, false, 3);
INSERT INTO public.star VALUES (5, 'M31 Star Alpha', 'A bright blue star in the Andromeda galaxy, known for its high luminosity.', 500, 2500000, 0.00, NULL, false, false, 4);
INSERT INTO public.star VALUES (6, 'Whirlpool Gamma', 'A supernova remnant star in the Whirlpool galaxy, emitting strong radio waves.', 100, 2300000, 0.00, NULL, false, true, 6);
INSERT INTO public.star VALUES (7, 'Sombrero Epsilon', 'A red supergiant star located in the Sombrero galaxy.', 10000, 2900000, 0.00, NULL, false, false, 7);
INSERT INTO public.star VALUES (8, 'Vega', 'A bright star in the Lyra constellation, part of the Summer Triangle.', 455, 25, 0.00, NULL, true, false, 3);
INSERT INTO public.star VALUES (9, 'Triangulum Beta', 'A giant star in the Triangulum galaxy, famous for its unique double nature.', 800, 3000000, 0.00, NULL, false, false, 5);
INSERT INTO public.star VALUES (10, 'M87 Zeta', 'A bright star near the supermassive black hole in Messier 87.', 2000, 5000000, 0.00, NULL, false, false, 9);
INSERT INTO public.star VALUES (11, 'Pinwheel Iota', 'A massive star in the Pinwheel galaxy, surrounded by dust clouds.', 600, 2100000, 0.00, NULL, false, false, 12);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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
