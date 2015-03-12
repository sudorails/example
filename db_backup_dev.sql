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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: address_serveys; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE address_serveys (
    id integer NOT NULL,
    user_id integer,
    customer_id integer,
    tab_id integer,
    accept_or_decline boolean,
    agency_name character varying,
    date_of_visit date,
    marital_status boolean,
    person_contacted character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    address_confirmed boolean
);


ALTER TABLE public.address_serveys OWNER TO desidime;

--
-- Name: address_serveys_id_seq; Type: SEQUENCE; Schema: public; Owner: desidime
--

CREATE SEQUENCE address_serveys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_serveys_id_seq OWNER TO desidime;

--
-- Name: address_serveys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: desidime
--

ALTER SEQUENCE address_serveys_id_seq OWNED BY address_serveys.id;


--
-- Name: address_verifications; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE address_verifications (
    id integer NOT NULL,
    father_name character varying,
    dob date,
    location character varying,
    address_one text,
    address_two text,
    address_third text,
    customer_id integer,
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.address_verifications OWNER TO desidime;

--
-- Name: address_verifications_id_seq; Type: SEQUENCE; Schema: public; Owner: desidime
--

CREATE SEQUENCE address_verifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_verifications_id_seq OWNER TO desidime;

--
-- Name: address_verifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: desidime
--

ALTER SEQUENCE address_verifications_id_seq OWNED BY address_verifications.id;


--
-- Name: assigned_addresses; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE assigned_addresses (
    id integer NOT NULL,
    tab_id integer,
    user_id integer,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.assigned_addresses OWNER TO desidime;

--
-- Name: assigned_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: desidime
--

CREATE SEQUENCE assigned_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assigned_addresses_id_seq OWNER TO desidime;

--
-- Name: assigned_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: desidime
--

ALTER SEQUENCE assigned_addresses_id_seq OWNED BY assigned_addresses.id;


--
-- Name: crime_verifications; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE crime_verifications (
    id integer NOT NULL,
    father_name character varying,
    dob date,
    location character varying,
    address_one text,
    address_two text,
    address_third text,
    customer_id integer,
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.crime_verifications OWNER TO desidime;

--
-- Name: crime_verifications_id_seq; Type: SEQUENCE; Schema: public; Owner: desidime
--

CREATE SEQUENCE crime_verifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crime_verifications_id_seq OWNER TO desidime;

--
-- Name: crime_verifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: desidime
--

ALTER SEQUENCE crime_verifications_id_seq OWNED BY crime_verifications.id;


--
-- Name: customer_documents; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE customer_documents (
    id integer NOT NULL,
    doc_name character varying,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    document_file_name character varying,
    document_content_type character varying,
    document_file_size integer,
    document_updated_at timestamp without time zone
);


ALTER TABLE public.customer_documents OWNER TO desidime;

--
-- Name: customer_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: desidime
--

CREATE SEQUENCE customer_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_documents_id_seq OWNER TO desidime;

--
-- Name: customer_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: desidime
--

ALTER SEQUENCE customer_documents_id_seq OWNED BY customer_documents.id;


--
-- Name: customer_verifications; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE customer_verifications (
    id integer NOT NULL,
    tab_id integer,
    customer_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.customer_verifications OWNER TO desidime;

--
-- Name: customer_verifications_id_seq; Type: SEQUENCE; Schema: public; Owner: desidime
--

CREATE SEQUENCE customer_verifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_verifications_id_seq OWNER TO desidime;

--
-- Name: customer_verifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: desidime
--

ALTER SEQUENCE customer_verifications_id_seq OWNED BY customer_verifications.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE customers (
    id integer NOT NULL,
    name character varying,
    user_id integer,
    reference_id integer DEFAULT 1,
    slug character varying,
    request_id character varying,
    verification_type_id integer,
    status character varying,
    father_name character varying,
    dob date,
    location character varying,
    address text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.customers OWNER TO desidime;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: desidime
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO desidime;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: desidime
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: education_verifications; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE education_verifications (
    id integer NOT NULL,
    stream character varying,
    month integer,
    year integer,
    customer_id integer,
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    seat_number character varying
);


ALTER TABLE public.education_verifications OWNER TO desidime;

--
-- Name: education_verifications_id_seq; Type: SEQUENCE; Schema: public; Owner: desidime
--

CREATE SEQUENCE education_verifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.education_verifications_id_seq OWNER TO desidime;

--
-- Name: education_verifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: desidime
--

ALTER SEQUENCE education_verifications_id_seq OWNED BY education_verifications.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE profiles (
    id integer NOT NULL,
    user_id integer,
    full_name character varying,
    contact_number character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone
);


ALTER TABLE public.profiles OWNER TO desidime;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: desidime
--

CREATE SEQUENCE profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO desidime;

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: desidime
--

ALTER SEQUENCE profiles_id_seq OWNED BY profiles.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO desidime;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: desidime
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO desidime;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: desidime
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO desidime;

--
-- Name: tabs; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE tabs (
    id integer NOT NULL,
    name character varying,
    tab_code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tabs OWNER TO desidime;

--
-- Name: tabs_id_seq; Type: SEQUENCE; Schema: public; Owner: desidime
--

CREATE SEQUENCE tabs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tabs_id_seq OWNER TO desidime;

--
-- Name: tabs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: desidime
--

ALTER SEQUENCE tabs_id_seq OWNED BY tabs.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    role_id integer,
    tab_id integer,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying
);


ALTER TABLE public.users OWNER TO desidime;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: desidime
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO desidime;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: desidime
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: verification_types; Type: TABLE; Schema: public; Owner: desidime; Tablespace: 
--

CREATE TABLE verification_types (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.verification_types OWNER TO desidime;

--
-- Name: verification_types_id_seq; Type: SEQUENCE; Schema: public; Owner: desidime
--

CREATE SEQUENCE verification_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verification_types_id_seq OWNER TO desidime;

--
-- Name: verification_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: desidime
--

ALTER SEQUENCE verification_types_id_seq OWNED BY verification_types.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: desidime
--

ALTER TABLE ONLY address_serveys ALTER COLUMN id SET DEFAULT nextval('address_serveys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: desidime
--

ALTER TABLE ONLY address_verifications ALTER COLUMN id SET DEFAULT nextval('address_verifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: desidime
--

ALTER TABLE ONLY assigned_addresses ALTER COLUMN id SET DEFAULT nextval('assigned_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: desidime
--

ALTER TABLE ONLY crime_verifications ALTER COLUMN id SET DEFAULT nextval('crime_verifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: desidime
--

ALTER TABLE ONLY customer_documents ALTER COLUMN id SET DEFAULT nextval('customer_documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: desidime
--

ALTER TABLE ONLY customer_verifications ALTER COLUMN id SET DEFAULT nextval('customer_verifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: desidime
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: desidime
--

ALTER TABLE ONLY education_verifications ALTER COLUMN id SET DEFAULT nextval('education_verifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: desidime
--

ALTER TABLE ONLY profiles ALTER COLUMN id SET DEFAULT nextval('profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: desidime
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: desidime
--

ALTER TABLE ONLY tabs ALTER COLUMN id SET DEFAULT nextval('tabs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: desidime
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: desidime
--

ALTER TABLE ONLY verification_types ALTER COLUMN id SET DEFAULT nextval('verification_types_id_seq'::regclass);


--
-- Data for Name: address_serveys; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY address_serveys (id, user_id, customer_id, tab_id, accept_or_decline, agency_name, date_of_visit, marital_status, person_contacted, created_at, updated_at, address_confirmed) FROM stdin;
\.


--
-- Name: address_serveys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: desidime
--

SELECT pg_catalog.setval('address_serveys_id_seq', 1, false);


--
-- Data for Name: address_verifications; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY address_verifications (id, father_name, dob, location, address_one, address_two, address_third, customer_id, status, created_at, updated_at) FROM stdin;
\.


--
-- Name: address_verifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: desidime
--

SELECT pg_catalog.setval('address_verifications_id_seq', 1, false);


--
-- Data for Name: assigned_addresses; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY assigned_addresses (id, tab_id, user_id, customer_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: assigned_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: desidime
--

SELECT pg_catalog.setval('assigned_addresses_id_seq', 1, false);


--
-- Data for Name: crime_verifications; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY crime_verifications (id, father_name, dob, location, address_one, address_two, address_third, customer_id, status, created_at, updated_at) FROM stdin;
\.


--
-- Name: crime_verifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: desidime
--

SELECT pg_catalog.setval('crime_verifications_id_seq', 1, false);


--
-- Data for Name: customer_documents; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY customer_documents (id, doc_name, customer_id, created_at, updated_at, document_file_name, document_content_type, document_file_size, document_updated_at) FROM stdin;
1	Passport	1	2015-03-11 17:36:02.359285	2015-03-11 17:36:02.359285	sep2oct.pdf	application/pdf	72275	2015-03-11 17:35:58.649186
2	Passport	2	2015-03-11 17:40:27.096074	2015-03-11 17:40:27.096074	Sudhir_-_August_2014.pdf	application/pdf	72708	2015-03-11 17:40:25.00624
3	Electricity Bill	3	2015-03-11 17:42:19.012104	2015-03-11 17:42:19.012104	USFlight.pdf	application/pdf	198445	2015-03-11 17:42:14.851396
4	Passport	4	2015-03-11 18:06:26.731356	2015-03-11 18:06:26.731356	SudhirVishwakarma.pdf	application/pdf	5807	2015-03-11 18:06:24.476874
5	Ration Card	5	2015-03-11 18:10:23.458498	2015-03-11 18:10:23.458498	SudhirVishwakarma(1).pdf	application/pdf	9009	2015-03-11 18:10:21.189727
6	Electricity Bill	6	2015-03-11 18:25:26.608927	2015-03-11 18:25:26.608927	September_2013_-_Sudhir_-_Salary_Slip_-_PCPL_1.pdf	application/pdf	70011	2015-03-11 18:25:24.506554
7	Passport	7	2015-03-11 18:34:43.235024	2015-03-11 18:34:43.235024	Dec_2013_-_Sudhir_-_Salary_Slip_-_PCPL.pdf	application/pdf	70167	2015-03-11 18:34:41.135019
\.


--
-- Name: customer_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: desidime
--

SELECT pg_catalog.setval('customer_documents_id_seq', 7, true);


--
-- Data for Name: customer_verifications; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY customer_verifications (id, tab_id, customer_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: customer_verifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: desidime
--

SELECT pg_catalog.setval('customer_verifications_id_seq', 1, false);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY customers (id, name, user_id, reference_id, slug, request_id, verification_type_id, status, father_name, dob, location, address, created_at, updated_at) FROM stdin;
1	Ayushman Khurana	2	1001	ayushman-khurana	1	\N	pending	BB Khurana	1985-01-27	Delhi	Vera Desai Road	2015-03-11 17:36:02.348863	2015-03-11 17:39:43.629892
3	Piyush Mishra	2	1003	piyush-mishra	1003	\N	pending	Joy Mishra	1985-01-27	Mumbai	Vera Desai Road	2015-03-11 17:42:19.002314	2015-03-11 17:42:19.002314
2	John Abrahm	2	1002	john-abrahm	1	\N	completed	John G	1985-01-27	Mumbai	Vera Desai Road	2015-03-11 17:40:27.086067	2015-03-11 17:41:34.480688
4	Ashrani	2	1004	ashrani	1004	\N	pending	Muralidhar	1985-01-27	Mumbai	Vera Desai Road	2015-03-11 18:06:26.722346	2015-03-11 18:06:26.722346
5	Yogesh Tiwari	2	1005	yogesh-tiwari	1005	\N	pending	Yaduwansh Tiwari	1985-01-27	Mumbai	Ghatkopar	2015-03-11 18:10:23.450369	2015-03-11 18:10:23.450369
6	Akshay Kumar	2	1006	akshay-kumar	1006	\N	pending	Ravi Bhatia	1985-01-27	Delhi	Parathe Wali Gali	2015-03-11 18:25:26.598428	2015-03-11 18:25:26.598428
7	Salman Khan	2	1007	salman-khan	1007	\N	pending	Salim Khan	1985-01-28	Bandra	Mumbai	2015-03-11 18:34:43.225242	2015-03-11 18:34:43.225242
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: desidime
--

SELECT pg_catalog.setval('customers_id_seq', 7, true);


--
-- Data for Name: education_verifications; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY education_verifications (id, stream, month, year, customer_id, status, created_at, updated_at, seat_number) FROM stdin;
\.


--
-- Name: education_verifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: desidime
--

SELECT pg_catalog.setval('education_verifications_id_seq', 1, false);


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY profiles (id, user_id, full_name, contact_number, created_at, updated_at, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at) FROM stdin;
1	1	\N	\N	2015-03-11 17:26:27.937969	2015-03-11 17:26:27.937969	\N	\N	\N	\N
2	2	\N	\N	2015-03-11 17:26:28.208434	2015-03-11 17:26:28.208434	\N	\N	\N	\N
\.


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: desidime
--

SELECT pg_catalog.setval('profiles_id_seq', 2, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY roles (id, name, created_at, updated_at) FROM stdin;
1	tab	2015-03-11 17:26:26.451836	2015-03-11 17:26:26.451836
2	banned	2015-03-11 17:26:26.471147	2015-03-11 17:26:26.471147
3	moderator	2015-03-11 17:26:26.493667	2015-03-11 17:26:26.493667
4	admin	2015-03-11 17:26:26.514953	2015-03-11 17:26:26.514953
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: desidime
--

SELECT pg_catalog.setval('roles_id_seq', 4, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY schema_migrations (version) FROM stdin;
20150221070222
20150221080719
20150221081005
20150221084233
20150221084554
20150221084841
20150221122409
20150222132129
20150222132146
20150222133106
20150301035150
20150301091903
20150301094817
20150301100539
20150301171251
20150304163723
20150304190640
20150306191112
20150306192726
20150308083615
20150308084438
\.


--
-- Data for Name: tabs; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY tabs (id, name, tab_code, created_at, updated_at) FROM stdin;
1	Tab-andheri	TAB-1	2015-03-11 17:26:26.308942	2015-03-11 17:26:26.308942
2	Tab-malad	TAB-2	2015-03-11 17:26:26.325063	2015-03-11 17:26:26.325063
3	Tab-thane	TAB-3	2015-03-11 17:26:26.347707	2015-03-11 17:26:26.347707
4	Tab-matunga	TAB-4	2015-03-11 17:26:26.369767	2015-03-11 17:26:26.369767
5	Tab-parel	TAB-5	2015-03-11 17:26:26.392171	2015-03-11 17:26:26.392171
\.


--
-- Name: tabs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: desidime
--

SELECT pg_catalog.setval('tabs_id_seq', 5, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, role_id, tab_id, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email) FROM stdin;
2	yogesh.tiwari@test.com	$2a$10$PvD2MfJEsiK4ULX0Waj6quhN2FD626BzHKLmv0p8kbn79uab5MiLm	\N	\N	\N	1	2015-03-11 17:27:04.907192	2015-03-11 17:27:04.907192	127.0.0.1	127.0.0.1	2015-03-11 17:26:28.142896	2015-03-11 17:27:04.912908	1	5	\N	2015-03-11 17:26:28.21946	2015-03-11 17:26:28.148098	\N
1	sudhirsb2003@gmail.com	$2a$10$.HqJpHw4b9RsAye6QMGYE.3W.PLSoYQYnBoyMCkZ7muOMUmWCG6OO	\N	\N	\N	1	2015-03-11 17:42:29.414669	2015-03-11 17:42:29.414669	127.0.0.1	127.0.0.1	2015-03-11 17:26:26.712285	2015-03-11 17:42:29.419827	4	\N	\N	2015-03-11 17:26:27.965237	2015-03-11 17:26:27.310075	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: desidime
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Data for Name: verification_types; Type: TABLE DATA; Schema: public; Owner: desidime
--

COPY verification_types (id, name, created_at, updated_at) FROM stdin;
1	Address	2015-03-11 17:26:26.217734	2015-03-11 17:26:26.217734
2	Education	2015-03-11 17:26:26.237191	2015-03-11 17:26:26.237191
3	Crime	2015-03-11 17:26:26.262673	2015-03-11 17:26:26.262673
\.


--
-- Name: verification_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: desidime
--

SELECT pg_catalog.setval('verification_types_id_seq', 3, true);


--
-- Name: address_serveys_pkey; Type: CONSTRAINT; Schema: public; Owner: desidime; Tablespace: 
--

ALTER TABLE ONLY address_serveys
    ADD CONSTRAINT address_serveys_pkey PRIMARY KEY (id);


--
-- Name: address_verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: desidime; Tablespace: 
--

ALTER TABLE ONLY address_verifications
    ADD CONSTRAINT address_verifications_pkey PRIMARY KEY (id);


--
-- Name: assigned_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: desidime; Tablespace: 
--

ALTER TABLE ONLY assigned_addresses
    ADD CONSTRAINT assigned_addresses_pkey PRIMARY KEY (id);


--
-- Name: crime_verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: desidime; Tablespace: 
--

ALTER TABLE ONLY crime_verifications
    ADD CONSTRAINT crime_verifications_pkey PRIMARY KEY (id);


--
-- Name: customer_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: desidime; Tablespace: 
--

ALTER TABLE ONLY customer_documents
    ADD CONSTRAINT customer_documents_pkey PRIMARY KEY (id);


--
-- Name: customer_verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: desidime; Tablespace: 
--

ALTER TABLE ONLY customer_verifications
    ADD CONSTRAINT customer_verifications_pkey PRIMARY KEY (id);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: desidime; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: education_verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: desidime; Tablespace: 
--

ALTER TABLE ONLY education_verifications
    ADD CONSTRAINT education_verifications_pkey PRIMARY KEY (id);


--
-- Name: profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: desidime; Tablespace: 
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: desidime; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: tabs_pkey; Type: CONSTRAINT; Schema: public; Owner: desidime; Tablespace: 
--

ALTER TABLE ONLY tabs
    ADD CONSTRAINT tabs_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: desidime; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: verification_types_pkey; Type: CONSTRAINT; Schema: public; Owner: desidime; Tablespace: 
--

ALTER TABLE ONLY verification_types
    ADD CONSTRAINT verification_types_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: desidime; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: desidime; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: desidime; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: desidime; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

