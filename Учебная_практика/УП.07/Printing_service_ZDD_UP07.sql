--
-- PostgreSQL database dump
--

\restrict yV3nrjHAfUat65f1LbuJj0DIxeSndRduyBRh9llBORLms2lcdwYavVJuCnEniAD

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-11-03 15:34:44

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 127435)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customers_id integer NOT NULL,
    login character varying(50) NOT NULL,
    customer_password character varying(255) NOT NULL,
    phone character varying(15) NOT NULL,
    customer_role character varying(25) NOT NULL,
    CONSTRAINT customers_customer_role_check CHECK (((customer_role)::text = ANY ((ARRAY['admin'::character varying, 'user'::character varying])::text[])))
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 127434)
-- Name: customers_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customers_id_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 219
-- Name: customers_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customers_id_seq OWNED BY public.customers.customers_id;


--
-- TOC entry 226 (class 1259 OID 127484)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    order_items integer NOT NULL,
    fk_orders integer NOT NULL,
    fk_services integer NOT NULL,
    quantity integer NOT NULL,
    full_price numeric(10,2) NOT NULL,
    CONSTRAINT order_items_full_price_check CHECK ((full_price >= (0)::numeric)),
    CONSTRAINT order_items_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 127483)
-- Name: order_items_order_items_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_order_items_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_order_items_seq OWNER TO postgres;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 225
-- Name: order_items_order_items_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_order_items_seq OWNED BY public.order_items.order_items;


--
-- TOC entry 224 (class 1259 OID 127466)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    orders_id integer NOT NULL,
    fk_customers integer NOT NULL,
    created_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status character varying(50) NOT NULL,
    CONSTRAINT orders_status_check CHECK (((status)::text = ANY ((ARRAY['new'::character varying, 'processing'::character varying, 'completed'::character varying])::text[])))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 127465)
-- Name: orders_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_orders_id_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 223
-- Name: orders_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_orders_id_seq OWNED BY public.orders.orders_id;


--
-- TOC entry 222 (class 1259 OID 127452)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    services_id integer NOT NULL,
    service_name character varying(50) NOT NULL,
    description text NOT NULL,
    service_price numeric(10,2) NOT NULL,
    CONSTRAINT services_service_price_check CHECK ((service_price >= (0)::numeric))
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 127451)
-- Name: services_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_services_id_seq OWNER TO postgres;

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 221
-- Name: services_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_services_id_seq OWNED BY public.services.services_id;


--
-- TOC entry 4770 (class 2604 OID 127438)
-- Name: customers customers_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customers_id SET DEFAULT nextval('public.customers_customers_id_seq'::regclass);


--
-- TOC entry 4774 (class 2604 OID 127487)
-- Name: order_items order_items; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN order_items SET DEFAULT nextval('public.order_items_order_items_seq'::regclass);


--
-- TOC entry 4772 (class 2604 OID 127469)
-- Name: orders orders_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN orders_id SET DEFAULT nextval('public.orders_orders_id_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 127455)
-- Name: services services_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN services_id SET DEFAULT nextval('public.services_services_id_seq'::regclass);


--
-- TOC entry 4943 (class 0 OID 127435)
-- Dependencies: 220
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customers_id, login, customer_password, phone, customer_role) FROM stdin;
\.


--
-- TOC entry 4949 (class 0 OID 127484)
-- Dependencies: 226
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (order_items, fk_orders, fk_services, quantity, full_price) FROM stdin;
\.


--
-- TOC entry 4947 (class 0 OID 127466)
-- Dependencies: 224
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (orders_id, fk_customers, created_time, status) FROM stdin;
\.


--
-- TOC entry 4945 (class 0 OID 127452)
-- Dependencies: 222
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (services_id, service_name, description, service_price) FROM stdin;
\.


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 219
-- Name: customers_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customers_id_seq', 1, false);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 225
-- Name: order_items_order_items_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_order_items_seq', 1, false);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 223
-- Name: orders_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_orders_id_seq', 1, false);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 221
-- Name: services_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_services_id_seq', 1, false);


--
-- TOC entry 4781 (class 2606 OID 127448)
-- Name: customers customers_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_login_key UNIQUE (login);


--
-- TOC entry 4783 (class 2606 OID 127450)
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- TOC entry 4785 (class 2606 OID 127446)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customers_id);


--
-- TOC entry 4791 (class 2606 OID 127496)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_items);


--
-- TOC entry 4789 (class 2606 OID 127477)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orders_id);


--
-- TOC entry 4787 (class 2606 OID 127464)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (services_id);


--
-- TOC entry 4793 (class 2606 OID 127497)
-- Name: order_items order_items_fk_orders_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_fk_orders_fkey FOREIGN KEY (fk_orders) REFERENCES public.orders(orders_id);


--
-- TOC entry 4794 (class 2606 OID 127502)
-- Name: order_items order_items_fk_services_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_fk_services_fkey FOREIGN KEY (fk_services) REFERENCES public.services(services_id);


--
-- TOC entry 4792 (class 2606 OID 127478)
-- Name: orders orders_fk_customers_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_fk_customers_fkey FOREIGN KEY (fk_customers) REFERENCES public.customers(customers_id);


-- Completed on 2026-11-03 15:34:44

--
-- PostgreSQL database dump complete
--

\unrestrict yV3nrjHAfUat65f1LbuJj0DIxeSndRduyBRh9llBORLms2lcdwYavVJuCnEniAD

