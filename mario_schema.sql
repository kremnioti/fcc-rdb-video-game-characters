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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: actions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actions (
    action_id integer NOT NULL,
    action character varying(20) NOT NULL
);


--
-- Name: actions_action_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.actions_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: actions_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.actions_action_id_seq OWNED BY public.actions.action_id;


--
-- Name: character_actions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.character_actions (
    character_id integer NOT NULL,
    action_id integer NOT NULL
);


--
-- Name: characters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.characters (
    character_id integer NOT NULL,
    name character varying(30) NOT NULL,
    homeland character varying(60),
    favorite_color character varying(30)
);


--
-- Name: characters_character_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.characters_character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: characters_character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.characters_character_id_seq OWNED BY public.characters.character_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    birthday date,
    height_in_cm integer,
    weight_in_kg numeric(4,1),
    character_id integer NOT NULL
);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: sounds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sounds (
    sound_id integer NOT NULL,
    filename character varying(40) NOT NULL,
    character_id integer NOT NULL
);


--
-- Name: sounds_sound_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sounds_sound_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sounds_sound_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sounds_sound_id_seq OWNED BY public.sounds.sound_id;


--
-- Name: actions action_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actions ALTER COLUMN action_id SET DEFAULT nextval('public.actions_action_id_seq'::regclass);


--
-- Name: characters character_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.characters ALTER COLUMN character_id SET DEFAULT nextval('public.characters_character_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: sounds sound_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sounds ALTER COLUMN sound_id SET DEFAULT nextval('public.sounds_sound_id_seq'::regclass);


--
-- Name: actions actions_action_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actions
    ADD CONSTRAINT actions_action_key UNIQUE (action);


--
-- Name: actions actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (action_id);


--
-- Name: character_actions character_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.character_actions
    ADD CONSTRAINT character_actions_pkey PRIMARY KEY (character_id, action_id);


--
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (character_id);


--
-- Name: more_info more_info_character_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_character_id_key UNIQUE (character_id);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: sounds sounds_filename_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sounds
    ADD CONSTRAINT sounds_filename_key UNIQUE (filename);


--
-- Name: sounds sounds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sounds
    ADD CONSTRAINT sounds_pkey PRIMARY KEY (sound_id);


--
-- Name: character_actions character_actions_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.character_actions
    ADD CONSTRAINT character_actions_action_id_fkey FOREIGN KEY (action_id) REFERENCES public.actions(action_id);


--
-- Name: character_actions character_actions_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.character_actions
    ADD CONSTRAINT character_actions_character_id_fkey FOREIGN KEY (character_id) REFERENCES public.characters(character_id);


--
-- Name: more_info more_info_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_character_id_fkey FOREIGN KEY (character_id) REFERENCES public.characters(character_id);


--
-- Name: sounds sounds_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sounds
    ADD CONSTRAINT sounds_character_id_fkey FOREIGN KEY (character_id) REFERENCES public.characters(character_id);


--
-- PostgreSQL database dump complete
--

