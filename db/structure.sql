--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: concept_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE concept_categories (
    id integer NOT NULL,
    label character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: concept_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE concept_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: concept_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE concept_categories_id_seq OWNED BY concept_categories.id;


--
-- Name: concept_category_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE concept_category_links (
    id integer NOT NULL,
    concept_id integer,
    category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: concept_category_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE concept_category_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: concept_category_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE concept_category_links_id_seq OWNED BY concept_category_links.id;


--
-- Name: concept_statuses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE concept_statuses (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: concept_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE concept_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: concept_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE concept_statuses_id_seq OWNED BY concept_statuses.id;


--
-- Name: concept_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE concept_types (
    id integer NOT NULL,
    label character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: concept_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE concept_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: concept_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE concept_types_id_seq OWNED BY concept_types.id;


--
-- Name: concepts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE concepts (
    id integer NOT NULL,
    title character varying,
    associate_number integer,
    associate_wished_number integer,
    concept_type_id integer,
    concept_status_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    author_id integer,
    content character varying
);


--
-- Name: concepts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE concepts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: concepts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE concepts_id_seq OWNED BY concepts.id;


--
-- Name: friend_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE friend_links (
    id integer NOT NULL,
    "askerId" integer,
    "answererId" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: friend_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE friend_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friend_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE friend_links_id_seq OWNED BY friend_links.id;


--
-- Name: link_comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE link_comments (
    id integer NOT NULL,
    body text,
    commentable_id integer,
    commentable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    author_id integer
);


--
-- Name: link_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE link_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: link_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE link_comments_id_seq OWNED BY link_comments.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: skills; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE skills (
    id integer NOT NULL,
    label character varying,
    skill_category_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE skills_id_seq OWNED BY skills.id;


--
-- Name: useful_link_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE useful_link_categories (
    id integer NOT NULL,
    label character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: useful_link_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE useful_link_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: useful_link_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE useful_link_categories_id_seq OWNED BY useful_link_categories.id;


--
-- Name: useful_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE useful_links (
    id integer NOT NULL,
    title character varying,
    description character varying,
    useful_link_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    picture_file_name character varying,
    picture_content_type character varying,
    picture_file_size integer,
    picture_updated_at timestamp without time zone,
    is_public boolean DEFAULT false NOT NULL,
    url character varying
);


--
-- Name: useful_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE useful_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: useful_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE useful_links_id_seq OWNED BY useful_links.id;


--
-- Name: user_link_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_link_types (
    id integer NOT NULL,
    title character varying
);


--
-- Name: user_link_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_link_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_link_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_link_types_id_seq OWNED BY user_link_types.id;


--
-- Name: user_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_links (
    id integer NOT NULL,
    "askerId" integer,
    "answererId" integer,
    user_link_type_id integer,
    "isAccepted" boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_links_id_seq OWNED BY user_links.id;


--
-- Name: user_skills; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_skills (
    id integer NOT NULL,
    user_id integer,
    skill_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_skills_id_seq OWNED BY user_skills.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying,
    email character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    firstname character varying,
    admin boolean DEFAULT false
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY concept_categories ALTER COLUMN id SET DEFAULT nextval('concept_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY concept_category_links ALTER COLUMN id SET DEFAULT nextval('concept_category_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY concept_statuses ALTER COLUMN id SET DEFAULT nextval('concept_statuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY concept_types ALTER COLUMN id SET DEFAULT nextval('concept_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY concepts ALTER COLUMN id SET DEFAULT nextval('concepts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY friend_links ALTER COLUMN id SET DEFAULT nextval('friend_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY link_comments ALTER COLUMN id SET DEFAULT nextval('link_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY skills ALTER COLUMN id SET DEFAULT nextval('skills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY useful_link_categories ALTER COLUMN id SET DEFAULT nextval('useful_link_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY useful_links ALTER COLUMN id SET DEFAULT nextval('useful_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_link_types ALTER COLUMN id SET DEFAULT nextval('user_link_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_links ALTER COLUMN id SET DEFAULT nextval('user_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_skills ALTER COLUMN id SET DEFAULT nextval('user_skills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: concept_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY concept_categories
    ADD CONSTRAINT concept_categories_pkey PRIMARY KEY (id);


--
-- Name: concept_category_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY concept_category_links
    ADD CONSTRAINT concept_category_links_pkey PRIMARY KEY (id);


--
-- Name: concept_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY concept_statuses
    ADD CONSTRAINT concept_statuses_pkey PRIMARY KEY (id);


--
-- Name: concept_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY concept_types
    ADD CONSTRAINT concept_types_pkey PRIMARY KEY (id);


--
-- Name: concepts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY concepts
    ADD CONSTRAINT concepts_pkey PRIMARY KEY (id);


--
-- Name: friend_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY friend_links
    ADD CONSTRAINT friend_links_pkey PRIMARY KEY (id);


--
-- Name: link_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY link_comments
    ADD CONSTRAINT link_comments_pkey PRIMARY KEY (id);


--
-- Name: skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: useful_link_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY useful_link_categories
    ADD CONSTRAINT useful_link_categories_pkey PRIMARY KEY (id);


--
-- Name: useful_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY useful_links
    ADD CONSTRAINT useful_links_pkey PRIMARY KEY (id);


--
-- Name: user_link_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_link_types
    ADD CONSTRAINT user_link_types_pkey PRIMARY KEY (id);


--
-- Name: user_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_links
    ADD CONSTRAINT user_links_pkey PRIMARY KEY (id);


--
-- Name: user_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_skills
    ADD CONSTRAINT user_skills_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20150927200906');

INSERT INTO schema_migrations (version) VALUES ('20150927203430');

INSERT INTO schema_migrations (version) VALUES ('20151003203829');

INSERT INTO schema_migrations (version) VALUES ('20151004210957');

INSERT INTO schema_migrations (version) VALUES ('20151024215108');

INSERT INTO schema_migrations (version) VALUES ('20151025112805');

INSERT INTO schema_migrations (version) VALUES ('20151114174720');

INSERT INTO schema_migrations (version) VALUES ('20151114181325');

INSERT INTO schema_migrations (version) VALUES ('20151114181410');

INSERT INTO schema_migrations (version) VALUES ('20151114183253');

INSERT INTO schema_migrations (version) VALUES ('20151115175232');

INSERT INTO schema_migrations (version) VALUES ('20151124173642');

INSERT INTO schema_migrations (version) VALUES ('20151125212022');

INSERT INTO schema_migrations (version) VALUES ('20151125212134');

INSERT INTO schema_migrations (version) VALUES ('20151205161405');

INSERT INTO schema_migrations (version) VALUES ('20151228221726');

INSERT INTO schema_migrations (version) VALUES ('20160208212842');

INSERT INTO schema_migrations (version) VALUES ('20160208232641');

INSERT INTO schema_migrations (version) VALUES ('20160214211730');

INSERT INTO schema_migrations (version) VALUES ('20160214211942');

INSERT INTO schema_migrations (version) VALUES ('20160227174946');

INSERT INTO schema_migrations (version) VALUES ('20160228164337');

INSERT INTO schema_migrations (version) VALUES ('20160228172100');

INSERT INTO schema_migrations (version) VALUES ('20160413181315');

INSERT INTO schema_migrations (version) VALUES ('20160506205411');

INSERT INTO schema_migrations (version) VALUES ('20160508155225');

