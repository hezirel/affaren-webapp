--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE affaren;
ALTER ROLE affaren WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'affaren';
CREATE ROLE backup;
ALTER ROLE backup WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN REPLICATION NOBYPASSRLS;
--
-- User Configurations
--

--
-- User Config "backup"
--

ALTER ROLE backup SET default_transaction_read_only TO 'on';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9
-- Dumped by pg_dump version 15.2

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "affaren" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9
-- Dumped by pg_dump version 15.2

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

--
-- Name: affaren; Type: DATABASE; Schema: -; Owner: affaren
--

CREATE DATABASE affaren WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'fr_FR.UTF-8';


ALTER DATABASE affaren OWNER TO affaren;

\connect affaren

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    card_id character varying(15) NOT NULL,
    card_name character varying(30),
    card_price double precision,
    card_taxe double precision
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- Name: cards_card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cards_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cards_card_id_seq OWNER TO postgres;

--
-- Name: cards_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cards_card_id_seq OWNED BY public.cards.card_id;


--
-- Name: dish_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dish_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dish_seq OWNER TO postgres;

--
-- Name: dishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes (
    dish_name character varying(40),
    dish_ingredients character varying[],
    dish_category character varying(15),
    dish_price double precision,
    dish_active character varying(5),
    dish_id text DEFAULT ('M_'::text || nextval('public.dish_seq'::regclass)) NOT NULL,
    product_taxe double precision
);


ALTER TABLE public.dishes OWNER TO postgres;

--
-- Name: drawer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drawer (
    id integer NOT NULL,
    year integer,
    month integer,
    day integer,
    drawer double precision
);


ALTER TABLE public.drawer OWNER TO postgres;

--
-- Name: drawer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drawer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drawer_id_seq OWNER TO postgres;

--
-- Name: drawer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drawer_id_seq OWNED BY public.drawer.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    order_title character varying(30),
    order_description character varying[],
    order_status character varying(20),
    order_due_date character varying(20),
    order_due_time character varying(20),
    order_client_name character varying(30),
    order_client_phone character varying(30),
    order_location character varying(20)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_supplier_id integer,
    product_name character varying(50) NOT NULL,
    product_price numeric(6,2) NOT NULL,
    product_taxe double precision NOT NULL,
    product_quantity integer NOT NULL,
    product_barcode character varying(20)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    sale_amount numeric(5,2) NOT NULL,
    sale_payment_methods jsonb NOT NULL,
    sale_user character varying(20) NOT NULL,
    sale_taxes jsonb,
    sale_id integer NOT NULL,
    sale_discount jsonb[],
    sale_year integer,
    sale_month integer,
    sale_day integer,
    sale_timestamp bigint
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Name: sales_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_products (
    product_name character varying(50) NOT NULL,
    product_quantity integer NOT NULL,
    product_price numeric(5,2) NOT NULL,
    product_taxe character varying NOT NULL,
    sale_id integer,
    product_id character varying,
    sale_year integer,
    sale_month integer,
    sale_day integer
);


ALTER TABLE public.sales_products OWNER TO postgres;

--
-- Name: sales_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_sale_id_seq OWNER TO postgres;

--
-- Name: sales_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_sale_id_seq OWNED BY public.sales.sale_id;


--
-- Name: table_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.table_products (
    table_id character varying(10) NOT NULL,
    table_person integer NOT NULL,
    dish_id character varying(10) NOT NULL,
    dish_name character varying(70),
    dish_quantity integer,
    dish_price double precision,
    dish_taxe double precision,
    table_year integer,
    table_month integer,
    table_day integer,
    dish_category character varying(15),
    dish_status character varying(10),
    table_status character varying(10),
    table_number integer
);


ALTER TABLE public.table_products OWNER TO postgres;

--
-- Name: table_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_seq OWNER TO postgres;

--
-- Name: tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tables (
    table_id text DEFAULT ('T_'::text || nextval('public.table_seq'::regclass)) NOT NULL,
    table_year integer,
    table_month integer,
    table_day integer,
    table_status character varying(20),
    sale_id integer,
    table_number integer
);


ALTER TABLE public.tables OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_first_name character varying(15) NOT NULL,
    user_last_name character varying(20) NOT NULL,
    user_email character varying(30) NOT NULL,
    user_password character varying(100) NOT NULL,
    user_is_admin character varying(5) NOT NULL,
    user_token character varying(300) NOT NULL,
    user_role character varying(10)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: cards card_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards ALTER COLUMN card_id SET DEFAULT nextval('public.cards_card_id_seq'::regclass);


--
-- Name: drawer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drawer ALTER COLUMN id SET DEFAULT nextval('public.drawer_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: sales sale_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ALTER COLUMN sale_id SET DEFAULT nextval('public.sales_sale_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (card_id, card_name, card_price, card_taxe) FROM stdin;
c-Bullar x4	Bullar x4	10	5.5
c-Kanelbulle	Kanelbulle	3	5.5
c-Kanel x4	Kanel x4	10	5.5
c-Kardemumbulle	Kardemumbulle	3	5.5
c-Kardemum x4	Kardemum x4	10	5.5
c-Blabärsbulle	Blabärsbulle	3	5.5
c-Blabär x4	Blabär x4	10	5.5
c-Semla	Semla	4	5.5
c-Semlor x4	Semlor x4	15	5.5
c-Café/Thé	Café/Thé	2	5.5
c-Sandwich EMP	Sandwich EMP	6	5.5
c-Bonbon	Bonbon	0.2	5.5
c-Sac	Sac	0.1	5.5
c-Formule sand	Formule sand	10	5.5
c-Saffransbulle	Saffransbulle	3	5.5
c-Saffran x4	Saffran x4	10	5.5
\.


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dishes (dish_name, dish_ingredients, dish_category, dish_price, dish_active, dish_id, product_taxe) FROM stdin;
Boulettes de viande	{boeuf,"pommes de terre",salade,"confiture d'airelles"}	main	16	true	M_1	5.5
Kladdkaka	{chocolat,oeufs,lait,farine}	desert	6	true	M_2	5.5
Poëlée Pytt i Panna	{"Pommes de terre",charcuterie,oeuf,salade,betterave}	main	16	true	M_3	5.5
Assiette saumon	{saumon,"pommes de terre","sauce gravlax"}	starter	8	true	M_5	5.5
Entrée - Plat	{starter,main}	formula	22	true	M_8	5.5
Soupe aux pois cassé/lardons	{"Pois cassés lardons"}	starter	8	true	M_19	5.5
Soupe aux légumes de saison	{"Légumes de saison"}	starter	8	true	M_20	5.5
Pavé de saumon	{"Pommes de terre",saumon,salade,""}	main	18	true	M_21	5.5
Gratin d’aubergines et légumes rôtis	{Aubergines,"légumes rôtis"}	main	16	true	M_22	5.5
Salade de fruits	{Fruits}	desert	6	true	M_23	5.5
Glace vanille coulis baie polaire	{"Glace vanille","coulis baie polaire"}	desert	6	true	M_24	5.5
Assiette de hareng	{"assortiment de 2 harengs","pommes de terre"}	starter	8	true	M_4	5.5
Plat - Dessert	{main,desert}	formula	20	true	M_16	5.5
Entrée - Plat - Dessert	{starter,main,desert}	formula	28	true	M_10	5.5
Entrée - Plat Saumon	{starter,main}	formula	24	true	M_30	5.5
Plat - Dessert Saumon	{main,desert}	formula	22	true	M_31	5.5
Entrée - Plat - Dessert Saumon	{starter,main,desert}	formula	30	true	M_32	5.5
Assiette nordique - Saumon	{Crevettes,saumon}	main	18	true	M_33	5.5
Verre de vin	{Vin}	drink	4	true	M_34	5.5
Plat végétarien	{Légumes}	main	16	true	M_36	5.5
Entrée Veg	{Légumes}	starter	8	true	M_37	5.5
Assiette nordique	{Saumon,hareng}	starter	8	true	M_35	5.5
\.


--
-- Data for Name: drawer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drawer (id, year, month, day, drawer) FROM stdin;
1	2023	2	22	75
2	2023	2	23	84.5
3	2023	2	26	55.5
4	2023	3	1	354
5	2023	3	2	154
6	2023	3	3	425.5
7	2023	3	4	515.5
8	2023	3	5	159.5
9	2023	3	8	151
10	2023	3	9	152
11	2023	3	10	150
12	2023	3	11	158
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, order_title, order_description, order_status, order_due_date, order_due_time, order_client_name, order_client_phone, order_location) FROM stdin;
2	Gräddtarta 10pers	{""}	todo	2023-02-14	15:00	Gunilla	0620269214	pick-up
1	3 x Princesstartor 6 pers	{Gröna,"Ingen text","30 x 3 = 90€"}	picked-up	2023-02-12	11:00	Ingrid	0603436550	pick-up
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_supplier_id, product_name, product_price, product_taxe, product_quantity, product_barcode) FROM stdin;
579	\N	Bowl Set	7.95	20	3	7332462092013
586	\N	Chicken in Egg	3.50	20	16	5420077309052
572	\N	Babybabbel	12.00	20	4	9789146212096
573	169009	Bakform Fettbeständigt papper 50x25mm vit	3.60	20	3	7310275586158
574	605133	Bakplåtspapper 33x42cm Guldhöken	2.50	20	2	7332636000011
575	\N	Bamse Påsk Ägg	4.95	20	13	7393885235227
576	\N	Bliw Blåbär	4.50	20	1	7310618427032
578	\N	Bougeoir	8.00	20	9	5420077305030
581	\N	Candle Holder	4.95	20	1	5737666555449
582	\N	Cartes Dalarhäst	5.00	20	0	7340041916674
583	\N	Cartes Viking	5.00	20	5	7340041916650
584	\N	Cheese Slicer	9.95	20	0	7332462084223
585	\N	Chicken Egg Cup	5.90	20	6	5420077315756
587	\N	Chicken Nest	7.00	20	8	5420077309069
589	\N	CN Tray	29.95	20	1	7340137871887
590	\N	Décapsuleur	6.50	20	6	7340041918272
591	\N	Denna Stora Pannkaksfesten	15.00	20	3	9789175770031
593	\N	Dough Scraper	6.95	20	6	7316830060750
594	606122	Duschcreme Sport 250ml	3.95	20	3	4005900553522
596	\N	Feather	1.20	20	14	7393885235289
598	\N	Flask Sverige	18.95	20	2	7340041914045
600	\N	Hej Kung	10.95	20	1	9789151910284
602	\N	Iron Dalarhäst	3.95	20	0	7350007925435
605	\N	Iron Swedish Wavy Flag	4.80	20	5	7350007921239
607	\N	Knäckformar 240st	3.30	20	4	7312270002749
608	\N	Kor Book	9.95	20	2	9789174430974
609	600676	Kronljus 24cm ø22mm 10-p vit	11.95	20	2	4002911152591
611	605548	Kronljus stearin 20cm ø22mm 10-pack röd	8.90	20	5	7350023011570
614	\N	Linie Aquavit	35.00	20	10	7048351691112
615	\N	Lypsyl	2.70	20	6	5023721950039
617	\N	Magnet	3.95	20	1	7340041911358
618	\N	Magnet	4.95	20	1	7340041913987
619	\N	Magnet	6.50	20	12	7340041917763
620	\N	Magnet	5.95	20	3	7340041911563
622	\N	Mug Dalarhäst	9.95	20	-1	7340041916360
623	\N	Mug Sweden Elg	9.95	20	1	7340041916377
624	\N	Mug Viking	9.95	20	3	7340041916384
626	\N	Påskägg	3.95	20	2	4015594312442
627	\N	Pastry Wheel	4.50	20	2	7316830071152
628	\N	Peluche	19.00	20	1	5420077311970
629	\N	Peluche	19.00	20	1	5420077315077
630	\N	Peluche	19.00	20	0	5420077317323
631	\N	Peluche Cheval	16.00	20	11	5420077312212
632	\N	Peluche Grenouille	37.00	20	3	5420077317293
633	\N	Peluche Ours	16.00	20	6	5420077317354
634	\N	Peluche Ours	29.95	20	1	7331133422296
635	\N	Porte-clefs Élan	3.95	20	6	7350007927224
636	\N	Purity Vodka 40% 0.7L	39.00	20	-4	7350043200015
637	607025	Såpa citron 750ml	4.40	20	5	7310610021450
639	607026	Såpa gul 750ml	4.50	20	3	7310610021467
640	\N	Serviette	3.50	20	5	7340119803561
642	\N	Serviette	3.50	20	8	7340119805695
643	\N	Serviette	3.50	20	-1	7340119808900
644	\N	Serviette	3.50	20	9	7340119808917
645	\N	Serviette	3.50	20	10	7340119808924
646	\N	Serviette	3.50	20	5	7340119812143
647	\N	Serviette	4.50	20	10	5906360110579
648	\N	Serviette	4.50	20	10	5906360577976
649	\N	Serviette	4.50	20	10	5906360777703
650	\N	Serviette	4.50	20	10	7340119800133
651	\N	Serviette	4.50	20	10	7340119803387
652	\N	Serviette	4.50	20	1	7340119803394
653	\N	Serviette	4.50	20	5	7340119803530
654	\N	Serviette	4.50	20	4	7340119803547
588	\N	CN Mini Tray	6.50	20	4	7340137875595
568	\N	Angel Chimes Brass	18.95	20	10	5688154478019
569	\N	Angel Chimes Silver	18.95	20	4	5688154478033
580	\N	Butter Spreader	6.95	20	4	7316830652917
599	\N	Guirlande Drapeau Suede	1.95	5.5	15	5737666552646
606	\N	Julgrans Ljus Vit 20sr	12.00	5.5	3	7392709001109
595	\N	Bird metal stick	3.50	20	8	4022949119717
603	\N	Iron Swedish Flag	4.80	5.5	3	7350007928191
656	\N	Serviette	4.50	20	10	7340119805183
657	\N	Serviette	4.50	20	10	7340119805190
749	\N	Skippers pipes	1.00	5.5	2	7310350133567
658	\N	Serviette	4.50	20	10	7340119807132
616	\N	Magnet	3.50	20	5	7340041913031
612	900900	Kronljus stearin 20cm ø22mm vit	24.95	5.5	5	7301002408676
601	606268	Hudsalva Idomin 50g	3.95	20	14	7310610011345
577	\N	Blockljus	13.80	20	7	7321011812301
604	\N	Iron Swedish Logo	3.70	20	4	7340041913598
621	606447	Marschaller med lock ø103mm brinntid 8tim	3.95	20	4	6410405203724
659	\N	Serviette	4.50	20	10	7340119808788
660	\N	Serviette	4.50	20	10	7340119808795
740	\N	Cloetta guld	2.00	5.5	17	7310040018341
597	\N	Flaggpunsch 26% 0.5L	28.00	20	21	7312041588021
655	\N	Serviette	4.50	20	1	7340119803783
641	\N	Serviette	3.50	20	-3	7340119803707
625	\N	O.P. Anderson	35.00	20	10	5710778001356
661	\N	Serviette	4.50	20	10	7340119808801
662	\N	Serviette	4.50	20	10	7340119809495
663	\N	Serviette	4.50	20	8	7340119809501
665	\N	Serviette Elg	4.50	20	9	7340119804612
666	\N	Sheepskin Long Wool Ivory	120.00	20	1	9325021010656
667	\N	Sheepskin Long Wool Single Rug Lime	120.00	20	1	9325021034515
668	\N	Sheepskin Long Wool Single Rug Rose	120.00	20	1	9325021010793
669	\N	Sheepskin Long Wool Single Rug Teal	120.00	20	1	9325021034522
670	\N	Skåne Akvavit	35.00	20	6	5710778002568
671	\N	Snaps	3.50	20	85	\N
672	\N	Snowball Big	34.95	20	1	7391533673537
673	\N	Snowball Medium	29.95	20	-3	7391533673506
674	\N	Snowball Small	24.95	20	3	7391533678006
675	\N	Sticker	2.00	20	4	7340041915295
676	\N	Sticker	3.00	20	10	7331133071111
677	\N	Sticker	3.00	20	10	7331133191161
678	\N	Sticker	1.85	20	9	7331133150014
679	\N	Stickers	0.95	20	10	5737666591218
681	\N	Stickers	3.95	20	4	7331133195039
682	\N	Stickers Dalarhäst	4.00	20	7	7340041915370
683	\N	Stockholms Bränneri Pink Gin	40.00	20	0	7350015330030
684	724727	Svampduk Classic mix 4st	4.50	20	-1	7391704800144
686	\N	Sverigealmanackan 2022	14.95	20	3	7350053960077
687	\N	Sverigealmanackan Familj	13.95	20	5	7350053960015
688	\N	Swedish Flag 150*90cm	15.95	20	4	7350007925008
691	\N	Tattoos	2.95	20	2	4400344400348
693	\N	Vandra i Provence	39.00	20	5	9789188779113
696	\N	Vid Foten Av Montmartre	20.00	20	7	9789113073613
698	\N	Vikings Book Fr	16.00	20	1	9789163798894
764	\N	Sun maid russin	6.95	5.5	8	41143024324
772	\N	Abba citronsås	5.95	5.5	3	7311171006221
815	\N	Peluche	24.50	20	1	7332458983288
680	\N	Stickers	2.95	5.5	17	7340041915271
211	\N	Iskonfekt Glutenfri	6.95	5.5	6	4008601261802
750	\N	Norrlands guld	5.50	5.5	2	7310400003154
782	\N	Havregryn 1.5kg	4.95	5.5	3	7310130321085
790	\N	Cheez doodles 225g	5.50	5.5	11	7340005403332
807	\N	Candle holder	4.70	5.5	10	5737666555340
816	\N	Peluche elan	32.95	20	1	7340041914151
294	126339	Lantchips lättsaltade	4.95	5.5	5	7392659002003
783	\N	Rågfras	8.95	5.5	3	7311171008430
817	\N	Sunglasses Swedish flag	6.95	20	3	7350007927033
775	\N	​ Keso cottage cheese blåbär	4.95	5.5	1	7310865074362
792	\N	Saltlakritskola	4.95	5.5	4	7394279020023
809	\N	Hanging firework	14.50	5.5	6	7391482049711
818	\N	Swedish jersey	24.95	20	9	7340041910627
735	\N	Serviettes	3.95	20	8	4037698049604
808	\N	Blockljus	5.00	5.5	8	7392709005169
699	\N	Yes Original	9.95	20	-1	4015600444419
758	\N	Mini croustades	7.50	5.5	7	7350137710017
791	\N	Estrella saltade chips	4.20	5.5	11	7310532106549
766	\N	Semper pepparkakor GF	5.90	5.5	10	7310100565235
690	118906	Tändstickor 8-Pack	3.95	20	12	7310680022517
694	752382	Värmeljus 59mm Maxi 10h	12.95	20	5	7321010006107
789	\N	Measuring jug 0.1L	4.50	5.5	7	7392244123014
412	\N	Polka Grisar	3.95	5.5	0	7310350117888
765	\N	Semper digestivekex GF	6.90	5.5	5	7310100566638
776	\N	Keso cottage cheese ananas apelsin 	4.95	5.5	1	7310865074355
785	\N	Yes original 1050mL	16.95	5.5	1	4015600402877
810	\N	Reindeer skin	195.00	20	6	7090027101159
819	\N	Barnförkläde	17.00	20	1	7394094176936
767	\N	Marsan vaniljsås	3.50	5.5	4	7350126083528
759	\N	Slotts sena original	6.95	5.5	6	8717163867891
664	\N	Serviette	4.50	20	8	7350022011397
475	102840	Sandwich franska örter	2.10	5.5	1	7300400127394
781	\N	Pepparkaksmix	5.95	5.5	7	7310130155512
744	\N	BBQ oil original	6.50	5.5	10	7312490059004
155	\N	Fullkornsvälling 1 år	14.95	5.5	-7	7310100684370
802	\N	Haribo nappar cola-sur	1.50	5.5	5	5701090076108
784	\N	Karen volf digestive	2.95	5.5	15	5705907000010
689	118905	Tändstickor	3.95	20	0	7310680023118
801	\N	Gott & blandat fizzy pop	2.95	5.5	11	7310350130061
685	\N	Svenska Nubbar x10	35.00	20	15	6412700066509
695	900907	Värmeljus vegetabiliskt fett ø39mm 6h	12.95	5.5	17	5024333237181
741	\N	Estrella linschips sourcream onion	3.95	5.5	7	7310532112236
753	\N	Haribo nappar sur	1.50	5.5	1	4001686313916
800	\N	Gott & blandat bär & frukt	2.95	5.5	11	7310350133758
751	\N	Haribo nappar cola	1.50	5.5	6	5996379193731
498	404325	Skogaholmslimpa skiv Tina och servera	6.95	5.5	-5	7314875011010
757	\N	Falu Chia & Havssalt rågrut	5.95	5.5	6	7300400482578
734	\N	Loka mango lime	2.00	5.5	3	7310401047416
78	141978	Daim dubbel	2.00	5.5	12	7310511257507
692	602711	Tvålull 100g Bra miljöval	4.95	20	-1	7310034230100
377	184869	Nyponsoppa original	5.95	5.5	-8	7310470063096
752	\N	Haribo nappar frukt	1.50	5.5	0	5996379193724
745	\N	Brakes lingonsylt	7.50	5.5	6	7301002401110
754	\N	Grötris	4.50	5.5	2	7330671014574
794	\N	Hasselnötskola	4.95	5.5	1	7394279020016
803	\N	Salta grodor	4.95	5.5	2	7394279019171
811	\N	Paper star 75cm	24.95	20	3	7391482033826
820	\N	Barnförkläde	17.00	5.5	3	7394094176929
472	\N	Sandwich	6.00	5.5	-76	\N
755	\N	Önos äppelmos lågkalori	5.95	5.5	7	7310770215485
761	\N	Felix klassisk rödkål	5.50	5.5	8	7310240064247
769	\N	Hovmästarsås	4.50	5.5	2	5755325
778	\N	Hushållsost	17.95	5.5	6	2340374705193
795	\N	Nygårda julmust 33cl	2.00	5.5	1	7310401001661
804	\N	Julskum	2.95	5.5	8	7310350131112
812	\N	Flower pot	3.00	20	6	3700686461290
821	\N	Iron Stockholm vasa	4.80	20	15	7340041913543
9	\N	Ahlgrens Bilar Fruktkombi	2.95	5.5	-2	7310350132904
19	133357	Äpplemos	4.95	5.5	3	7310090301882
40	\N	Blossa Glögg Lätt 75cL	10.95	5.5	5	5710778002148
738	\N	Marabou chocolat au lait	1.95	5.5	10	7310510002122
747	\N	Nyåkers småskorpor	29.90	5.5	1	7317066311005
41	\N	Bonbon pièce	0.20	5.5	12	\N
54	\N	Bulle	3.00	5.5	-833	\N
379	\N	Oboy 1.1kg	13.95	5.5	1	7622300248987
700	\N	Rostad lok	8.50	5.5	7	8717278750798
5	\N	Ädelost 175g	6.95	5.5	3	7311440016364
6	206202	Ädelost Grädd 36%	6.80	5.5	4	7311878172335
7	\N	Agave Sirap	9.95	5.5	5	3088542506508
12	111910	Aladdin	28.00	5.5	3	7310510002504
14	\N	Ansjovis 860g	14.95	5.5	5	7311170022758
15	\N	Ansjovis Kryddad Sill	4.10	5.5	4	7311171004111
17	150405	Apelsinskal kanderat	4.50	5.5	3	5701073062708
18	192859	Äppelcidervinäger	5.50	5.5	3	7310155507495
20	\N	Aqua dor	2.00	5.5	5	5703828003288
22	\N	Arla Ko Präst 31%	17.95	5.5	5	2340415206948
23	\N	Ärtsoppa 250mL	4.50	5.5	7	7310390001390
27	212453	Baconost 17% tub	7.95	5.5	8	7311441061608
28	110051	Bakpulver ögon	3.95	5.5	-1	6416453068810
31	123767	BBQ-sås Black Garlic & Chili	11.00	5.5	5	7392031501100
32	109192	Bearnaisesås 3-p pulver	3.95	5.5	-1	7322550092001
33	206500	Bearnaisesås chili	4.40	5.5	8	7350042720132
34	\N	Beer Cheese Ilchester	14.95	5.5	3	5014442405045
35	117943	Bikarbonat påse	1.95	5.5	5	7311311004537
38	\N	Blandsaft Hallon BOB	7.95	5.5	2	7310090345138
39	209426	Blodpudding	4.50	5.5	0	7310943092523
43	112632	Bostongurka original	8.95	5.5	0	7310240150834
44	\N	Brakes Värmkorv	15.50	5.5	2	7330671013164
45	\N	Brännvinnssill	4.10	5.5	9	7350126082224
47	\N	Bridge	3.95	5.5	-4	7310040052284
48	\N	Brödkryddor	1.70	5.5	4	7311311005046
49	\N	Brun Farin Strö	3.95	5.5	5	7310340114033
50	192622	Bruna bönor Sverige	4.95	5.5	5	7312787703887
53	\N	Bullar X4	10.00	5.5	-535	\N
56	158331	Center rulle	2.20	5.5	5	7310040021341
57	124013	Chai Grönt FT EKO	15.50	5.5	5	7350054815109
58	103567	Champis BRK	2.00	5.5	-14	7310401007144
59	120269	Champis PET	2.50	5.5	5	7310401000367
61	\N	Cheez Cruncherz Hot	4.10	5.5	4	7340005403226
777	\N	Rökt skinka	4.95	5.5	5	7300200287007
64	192563	Chili Con Carne	7.95	5.5	5	7310240064346
65	116945	Chilisås glasflaska	5.95	5.5	8	5900783007867
68	124592	Chips Tryffel	2.70	5.5	5	7350045591500
786	\N	Zingo apelsin	2.00	5.5	1	7310070005298
760	\N	Slotts stark senap tub	5.95	5.5	0	8714100751374
25	109572	Ättika 24%	3.95	5.5	0	7320081190302
16	111448	Apelsinkrokant Chokladkaka	5.95	20	-7	7310510001231
60	\N	Cheez Cruncherz	4.95	5.5	15	7340005403448
793	\N	Havssaltskola	4.95	5.5	4	7394279020030
3	122889	100 Frön & Havssalt	4.95	5.5	12	7300400482165
4	\N	5-minuters Sill	7.95	5.5	-3	7350126082712
72	117946	Citronsyra påse	3.60	5.5	5	7311311004285
73	\N	Coca-Cola 33cL	2.00	5.5	15	5449000214911
74	122462	Coca-Cola Original BRK	2.00	5.5	20	5000112637922
75	122470	Coca-Cola zero BRK	2.00	5.5	24	5000112637939
76	\N	Cool Cola Skalle	2.95	5.5	12	7393077181738
813	\N	Flower pot	10.00	20	8	3701420421983
46	700638	Bregott 75 % normalsaltat	7.20	5.5	11	7310860005774
21	719573	Arboga pastej	4.20	5.5	8	7310941803220
746	\N	Kung Oscar pepparkakor	5.95	5.5	-11	7312220655803
26	101901	Ättikssprit 12%	4.50	5.5	-3	7310300011020
67	102100	Chips Sourcream & onion	1.20	5.5	-3	7310531027906
737	\N	OP Anderson pack x12	43.00	20	28	6412700057521
55	213232	Bullens Pilsnerkorv	6.95	5.5	7	7300203296006
768	\N	Vaniljsocker	3.95	5.5	2	5701259728589
13	\N	Amerikansk Dressing Original	5.40	5.5	2	7311440052157
11	124265	Ahlgrens bilar Sursockrade	2.95	5.5	81	7310350132898
592	729595	Diskborste classic mix	1.95	20	11	7330671012600
29	101507	Ballerina kladdkaka	4.50	5.5	8	7310521397712
779	\N	Oatly havre dryck	4.50	5.5	1	7394376615733
787	\N	Butter spreader	5.65	5.5	5	7316830071008
81	\N	Delikatess Knäckebröd	4.65	5.5	11	7300400117968
83	112296	Dextro Energy Lemon Sticks	2.60	5.5	2	87111781
85	122797	Din Harmoni Vallmofrö & Havssalt	6.50	5.5	5	7300400482233
86	121798	Din Stund Chia & Havssalt	6.50	5.5	5	7300400482691
87	\N	Dinkel Mjöl	6.95	5.5	3	7310130011405
89	102069	Dipmix Dill	1.50	5.5	5	7310531037103
90	102073	Dipmix Holiday	1.95	5.5	10	7310531037905
91	\N	Dipmix Hot Holiday	1.95	5.5	14	7310532130612
98	\N	Dippmix Sweet Chili	1.95	5.5	1	7340005404209
99	\N	Dippmix Taco	1.95	5.5	-1	7340005404247
100	\N	Dippmix Vitlök	1.95	5.5	-7	7340005404254
102	\N	Drage Egg Mini	3.50	5.5	13	7310350132591
103	\N	Egg Slicer	4.85	5.5	2	7332462094017
104	\N	Ekologiska Blandade Bönor	3.75	5.5	1	7350002403440
105	\N	Ekologiska Rödbettor	8.95	5.5	8	7310240151107
107	\N	Extra White	3.00	5.5	7	4009900527897
108	124292	Extra White bubblemint	3.20	5.5	5	4009900519762
110	124739	Fäbodknäcke Frön & Havssalt	11.60	5.5	5	7312080003646
114	122786	Fanta Exotic PET	2.50	5.5	4	90490705
115	107778	Fast vardagsblomsterhonung	10.80	5.5	5	7350071870082
116	\N	Fazer Chocolate Dumle	2.95	5.5	5	6416453015739
121	\N	Fil Citron	4.50	5.5	3	7310867000710
124	\N	Filmjölk Jordgubb	4.95	5.5	10	7310865088222
126	\N	Finkornig Rom Caviar	6.50	5.5	2	7311171007907
129	\N	Fiskbuljong	3.75	5.5	6	8714100786710
134	\N	Fiskbullar Räksås	5.40	5.5	2	7311170041353
135	423887	Fiskgratäng Dill MSC	9.50	5.5	5	7310500038803
136	\N	Fizzypop	1.50	5.5	22	7310350110131
138	\N	Florsocker	3.50	5.5	4	5701259100781
139	\N	Formule sandwich	10.00	5.5	-163	\N
141	\N	Frasvåfflor	3.50	5.5	-2	7310470030203
142	\N	Frödinge Blåbärspaj	8.95	5.5	8	7310890201191
145	407748	Frökusar fryst Tina och servera	6.50	5.5	3	7314879190018
146	\N	Froosh Clean Green	3.50	5.5	2	7350020727726
149	\N	Frozen Bun	1.50	5.5	54	\N
118	124791	Festis Apelsin EKO BRIK	2.00	5.5	26	73165637
150	\N	Frozen Bun X4	5.00	5.5	-61	\N
152	108258	Fruktgröt Päron Banan 8 mån osockrad	10.70	5.5	5	7312170029174
153	\N	Fruktmusli GF	10.95	5.5	4	7311143200107
154	141787	Fruxo tablettask	0.90	5.5	5	7310780002365
156	\N	Fullkornsvälling 8 mån	13.95	5.5	3	7310100683953
24	208770	Åseda Gräddost 38%	17.95	5.5	1	5711953018275
130	117457	Fiskbuljong 6-pack	4.60	5.5	4	8714100284261
805	\N	M&m’s 100g	2.95	5.5	7	5000159513760
571	\N	Antikljus x8	10.00	5.5	18	7350023010641
42	188265	Boston gurka	5.50	5.5	2	7310240050844
66	115752	Estrella chips sourcream & onion	4.20	5.5	-3	7310532106464
69	209297	Chokladpudding	3.95	5.5	-1	7310470018263
770	\N	Finkornig rom röd	9.95	5.5	9	7350126083108
151	158076	Frukt & Mandel Chokladkaka	3.10	5.5	-7	7310511217303
158	120105	Geléhallon	4.80	5.5	5	6411401036699
159	213021	Gifflar kanel	6.95	5.5	2	7311070006209
125	208415	Filmjölk LF Eko	6.50	5.5	6	7310865094117
123	\N	​Filmjölk hallon/blåbär	5.50	5.5	6	7310865088215
88	191813	Dinkelmjöl fullkorn	5.95	20	5	7310130011412
163	201321	Gräddfil 12%	2.95	5.5	27	7310865004703
166	\N	Grängesberg Jul Lättöl 33cL	3.50	5.5	16	7310401032641
168	\N	Gravad Lax 350g	24.95	5.5	11	2357552803473
169	\N	Gravad Lax 350g Korshags	24.95	5.5	6	2357552803565
170	\N	Gravad Lax Skivad 350g	24.95	5.5	7	2357552803527
173	121299	Grillkrydda	18.90	5.5	4	7311311014024
174	121295	Grillkrydda	3.95	5.5	5	7311311014192
175	\N	Gröna Kulor Chokladpraliner	9.95	5.5	5	6416453071339
176	180119	Grönsaksfond 0.8% salt	9.80	5.5	5	7322550052708
796	\N	Herrljunga cider 1L	3.95	5.5	0	7312720021825
52	109193	Brunsås 3-pack	4.65	5.5	-2	7322550092032
62	122121	Cheez doodles 35g	1.50	20	-10	7300400382205
143	\N	Frödinge Kladdkaka	9.95	5.5	1	7310890203508
95	116975	Dippmix Dill & Gräslök	1.95	5.5	-2	7340005404223
77	119889	Daim Chokladkaka	3.10	5.5	0	7622201056629
70	121287	Citronpeppar glasburk	3.95	5.5	-7	7311311016073
36	184868	Blåbärssoppa original	5.95	5.5	-4	7310470063195
97	116981	Dippmix Ranch	1.95	5.5	-13	7340005404261
120	124790	Festis Päron EKO BRIK	2.00	5.5	45	73165644
119	124811	Festis Hallon EKO BRIK	2.00	5.5	55	73165651
92	112792	Dipmix Ranch	1.95	5.5	8	7310532131428
96	116982	Dippmix Fresh Island	1.95	5.5	0	7340005404278
109	190754	F-müsli Guld nöt	6.95	5.5	3	5701029160823
762	\N	Owl smörsmak popcorn	5.95	5.5	7	7340005405244
80	742357	Delicatoboll singel	1.50	5.5	30	7315360010754
178	\N	Grythyttan 50cL	2.00	5.5	-37	7310401003825
183	726271	Halloumi	7.40	5.5	5	7331494128035
184	123738	Hamburgerdressing Original	7.95	5.5	5	7392005801502
186	\N	Havre Välling 6 mån	13.95	5.5	0	7310100683533
187	116430	Havrefras	11.20	5.5	5	7311171008423
189	147415	Havregryn påse	5.95	5.5	14	7310130321122
190	185873	Havreknäcke 280 gr	6.90	5.5	5	7300400121859
191	113329	Havreknäcke GF LF	5.95	5.5	4	7310100600462
192	\N	Hela Filéer Sill	7.95	5.5	0	7311170014111
194	123733	Hellmann’s American Style Yellow mustard senap	6.80	5.5	5	8714100695876
195	\N	Helsingborg Lager 5% 33cL	5.00	5.5	-6	7350060230019
196	\N	Herrljunga Cider Alkoholfri 1L	4.65	5.5	6	7312720022235
197	\N	Herrljunga Julmust 33cL	2.00	5.5	15	7312720042271
198	\N	Hjortonssalt	1.20	5.5	19	7311311004339
199	109201	Hollandaisesås 3-pack	3.95	5.5	5	7322550092018
202	\N	Ideal Makaroner	4.20	5.5	8	7310130416170
208	\N	Inlagd Sill 500g	8.30	5.5	5	7311171006504
209	186050	Inlagd sill bit MSC	4.10	5.5	-2	7311171004050
210	106670	Inlagd sill MSC	7.95	5.5	4	7311171007938
212	\N	Jokk Lingon 1L	5.25	5.5	6	7310861008804
213	\N	Jordgubb Kräm	4.50	5.5	3	7310470065021
215	\N	Julmust Apotekarnes 0.5L	2.50	5.5	4	7310070059208
216	\N	Julmust Apotekarnes 1.4L	3.95	5.5	-8	7310070151209
217	\N	Julmust Apotekarnes 33cL	2.00	5.5	22	7310070765802
218	\N	Julmust Apotekarnes Sockerfri 0.5L	2.50	5.5	15	7310070733856
219	\N	Julmust Apotekarnes Sockerfri 1.4L	3.95	5.5	5	7310070151308
221	109837	Kaffe mellanrost Fair brygg EKO	14.30	5.5	5	7310050001777
224	201383	Kalles Original MSC	4.50	5.5	-141	7311170031118
225	192242	Kalles Randiga MSC	4.50	5.5	-24	7311171001943
227	\N	Kallrökt Lax 350g	24.95	5.5	11	2357553003421
228	\N	Kallrökt Lax 350g Korshags	24.95	5.5	10	2357553003612
229	\N	Kallrökt laxfilé 350g	24.95	5.5	12	2357553003377
230	180120	Kalvfond 0.8% salt	9.50	5.5	5	7322550052715
231	\N	Kanel	1.50	5.5	-3	7311311004179
233	109203	Kantarellsås 3-pack	5.80	5.5	5	7322550092216
234	180077	Kantarellsoppa	4.70	5.5	5	7322550031833
235	\N	Kardemumma Glasburk	6.95	5.5	6	7311311015205
237	123239	Karl Fazer Mjölkchoklad	2.70	5.5	-8	6416453015746
157	\N	Gammeldags enrisrökt korv	8.95	5.5	6	7300202175005
111	182922	Falu Råg-rut Knäckebröd	5.95	5.5	5	7300400114783
222	114722	Kaffe skånerost brygg RA	12.95	5.5	13	7310731101734
140	\N	Fransk Lök Sill	4.95	5.5	-1	7350126081708
147	\N	Froosh Mango Orange	4.50	5.5	17	7350020720017
180	184519	Gulaschsoppa Österrikisk	7.95	5.5	3	7310240064377
137	117562	Flädersaft	9.95	5.5	5	7310770548583
205	117949	Ingefära malen påse	1.95	5.5	3	7311311004551
240	141794	Kexchoklad stycksak	0.50	5.5	1	7310040027565
241	124654	Kexchoklad Vegan 40g	2.10	5.5	5	7310350132669
242	119452	Kick Original	0.80	5.5	-8	5700417006804
243	110409	Kick Sea salt	0.80	5.5	-43	7310350117116
244	120814	Kick Sea Salt Caramel	0.80	5.5	-5	7310350129140
245	120342	Kina gul snacks	2.80	5.5	5	6416453039131
193	\N	Hela Rödbetor	6.95	5.5	16	7310240051339
232	117971	Kanel malen påse	5.95	5.5	3	7311311004803
223	111477	Kakao ögon	6.95	5.5	2	6416453062320
238	114885	Kärnvetemjöl	5.95	5.5	14	7310130006043
246	410957	Kladdkaka vegansk tina och servera	8.90	5.5	5	7310890203652
252	108784	Knäcke surdeg flerkorn	4.65	5.5	20	7300400128926
256	\N	Kockens Saffran 0.5g	3.95	5.5	20	7310700814207
260	\N	Kron Jäst Färsk	1.00	5.5	15	73500346
264	117972	Kryddpeppar hel påse	5.60	5.5	5	7311311004797
161	\N	Gott & blandat Salt	2.95	5.5	23	7310350504909
177	\N	Gröt Äpple & Blåbär	3.95	5.5	-19	7310100690708
200	181103	Hovmästarsås glasburk	4.50	5.5	-15	7310155800251
179	192623	Gula ärtor kapsel	3.95	5.5	-2	7312787703627
133	109393	Fiskbullar i hummersås MSC	6.95	5.5	6	7311170041049
220	120208	Kaffe mellanrost brygg	12.95	5.5	-4	8711000530085
131	109392	Fiskbullar i buljong	6.95	5.5	-1	7311170041018
236	\N	Kardemumma Malen 18g	3.95	5.5	9	7311311004353
132	109394	Fiskbullar i dillsås	6.95	5.5	-9	7311170041346
214	124188	Jordnötsringar	3.50	5.5	3	7310532114001
106	133794	Emser	2.25	20	24	6411401035562
128	184356	Finn Crisp Original	4.95	5.5	-49	6410500090014
201	183957	Husman	3.95	5.5	-19	7300400118415
160	750683	Gott & Blandat Original	2.95	5.5	13	7310350504305
82	183959	Delikatess Sesam knäcke	5.95	5.5	2	7300400121644
258	192320	Köttsoppa m grönsaker	5.95	5.5	1	7310500025285
188	\N	HavreGryn Fiber	5.95	5.5	10	7310130321184
162	107592	Gott & Blandat Supersur	2.95	5.5	14	7310350116256
185	\N	Havre Fras	8.95	5.5	3	7311171008386
181	162698	Guld Marie	2.50	5.5	-8	7310521050204
265	\N	Kung Gustaf Sardiner	4.50	5.5	6	7311170061092
266	145580	Kung Oscar Välkryddade Pepparkakor original	5.95	5.5	3	7310521058507
267	\N	Kvibille Ädelost	5.95	5.5	7	7311878172458
270	\N	Kvibille Cheddar 6 månader	17.95	5.5	8	2340302105057
271	180121	Kycklingfond 0.8% salt	9.50	5.5	5	7322550052722
272	\N	Lagrad Julmust Nygårda 33cL	2.00	5.5	14	7310401004778
280	124247	Läkerol Raspberry Licortice Big	4.70	5.5	5	7310350132805
284	118456	Lakritsi Lemon	1.00	5.5	-1	6416453061354
285	121205	Lakritsi Mint	0.60	5.5	5	6416453061446
286	\N	Lakritsi Original	1.00	5.5	-2	6416453061361
287	118482	Lakritsi Raspberry	0.70	5.5	5	6416453061385
288	118459	Lakritsi Salmiak	1.00	5.5	-1	6416453061392
289	\N	Lakritsi Soft Original	4.50	5.5	12	6416453061200
290	\N	Laktosfri Filmjölk Skånemejerier	4.95	5.5	6	7310867512466
291	745125	Lantchips Gräddfil	1.40	5.5	5	7392659005721
292	126350	Lantchips Gräddfil	4.50	5.5	3	7392659002102
293	\N	Lantchips Gräddfil Lök	4.50	5.5	8	7392659002300
296	\N	Lättsaltade Lantchips 40g	1.95	5.5	16	7392659005714
297	212360	Laxfilé kallrökt skivad. 150 g	11.30	5.5	5	7393423001154
301	\N	Linschips Dill & Gräslök 110g	3.95	5.5	6	7310532112601
304	\N	Lohmanders Bearnaise	5.95	5.5	1	7313160004744
307	\N	Loka Citron 33cL	2.00	5.5	-4	7310401007113
308	123549	Loka citron PET	1.90	5.5	15	7310400020731
309	115526	Loka Crush Hallon BRK	1.50	5.5	4	7310401021010
310	\N	Loka Crush Päron 33cL	2.00	5.5	4	7310401020952
311	124803	Loka Fläder Päron PET	1.90	5.5	38	7310401043050
312	\N	Loka Jordgubb Granatäpple PET	2.50	5.5	43	7310401042978
313	103252	Loka naturell BRK	2.00	5.5	17	7310401007120
315	123509	Loka naturell PET	2.50	5.5	11	7310400020182
317	\N	Loka Päron	2.50	5.5	6	7310401015965
318	\N	Loka Päron 33cL BRK	2.00	5.5	20	7310401007137
319	\N	Loka Solig Citrus Pet	2.50	5.5	2	7310401036892
321	186047	Löksill bit MSC	4.10	5.5	-5	7311171004067
322	186006	Löksill fransk bit MSC	4.10	5.5	5	7311171004128
323	106671	Löksill MSC	8.30	5.5	5	7311171006511
326	115300	Mandelägg	5.00	5.5	5	5774540959146
327	\N	Mandelägg Anthon Berg	2.95	5.5	15	5774540959245
165	114889	Grahamsmjöl	6.95	5.5	-4	7310130006067
182	\N	Hallon/Lakrits Skalle	2.50	5.5	-1	7393077181653
298	\N	Le Suédois Pour Les Nuls	7.95	5.5	-13	9782412042694
305	\N	Loka Citron	2.00	5.5	13	7310401046686
206	\N	Inlagd Sill	4.95	5.5	-22	7350126081616
329	116776	Mandelmassa	4.95	5.5	5	5709521036226
263	\N	Kryddpeppar	2.25	5.5	4	7311311004360
259	\N	Krögarens	5.95	5.5	14	7300400121187
324	\N	Löksill Stor	8.95	5.5	4	7350126081791
269	\N	Kvibille Cheddar	17.95	5.5	6	2340302105293
306	\N	Loka Citron 1.5L	4.00	5.5	24	7310401000053
331	\N	Mangoraja	6.95	5.5	8	7313161404987
332	123899	Mannagryn	5.95	5.5	4	7310130010590
335	\N	Marabou Co-co	1.95	5.5	5	7310511251406
336	\N	Marabou Darkmilk Chocolate Roasted Almonds	3.10	5.5	3	7622210655745
337	\N	Marabou Dröm Krisp	3.10	5.5	5	7622210059956
339	123633	Marabou Havssalt	5.90	5.5	5	7622201099374
341	\N	Marabou Ming Choco	2.95	5.5	4	7310510001804
345	\N	Marabou Premium Fin 70%	4.95	5.5	3	7622300544010
348	107411	Mariestad alkoholfri ENGL	2.50	5.5	13	7310401009551
351	192597	Mästarmatjes i bit MSC	5.95	5.5	-6	7311170012094
352	\N	Matjessill Hela Filéer	5.95	5.5	-1	7350126082866
354	\N	Mer Jordgubbe	2.00	5.5	20	90375897
355	\N	Mer Päron	2.00	5.5	4	54490475
356	\N	Mer sockerfri lingon	2.50	5.5	51	5000112647754
357	207014	Messmör Original 5%	3.50	5.5	2	7313160002443
262	121743	Kronjäst matbröd färsk	2.00	5.5	3	73500391
302	\N	Ljus Sirap	4.50	5.5	4	7310340464435
273	112816	Läkerol Bon Bons	2.10	5.5	-19	7310350118540
167	\N	Gravad Lax 150g Korshags	13.95	5.5	17	2357552701502
275	112811	Läkerol Cassis	2.10	5.5	-48	7310350118465
282	112807	Läkerol Salvi	2.10	5.5	-41	7310350118595
239	\N	Kex Chocklad	2.00	5.5	-33	7310350118342
251	108671	Knäcke rund normalgräddat	7.95	5.5	-4	7312082001015
226	\N	Kallrökt Lax 150g Korshags	13.95	5.5	40	2357552901506
303	\N	Löfbergs Mellanrost	12.95	5.5	10	7310050001142
295	121236	Lapin Kulta 3.5% BRK	3.50	5.5	25	6413600091226
325	\N	Mandel biskvier	3.50	5.5	12	7310040094727
204	207322	Oatly ikaffe	4.80	5.5	0	7394376616037
314	\N	Loka Naturell Brk	2.00	5.5	-1	7310401046693
316	\N	Loka Päron	2.00	5.5	11	7310401046709
277	\N	Läkerol Licorice Seasalt	2.10	5.5	-20	7310350118526
359	116749	Micropopcorn Smör 3 pack	4.85	5.5	0	7310532160787
360	106844	Mini krustader	5.90	5.5	21	40029180505
361	\N	Mjölk Choklad Cookies	5.95	5.5	3	7622300589882
364	\N	Munkens Svarta	14.95	5.5	6	2340343605011
365	\N	Munkens Svarta	14.95	5.5	2	2340343605035
366	\N	Munkens Svarta	14.95	5.5	10	2340343605400
367	\N	Nejlika	1.95	5.5	-3	7311311004599
368	107518	Never stop påse	3.95	5.5	5	7310510001729
373	104809	Norrlands Guld 3.5 % BRK	17.20	5.5	5	7310402006795
376	725566	Nyponsoppa klassisk	11.95	5.5	5	7310470013558
380	123848	Oboy original påse	6.95	5.5	2	7622210664181
381	\N	Odense Nougat	5.95	5.5	4	5709521027644
382	\N	Onos Apelsinmarmelad	5.95	5.5	5	73104711
383	\N	Onos Hallonsylt	5.95	5.5	5	7310770221424
384	192335	Örtsalt Herbamare EKO	7.70	5.5	10	7610313412143
385	211852	Ostkaka	6.50	5.5	3	7310890100333
387	\N	OWL Hot Ranch	4.10	5.5	11	7340005405374
388	111932	Paradis	24.80	5.5	2	7310510002566
390	\N	Pärsons Rökt Skinka	6.50	5.5	8	7330797088794
391	\N	Påskeskum påse	2.20	5.5	14	7310350131433
392	\N	Påskmust	2.50	5.5	13	7310070001146
393	\N	Påskmust	3.95	5.5	2	7331157001088
394	121600	Penne glutenfri	5.95	5.5	4	8028833005735
397	201966	Pepparkaksdeg kyld	7.30	5.5	5	7317062055002
398	117962	Pepparkakskrydda påse	2.95	5.5	3	7311311004391
400	119487	Pim Pim	1.50	5.5	11	7310350109142
403	\N	Plopp	3.50	5.5	9	7310040020504
404	\N	Plopp	1.00	5.5	-1	7310040020320
406	163080	Pofiber	4.95	5.5	5	7310100857200
408	\N	polarklämma Kalkon	3.00	5.5	5	7311800888006
409	409604	Polarklämma renkött	3.00	5.5	-10	7311800008602
410	\N	Polarklämma Skinka	3.00	5.5	5	7311800008626
411	124482	Polarknäcke Original	6.95	5.5	2	7313350007203
413	103274	Polly blå	3.80	5.5	5	7310040034556
414	103275	Polly röd	4.40	5.5	5	7310040034563
347	\N	Marabou Schweizer Nöt Single	1.00	5.5	-11	73550020
248	\N	Klassiskt Potatismos	9.95	5.5	11	7310240066128
416	150951	Potatismjöl	3.30	5.5	3	7310160000158
333	\N	Marabou 30 praliner med nougatfyllning	9.95	5.5	-7	7622210929525
299	\N	Lönneberga leverpastej	3.95	5.5	0	7310941801301
353	117835	Mazarin singel	1.50	5.5	-3	7315361112372
330	\N	Mandelmassa 500g	14.95	5.5	1	7393082110761
328	116774	Mandelkubb	6.95	5.5	3	7317065004014
371	\N	Noblesse Mörk Choklad Krisp	6.95	5.5	10	7622400706059
375	115189	Norrlandspölsa	6.95	5.5	4	7310862084272
401	133738	PIM PIM tablettask	1.50	20	5	7310780002327
419	\N	Präst ost mellangräddad 31%	14.95	5.5	10	2340415207051
420	\N	Prästost	17.95	5.5	9	2340415207778
421	110144	Premium Dark 70%	5.30	5.5	5	7622400624520
423	774015	Prickig korv skivad	6.95	5.5	5	7300200266002
425	105749	Pripps Blå 3.5% 6-p BRK	13.10	5.5	4	7310072766050
427	212343	Proviva Mango	8.10	5.5	5	7350000550535
428	\N	Proviva Svartvinbär	5.50	5.5	5	7350000550559
429	\N	Psyllium 85% GF	7.95	5.5	3	7311149104003
431	191719	Rågflingor	5.95	5.5	14	7310130331084
432	900091	Rågkaka Tina och servera	9.80	5.5	5	7330671019043
433	192045	Rågkross	3.85	5.5	38	7310130769030
435	\N	Rågmjöl Finmalt	6.95	5.5	14	7310130007187
439	\N	Räkost Ask 330g	12.95	5.5	7	7311441343100
440	\N	Räkost Tub 275g	9.95	5.5	3	7311440020897
442	\N	Ramlösa 0.5L	2.50	5.5	3	7310070001719
443	\N	Ramlösa 80cL	3.95	5.5	3	73120001
444	124817	Ramlösa Granatäpple BRK	1.20	5.5	5	7310070004772
446	206398	Ramslök & Citronsill MSC	4.10	5.5	4	7311171006979
448	107230	Rårörda lingon EKO	17.10	5.5	5	7317661714706
450	\N	Remouladsås	3.95	5.5	6	7310500002477
451	404128	Renskav	12.50	5.5	5	7319993289761
452	\N	Renstek Varmrökt Skivad 500g	37.50	5.5	2	7319993222300
340	\N	Marabou Japp	1.00	5.5	1	7040110663408
254	\N	Knäcke trekant normalgräddat	3.50	5.5	-10	7312080004018
283	\N	Lakrisal	1.20	5.5	-1	8711400800016
255	147235	Knäckebröd Frukost	5.50	5.5	-10	7300400248204
396	146296	Pepparkakor Annas	5.95	5.5	-38	7312220000054
334	\N	Marabou Black Saltlakrits	3.10	5.5	-14	7622201464011
374	104809	Norrlands Guld 3.5 % BRK	3.50	5.5	19	7310401006765
261	121740	Kronjäst för söta degar färsk	2.00	5.5	-6	73500360
445	\N	Ramslök & Citron Sill	4.95	5.5	-25	7350126082286
405	732695	Plopp dubbel stycksak	1.70	5.5	-9	7310040020726
389	154651	Pärlsocker	3.50	5.5	-2	7310340114026
362	158079	Mjölkchoklad Kaka	3.10	5.5	-10	7310511210304
346	\N	Marabou Schweizer nöt	3.10	5.5	-2	7310511216306
372	\N	Noblesse Original Crisp	6.95	5.5	6	7622400705960
274	112809	Läkerol Cactus	2.10	5.5	1	7310350118496
369	\N	Noblesse Apelsin Crisp	6.95	5.5	-2	7622400706035
453	\N	Ris Kakor Cheddar	4.50	5.5	2	7350028544066
454	\N	Ris Kakor Pizza	4.50	5.5	-1	7310106055815
455	\N	Risgröt Felix 500g	2.95	5.5	6	7310090755692
456	\N	Risi Frutti	2.95	5.5	4	7310090772620
465	184867	Saftsoppa	5.00	5.5	5	7310470063294
466	\N	Salladskrydda	3.95	5.5	9	7311311018145
467	\N	Salladskrydda 325g	16.95	5.5	5	7311311016455
468	\N	Salmiakki	3.50	5.5	-10	6411401015830
471	123162	Salty Toffee	2.80	5.5	5	6416453015753
476	\N	Sandwich Pizza	2.00	5.5	17	7300400482752
478	\N	Santa Maria Saffran	4.50	5.5	12	7311312002044
479	\N	Scan Köttbullar	5.95	5.5	0	7300208283001
480	\N	Senap Original Johnny’s	6.95	5.5	13	7392031000122
482	117757	Senap skånsk glasburk	5.95	5.5	5	7310430000581
484	123192	Senap stark plastflaska	6.90	5.5	5	8717163867914
486	106672	Senapssill	8.30	5.5	5	7311171006528
488	186036	Senapssill bit MSC	4.10	5.5	-16	7311171004135
489	121974	Singoalla hallon och lakrits	4.70	5.5	5	7310520007650
493	106673	Skärgårdssill	8.30	5.5	4	7311171006535
494	186016	Skärgårdssill bit MSC	4.10	5.5	5	7311171004098
495	\N	Skärgårdssill Stor	8.30	5.5	1	7350126081852
497	\N	Skogaholm Originalrost	7.50	5.5	3	7314875270011
499	117356	Skorpor Kardemumma	5.90	5.5	-13	7311070362572
500	158362	Skotte dubbel	1.30	5.5	5	7310511253608
417	235707	Potatissallad	3.95	5.5	4	7313161311377
342	\N	Marabou Mjölk Choklad 200g	5.95	5.5	2	7310511210403
436	117409	Rågmjöl Grovt	6.95	5.5	4	7310130007170
415	\N	Pommac 1.4L	4.00	5.5	2	7310070701916
338	\N	Marabou Frukt Mandel 200g	5.95	5.5	8	7310511217402
434	712324	Rågkusar osötad Tina och servera	8.95	5.5	-10	7314879170003
370	122667	Noblesse Havssalt crisp	6.50	5.5	-3	7622210976895
378	\N	Nyponsoppa Utan Tillsatt Socker	5.95	5.5	4	7310470070209
473	105152	Sandwich cheese paprika	2.00	5.5	-8	7300400128315
437	117408	Rågsikt	7.95	5.5	5	7310130007194
503	200908	Smoothie Ananas Banan Kokos ENGL	3.50	5.5	5	7350020720093
505	206225	Smoothie Jordgubb Banan Guava ENGL	3.50	5.5	5	7350020720734
510	109435	Snabbmakaroner	4.40	5.5	5	7310130003530
512	\N	Snöre Jordgubb	2.70	5.5	-5	5700417990219
515	\N	Sopset	19.95	5.5	4	7312280010451
516	182639	Sparrissoppa	4.95	5.5	4	7322550031796
518	\N	Start Naturell	7.95	5.5	1	7310130801709
519	776642	Stenbitsrom svart MSC	89.70	5.5	5	7392497082298
521	\N	Sucette	0.50	5.5	53	\N
522	\N	Sun Maid Rusin 250g	4.95	5.5	-2	41143024324
523	\N	Sur Skalle	2.95	5.5	6	7393077181684
524	\N	Svartpeppar	4.50	5.5	6	7311311014185
526	167846	Syltsocker	4.95	5.5	5	7310340112473
528	169545	Taco Tubs	7.95	5.5	4	7311310038205
531	117113	Tacosås Mild	4.50	5.5	2	7311312002075
533	124012	Te hallon grädde EKO FT	0.78	5.5	5	7350054815833
534	124038	Te rabarber vanilj EKO FT	0.78	5.5	5	7350054815741
536	\N	Tranbär o Lingon Lättdryck	2.10	5.5	19	7310090167532
537	\N	Trocadero 33cL	2.00	5.5	4	7310401007151
540	\N	Tunnbröd Hård	6.95	5.5	17	7313830006795
542	\N	Tupla KingSize	1.95	5.5	12	6420256015568
544	\N	Tutti Frutti Sour	3.50	5.5	5	6416453035966
546	\N	Tyrkisk Peber Soft & Salty	2.95	5.5	-3	6416453039711
547	\N	Tyrkisk Peter 20g	0.80	5.5	15	6411401061066
548	110097	Vaniljsocker ögon	3.95	5.5	23	6416453068865
549	\N	Varmrökt Lax Citron 125g Korshags	9.95	5.5	8	5755332
550	\N	Varmrökt Lax Naturell 125g Korshags	9.95	5.5	44	5755325
551	\N	Västerbotten ost 1kg	34.95	5.5	0	2352401609664
552	\N	Västerbotten ost 1kg	34.95	5.5	-1	2352401609800
553	\N	Västerbotten ost 1kg	34.95	5.5	1	2352401610059
358	116748	Micropopcorn Salt 3 pack	5.55	5.5	18	7310532160794
496	\N	Skinkost 175g	7.95	5.5	-3	7311440026752
399	\N	Piffi Allkrydda	5.75	5.5	7	7310700817703
483	109190	Slotts senap original tub	7.95	5.5	-1	7392031000016
462	\N	Rödbetssallad 400g	6.50	5.5	-5	7313161310677
490	111176	Singoalla original	4.50	5.5	2	7310520003089
441	212215	Räksallad	5.95	5.5	4	7313160004997
343	\N	Marabou Mjölkchocklad Single	1.00	5.5	-3	73550013
481	121203	Slotts senap original tub	5.95	5.5	2	8714100751527
487	\N	Senapssill  Stor	8.95	5.5	2	7350126081821
402	424067	Billys pizza original	3.00	5.5	-3	7310960713654
426	105749	Pripps Blå 3.5% 6-p BRK	3.50	5.5	52	7310070766052
350	117668	Marsan vaniljsås färdig	4.95	5.5	-1	7310470061108
474	\N	Sandwich Chives	2.00	5.5	-22	7300400122689
457	163785	Riskakor Gräddfil Lök glutenfria	4.75	5.5	7	7320496055821
430	290199	Punschrulle singel	1.50	5.5	-1	7315360010914
459	121065	Rödbetor aptit skivad	3.95	5.5	-4	7310240051261
557	180118	Viltfond kantarell 0.8% salt	9.50	5.5	5	7322550052692
559	192858	Vitvinsvinäger	5.50	5.5	5	7310155506405
560	759976	Vitvinsvinäger	8.95	5.5	5	7310155506450
561	183308	Wafers Jätten vanilj	7.40	5.5	5	7310525501412
563	200674	Wienerkorv Sverige	15.50	5.5	9	7330671013171
564	\N	Yoggi Original	4.95	5.5	4	7310865018465
565	103642	Zingo orange BRK	2.00	5.5	2	7310070766113
566	119710	Zoo	1.50	5.5	13	7310350103959
748	\N	Annas pepparkashus	7.50	5.5	4	7312220235630
556	114884	Vetemjöl special	9.95	5.5	11	7310130006050
539	120271	Trocadero PET	4.00	5.5	2	7310401000374
543	119493	Tutti Frutti Original	2.95	5.5	1	6416453038271
806	\N	Kavring	7.95	5.5	3	7315060177382
814	\N	Tea towel	9.95	20	4	7340041916742
513	115406	Snören cola	2.95	5.5	0	5700417990202
506	700644	Bregott extrasaltat	7.20	5.5	-1	7310860005859
797	\N	Marabou daim 200g	5.95	5.5	9	7622201056643
780	\N	Kela koka kräftor	23.95	5.5	2	8437006723145
504	206599	Smoothie blåbär hallon ENGL	3.50	5.5	32	7350020720024
463	185594	Rotmos pulver	9.95	5.5	11	7310240066098
511	145247	Snabbmarsan vaniljsås 7p	3.50	5.5	-4	7310470016283
788	\N	Cheese slicer	10.95	5.5	1	7316830070483
509	145844	Smörgåsrån Vete	3.95	20	5	7310521080300
424	\N	Prinskorv	6.95	5.5	-1	7300207088003
422	208948	Prickig korv skiv	3.95	5.5	19	7300200264008
71	121288	Citronpeppar plastburk	16.95	5.5	0	7311311016424
37	184873	Blåbärssoppa osockrad	5.95	5.5	-2	7310470070193
826	\N	Hushållsost	17.95	5.5	1	2340374705100
386	\N	Owl chips dill & gräslök 	4.20	20	1	7340005403523
570	\N	Anna Försvaringsask	11.95	20	3	7315340382000
458	192293	Riskakor Ost glutenfria	4.75	5.5	14	7310186055804
203	109473	Idealmakaroner gammeldags	4.20	5.5	2	7310130003547
840	\N	Servett kyckling	4.50	20	17	8584014848589
525	117566	Svartvinbärssaft	9.95	5.5	6	7310770571581
841	\N	Servetter krokus	4.50	20	20	5906360560725
743	\N	OP Anderson baby	3.50	20	-14	5710778002414
842	\N	Servett Happy Birthday	4.50	20	30	7350107285262
844	\N	Paskagg Beatrix Potter	5.95	20	12	4015594303907
562	\N	Wasa Glutenfri Naturell	6.95	5.5	0	7300400481861
148	\N	Froosh Peach & Passion Fruit	4.50	5.5	5	7350020724114
736	\N	Saumon filet nature	10.95	5.5	-5	000005755325
697	\N	Vikingar Bok	16.00	20	2	9789163798887
112	240593	Falukorv ring Sverige	10.95	5.5	-1	7300206787006
470	102008	Salta Katten	1.50	20	12	6411401037177
558	102010	Viol Tablettask	1.30	5.5	-14	6411401037184
773	\N	Kalles kaviar original	5.50	5.5	-95	7350126084143
555	\N	Vetekaka	8.95	5.5	-5	7311800009531
774	\N	Kalles kaviar randiga	5.95	5.5	-3	7350126084235
739	\N	Fazer Oat choco	2.00	5.5	2	6416453017870
541	\N	Tunnbröd Litet	6.95	5.5	-3	7313830011423
530	117114	Tacosås Medium	4.50	5.5	-2	7311312002112
532	101060	Taco shells	7.95	5.5	5	7311310038038
839	\N	Aggfarg	2.90	20	39	7393885227451
567	141785	Zoo Tablettask	1.50	20	-19	7310780002303
535	111342	Tomatketchup Original	5.00	5.5	1	7310240060638
461	235702	Rödbetssallad	4.95	5.5	-1	7313161311360
395	124294	Pepparkaka Jul plåtburk	10.95	5.5	-5	7312220125689
507	120331	​ Smörgåsgurka 370g	5.50	5.5	-5	7310240050189
529	116939	Taco sauce hot	4.50	5.5	5	7311312002143
520	147245	Ströbröd	4.50	5.5	3	7300400312400
30	123712	Ballerina Original	4.50	5.5	22	7310520009326
827	\N	Dumle sachet 120g	4.50	5.5	19	6411404035187
127	187636	Finn Crisp caraway	4.95	5.5	-24	6410500900108
538	\N	Trocadero 50cL	2.50	5.5	4	7310401024844
469	\N	Salt Skalle	2.50	5.5	16	7393077181660
10	759751	Ahlgrens bilar lakrits däck	2.95	5.5	-11	7310350132881
517	182918	Sport knäckebröd	4.20	5.5	12	7300400114752
828	\N	Oboy 700g	8.50	5.5	-1	7622300247942
447	139660	Rårörda lingon	8.95	5.5	-2	7310240055184
508	112631	Smörgåsgurka 715g	7.50	5.5	-2	7310240150131
502	119265	Smash	4.95	5.5	-12	7310520006851
51	\N	Brunost	17.95	5.5	0	7038010028830
460	113508	​ ​Rödbetor skivade 710g	7.50	5.5	3	7310240151169
514	125013	Soldatens ärtsoppa extra fläsk	9.95	5.5	-2	7310390001383
771	\N	Mästar matjessill	5.95	5.5	-9	7350126082804
438	\N	Räkost	8.95	5.5	-12	7311440026677
554	784673	Västerbottensost 35% normalbit	21.95	5.5	-5	7310861081005
247	409055	Klassiska Köttbullar	12.95	5.5	-14	7310240039535
63	112780	Cheez doodles 160g	4.20	5.5	-37	7340005403370
418	236756	Potatissallad	5.95	5.5	-7	7313161310561
846	\N	Pask ask	8.95	20	12	4033051030616
798	\N	Marabou helnöt 200g	5.95	5.5	8	7310511214401
848	\N	Dépêche toi Alphonse	12.00	5.5	6	9782490253517
113	240563	Falukorv Sverige	5.95	5.5	6	7300206338000
93	124177	Dipmix Rostad Paprika och Vitlök	1.95	5.5	-28	7310532131947
831	\N	Paskägg stor	19.90	20	4	4015594110253
344	\N	Marabou Pigall Dubbel	1.70	5.5	8	7310511251604
850	\N	Paskägg mellan	8.95	5.5	8	4015594110185
838	\N	Collorit	3.95	5.5	10	7310470050256
830	\N	Imsdal 50cL	1.80	5.5	9	7044610240824
545	111979	Tyrkisk Peber Original	3.50	5.5	4	6416453028210
101	119408	Djungelvrål	1.95	5.5	-6	7310350109029
527	114523	Taco spice mix	2.50	20	0	7311310031015
845	\N	Paskfjadrar	1.50	20	98	7393885108491
84	115753	Estrella dillchips	4.20	5.5	-21	7310532106488
281	112808	Läkerol Salmiak	2.10	5.5	-35	7310350118519
278	\N	Läkerol Original	2.10	5.5	-31	7310350118458
207	\N	Inlagd Sill	8.95	5.5	-8	7350126081760
763	\N	Kardemummaskorpor finax	5.95	5.5	0	7313960007822
144	\N	Frödinge Princesstårta	15.00	5.5	-19	7310890601601
279	\N	Läkerol Raspberry Licorice	2.10	5.5	-21	7310350131600
610	\N	Kronljus 25cm 30st	29.95	5.5	4	7301002408683
477	102839	Sandwich tomat basilika	2.10	5.5	-6	7300400127363
852	\N	Kaldolmar i sas	15.00	5.5	2	7310960101734
300	107258	Lingonsylt	8.95	5.5	-15	7313590199508
613	\N	Lapponia 50cL 21%	15.95	20	1	6420614681657
407	\N	Polarbröd Rågkaka	8.95	5.5	-9	7311800009357
857	\N	Spice Mix FAJITA	2.50	5.5	20	7311310031367
320	\N	Löksill	4.95	5.5	-9	7350126081647
253	108673	Knäcke trekant brungräddat	3.50	5.5	-8	7312080004025
8	124266	Ahlgrens bilar	2.95	5.5	-36	7310350132874
122	205442	Filmjölk 3%	4.95	5.5	-14	7310865087935
829	\N	Frasvaflor 210g	2.95	5.5	4	7350126083580
363	\N	Mörk Sirap	4.50	5.5	9	7310340464428
449	\N	Rekorderlig Päron Cider	3.50	5.5	-5	7311100400908
485	\N	Senapssill	4.10	5.5	-34	7350126081739
492	\N	Skärgårdssill	4.95	5.5	-36	7350126081678
79	112023	Daim singel	1.00	5.5	-14	7310511250706
853	\N	Anthon berg Marzipan bar	2.50	5.5	28	57540597
257	742973	Korvbröd 10-pack Tina och servera	4.50	5.5	1	7311379537015
742	\N	Tutti frutti tablettask	1.50	5.5	-2	6411401037191
164	109199	Gräddsås 3-pack	4.65	5.5	-12	7322550092025
638	607024	Såpa grön 750ml	4.50	20	6	7310610021474
94	102072	Dipmix Sourcream onion	1.95	5.5	-2	7310532130513
799	\N	Marabou schweizer nöt 200g	5.95	5.5	5	7310511216405
464	182928	Runda Kanel	5.95	5.5	-13	7300400115636
117	\N	Felix Krögarpytt Klassisk	10.95	5.5	-14	7310240075472
849	\N	Bien joué Alphonse	6.00	5.5	5	9782490253265
847	\N	Bonne nuit Alphonse	12.00	5.5	5	9782490253258
171	209115	Grebbestads® Ansjovisfilé Original	6.95	5.5	-26	7311170022116
249	111064	Knäcke Fäbod original	8.95	5.5	2	7312080003615
349	\N	Mariestads Öl 3.5% 50cL	3.50	5.5	4	7310401006710
854	\N	Skane Akvavit 12 pack	43.00	20	20	6412700062525
855	\N	MINTTU peppermint	28.00	20	15	6420614681794
856	\N	Skane akvavit	35.00	20	20	7330755125066
276	\N	Läkerol Eucalyptus	2.10	5.5	-22	7310350118502
491	212195	Skagenröra	5.95	5.5	-10	7313160005017
172	115754	Estrella chips grill	4.20	5.5	-5	7310532106501
250	108672	Knäcke rund brungräddat	7.95	5.5	-16	7312082001039
501	409123	Små delikatess köttbullar	9.95	5.5	-30	7310240039504
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (sale_amount, sale_payment_methods, sale_user, sale_taxes, sale_id, sale_discount, sale_year, sale_month, sale_day, sale_timestamp) FROM stdin;
27.00	{"card": 27}	Yann	{"ht1": "25.59", "tva1": "1.41", "total1": "27.00", "totalHt": "25.59", "totalTva": "1.41"}	1	{}	2023	2	6	\N
6.00	{"cash": 6}	Jaja	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	2	{}	2023	2	7	\N
67.65	{"card": 67.65}	Jaja	{"ht1": "64.13", "tva1": "3.52", "total1": "67.65", "totalHt": "64.13", "totalTva": "3.52"}	3	{}	2023	2	7	\N
53.50	{"cash": 53.5}	Jaja	{"ht1": "50.71", "tva1": "2.79", "total1": "53.50", "totalHt": "50.71", "totalTva": "2.79"}	4	{}	2023	2	7	\N
3.00	{"cash": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	5	{}	2023	2	7	\N
16.00	{"cash": 16}	Jaja	{"ht1": "15.17", "tva1": "0.83", "total1": "16.00", "totalHt": "15.17", "totalTva": "0.83"}	6	{}	2023	2	7	\N
5.80	{"cash": 5.8}	Jaja	{"ht2": "5.68", "tva2": "0.12", "total2": "5.80", "totalHt": "5.68", "totalTva": "0.12"}	7	{}	2023	2	7	\N
23.53	{"card": 23.53}	Jaja	{"ht1": "22.30", "tva1": "1.23", "total1": "23.53", "totalHt": "22.30", "totalTva": "1.23"}	8	{"{\\"newPrice\\": 3.6, \\"productId\\": 506, \\"reduction\\": 3.6, \\"discountType\\": \\"percent\\", \\"originalPrice\\": 7.2, \\"discountAmount\\": 50}"}	2023	2	7	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	9	{}	2023	2	7	\N
23.75	{"card": 23.75}	Jaja	{"ht1": "22.51", "tva1": "1.24", "total1": "23.75", "totalHt": "22.51", "totalTva": "1.24"}	10	{}	2023	2	7	\N
14.95	{"card": 14.95}	Jaja	{"ht1": "11.80", "ht3": "2.08", "tva1": "0.65", "tva3": "0.42", "total1": "12.45", "total3": 2.5, "totalHt": "13.88", "totalTva": "1.07"}	11	{}	2023	2	7	\N
18.00	{"card": 18}	Jaja	{"ht1": "17.07", "tva1": "0.93", "total1": "18.00", "totalHt": "17.07", "totalTva": "0.93"}	12	{}	2023	2	7	\N
9.00	{"card": 9}	Jaja	{"ht1": "8.53", "tva1": "0.47", "total1": "9.00", "totalHt": "8.53", "totalTva": "0.47"}	13	{}	2023	2	7	\N
45.95	{"card": 45.95}	Jaja	{"ht1": "43.55", "tva1": "2.40", "total1": "45.95", "totalHt": "43.55", "totalTva": "2.40"}	14	{}	2023	2	7	\N
171.25	{"card": 171.25}	Jaja	{"ht1": "142.42", "ht2": "20.56", "tva1": "7.83", "tva2": "0.44", "total1": "150.25", "total2": "21.00", "totalHt": "162.98", "totalTva": "8.27"}	15	{}	2023	2	7	\N
8.00	{"cash": 8}	Jaja	{"ht1": "7.58", "tva1": "0.42", "total1": 8, "totalHt": "7.58", "totalTva": "0.42"}	16	{}	2023	2	7	\N
150.90	{"card": 150.9}	Jaja	{"ht1": "133.60", "ht3": "8.29", "tva1": "7.35", "tva3": "1.66", "total1": "140.95", "total3": 9.95, "totalHt": "141.89", "totalTva": "9.01"}	17	{}	2023	2	7	\N
10.00	{"cash": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	18	{}	2023	2	7	\N
5.00	{"cash": 5}	Jaja	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	19	{}	2023	2	7	\N
13.95	{"card": 13.95}	Jaja	{"ht1": "13.22", "tva1": "0.73", "total1": 13.95, "totalHt": "13.22", "totalTva": "0.73"}	20	{}	2023	2	7	\N
7.00	{"card": 7}	Jaja	{"ht1": "6.64", "tva1": "0.36", "total1": "7.00", "totalHt": "6.64", "totalTva": "0.36"}	21	{}	2023	2	7	\N
10.00	{"cash": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	22	{}	2023	2	7	\N
13.00	{"cash": 13}	Jaja	{"ht1": "12.32", "tva1": "0.68", "total1": "13.00", "totalHt": "12.32", "totalTva": "0.68"}	23	{}	2023	2	7	\N
11.45	{"card": 11.45}	Jaja	{"ht1": "10.86", "tva1": "0.59", "total1": "11.45", "totalHt": "10.86", "totalTva": "0.59"}	24	{}	2023	2	7	\N
24.65	{"card": 24.65}	Jaja	{"ht1": "23.37", "tva1": "1.28", "total1": "24.65", "totalHt": "23.37", "totalTva": "1.28"}	25	{}	2023	2	7	\N
13.00	{"card": 13}	Jaja	{"ht1": "12.32", "tva1": "0.68", "total1": "13.00", "totalHt": "12.32", "totalTva": "0.68"}	26	{}	2023	2	7	\N
5.00	{"cash": 5}	Jaja	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	27	{}	2023	2	7	\N
21.90	{"card": 21.9}	Jaja	{"ht1": "7.58", "ht2": "13.61", "tva1": "0.42", "tva2": "0.29", "total1": "8.00", "total2": "13.90", "totalHt": "21.19", "totalTva": "0.71"}	28	{}	2023	2	7	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	29	{}	2023	2	8	\N
27.85	{"card": 27.85}	Jaja	{"ht1": "14.12", "ht3": "10.79", "tva1": "0.78", "tva3": "2.16", "total1": "14.90", "total3": 12.95, "totalHt": "24.91", "totalTva": "2.94"}	30	{}	2023	2	8	\N
21.75	{"card": 21.75}	Jaja	{"ht1": "20.61", "tva1": "1.14", "total1": "21.75", "totalHt": "20.61", "totalTva": "1.14"}	31	{}	2023	2	8	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	32	{}	2023	2	8	\N
26.10	{"card": 26.1}	Jaja	{"ht1": "14.98", "ht2": "5.68", "ht3": "3.75", "tva1": "0.82", "tva2": "0.12", "tva3": "0.75", "total1": "15.80", "total2": "5.80", "total3": 4.5, "totalHt": "24.41", "totalTva": "1.69"}	33	{}	2023	2	8	\N
47.25	{"card": 47.25}	Jaja	{"ht1": "44.79", "tva1": "2.46", "total1": "47.25", "totalHt": "44.79", "totalTva": "2.46"}	34	{}	2023	2	8	\N
12.00	{"cash": 12}	Jaja	{"ht1": "11.37", "tva1": "0.63", "total1": "12.00", "totalHt": "11.37", "totalTva": "0.63"}	35	{}	2023	2	8	\N
65.75	{"card": 65.75}	Jaja	{"ht1": "52.89", "ht3": "8.29", "tva1": "2.91", "tva3": "1.66", "total1": "55.80", "total3": 9.95, "totalHt": "61.18", "totalTva": "4.57"}	36	{"{\\"newPrice\\": 5, \\"productId\\": \\"c-Bullar x4\\", \\"reduction\\": 5, \\"discountType\\": \\"percent\\", \\"originalPrice\\": 10, \\"discountAmount\\": \\"50\\"}"}	2023	2	8	\N
9.96	{"card": 9.96}	Jaja	{"ht1": "9.44", "tva1": "0.52", "total1": "9.96", "totalHt": "9.44", "totalTva": "0.52"}	37	{}	2023	2	8	\N
47.50	{"card": 47.5}	Jaja	{"ht1": "45.02", "tva1": "2.48", "total1": "47.50", "totalHt": "45.02", "totalTva": "2.48"}	38	{}	2023	2	8	\N
7.00	{"cash": 7}	Jaja	{"ht1": "6.63", "tva1": "0.37", "total1": "7.00", "totalHt": "6.63", "totalTva": "0.37"}	39	{}	2023	2	8	\N
24.00	{"card": 24}	Jaja	{"ht1": "22.75", "tva1": "1.25", "total1": "24.00", "totalHt": "22.75", "totalTva": "1.25"}	40	{}	2023	2	8	\N
6.95	{"card": 6.95}	Jaja	{"ht1": "6.59", "tva1": "0.36", "total1": "6.95", "totalHt": "6.59", "totalTva": "0.36"}	41	{}	2023	2	8	\N
36.00	{"card": 36}	Jaja	{"ht1": "34.13", "tva1": "1.87", "total1": "36.00", "totalHt": "34.13", "totalTva": "1.87"}	42	{}	2023	2	8	\N
3.00	{"cash": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	44	{}	2023	2	8	\N
5.00	{"card": 5}	Jaja	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	45	{}	2023	2	8	\N
46.15	{"card": 46.15}	Jaja	{"ht1": "43.75", "tva1": "2.40", "total1": "46.15", "totalHt": "43.75", "totalTva": "2.40"}	46	{}	2023	2	8	\N
4.00	{"card": 4}	Jaja	{"ht1": "3.80", "tva1": "0.20", "total1": "4.00", "totalHt": "3.80", "totalTva": "0.20"}	47	{}	2023	2	8	\N
36.25	{"card": 36.25}	Jaja	{"ht1": "13.60", "ht2": "9.70", "ht3": "10.00", "tva1": "0.75", "tva2": "0.20", "tva3": "2.00", "total1": "14.35", "total2": "9.90", "total3": "12.00", "totalHt": "33.30", "totalTva": "2.95"}	48	{}	2023	2	8	\N
27.50	{"card": 27.5}	Jaja	{"ht1": "26.07", "tva1": "1.43", "total1": "27.50", "totalHt": "26.07", "totalTva": "1.43"}	50	{}	2023	2	8	\N
23.95	{"card": 23.95}	Jaja	{"ht1": "22.71", "tva1": "1.24", "total1": "23.95", "totalHt": "22.71", "totalTva": "1.24"}	51	{}	2023	2	8	\N
12.50	{"card": 12.5}	Jaja	{"ht1": "11.85", "tva1": "0.65", "total1": "12.50", "totalHt": "11.85", "totalTva": "0.65"}	52	{}	2023	2	8	\N
50.60	{"card": 50.6}	Jaja	{"ht1": "47.95", "tva1": "2.65", "total1": "50.60", "totalHt": "47.95", "totalTva": "2.65"}	53	{}	2023	2	8	\N
39.05	{"card": 39.05}	Jaja	{"ht1": "33.27", "ht3": "3.29", "tva1": "1.83", "tva3": "0.66", "total1": "35.10", "total3": 3.95, "totalHt": "36.56", "totalTva": "2.49"}	54	{}	2023	2	8	\N
50.95	{"cash": 50.95}	Jaja	{"ht1": "44.54", "ht3": "3.29", "tva1": "2.46", "tva3": "0.66", "total1": "47.00", "total3": 3.95, "totalHt": "47.83", "totalTva": "3.12"}	55	{"{\\"newPrice\\": 3.6, \\"productId\\": 506, \\"reduction\\": 3.6, \\"discountType\\": \\"percent\\", \\"originalPrice\\": 7.2, \\"discountAmount\\": \\"50\\"}"}	2023	2	8	\N
4.00	{"cash": 4}	Jaja	{"ht1": "3.79", "tva1": "0.21", "total1": "4.00", "totalHt": "3.79", "totalTva": "0.21"}	56	{}	2023	2	8	\N
12.42	{"card": 12.42}	Jaja	{"ht1": "11.77", "tva1": "0.65", "total1": "12.42", "totalHt": "11.77", "totalTva": "0.65"}	57	{}	2023	2	8	\N
17.50	{"cash": 17.5}	Jaja	{"ht1": "16.59", "tva1": "0.91", "total1": "17.50", "totalHt": "16.59", "totalTva": "0.91"}	58	{}	2023	2	8	\N
25.02	{"cash": 25.02}	Jaja	{"ht1": "23.72", "tva1": "1.30", "total1": 25.02, "totalHt": "23.72", "totalTva": "1.30"}	59	{"{\\"newPrice\\": 25.02, \\"productId\\": 165, \\"reduction\\": 2.78, \\"discountType\\": \\"percent\\", \\"originalPrice\\": 27.8, \\"discountAmount\\": \\"10\\"}"}	2023	2	8	\N
6.00	{"card": 6}	Jaja	{"ht1": "2.37", "ht3": "2.92", "tva1": "0.13", "tva3": "0.58", "total1": 2.5, "total3": 3.5, "totalHt": "5.29", "totalTva": "0.71"}	60	{}	2023	2	8	\N
47.40	{"card": 47.4}	Jaja	{"ht1": "44.94", "tva1": "2.46", "total1": "47.40", "totalHt": "44.94", "totalTva": "2.46"}	61	{}	2023	2	8	\N
2.30	{"cash": 2.3}	Jaja	{"ht1": "2.18", "tva1": "0.12", "total1": "2.30", "totalHt": "2.18", "totalTva": "0.12"}	62	{}	2023	2	8	\N
10.00	{"cash": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	63	{}	2023	2	8	\N
60.10	{"card": 60.1}	Jaja	{"ht1": "56.98", "tva1": "3.12", "total1": "60.10", "totalHt": "56.98", "totalTva": "3.12"}	64	{}	2023	2	8	\N
70.90	{"card": 70.9}	Jaja	{"ht1": "67.20", "tva1": "3.70", "total1": "70.90", "totalHt": "67.20", "totalTva": "3.70"}	65	{}	2023	2	8	\N
80.35	{"card": 80.35}	Jaja	{"ht1": "76.15", "tva1": "4.20", "total1": "80.35", "totalHt": "76.15", "totalTva": "4.20"}	66	{}	2023	2	8	\N
9.90	{"card": 9.9}	Jaja	{"ht1": "9.38", "tva1": "0.52", "total1": "9.90", "totalHt": "9.38", "totalTva": "0.52"}	67	{}	2023	2	8	\N
21.50	{"card": 21.5}	Jaja	{"ht1": "20.38", "tva1": "1.12", "total1": "21.50", "totalHt": "20.38", "totalTva": "1.12"}	68	{}	2023	2	8	\N
5.00	{"card": 5}	Jaja	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	69	{}	2023	2	8	\N
4.95	{"card": 4.95}	Jaja	{"ht1": "4.69", "tva1": "0.26", "total1": 4.95, "totalHt": "4.69", "totalTva": "0.26"}	70	{}	2023	2	8	\N
26.45	{"card": 26.45}	Jaja	{"ht1": "18.44", "ht3": "5.83", "tva1": "1.01", "tva3": "1.17", "total1": "19.45", "total3": "7.00", "totalHt": "24.27", "totalTva": "2.18"}	71	{}	2023	2	9	\N
19.80	{"cash": 19.8}	Jaja	{"ht1": "18.77", "tva1": "1.03", "total1": "19.80", "totalHt": "18.77", "totalTva": "1.03"}	72	{}	2023	2	9	\N
21.80	{"card": 21.8}	Jaja	{"ht1": "20.67", "tva1": "1.13", "total1": "21.80", "totalHt": "20.67", "totalTva": "1.13"}	73	{}	2023	2	9	\N
29.85	{"card": 29.85}	Jaja	{"ht1": "28.29", "tva1": "1.56", "total1": "29.85", "totalHt": "28.29", "totalTva": "1.56"}	74	{}	2023	2	9	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	75	{}	2023	2	9	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	76	{}	2023	2	9	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	77	{}	2023	2	9	\N
20.00	{"card": 20}	Jaja	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	78	{}	2023	2	9	\N
21.00	{"card": 21}	Jaja	{"ht1": "19.91", "tva1": "1.09", "total1": "21.00", "totalHt": "19.91", "totalTva": "1.09"}	79	{}	2023	2	9	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	80	{}	2023	2	9	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	81	{}	2023	2	9	\N
7.50	{"cash": 7.5}	Jaja	{"ht1": "7.11", "tva1": "0.39", "total1": "7.50", "totalHt": "7.11", "totalTva": "0.39"}	82	{}	2023	2	9	\N
57.80	{"card": 57.8}	Jaja	{"ht1": "54.79", "tva1": "3.01", "total1": "57.80", "totalHt": "54.79", "totalTva": "3.01"}	83	{}	2023	2	9	\N
24.45	{"card": 24.45}	Jaja	{"ht1": "23.18", "tva1": "1.27", "total1": "24.45", "totalHt": "23.18", "totalTva": "1.27"}	84	{}	2023	2	9	\N
21.00	{"cash": 21}	Jaja	{"ht1": "19.91", "tva1": "1.09", "total1": "21.00", "totalHt": "19.91", "totalTva": "1.09"}	85	{}	2023	2	9	\N
40.40	{"card": 40.4}	Jaja	{"ht1": "34.98", "ht3": "2.92", "tva1": "1.92", "tva3": "0.58", "total1": "36.90", "total3": 3.5, "totalHt": "37.90", "totalTva": "2.50"}	86	{}	2023	2	9	\N
20.45	{"card": 20.45}	Jaja	{"ht1": "19.39", "tva1": "1.06", "total1": "20.45", "totalHt": "19.39", "totalTva": "1.06"}	87	{}	2023	2	9	\N
9.45	{"card": 9.45}	Jaja	{"ht1": "8.96", "tva1": "0.49", "total1": "9.45", "totalHt": "8.96", "totalTva": "0.49"}	88	{}	2023	2	9	\N
23.50	{"card": 23.5}	Jaja	{"ht1": "22.28", "tva1": "1.22", "total1": "23.50", "totalHt": "22.28", "totalTva": "1.22"}	89	{}	2023	2	9	\N
12.10	{"cash": 12.1}	Jaja	{"ht1": "11.47", "tva1": "0.63", "total1": "12.10", "totalHt": "11.47", "totalTva": "0.63"}	90	{}	2023	2	9	\N
21.00	{"card": 21}	Jaja	{"ht1": "19.91", "tva1": "1.09", "total1": "21.00", "totalHt": "19.91", "totalTva": "1.09"}	91	{}	2023	2	9	\N
8.95	{"cash": 8.95}	Jaja	{"ht1": "8.48", "tva1": "0.47", "total1": "8.95", "totalHt": "8.48", "totalTva": "0.47"}	92	{}	2023	2	9	\N
4.95	{"cash": 4.95}	Jaja	{"ht1": "4.69", "tva1": "0.26", "total1": 4.95, "totalHt": "4.69", "totalTva": "0.26"}	93	{}	2023	2	9	\N
9.50	{"cash": 9.5}	Jaja	{"ht1": "9.00", "tva1": "0.50", "total1": "9.50", "totalHt": "9.00", "totalTva": "0.50"}	94	{}	2023	2	9	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	95	{}	2023	2	9	\N
3.00	{"cash": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	96	{}	2023	2	9	\N
15.00	{"card": 15}	Jaja	{"ht1": "14.22", "tva1": "0.78", "total1": 15, "totalHt": "14.22", "totalTva": "0.78"}	97	{}	2023	2	9	\N
5.50	{"card": 5.5}	Jaja	{"ht1": "5.21", "tva1": "0.29", "total1": 5.5, "totalHt": "5.21", "totalTva": "0.29"}	98	{}	2023	2	9	\N
7.95	{"cash": 7.95}	Jaja	{"ht1": "7.53", "tva1": "0.42", "total1": "7.95", "totalHt": "7.53", "totalTva": "0.42"}	99	{}	2023	2	9	\N
8.00	{"card": 8}	Jaja	{"ht1": "7.58", "tva1": "0.42", "total1": "8.00", "totalHt": "7.58", "totalTva": "0.42"}	100	{}	2023	2	9	\N
46.60	{"card": 46.6}	Jaja	{"ht1": "44.16", "tva1": "2.44", "total1": "46.60", "totalHt": "44.16", "totalTva": "2.44"}	101	{}	2023	2	9	\N
31.90	{"card": 31.9}	Jaja	{"ht1": "30.24", "tva1": "1.66", "total1": "31.90", "totalHt": "30.24", "totalTva": "1.66"}	102	{}	2023	2	9	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	103	{}	2023	2	9	\N
0.00	{"card": 0}	Jaja	{}	104	{}	2023	2	9	\N
12.00	{"card": 12}	Jaja	{"ht1": "11.38", "tva1": "0.62", "total1": "12.00", "totalHt": "11.38", "totalTva": "0.62"}	105	{}	2023	2	9	\N
47.85	{"card": 47.85}	Jaja	{"ht1": "16.92", "ht3": "25.00", "tva1": "0.93", "tva3": "5.00", "total1": "17.85", "total3": 30, "totalHt": "41.92", "totalTva": "5.93"}	106	{}	2023	2	9	\N
83.55	{"card": 83.55}	Jaja	{"ht1": "79.20", "tva1": "4.35", "total1": "83.55", "totalHt": "79.20", "totalTva": "4.35"}	107	{}	2023	2	9	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	108	{}	2023	2	9	\N
21.95	{"card": 21.95}	Jaja	{"ht1": "20.81", "tva1": "1.14", "total1": 21.95, "totalHt": "20.81", "totalTva": "1.14"}	109	{}	2023	2	9	\N
21.95	{"card": 21.95}	Lotta	{"ht1": "16.07", "ht3": "4.17", "tva1": "0.88", "tva3": "0.83", "total1": "16.95", "total3": "5.00", "totalHt": "20.24", "totalTva": "1.71"}	110	{}	2023	2	10	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	112	{}	2023	2	10	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	113	{}	2023	2	10	\N
3.00	{"cash": 3}	Lotta	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	116	{}	2023	2	10	\N
20.50	{"cash": 20.5}	Lotta	{"ht1": "15.17", "ht3": "3.75", "tva1": "0.83", "tva3": "0.75", "total1": "16.00", "total3": "4.50", "totalHt": "18.92", "totalTva": "1.58"}	117	{"{\\"newPrice\\": 10, \\"productId\\": \\"c-Bullar x4\\", \\"reduction\\": 10, \\"discountType\\": \\"percent\\", \\"originalPrice\\": \\"20.00\\", \\"discountAmount\\": \\"50\\"}"}	2023	2	10	\N
27.00	{"cash": 27}	Lotta	{"ht1": "25.59", "tva1": "1.41", "total1": 27, "totalHt": "25.59", "totalTva": "1.41"}	118	{}	2023	2	10	\N
30.30	{"card": 30.3}	Lotta	{"ht1": "28.71", "tva1": "1.59", "total1": "30.30", "totalHt": "28.71", "totalTva": "1.59"}	119	{}	2023	2	10	\N
33.90	{"card": 33.9}	Lotta	{"ht1": "27.44", "ht3": "4.13", "tva1": "1.51", "tva3": "0.82", "total1": "28.95", "total3": 4.95, "totalHt": "31.57", "totalTva": "2.33"}	120	{}	2023	2	10	\N
4.50	{"cash": 4.5}	Lotta	{"ht1": "4.27", "tva1": "0.23", "total1": 4.5, "totalHt": "4.27", "totalTva": "0.23"}	121	{}	2023	2	10	\N
25.90	{"card": 25.9}	Lotta	{"ht1": "24.55", "tva1": "1.35", "total1": "25.90", "totalHt": "24.55", "totalTva": "1.35"}	122	{}	2023	2	10	\N
19.50	{"card": 19.5}	Lotta	{"ht1": "18.49", "tva1": "1.01", "total1": "19.50", "totalHt": "18.49", "totalTva": "1.01"}	123	{}	2023	2	10	\N
21.85	{"card": 21.85}	Lotta	{"ht1": "20.71", "tva1": "1.14", "total1": "21.85", "totalHt": "20.71", "totalTva": "1.14"}	124	{}	2023	2	10	\N
6.00	{"card": 6}	Lotta	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	125	{}	2023	2	10	\N
43.10	{"card": 43.1}	Lotta	{"ht1": "40.84", "tva1": "2.26", "total1": "43.10", "totalHt": "40.84", "totalTva": "2.26"}	126	{}	2023	2	10	\N
68.85	{"card": 68.85}	Lotta	{"ht1": "65.26", "tva1": "3.59", "total1": "68.85", "totalHt": "65.26", "totalTva": "3.59"}	127	{}	2023	2	10	\N
65.90	{"card": 65.9}	Lotta	{"ht1": "62.47", "tva1": "3.43", "total1": "65.90", "totalHt": "62.47", "totalTva": "3.43"}	128	{}	2023	2	10	\N
71.90	{"card": 71.9}	Lotta	{"ht1": "68.14", "tva1": "3.76", "total1": "71.90", "totalHt": "68.14", "totalTva": "3.76"}	129	{}	2023	2	10	\N
30.40	{"card": 30.4}	Lotta	{"ht1": "28.81", "tva1": "1.59", "total1": "30.40", "totalHt": "28.81", "totalTva": "1.59"}	130	{}	2023	2	10	\N
8.00	{"cash": 8}	Lotta	{"ht1": "7.58", "tva1": "0.42", "total1": "8.00", "totalHt": "7.58", "totalTva": "0.42"}	131	{}	2023	2	10	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	132	{}	2023	2	10	\N
20.00	{"card": 20}	Lotta	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	134	{}	2023	2	10	\N
16.45	{"card": 16.45}	Lotta	{"ht1": "15.60", "tva1": "0.85", "total1": "16.45", "totalHt": "15.60", "totalTva": "0.85"}	135	{}	2023	2	10	\N
28.35	{"card": 28.35}	Lotta	{"ht1": "26.88", "tva1": "1.47", "total1": "28.35", "totalHt": "26.88", "totalTva": "1.47"}	136	{}	2023	2	10	\N
9.00	{"cash": 9}	Lotta	{"ht1": "8.53", "tva1": "0.47", "total1": "9.00", "totalHt": "8.53", "totalTva": "0.47"}	137	{}	2023	2	10	\N
41.70	{"card": 41.7}	Lotta	{"ht1": "39.52", "tva1": "2.18", "total1": "41.70", "totalHt": "39.52", "totalTva": "2.18"}	138	{}	2023	2	10	\N
52.00	{"card": 52}	Lotta	{"ht1": "49.29", "tva1": "2.71", "total1": "52.00", "totalHt": "49.29", "totalTva": "2.71"}	139	{}	2023	2	10	\N
12.00	{"cash": 12}	Lotta	{"ht1": "11.38", "tva1": "0.62", "total1": "12.00", "totalHt": "11.38", "totalTva": "0.62"}	140	{}	2023	2	10	\N
18.00	{"card": 18}	Lotta	{"ht1": "17.06", "tva1": "0.94", "total1": "18.00", "totalHt": "17.06", "totalTva": "0.94"}	141	{}	2023	2	10	\N
12.00	{"card": 12}	Lotta	{"ht1": "11.38", "tva1": "0.62", "total1": "12.00", "totalHt": "11.38", "totalTva": "0.62"}	142	{}	2023	2	10	\N
24.85	{"card": 24.85}	Lotta	{"ht1": "23.54", "tva1": "1.31", "total1": "24.85", "totalHt": "23.54", "totalTva": "1.31"}	143	{}	2023	2	10	\N
61.25	{"card": 61.25}	Lotta	{"ht1": "50.99", "ht2": "5.83", "ht3": "1.25", "tva1": "2.81", "tva2": "0.12", "tva3": "0.25", "total1": "53.80", "total2": "5.95", "total3": 1.5, "totalHt": "58.07", "totalTva": "3.18"}	144	{}	2023	2	10	\N
150.90	{"cash": 150.9}	Lotta	{"ht1": "143.06", "tva1": "7.84", "total1": "150.90", "totalHt": "143.06", "totalTva": "7.84"}	145	{}	2023	2	10	\N
3.00	{"card": 3}	Lotta	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	146	{}	2023	2	10	\N
5.00	{"cash": 5}	Lotta	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	147	{}	2023	2	10	\N
27.50	{"card": 27.5}	Lotta	{"ht1": "16.12", "ht3": "8.75", "tva1": "0.88", "tva3": "1.75", "total1": "17.00", "total3": "10.50", "totalHt": "24.87", "totalTva": "2.63"}	148	{}	2023	2	10	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	149	{}	2023	2	10	\N
4.00	{"card": 4}	Lotta	{"ht1": "3.79", "tva1": "0.21", "total1": "4.00", "totalHt": "3.79", "totalTva": "0.21"}	150	{}	2023	2	10	\N
9.90	{"cash": 9.9}	Lotta	{"ht1": "5.64", "ht3": "3.29", "tva1": "0.31", "tva3": "0.66", "total1": 5.95, "total3": 3.95, "totalHt": "8.93", "totalTva": "0.97"}	152	{}	2023	2	10	\N
6.00	{"cash": 6}	Lotta	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	153	{}	2023	2	10	\N
10.25	{"card": 10.25}	Lotta	{"ht1": "9.72", "tva1": "0.53", "total1": "10.25", "totalHt": "9.72", "totalTva": "0.53"}	154	{}	2023	2	10	\N
22.10	{"card": 22.1}	Lotta	{"ht1": "20.94", "tva1": "1.16", "total1": "22.10", "totalHt": "20.94", "totalTva": "1.16"}	155	{}	2023	2	10	\N
14.95	{"card": 14.95}	Lotta	{"ht1": "14.17", "tva1": "0.78", "total1": "14.95", "totalHt": "14.17", "totalTva": "0.78"}	156	{}	2023	2	10	\N
14.40	{"cash": 14.4}	Lotta	{"ht1": "13.64", "tva1": "0.76", "total1": "14.40", "totalHt": "13.64", "totalTva": "0.76"}	157	{}	2023	2	10	\N
12.45	{"card": 12.45}	Lotta	{"ht1": "11.80", "tva1": "0.65", "total1": "12.45", "totalHt": "11.80", "totalTva": "0.65"}	158	{}	2023	2	10	\N
14.00	{"card": 14}	Lotta	{"ht3": "11.67", "tva3": "2.33", "total3": "14.00", "totalHt": "11.67", "totalTva": "2.33"}	159	{}	2023	2	10	\N
17.50	{"card": 17.5}	Lotta	{"ht1": "16.59", "tva1": "0.91", "total1": "17.50", "totalHt": "16.59", "totalTva": "0.91"}	160	{}	2023	2	11	\N
5.95	{"card": 5.95}	Yann	{"ht1": "5.64", "tva1": "0.31", "total1": 5.95, "totalHt": "5.64", "totalTva": "0.31"}	162	{}	2023	2	11	\N
19.95	{"card": 19.95}	Yann	{"ht1": "18.91", "tva1": "1.04", "total1": "19.95", "totalHt": "18.91", "totalTva": "1.04"}	163	{}	2023	2	11	\N
93.35	{"card": 93.35}	Yann	{"ht1": "40.19", "ht3": "42.46", "tva1": "2.21", "tva3": "8.49", "total1": "42.40", "total3": "50.95", "totalHt": "82.65", "totalTva": "10.70"}	164	{}	2023	2	11	\N
8.00	{"card": 8}	Yann	{"ht1": "7.58", "tva1": "0.42", "total1": "8.00", "totalHt": "7.58", "totalTva": "0.42"}	165	{}	2023	2	11	\N
4.20	{"card": 4.2}	Lotta	{"ht1": "3.98", "tva1": "0.22", "total1": 4.2, "totalHt": "3.98", "totalTva": "0.22"}	151	{}	2023	2	10	\N
43.00	{"card": 43}	Lotta	{"ht1": "40.76", "tva1": "2.24", "total1": "43.00", "totalHt": "40.76", "totalTva": "2.24"}	133	{}	2023	2	10	\N
24.90	{"card": 24.9}	Yann	{"ht1": "23.60", "tva1": "1.30", "total1": "24.90", "totalHt": "23.60", "totalTva": "1.30"}	166	{}	2023	2	11	\N
33.60	{"card": 33.6}	Yann	{"ht1": "31.85", "tva1": "1.75", "total1": "33.60", "totalHt": "31.85", "totalTva": "1.75"}	167	{}	2023	2	11	\N
21.15	{"card": 21.15}	Yann	{"ht1": "20.04", "tva1": "1.11", "total1": "21.15", "totalHt": "20.04", "totalTva": "1.11"}	168	{}	2023	2	11	\N
10.00	{"cash": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	169	{}	2023	2	11	\N
10.00	{"cash": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	170	{}	2023	2	11	\N
53.70	{"card": 53.7}	Lotta	{"ht1": "50.90", "tva1": "2.80", "total1": 53.7, "totalHt": "50.90", "totalTva": "2.80"}	171	{}	2023	2	11	\N
7.50	{"cash": 7.5}	Lotta	{"ht1": "7.11", "tva1": "0.39", "total1": "7.50", "totalHt": "7.11", "totalTva": "0.39"}	172	{}	2023	2	11	\N
24.00	{"card": 24}	Lotta	{"ht1": "22.75", "tva1": "1.25", "total1": "24.00", "totalHt": "22.75", "totalTva": "1.25"}	173	{}	2023	2	11	\N
10.00	{"cash": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	174	{}	2023	2	11	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	175	{}	2023	2	11	\N
8.00	{"card": 8}	Lotta	{"ht1": "7.59", "tva1": "0.41", "total1": "8.00", "totalHt": "7.59", "totalTva": "0.41"}	176	{}	2023	2	11	\N
45.00	{"card": 45}	Lotta	{"ht1": "42.66", "tva1": "2.34", "total1": "45.00", "totalHt": "42.66", "totalTva": "2.34"}	177	{}	2023	2	11	\N
20.00	{"card": 20}	Lotta	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	178	{}	2023	2	11	\N
16.00	{"card": 16}	Lotta	{"ht1": "15.17", "tva1": "0.83", "total1": "16.00", "totalHt": "15.17", "totalTva": "0.83"}	179	{}	2023	2	11	\N
16.00	{"card": 16}	Lotta	{"ht1": "15.17", "tva1": "0.83", "total1": "16.00", "totalHt": "15.17", "totalTva": "0.83"}	180	{}	2023	2	11	\N
88.50	{"card": 88.5}	Lotta	{"ht1": "83.89", "tva1": "4.61", "total1": "88.50", "totalHt": "83.89", "totalTva": "4.61"}	181	{}	2023	2	11	\N
17.95	{"card": 17.95}	Lotta	{"ht1": "17.02", "tva1": "0.93", "total1": "17.95", "totalHt": "17.02", "totalTva": "0.93"}	182	{}	2023	2	11	\N
95.95	{"card": 95.95}	Lotta	{"ht1": "5.64", "ht3": "75.00", "tva1": "0.31", "tva3": "15.00", "total1": "5.95", "total3": "90.00", "totalHt": "80.64", "totalTva": "15.31"}	183	{}	2023	2	11	\N
5.00	{"card": 5}	Lotta	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	184	{}	2023	2	11	\N
5.10	{"cash": 5.1}	Lotta	{"ht1": "4.83", "tva1": "0.27", "total1": "5.10", "totalHt": "4.83", "totalTva": "0.27"}	185	{}	2023	2	11	\N
6.00	{"cash": 6}	Lotta	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	186	{}	2023	2	11	\N
32.00	{"card": 32}	Lotta	{"ht1": "30.34", "tva1": "1.66", "total1": "32.00", "totalHt": "30.34", "totalTva": "1.66"}	187	{}	2023	2	11	\N
22.00	{"card": 22}	Lotta	{"ht1": "20.86", "tva1": "1.14", "total1": "22.00", "totalHt": "20.86", "totalTva": "1.14"}	188	{}	2023	2	11	\N
15.00	{"card": 15}	Lotta	{"ht1": "14.22", "tva1": "0.78", "total1": 15, "totalHt": "14.22", "totalTva": "0.78"}	189	{}	2023	2	11	\N
27.95	{"card": 27.95}	Lotta	{"ht1": "26.50", "tva1": "1.45", "total1": "27.95", "totalHt": "26.50", "totalTva": "1.45"}	190	{}	2023	2	11	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	191	{}	2023	2	11	\N
25.45	{"card": 25.45}	Lotta	{"ht1": "18.48", "ht3": "4.96", "tva1": "1.02", "tva3": "0.99", "total1": "19.50", "total3": 5.95, "totalHt": "23.44", "totalTva": "2.01"}	192	{}	2023	2	11	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	193	{}	2023	2	11	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	194	{}	2023	2	11	\N
6.00	{"card": 6}	Lotta	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	195	{}	2023	2	11	\N
42.40	{"card": 42.4}	Lotta	{"ht1": "36.44", "ht3": "3.29", "tva1": "2.01", "tva3": "0.66", "total1": "38.45", "total3": 3.95, "totalHt": "39.73", "totalTva": "2.67"}	196	{}	2023	2	11	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	197	{}	2023	2	11	\N
23.95	{"card": 23.95}	Lotta	{"ht1": "22.70", "tva1": "1.25", "total1": "23.95", "totalHt": "22.70", "totalTva": "1.25"}	198	{}	2023	2	11	\N
18.00	{"card": 18}	Lotta	{"ht1": "17.06", "tva1": "0.94", "total1": "18.00", "totalHt": "17.06", "totalTva": "0.94"}	199	{}	2023	2	11	\N
30.40	{"cash": 30.4}	Lotta	{"ht1": "28.82", "tva1": "1.58", "total1": "30.40", "totalHt": "28.82", "totalTva": "1.58"}	200	{}	2023	2	11	\N
16.90	{"cash": 16.9}	Lotta	{"ht1": "16.01", "tva1": "0.89", "total1": "16.90", "totalHt": "16.01", "totalTva": "0.89"}	201	{}	2023	2	11	\N
9.95	{"card": 9.95}	Lotta	{"ht1": "9.43", "tva1": "0.52", "total1": "9.95", "totalHt": "9.43", "totalTva": "0.52"}	202	{}	2023	2	11	\N
5.95	{"card": 5.95}	Lotta	{"ht1": "5.64", "tva1": "0.31", "total1": 5.95, "totalHt": "5.64", "totalTva": "0.31"}	203	{}	2023	2	11	\N
48.55	{"card": 48.55}	Lotta	{"ht1": "24.41", "ht2": "22.33", "tva1": "1.34", "tva2": "0.47", "total1": "25.75", "total2": "22.80", "totalHt": "46.74", "totalTva": "1.81"}	204	{}	2023	2	11	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	205	{}	2023	2	11	\N
101.10	{"card": 101.1}	Lotta	{"ht1": "95.83", "tva1": "5.27", "total1": "101.10", "totalHt": "95.83", "totalTva": "5.27"}	206	{}	2023	2	11	\N
97.60	{"card": 97.6}	Lotta	{"ht1": "92.53", "tva1": "5.07", "total1": "97.60", "totalHt": "92.53", "totalTva": "5.07"}	207	{}	2023	2	11	\N
37.85	{"card": 37.85}	Lotta	{"ht1": "26.45", "ht2": "9.75", "tva1": "1.45", "tva2": "0.20", "total1": "27.90", "total2": "9.95", "totalHt": "36.20", "totalTva": "1.65"}	208	{}	2023	2	11	\N
20.85	{"card": 20.85}	Lotta	{"ht1": "19.76", "tva1": "1.09", "total1": "20.85", "totalHt": "19.76", "totalTva": "1.09"}	209	{}	2023	2	11	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	210	{}	2023	2	11	\N
8.95	{"cash": 8.95}	Lotta	{"ht1": "4.74", "ht3": "3.29", "tva1": "0.26", "tva3": "0.66", "total1": "5.00", "total3": 3.95, "totalHt": "8.03", "totalTva": "0.92"}	211	{}	2023	2	11	\N
14.50	{"card": 14.5}	Lotta	{"ht1": "13.75", "tva1": "0.75", "total1": "14.50", "totalHt": "13.75", "totalTva": "0.75"}	212	{}	2023	2	11	\N
13.95	{"cash": 13.95}	Lotta	{"ht1": "13.22", "tva1": "0.73", "total1": "13.95", "totalHt": "13.22", "totalTva": "0.73"}	213	{}	2023	2	11	\N
19.25	{"card": 19.25}	Lotta	{"ht1": "18.24", "tva1": "1.01", "total1": "19.25", "totalHt": "18.24", "totalTva": "1.01"}	214	{}	2023	2	11	\N
6.00	{"card": 6}	Lotta	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	215	{}	2023	2	11	\N
7.95	{"card": 7.95}	Lotta	{"ht1": "7.54", "tva1": "0.41", "total1": 7.95, "totalHt": "7.54", "totalTva": "0.41"}	216	{}	2023	2	11	\N
3.00	{"cash": 3}	Lotta	{"ht1": "2.84", "tva1": "0.16", "total1": "3.00", "totalHt": "2.84", "totalTva": "0.16"}	217	{}	2023	2	11	\N
126.50	{"card": 126.5}	Yann	{"ht1": "88.63", "ht3": "27.50", "tva1": "4.87", "tva3": "5.50", "total1": "93.50", "total3": "33.00", "totalHt": "116.13", "totalTva": "10.37"}	218	{}	2023	2	12	\N
35.40	{"card": 35.4}	Jaja	{"ht1": "33.57", "tva1": "1.83", "total1": "35.40", "totalHt": "33.57", "totalTva": "1.83"}	219	{}	2023	2	12	\N
36.45	{"card": 36.45}	Jaja	{"ht1": "34.56", "tva1": "1.89", "total1": "36.45", "totalHt": "34.56", "totalTva": "1.89"}	220	{}	2023	2	12	\N
30.00	{"cash": 30}	Jaja	{"ht1": "28.44", "tva1": "1.56", "total1": "30.00", "totalHt": "28.44", "totalTva": "1.56"}	221	{}	2023	2	12	\N
29.40	{"card": 29.4}	Jaja	{"ht1": "27.87", "tva1": "1.53", "total1": "29.40", "totalHt": "27.87", "totalTva": "1.53"}	222	{}	2023	2	12	\N
3.00	{"cash": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	223	{}	2023	2	12	\N
6.00	{"cash": 6}	Jaja	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	224	{}	2023	2	12	\N
20.00	{"card": 20}	Jaja	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	225	{}	2023	2	12	\N
27.50	{"cash": 27.5}	Jaja	{"ht1": "26.06", "tva1": "1.44", "total1": "27.50", "totalHt": "26.06", "totalTva": "1.44"}	226	{}	2023	2	12	\N
23.95	{"card": 23.95}	Jaja	{"ht1": "22.70", "tva1": "1.25", "total1": "23.95", "totalHt": "22.70", "totalTva": "1.25"}	227	{}	2023	2	12	\N
77.80	{"card": 77.8}	Jaja	{"ht1": "73.74", "tva1": "4.06", "total1": "77.80", "totalHt": "73.74", "totalTva": "4.06"}	228	{}	2023	2	12	\N
44.95	{"card": 44.95}	Jaja	{"ht1": "42.61", "tva1": "2.34", "total1": "44.95", "totalHt": "42.61", "totalTva": "2.34"}	229	{}	2023	2	12	\N
29.00	{"cash": 29}	Jaja	{"ht1": "27.48", "tva1": "1.52", "total1": "29.00", "totalHt": "27.48", "totalTva": "1.52"}	230	{}	2023	2	12	\N
51.55	{"card": 51.55}	Jaja	{"ht1": "48.86", "tva1": "2.69", "total1": "51.55", "totalHt": "48.86", "totalTva": "2.69"}	231	{}	2023	2	12	\N
24.55	{"cash": 24.55}	Jaja	{"ht1": "15.22", "ht2": "8.33", "tva1": "0.83", "tva2": "0.17", "total1": "16.05", "total2": "8.50", "totalHt": "23.55", "totalTva": "1.00"}	232	{}	2023	2	12	\N
18.10	{"card": 18.1}	Jaja	{"ht1": "17.16", "tva1": "0.94", "total1": "18.10", "totalHt": "17.16", "totalTva": "0.94"}	233	{}	2023	2	12	\N
32.00	{"card": 32}	Jaja	{"ht1": "30.33", "tva1": "1.67", "total1": "32.00", "totalHt": "30.33", "totalTva": "1.67"}	234	{}	2023	2	12	\N
1.48	{"card": 1.48}	Jaja	{"ht1": "1.40", "tva1": "0.08", "total1": "1.48", "totalHt": "1.40", "totalTva": "0.08"}	235	{}	2023	2	12	\N
2.46	{"card": 2.46}	Jaja	{"ht1": "2.33", "tva1": "0.13", "total1": "2.46", "totalHt": "2.33", "totalTva": "0.13"}	236	{}	2023	2	12	\N
38.20	{"card": 38.2}	Jaja	{"ht1": "23.13", "ht3": "11.50", "tva1": "1.27", "tva3": "2.30", "total1": "24.40", "total3": 13.8, "totalHt": "34.63", "totalTva": "3.57"}	237	{}	2023	2	12	\N
76.00	{"card": 76}	Jaja	{"ht1": "72.05", "tva1": "3.95", "total1": "76.00", "totalHt": "72.05", "totalTva": "3.95"}	238	{}	2023	2	12	\N
80.00	{"card": 80}	Jaja	{"ht3": "66.67", "tva3": "13.33", "total3": "80.00", "totalHt": "66.67", "totalTva": "13.33"}	239	{}	2023	2	12	\N
22.15	{"card": 22.15}	Jaja	{"ht1": "20.99", "tva1": "1.16", "total1": "22.15", "totalHt": "20.99", "totalTva": "1.16"}	240	{}	2023	2	12	\N
10.00	{"cash": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	241	{}	2023	2	12	\N
14.00	{"card": 14}	Jaja	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	242	{}	2023	2	12	\N
28.45	{"card": 28.45}	Jaja	{"ht1": "26.98", "tva1": "1.47", "total1": "28.45", "totalHt": "26.98", "totalTva": "1.47"}	243	{}	2023	2	12	\N
2.95	{"card": 2.95}	Jaja	{"ht1": "2.80", "tva1": "0.15", "total1": 2.95, "totalHt": "2.80", "totalTva": "0.15"}	244	{}	2023	2	12	\N
23.90	{"card": 23.9}	Jaja	{"ht1": "22.66", "tva1": "1.24", "total1": "23.90", "totalHt": "22.66", "totalTva": "1.24"}	245	{"{\\"newPrice\\": 13.9, \\"productId\\": 758, \\"reduction\\": 1.1, \\"discountType\\": \\"cash\\", \\"originalPrice\\": 15, \\"discountAmount\\": \\"1.10\\"}"}	2023	2	12	\N
13.00	{"card": 13}	Jaja	{"ht1": "12.32", "tva1": "0.68", "total1": "13.00", "totalHt": "12.32", "totalTva": "0.68"}	246	{}	2023	2	12	\N
11.45	{"card": 11.45}	Jaja	{"ht1": "10.85", "tva1": "0.60", "total1": "11.45", "totalHt": "10.85", "totalTva": "0.60"}	247	{}	2023	2	12	\N
2.95	{"card": 2.95}	Jaja	{"ht1": "2.80", "tva1": "0.15", "total1": 2.95, "totalHt": "2.80", "totalTva": "0.15"}	248	{}	2023	2	12	\N
29.35	{"card": 29.35}	Jaja	{"ht1": "27.82", "tva1": "1.53", "total1": "29.35", "totalHt": "27.82", "totalTva": "1.53"}	249	{}	2023	2	12	\N
8.00	{"cash": 8}	Jaja	{"ht1": "7.59", "tva1": "0.41", "total1": "8.00", "totalHt": "7.59", "totalTva": "0.41"}	250	{}	2023	2	12	\N
16.45	{"card": 16.45}	Jaja	{"ht1": "15.58", "tva1": "0.87", "total1": "16.45", "totalHt": "15.58", "totalTva": "0.87"}	251	{}	2023	2	12	\N
20.00	{"card": 20}	Jaja	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	252	{}	2023	2	12	\N
4.20	{"card": 4.2}	Jaja	{"ht1": "3.98", "tva1": "0.22", "total1": "4.20", "totalHt": "3.98", "totalTva": "0.22"}	253	{}	2023	2	12	\N
4.95	{"card": 4.95}	Jaja	{"ht1": "4.69", "tva1": "0.26", "total1": 4.95, "totalHt": "4.69", "totalTva": "0.26"}	254	{}	2023	2	12	\N
39.70	{"card": 39.7}	Jaja	{"ht1": "37.63", "tva1": "2.07", "total1": "39.70", "totalHt": "37.63", "totalTva": "2.07"}	255	{"{\\"newPrice\\": 4.7, \\"productId\\": 122, \\"reduction\\": 0.25, \\"discountType\\": \\"cash\\", \\"originalPrice\\": 4.95, \\"discountAmount\\": \\"0.25\\"}"}	2023	2	12	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	256	{}	2023	2	12	\N
20.00	{"card": 20}	Jaja	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	257	{}	2023	2	12	\N
0.05	{"card": 0.05}	Jaja	{"ht1": "0.05", "tva1": "0.00", "total1": "0.05", "totalHt": "0.05", "totalTva": "0.00"}	258	{}	2023	2	12	\N
23.85	{"card": 23.85}	Yann	{"ht1": "22.60", "tva1": "1.25", "total1": "23.85", "totalHt": "22.60", "totalTva": "1.25"}	259	{}	2023	2	14	\N
21.00	{"card": 21}	Yann	{"ht1": "19.91", "tva1": "1.09", "total1": 21, "totalHt": "19.91", "totalTva": "1.09"}	260	{}	2023	2	14	\N
134.15	{"card": 134.15}	Yann	{"ht1": "125.03", "ht3": "1.88", "tva1": "6.87", "tva3": "0.37", "total1": "131.90", "total3": 2.25, "totalHt": "126.91", "totalTva": "7.24"}	261	{}	2023	2	14	\N
18.00	{"card": 18}	Yann	{"ht1": "17.06", "tva1": "0.94", "total1": "18.00", "totalHt": "17.06", "totalTva": "0.94"}	262	{}	2023	2	14	\N
16.50	{"card": 16.5}	Yann	{"ht1": "15.64", "tva1": "0.86", "total1": "16.50", "totalHt": "15.64", "totalTva": "0.86"}	263	{}	2023	2	14	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	264	{}	2023	2	14	\N
6.00	{"card": 6}	Yann	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	265	{}	2023	2	14	\N
27.10	{"card": 27.1}	Yann	{"ht1": "24.26", "ht3": "1.25", "tva1": "1.34", "tva3": "0.25", "total1": "25.60", "total3": 1.5, "totalHt": "25.51", "totalTva": "1.59"}	266	{}	2023	2	14	\N
3.70	{"card": 3.7}	Yann	{"ht3": "3.08", "tva3": "0.62", "total3": 3.7, "totalHt": "3.08", "totalTva": "0.62"}	295	{}	2023	2	14	\N
0.00	{"card": 0}	Yann	{}	343	{}	2023	2	15	\N
30.90	{"card": 30.90}	Lotta	{"ht1": "29.29", "tva1": "1.61", "total1": "30.90", "totalHt": "29.29", "totalTva": "1.61"}	114	{}	2023	2	10	\N
20.80	{"card": 20.8}	Yann	{"ht1": "19.72", "tva1": "1.08", "total1": "20.80", "totalHt": "19.72", "totalTva": "1.08"}	267	{}	2023	2	14	\N
22.00	{"card": 22}	Yann	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	268	{}	2023	2	14	\N
22.00	{"card": 22}	Yann	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	269	{}	2023	2	14	\N
34.85	{"card": 34.85}	Yann	{"ht1": "33.03", "tva1": "1.82", "total1": "34.85", "totalHt": "33.03", "totalTva": "1.82"}	270	{}	2023	2	14	\N
22.00	{"card": 22}	Yann	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	271	{}	2023	2	14	\N
28.00	{"cash": 28}	Yann	{"ht1": "26.53", "tva1": "1.47", "total1": "28.00", "totalHt": "26.53", "totalTva": "1.47"}	272	{}	2023	2	14	\N
50.00	{"card": 50}	Yann	{"ht1": "47.39", "tva1": "2.61", "total1": "50.00", "totalHt": "47.39", "totalTva": "2.61"}	273	{}	2023	2	14	\N
70.75	{"card": 70.75}	Yann	{"ht1": "67.07", "tva1": "3.68", "total1": "70.75", "totalHt": "67.07", "totalTva": "3.68"}	274	{}	2023	2	14	\N
47.25	{"card": 47.25}	Yann	{"ht1": "44.78", "tva1": "2.47", "total1": "47.25", "totalHt": "44.78", "totalTva": "2.47"}	275	{}	2023	2	14	\N
1.95	{"cash": 1.95}	Yann	{"ht1": "1.85", "tva1": "0.10", "total1": 1.95, "totalHt": "1.85", "totalTva": "0.10"}	276	{}	2023	2	14	\N
18.00	{"card": 18}	Yann	{"ht1": "17.07", "tva1": "0.93", "total1": "18.00", "totalHt": "17.07", "totalTva": "0.93"}	277	{}	2023	2	14	\N
4.50	{"card": 4.5}	Yann	{"ht1": "4.27", "tva1": "0.23", "total1": 4.5, "totalHt": "4.27", "totalTva": "0.23"}	278	{}	2023	2	14	\N
4.95	{"cash": 4.95}	Yann	{"ht1": "4.69", "tva1": "0.26", "total1": 4.95, "totalHt": "4.69", "totalTva": "0.26"}	279	{}	2023	2	14	\N
11.00	{"card": 11}	Yann	{"ht1": "10.43", "tva1": "0.57", "total1": "11.00", "totalHt": "10.43", "totalTva": "0.57"}	280	{}	2023	2	14	\N
27.00	{"card": 27}	Yann	{"ht1": "25.60", "tva1": "1.40", "total1": "27.00", "totalHt": "25.60", "totalTva": "1.40"}	281	{"{\\"newPrice\\": 3, \\"productId\\": \\"c-Blabärsbulle\\", \\"reduction\\": 3, \\"discountType\\": \\"percent\\", \\"originalPrice\\": \\"6.00\\", \\"discountAmount\\": \\"50\\"}","{\\"newPrice\\": 5, \\"productId\\": \\"c-Kardemum x4\\", \\"reduction\\": 5, \\"discountType\\": \\"percent\\", \\"originalPrice\\": 10, \\"discountAmount\\": \\"50\\"}","{\\"newPrice\\": 5, \\"productId\\": \\"c-Saffran x4\\", \\"reduction\\": 5, \\"discountType\\": \\"percent\\", \\"originalPrice\\": 10, \\"discountAmount\\": \\"50\\"}","{\\"newPrice\\": 5, \\"productId\\": \\"c-Kanel x4\\", \\"reduction\\": 5, \\"discountType\\": \\"percent\\", \\"originalPrice\\": 10, \\"discountAmount\\": \\"50\\"}"}	2023	2	14	\N
5.50	{"card": 5.5}	Yann	{"ht1": "5.21", "tva1": "0.29", "total1": 5.5, "totalHt": "5.21", "totalTva": "0.29"}	282	{}	2023	2	14	\N
40.90	{"cash": 40.9}	Yann	{"ht1": "38.77", "tva1": "2.13", "total1": "40.90", "totalHt": "38.77", "totalTva": "2.13"}	283	{}	2023	2	14	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	284	{}	2023	2	14	\N
11.00	{"card": 11}	Yann	{"ht1": "10.43", "tva1": "0.57", "total1": "11.00", "totalHt": "10.43", "totalTva": "0.57"}	285	{}	2023	2	14	\N
5.00	{"cash": 5}	Yann	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	286	{}	2023	2	14	\N
6.50	{"card": 6.5}	Yann	{"ht1": "6.16", "tva1": "0.34", "total1": "6.50", "totalHt": "6.16", "totalTva": "0.34"}	287	{}	2023	2	14	\N
5.00	{"card": 5}	Yann	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	288	{}	2023	2	14	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	289	{}	2023	2	14	\N
3.00	{"card": 3}	Yann	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	290	{}	2023	2	14	\N
3.70	{"card": 3.7}	Yann	{"ht1": "3.51", "tva1": "0.19", "total1": "3.70", "totalHt": "3.51", "totalTva": "0.19"}	291	{}	2023	2	14	\N
9.95	{"card": 9.95}	Yann	{"ht1": "9.43", "tva1": "0.52", "total1": 9.95, "totalHt": "9.43", "totalTva": "0.52"}	292	{}	2023	2	14	\N
44.75	{"card": 44.75}	Yann	{"ht1": "42.41", "tva1": "2.34", "total1": "44.75", "totalHt": "42.41", "totalTva": "2.34"}	293	{}	2023	2	14	\N
14.10	{"card": 14.1}	Yann	{"ht1": "13.37", "tva1": "0.73", "total1": "14.10", "totalHt": "13.37", "totalTva": "0.73"}	294	{}	2023	2	14	\N
3.00	{"cash": 3}	Yann	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	296	{}	2023	2	14	\N
23.50	{"card": 23.5}	Yann	{"ht1": "22.28", "tva1": "1.22", "total1": "23.50", "totalHt": "22.28", "totalTva": "1.22"}	297	{}	2023	2	14	\N
18.50	{"card": 18.5}	Yann	{"ht1": "17.53", "tva1": "0.97", "total1": "18.50", "totalHt": "17.53", "totalTva": "0.97"}	298	{}	2023	2	14	\N
8.00	{"card": 8}	Yann	{"ht1": "7.59", "tva1": "0.41", "total1": "8.00", "totalHt": "7.59", "totalTva": "0.41"}	300	{}	2023	2	14	\N
61.75	{"card": 61.75}	Yann	{"ht1": "58.52", "tva1": "3.23", "total1": "61.75", "totalHt": "58.52", "totalTva": "3.23"}	301	{}	2023	2	14	\N
18.00	{"card": 18}	Yann	{"ht1": "17.06", "tva1": "0.94", "total1": "18.00", "totalHt": "17.06", "totalTva": "0.94"}	302	{}	2023	2	14	\N
8.00	{"cash": 8}	Yann	{"ht1": "7.58", "tva1": "0.42", "total1": 8, "totalHt": "7.58", "totalTva": "0.42"}	303	{}	2023	2	15	\N
0.00	{"cash": 0}	Yann	{}	304	{}	2023	2	15	\N
8.00	{"cash": 8}	Yann	{"ht1": "7.58", "tva1": "0.42", "total1": 8, "totalHt": "7.58", "totalTva": "0.42"}	305	{}	2023	2	15	\N
19.20	{"card": 19.2}	Yann	{"ht1": "18.21", "tva1": "0.99", "total1": "19.20", "totalHt": "18.21", "totalTva": "0.99"}	306	{}	2023	2	15	\N
42.90	{"card": 42.9}	Yann	{"ht1": "40.67", "tva1": "2.23", "total1": "42.90", "totalHt": "40.67", "totalTva": "2.23"}	307	{}	2023	2	15	\N
25.35	{"card": 25.35}	Yann	{"ht1": "24.02", "tva1": "1.33", "total1": "25.35", "totalHt": "24.02", "totalTva": "1.33"}	308	{}	2023	2	15	\N
6.00	{"card": 6}	Yann	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	309	{}	2023	2	15	\N
34.40	{"card": 34.4}	Yann	{"ht1": "32.60", "tva1": "1.80", "total1": "34.40", "totalHt": "32.60", "totalTva": "1.80"}	310	{}	2023	2	15	\N
21.60	{"card": 21.6}	Yann	{"ht1": "20.48", "tva1": "1.12", "total1": "21.60", "totalHt": "20.48", "totalTva": "1.12"}	311	{}	2023	2	15	\N
9.00	{"card": 9}	Yann	{"ht1": "8.53", "tva1": "0.47", "total1": "9.00", "totalHt": "8.53", "totalTva": "0.47"}	312	{}	2023	2	15	\N
6.00	{"card": 6}	Yann	{"ht1": "5.69", "tva1": "0.31", "total1": 6, "totalHt": "5.69", "totalTva": "0.31"}	313	{}	2023	2	15	\N
22.95	{"card": 22.95}	Yann	{"ht1": "21.75", "tva1": "1.20", "total1": "22.95", "totalHt": "21.75", "totalTva": "1.20"}	314	{}	2023	2	15	\N
12.00	{"cash": 12}	Yann	{"ht1": "11.37", "tva1": "0.63", "total1": "12.00", "totalHt": "11.37", "totalTva": "0.63"}	315	{}	2023	2	15	\N
44.00	{"card": 44}	Yann	{"ht1": "41.70", "tva1": "2.30", "total1": "44.00", "totalHt": "41.70", "totalTva": "2.30"}	316	{}	2023	2	15	\N
10.50	{"card": 10.5}	Yann	{"ht1": "9.96", "tva1": "0.54", "total1": "10.50", "totalHt": "9.96", "totalTva": "0.54"}	317	{}	2023	2	15	\N
37.00	{"card": 37}	Yann	{"ht1": "35.08", "tva1": "1.92", "total1": "37.00", "totalHt": "35.08", "totalTva": "1.92"}	318	{}	2023	2	15	\N
43.95	{"card": 43.95}	Yann	{"ht1": "41.66", "tva1": "2.29", "total1": "43.95", "totalHt": "41.66", "totalTva": "2.29"}	319	{}	2023	2	15	\N
45.30	{"card": 45.3}	Yann	{"ht1": "38.23", "ht3": "4.13", "tva1": "2.12", "tva3": "0.82", "total1": "40.35", "total3": 4.95, "totalHt": "42.36", "totalTva": "2.94"}	320	{}	2023	2	15	\N
9.95	{"cash": 9.95}	Yann	{"ht1": "9.43", "tva1": "0.52", "total1": 9.95, "totalHt": "9.43", "totalTva": "0.52"}	321	{}	2023	2	15	\N
13.50	{"cash": 13.5}	Yann	{"ht1": "12.80", "tva1": "0.70", "total1": "13.50", "totalHt": "12.80", "totalTva": "0.70"}	322	{}	2023	2	15	\N
34.85	{"card": 34.85}	Yann	{"ht1": "33.04", "tva1": "1.81", "total1": "34.85", "totalHt": "33.04", "totalTva": "1.81"}	323	{}	2023	2	15	\N
12.45	{"card": 12.45}	Yann	{"ht1": "11.80", "tva1": "0.65", "total1": "12.45", "totalHt": "11.80", "totalTva": "0.65"}	324	{}	2023	2	15	\N
15.00	{"card": 15}	Yann	{"ht1": "14.22", "tva1": "0.78", "total1": "15.00", "totalHt": "14.22", "totalTva": "0.78"}	325	{}	2023	2	15	\N
20.95	{"cash": 20.95}	Yann	{"ht1": "19.85", "tva1": "1.10", "total1": "20.95", "totalHt": "19.85", "totalTva": "1.10"}	326	{}	2023	2	15	\N
6.95	{"cash": 6.95}	Yann	{"ht1": "6.59", "tva1": "0.36", "total1": 6.95, "totalHt": "6.59", "totalTva": "0.36"}	327	{}	2023	2	15	\N
19.95	{"card": 19.95}	Yann	{"ht1": "18.91", "tva1": "1.04", "total1": "19.95", "totalHt": "18.91", "totalTva": "1.04"}	328	{}	2023	2	15	\N
146.38	{"card": 146.38}	Yann	{"ht1": "84.82", "ht2": "10.28", "ht3": "38.66", "tva1": "4.66", "tva2": "0.22", "tva3": "7.74", "total1": "89.48", "total2": "10.50", "total3": "46.40", "totalHt": "133.76", "totalTva": "12.62"}	329	{}	2023	2	15	\N
9.90	{"card": 9.9}	Yann	{"ht1": "9.38", "tva1": "0.52", "total1": 9.9, "totalHt": "9.38", "totalTva": "0.52"}	330	{}	2023	2	15	\N
5.75	{"card": 5.75}	Yann	{"ht1": "5.45", "tva1": "0.30", "total1": 5.75, "totalHt": "5.45", "totalTva": "0.30"}	331	{}	2023	2	15	\N
18.95	{"card": 18.95}	Yann	{"ht1": "17.96", "tva1": "0.99", "total1": "18.95", "totalHt": "17.96", "totalTva": "0.99"}	332	{}	2023	2	15	\N
42.80	{"cash": 42.8}	Yann	{"ht1": "30.62", "ht2": "10.28", "tva1": "1.68", "tva2": "0.22", "total1": "32.30", "total2": "10.50", "totalHt": "40.90", "totalTva": "1.90"}	333	{}	2023	2	15	\N
6.45	{"card": 6.45}	Yann	{"ht1": "6.11", "tva1": "0.34", "total1": "6.45", "totalHt": "6.11", "totalTva": "0.34"}	334	{}	2023	2	15	\N
19.05	{"card": 19.05}	Yann	{"ht1": "18.05", "tva1": "1.00", "total1": "19.05", "totalHt": "18.05", "totalTva": "1.00"}	335	{}	2023	2	15	\N
36.30	{"card": 36.3}	Yann	{"ht1": "19.34", "ht3": "13.25", "tva1": "1.06", "tva3": "2.65", "total1": "20.40", "total3": "15.90", "totalHt": "32.59", "totalTva": "3.71"}	336	{}	2023	2	15	\N
49.02	{"card": 49.02}	Yann	{"ht1": "46.46", "tva1": "2.56", "total1": "49.02", "totalHt": "46.46", "totalTva": "2.56"}	337	{}	2023	2	15	\N
80.00	{"card": 80}	Yann	{"ht3": "66.67", "tva3": "13.33", "total3": "80.00", "totalHt": "66.67", "totalTva": "13.33"}	338	{}	2023	2	15	\N
20.35	{"card": 20.35}	Yann	{"ht1": "19.29", "tva1": "1.06", "total1": "20.35", "totalHt": "19.29", "totalTva": "1.06"}	339	{}	2023	2	15	\N
8.95	{"cash": 8.95}	Yann	{"ht1": "2.84", "ht2": "5.83", "tva1": "0.16", "tva2": "0.12", "total1": 3, "total2": "5.95", "totalHt": "8.67", "totalTva": "0.28"}	340	{}	2023	2	15	\N
30.95	{"card": 30.95}	Yann	{"ht1": "29.34", "tva1": "1.61", "total1": "30.95", "totalHt": "29.34", "totalTva": "1.61"}	341	{}	2023	2	15	\N
21.27	{"card": 21.27}	Yann	{"ht1": "20.16", "tva1": "1.11", "total1": "21.27", "totalHt": "20.16", "totalTva": "1.11"}	342	{}	2023	2	15	\N
20.90	{"cash": 20.9}	Yann	{"ht1": "19.81", "tva1": "1.09", "total1": "20.90", "totalHt": "19.81", "totalTva": "1.09"}	344	{}	2023	2	15	\N
19.80	{"card": 19.8}	Yann	{"ht1": "18.77", "tva1": "1.03", "total1": 19.8, "totalHt": "18.77", "totalTva": "1.03"}	345	{}	2023	2	16	\N
6.00	{"cash": 6}	Yann	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	346	{}	2023	2	16	\N
6.00	{"cash": 6}	Yann	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	347	{}	2023	2	16	\N
3.00	{"cash": 3}	Yann	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	348	{}	2023	2	16	\N
11.00	{"card": 11}	Yann	{"ht1": "10.42", "tva1": "0.58", "total1": "11.00", "totalHt": "10.42", "totalTva": "0.58"}	349	{}	2023	2	16	\N
14.20	{"card": 14.2}	Yann	{"ht1": "7.82", "ht3": "4.96", "tva1": "0.43", "tva3": "0.99", "total1": "8.25", "total3": "5.95", "totalHt": "12.78", "totalTva": "1.42"}	350	{}	2023	2	16	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	351	{}	2023	2	16	\N
9.95	{"card": 9.95}	Yann	{"ht1": "9.43", "tva1": "0.52", "total1": 9.95, "totalHt": "9.43", "totalTva": "0.52"}	352	{}	2023	2	16	\N
14.90	{"card": 14.9}	Yann	{"ht1": "14.12", "tva1": "0.78", "total1": "14.90", "totalHt": "14.12", "totalTva": "0.78"}	353	{}	2023	2	16	\N
5.95	{"cash": 5.95}	Yann	{"ht1": "5.64", "tva1": "0.31", "total1": 5.95, "totalHt": "5.64", "totalTva": "0.31"}	354	{}	2023	2	16	\N
15.00	{"card": 15}	Yann	{"ht1": "14.23", "tva1": "0.77", "total1": "15.00", "totalHt": "14.23", "totalTva": "0.77"}	355	{}	2023	2	16	\N
43.75	{"card": 43.75}	Yann	{"ht1": "41.47", "tva1": "2.28", "total1": "43.75", "totalHt": "41.47", "totalTva": "2.28"}	356	{}	2023	2	16	\N
69.40	{"card": 69.4}	Yann	{"ht1": "59.35", "ht2": "6.66", "tva1": "3.25", "tva2": "0.14", "total1": "62.60", "total2": "6.80", "totalHt": "66.01", "totalTva": "3.39"}	357	{}	2023	2	16	\N
13.90	{"card": 13.9}	Yann	{"ht1": "13.18", "tva1": "0.72", "total1": "13.90", "totalHt": "13.18", "totalTva": "0.72"}	359	{}	2023	2	16	\N
5.00	{"cash": 5}	Yann	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	360	{}	2023	2	16	\N
3.00	{"cash": 3}	Yann	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	361	{}	2023	2	16	\N
6.00	{"card": 6}	Yann	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	362	{}	2023	2	16	\N
27.95	{"card": 27.95}	Yann	{"ht1": "26.48", "tva1": "1.47", "total1": "27.95", "totalHt": "26.48", "totalTva": "1.47"}	363	{}	2023	2	16	\N
69.55	{"card": 69.55}	Yann	{"ht1": "32.80", "ht3": "29.13", "tva1": "1.80", "tva3": "5.82", "total1": "34.60", "total3": "34.95", "totalHt": "61.93", "totalTva": "7.62"}	364	{}	2023	2	16	\N
15.00	{"card": 15}	Yann	{"ht1": "14.22", "tva1": "0.78", "total1": 15, "totalHt": "14.22", "totalTva": "0.78"}	365	{}	2023	2	16	\N
194.85	{"card": 194.85}	Yann	{"ht1": "60.53", "ht3": "109.16", "tva1": "3.32", "tva3": "21.84", "total1": "63.85", "total3": "131.00", "totalHt": "169.69", "totalTva": "25.16"}	366	{}	2023	2	16	\N
17.00	{"card": 17}	Yann	{"ht1": "16.11", "tva1": "0.89", "total1": "17.00", "totalHt": "16.11", "totalTva": "0.89"}	367	{}	2023	2	16	\N
29.85	{"card": 29.85}	Yann	{"ht1": "28.30", "tva1": "1.55", "total1": "29.85", "totalHt": "28.30", "totalTva": "1.55"}	368	{}	2023	2	16	\N
7.95	{"card": 7.95}	Yann	{"ht1": "7.54", "tva1": "0.41", "total1": 7.95, "totalHt": "7.54", "totalTva": "0.41"}	369	{}	2023	2	16	\N
11.95	{"card": 11.95}	Yann	{"ht1": "11.33", "tva1": "0.62", "total1": "11.95", "totalHt": "11.33", "totalTva": "0.62"}	370	{}	2023	2	16	\N
38.95	{"card": 38.95}	Yann	{"ht1": "36.92", "tva1": "2.03", "total1": "38.95", "totalHt": "36.92", "totalTva": "2.03"}	371	{}	2023	2	16	\N
14.00	{"cash": 14}	Yann	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	372	{}	2023	2	16	\N
61.48	{"card": 61.48}	Yann	{"ht1": "58.27", "tva1": "3.21", "total1": "61.48", "totalHt": "58.27", "totalTva": "3.21"}	373	{}	2023	2	16	\N
6.00	{"cash": 6}	Yann	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	374	{}	2023	2	16	\N
16.45	{"card": 16.45}	Yann	{"ht1": "9.96", "ht3": "4.96", "tva1": "0.54", "tva3": "0.99", "total1": "10.50", "total3": 5.95, "totalHt": "14.92", "totalTva": "1.53"}	375	{}	2023	2	16	\N
3.00	{"cash": 3}	Yann	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	376	{}	2023	2	16	\N
12.00	{"card": 12}	Yann	{"ht1": "11.37", "tva1": "0.63", "total1": "12.00", "totalHt": "11.37", "totalTva": "0.63"}	377	{}	2023	2	16	\N
15.40	{"cash": 15.4}	Yann	{"ht1": "14.59", "tva1": "0.81", "total1": "15.40", "totalHt": "14.59", "totalTva": "0.81"}	378	{}	2023	2	16	\N
36.80	{"card": 36.8}	Lotta	{"ht1": "26.40", "ht3": "7.46", "tva1": "1.45", "tva3": "1.49", "total1": "27.85", "total3": "8.95", "totalHt": "33.86", "totalTva": "2.94"}	379	{}	2023	2	17	\N
8.00	{"card": 8}	Lotta	{"ht1": "7.58", "tva1": "0.42", "total1": "8.00", "totalHt": "7.58", "totalTva": "0.42"}	380	{}	2023	2	17	\N
1.00	{"cash": 1}	Lotta	{"ht3": "0.83", "tva3": "0.17", "total3": "1.00", "totalHt": "0.83", "totalTva": "0.17"}	381	{}	2023	2	17	\N
8.00	{"cash": 8}	Lotta	{"ht1": "7.59", "tva1": "0.41", "total1": "8.00", "totalHt": "7.59", "totalTva": "0.41"}	382	{}	2023	2	17	\N
14.00	{"card": 14}	Lotta	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	383	{}	2023	2	17	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	384	{}	2023	2	17	\N
22.00	{"card": 22}	Lotta	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	385	{}	2023	2	17	\N
3.00	{"card": 3}	Lotta	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	386	{}	2023	2	17	\N
103.60	{"card": 103.6}	Lotta	{"ht1": "82.32", "ht2": "11.56", "ht3": "4.13", "tva1": "4.53", "tva2": "0.24", "tva3": "0.82", "total1": "86.85", "total2": "11.80", "total3": 4.95, "totalHt": "98.01", "totalTva": "5.59"}	387	{}	2023	2	17	\N
48.55	{"cash": 48.55}	Lotta	{"ht1": "46.02", "tva1": "2.53", "total1": "48.55", "totalHt": "46.02", "totalTva": "2.53"}	388	{}	2023	2	17	\N
4.60	{"card": 4.6}	Lotta	{"ht1": "4.36", "tva1": "0.24", "total1": "4.60", "totalHt": "4.36", "totalTva": "0.24"}	389	{}	2023	2	17	\N
30.95	{"card": 30.95}	Lotta	{"ht1": "29.33", "tva1": "1.62", "total1": "30.95", "totalHt": "29.33", "totalTva": "1.62"}	390	{}	2023	2	17	\N
22.00	{"card": 22}	Lotta	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	391	{}	2023	2	17	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	392	{}	2023	2	17	\N
22.00	{"card": 22}	Lotta	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	393	{}	2023	2	17	\N
30.90	{"card": 30.9}	Lotta	{"ht1": "29.30", "tva1": "1.60", "total1": "30.90", "totalHt": "29.30", "totalTva": "1.60"}	394	{}	2023	2	17	\N
20.00	{"card": 20}	Lotta	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	395	{}	2023	2	17	\N
8.00	{"card": 8}	Lotta	{"ht1": "7.58", "tva1": "0.42", "total1": "8.00", "totalHt": "7.58", "totalTva": "0.42"}	396	{}	2023	2	17	\N
17.20	{"card": 17.2}	Lotta	{"ht1": "16.31", "tva1": "0.89", "total1": "17.20", "totalHt": "16.31", "totalTva": "0.89"}	397	{}	2023	2	17	\N
22.00	{"card": 22}	Lotta	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	398	{}	2023	2	17	\N
22.00	{"card": 22}	Lotta	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	399	{}	2023	2	17	\N
19.00	{"card": 19}	Lotta	{"ht1": "18.01", "tva1": "0.99", "total1": "19.00", "totalHt": "18.01", "totalTva": "0.99"}	400	{}	2023	2	17	\N
22.00	{"card": 22}	Lotta	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	401	{}	2023	2	17	\N
35.30	{"card": 35.3}	Lotta	{"ht1": "33.47", "tva1": "1.83", "total1": "35.30", "totalHt": "33.47", "totalTva": "1.83"}	402	{}	2023	2	17	\N
17.95	{"card": 17.95}	Lotta	{"ht1": "17.01", "tva1": "0.94", "total1": "17.95", "totalHt": "17.01", "totalTva": "0.94"}	403	{}	2023	2	17	\N
15.00	{"card": 15}	Lotta	{"ht1": "14.22", "tva1": "0.78", "total1": 15, "totalHt": "14.22", "totalTva": "0.78"}	404	{}	2023	2	17	\N
17.25	{"card": 17.25}	Lotta	{"ht1": "16.35", "tva1": "0.90", "total1": "17.25", "totalHt": "16.35", "totalTva": "0.90"}	405	{}	2023	2	17	\N
6.95	{"card": 6.95}	Lotta	{"ht1": "6.59", "tva1": "0.36", "total1": "6.95", "totalHt": "6.59", "totalTva": "0.36"}	406	{}	2023	2	17	\N
9.90	{"card": 9.9}	Lotta	{"ht1": "9.38", "tva1": "0.52", "total1": "9.90", "totalHt": "9.38", "totalTva": "0.52"}	407	{}	2023	2	17	\N
14.00	{"card": 14}	Lotta	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	408	{}	2023	2	17	\N
46.85	{"card": 46.85}	Lotta	{"ht1": "44.41", "tva1": "2.44", "total1": "46.85", "totalHt": "44.41", "totalTva": "2.44"}	409	{}	2023	2	17	\N
20.40	{"card": 20.4}	Lotta	{"ht1": "19.34", "tva1": "1.06", "total1": "20.40", "totalHt": "19.34", "totalTva": "1.06"}	410	{}	2023	2	17	\N
107.95	{"card": 107.95}	Lotta	{"ht1": "102.32", "tva1": "5.63", "total1": "107.95", "totalHt": "102.32", "totalTva": "5.63"}	411	{}	2023	2	17	\N
14.10	{"card": 14.1}	Lotta	{"ht1": "13.36", "tva1": "0.74", "total1": "14.10", "totalHt": "13.36", "totalTva": "0.74"}	412	{}	2023	2	17	\N
3.10	{"cash": 3.1}	Lotta	{"ht1": "2.94", "tva1": "0.16", "total1": 3.1, "totalHt": "2.94", "totalTva": "0.16"}	413	{}	2023	2	17	\N
73.85	{"card": 73.85}	Lotta	{"ht1": "34.98", "ht3": "30.79", "tva1": "1.92", "tva3": "6.16", "total1": "36.90", "total3": "36.95", "totalHt": "65.77", "totalTva": "8.08"}	414	{}	2023	2	17	\N
11.60	{"card": 11.6}	Lotta	{"ht1": "11.01", "tva1": "0.59", "total1": "11.60", "totalHt": "11.01", "totalTva": "0.59"}	415	{}	2023	2	17	\N
12.00	{"card": 12}	Lotta	{"ht1": "11.37", "tva1": "0.63", "total1": "12.00", "totalHt": "11.37", "totalTva": "0.63"}	416	{}	2023	2	17	\N
11.90	{"card": 11.9}	Lotta	{"ht1": "11.28", "tva1": "0.62", "total1": "11.90", "totalHt": "11.28", "totalTva": "0.62"}	417	{}	2023	2	17	\N
15.65	{"card": 15.65}	Lotta	{"ht1": "14.84", "tva1": "0.81", "total1": "15.65", "totalHt": "14.84", "totalTva": "0.81"}	418	{}	2023	2	17	\N
5.00	{"card": 5}	Lotta	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	419	{}	2023	2	17	\N
10.00	{"cash": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	420	{}	2023	2	18	\N
18.90	{"card": 18.9}	Lotta	{"ht1": "17.91", "tva1": "0.99", "total1": "18.90", "totalHt": "17.91", "totalTva": "0.99"}	421	{}	2023	2	18	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	422	{}	2023	2	18	\N
21.35	{"card": 21.35}	Lotta	{"ht1": "20.24", "tva1": "1.11", "total1": "21.35", "totalHt": "20.24", "totalTva": "1.11"}	423	{}	2023	2	18	\N
14.95	{"card": 14.95}	Lotta	{"ht1": "14.17", "tva1": "0.78", "total1": "14.95", "totalHt": "14.17", "totalTva": "0.78"}	424	{}	2023	2	18	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	425	{}	2023	2	18	\N
6.00	{"card": 6}	Lotta	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	426	{}	2023	2	18	\N
26.95	{"card": 26.95}	Lotta	{"ht1": "9.48", "ht3": "14.13", "tva1": "0.52", "tva3": "2.82", "total1": 10, "total3": "16.95", "totalHt": "23.61", "totalTva": "3.34"}	427	{}	2023	2	18	\N
47.20	{"cash": 47.2}	Lotta	{"ht1": "44.74", "tva1": "2.46", "total1": "47.20", "totalHt": "44.74", "totalTva": "2.46"}	428	{}	2023	2	18	\N
20.00	{"card": 20}	Lotta	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	429	{}	2023	2	18	\N
40.50	{"card": 40.5}	Lotta	{"ht1": "38.41", "tva1": "2.09", "total1": "40.50", "totalHt": "38.41", "totalTva": "2.09"}	430	{}	2023	2	18	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	431	{}	2023	2	18	\N
19.85	{"card": 19.85}	Lotta	{"ht1": "18.81", "tva1": "1.04", "total1": "19.85", "totalHt": "18.81", "totalTva": "1.04"}	432	{}	2023	2	18	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	433	{}	2023	2	18	\N
30.00	{"card": 30}	Lotta	{"ht1": "28.44", "tva1": "1.56", "total1": "30.00", "totalHt": "28.44", "totalTva": "1.56"}	434	{}	2023	2	18	\N
23.65	{"card": 23.65}	Lotta	{"ht1": "22.42", "tva1": "1.23", "total1": "23.65", "totalHt": "22.42", "totalTva": "1.23"}	435	{}	2023	2	18	\N
58.95	{"card": 58.95}	Lotta	{"ht1": "55.87", "tva1": "3.08", "total1": "58.95", "totalHt": "55.87", "totalTva": "3.08"}	436	{}	2023	2	18	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	437	{}	2023	2	18	\N
57.75	{"card": 57.75}	Lotta	{"ht1": "44.32", "ht2": "10.77", "tva1": "2.43", "tva2": "0.23", "total1": "46.75", "total2": "11.00", "totalHt": "55.09", "totalTva": "2.66"}	438	{}	2023	2	18	\N
4.70	{"card": 4.7}	Lotta	{"ht1": "4.46", "tva1": "0.24", "total1": "4.70", "totalHt": "4.46", "totalTva": "0.24"}	439	{}	2023	2	18	\N
93.35	{"card": 93.35}	Lotta	{"ht1": "88.49", "tva1": "4.86", "total1": "93.35", "totalHt": "88.49", "totalTva": "4.86"}	440	{}	2023	2	18	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	441	{}	2023	2	18	\N
16.00	{"card": 16}	Lotta	{"ht1": "15.17", "tva1": "0.83", "total1": "16.00", "totalHt": "15.17", "totalTva": "0.83"}	442	{}	2023	2	18	\N
12.00	{"card": 12}	Lotta	{"ht1": "11.37", "tva1": "0.63", "total1": "12.00", "totalHt": "11.37", "totalTva": "0.63"}	443	{}	2023	2	18	\N
6.00	{"card": 6}	Lotta	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	444	{}	2023	2	18	\N
9.90	{"cash": 9.9}	Lotta	{"ht1": "3.70", "ht3": "5.00", "tva1": "0.20", "tva3": "1.00", "total1": "3.90", "total3": "6.00", "totalHt": "8.70", "totalTva": "1.20"}	445	{}	2023	2	18	\N
55.75	{"card": 55.75}	Lotta	{"ht1": "47.20", "ht2": "5.83", "tva1": "2.60", "tva2": "0.12", "total1": "49.80", "total2": "5.95", "totalHt": "53.03", "totalTva": "2.72"}	446	{}	2023	2	18	\N
10.95	{"card": 10.95}	Lotta	{"ht1": "10.39", "tva1": "0.56", "total1": "10.95", "totalHt": "10.39", "totalTva": "0.56"}	447	{}	2023	2	18	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	448	{}	2023	2	18	\N
13.00	{"cash": 13}	Lotta	{"ht1": "12.32", "tva1": "0.68", "total1": "13.00", "totalHt": "12.32", "totalTva": "0.68"}	449	{}	2023	2	18	\N
24.45	{"card": 24.45}	Lotta	{"ht1": "23.17", "tva1": "1.28", "total1": "24.45", "totalHt": "23.17", "totalTva": "1.28"}	450	{}	2023	2	18	\N
17.40	{"card": 17.4}	Lotta	{"ht1": "16.49", "tva1": "0.91", "total1": "17.40", "totalHt": "16.49", "totalTva": "0.91"}	451	{}	2023	2	18	\N
40.85	{"card": 40.85}	Lotta	{"ht1": "38.73", "tva1": "2.12", "total1": "40.85", "totalHt": "38.73", "totalTva": "2.12"}	452	{}	2023	2	18	\N
9.00	{"card": 9}	Lotta	{"ht1": "8.53", "tva1": "0.47", "total1": "9.00", "totalHt": "8.53", "totalTva": "0.47"}	453	{}	2023	2	18	\N
5.00	{"card": 5}	Lotta	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	454	{}	2023	2	18	\N
35.90	{"card": 35.9}	Lotta	{"ht1": "34.03", "tva1": "1.87", "total1": "35.90", "totalHt": "34.03", "totalTva": "1.87"}	455	{}	2023	2	18	\N
7.00	{"card": 7}	Lotta	{"ht1": "6.64", "tva1": "0.36", "total1": "7.00", "totalHt": "6.64", "totalTva": "0.36"}	456	{}	2023	2	18	\N
19.80	{"card": 19.8}	Lotta	{"ht1": "18.77", "tva1": "1.03", "total1": "19.80", "totalHt": "18.77", "totalTva": "1.03"}	457	{}	2023	2	18	\N
16.95	{"card": 16.95}	Lotta	{"ht1": "16.07", "tva1": "0.88", "total1": "16.95", "totalHt": "16.07", "totalTva": "0.88"}	458	{}	2023	2	18	\N
16.95	{"card": 16.95}	Lotta	{"ht1": "16.07", "tva1": "0.88", "total1": "16.95", "totalHt": "16.07", "totalTva": "0.88"}	459	{}	2023	2	18	\N
11.95	{"card": 11.95}	Lotta	{"ht1": "11.32", "tva1": "0.63", "total1": "11.95", "totalHt": "11.32", "totalTva": "0.63"}	460	{}	2023	2	18	\N
8.00	{"card": 8}	Lotta	{"ht1": "7.59", "tva1": "0.41", "total1": "8.00", "totalHt": "7.59", "totalTva": "0.41"}	461	{}	2023	2	18	\N
11.15	{"card": 11.15}	Lotta	{"ht1": "10.56", "tva1": "0.59", "total1": "11.15", "totalHt": "10.56", "totalTva": "0.59"}	462	{}	2023	2	18	\N
31.95	{"card": 31.95}	Lotta	{"ht1": "30.29", "tva1": "1.66", "total1": "31.95", "totalHt": "30.29", "totalTva": "1.66"}	463	{}	2023	2	18	\N
16.30	{"card": 16.3}	Lotta	{"ht1": "15.45", "tva1": "0.85", "total1": "16.30", "totalHt": "15.45", "totalTva": "0.85"}	464	{}	2023	2	18	\N
32.95	{"card": 32.95}	Lotta	{"ht1": "17.06", "ht3": "12.46", "tva1": "0.94", "tva3": "2.49", "total1": "18.00", "total3": "14.95", "totalHt": "29.52", "totalTva": "3.43"}	465	{}	2023	2	18	\N
10.00	{"cash": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	466	{}	2023	2	18	\N
5.00	{"card": 5}	Lotta	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	467	{}	2023	2	18	\N
34.90	{"card": 34.9}	Lotta	{"ht1": "33.08", "tva1": "1.82", "total1": "34.90", "totalHt": "33.08", "totalTva": "1.82"}	468	{}	2023	2	18	\N
4.00	{"cash": 4}	Lotta	{"ht1": "3.79", "tva1": "0.21", "total1": "4.00", "totalHt": "3.79", "totalTva": "0.21"}	469	{}	2023	2	18	\N
54.70	{"card": 54.7}	Lotta	{"ht1": "37.67", "ht3": "12.46", "tva1": "2.08", "tva3": "2.49", "total1": "39.75", "total3": "14.95", "totalHt": "50.13", "totalTva": "4.57"}	470	{}	2023	2	18	\N
7.90	{"card": 7.9}	Lotta	{"ht1": "7.50", "tva1": "0.40", "total1": "7.90", "totalHt": "7.50", "totalTva": "0.40"}	471	{}	2023	2	18	\N
16.00	{"card": 16}	Lotta	{"ht1": "15.17", "tva1": "0.83", "total1": "16.00", "totalHt": "15.17", "totalTva": "0.83"}	472	{}	2023	2	18	\N
8.10	{"card": 8.1}	Lotta	{"ht1": "7.68", "tva1": "0.42", "total1": "8.10", "totalHt": "7.68", "totalTva": "0.42"}	473	{}	2023	2	18	\N
9.00	{"card": 9}	Lotta	{"ht1": "8.53", "tva1": "0.47", "total1": "9.00", "totalHt": "8.53", "totalTva": "0.47"}	474	{}	2023	2	18	\N
5.00	{"card": 5}	Lotta	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	475	{}	2023	2	18	\N
5.00	{"card": 5}	Lotta	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	476	{}	2023	2	18	\N
79.30	{"card": 79.3}	Lotta	{"ht1": "37.77", "ht3": "32.88", "tva1": "2.08", "tva3": "6.57", "total1": "39.85", "total3": "39.45", "totalHt": "70.65", "totalTva": "8.65"}	477	{}	2023	2	18	\N
4.50	{"card": 4.5}	Lotta	{"ht3": "3.75", "tva3": "0.75", "total3": "4.50", "totalHt": "3.75", "totalTva": "0.75"}	478	{}	2023	2	18	\N
13.10	{"card": 13.1}	Jaja	{"ht1": "12.41", "tva1": "0.69", "total1": "13.10", "totalHt": "12.41", "totalTva": "0.69"}	479	{}	2023	2	19	\N
10.00	{"cash": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	480	{}	2023	2	19	\N
19.90	{"card": 19.9}	Jaja	{"ht1": "18.87", "tva1": "1.03", "total1": "19.90", "totalHt": "18.87", "totalTva": "1.03"}	481	{}	2023	2	19	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	482	{}	2023	2	19	\N
10.00	{"cash": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	483	{}	2023	2	19	\N
13.00	{"card": 13}	Jaja	{"ht1": "12.32", "tva1": "0.68", "total1": "13.00", "totalHt": "12.32", "totalTva": "0.68"}	484	{}	2023	2	19	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	485	{}	2023	2	19	\N
8.00	{"card": 8}	Jaja	{"ht1": "7.59", "tva1": "0.41", "total1": "8.00", "totalHt": "7.59", "totalTva": "0.41"}	486	{}	2023	2	19	\N
23.05	{"card": 23.05}	Jaja	{"ht1": "21.85", "tva1": "1.20", "total1": "23.05", "totalHt": "21.85", "totalTva": "1.20"}	487	{}	2023	2	19	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	488	{}	2023	2	19	\N
24.40	{"card": 24.4}	Jaja	{"ht1": "23.13", "tva1": "1.27", "total1": "24.40", "totalHt": "23.13", "totalTva": "1.27"}	489	{}	2023	2	19	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	490	{}	2023	2	19	\N
16.10	{"card": 16.1}	Jaja	{"ht1": "10.52", "ht3": "4.17", "tva1": "0.58", "tva3": "0.83", "total1": "11.10", "total3": 5, "totalHt": "14.69", "totalTva": "1.41"}	491	{}	2023	2	19	\N
6.00	{"cash": 6}	Jaja	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	492	{}	2023	2	19	\N
10.00	{"cash": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	493	{}	2023	2	19	\N
61.40	{"card": 61.4}	Jaja	{"ht1": "58.20", "tva1": "3.20", "total1": "61.40", "totalHt": "58.20", "totalTva": "3.20"}	495	{}	2023	2	19	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	496	{}	2023	2	19	\N
4.95	{"card": 4.95}	Jaja	{"ht1": "4.69", "tva1": "0.26", "total1": 4.95, "totalHt": "4.69", "totalTva": "0.26"}	497	{}	2023	2	19	\N
14.85	{"card": 14.85}	Jaja	{"ht1": "14.07", "tva1": "0.78", "total1": "14.85", "totalHt": "14.07", "totalTva": "0.78"}	498	{}	2023	2	19	\N
8.45	{"card": 8.45}	Jaja	{"ht1": "8.00", "tva1": "0.45", "total1": "8.45", "totalHt": "8.00", "totalTva": "0.45"}	499	{}	2023	2	19	\N
20.00	{"card": 20}	Jaja	{"ht1": "18.96", "tva1": "1.04", "total1": 20, "totalHt": "18.96", "totalTva": "1.04"}	500	{}	2023	2	19	\N
23.00	{"card": 23}	Jaja	{"ht1": "21.80", "tva1": "1.20", "total1": "23.00", "totalHt": "21.80", "totalTva": "1.20"}	501	{}	2023	2	19	\N
4.95	{"card": 4.95}	Jaja	{"ht1": "4.69", "tva1": "0.26", "total1": 4.95, "totalHt": "4.69", "totalTva": "0.26"}	502	{"{\\"newPrice\\": 4.95, \\"productId\\": 762, \\"reduction\\": 1, \\"discountType\\": \\"cash\\", \\"originalPrice\\": 5.95, \\"discountAmount\\": \\"1\\"}"}	2023	2	19	\N
22.05	{"cash": 22.05}	Jaja	{"ht1": "20.89", "tva1": "1.16", "total1": "22.05", "totalHt": "20.89", "totalTva": "1.16"}	503	{}	2023	2	19	\N
70.53	{"card": 70.53}	Jaja	{"ht1": "51.83", "ht3": "13.21", "tva1": "2.85", "tva3": "2.64", "total1": "54.68", "total3": "15.85", "totalHt": "65.04", "totalTva": "5.49"}	504	{}	2023	2	19	\N
4.00	{"card": 4}	Jaja	{"ht1": "3.79", "tva1": "0.21", "total1": "4.00", "totalHt": "3.79", "totalTva": "0.21"}	505	{}	2023	2	19	\N
79.40	{"card": 79.4}	Jaja	{"ht1": "75.28", "tva1": "4.12", "total1": "79.40", "totalHt": "75.28", "totalTva": "4.12"}	506	{}	2023	2	19	\N
12.00	{"card": 12}	Jaja	{"ht3": "10.00", "tva3": "2.00", "total3": "12.00", "totalHt": "10.00", "totalTva": "2.00"}	507	{}	2023	2	19	\N
11.45	{"card": 11.45}	Jaja	{"ht1": "6.58", "ht3": "3.75", "tva1": "0.37", "tva3": "0.75", "total1": "6.95", "total3": "4.50", "totalHt": "10.33", "totalTva": "1.12"}	508	{}	2023	2	19	\N
26.15	{"cash": 26.15}	Jaja	{"ht1": "24.79", "tva1": "1.36", "total1": "26.15", "totalHt": "24.79", "totalTva": "1.36"}	509	{}	2023	2	19	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	510	{}	2023	2	19	\N
18.85	{"card": 18.85}	Jaja	{"ht1": "17.86", "tva1": "0.99", "total1": "18.85", "totalHt": "17.86", "totalTva": "0.99"}	511	{}	2023	2	19	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	512	{}	2023	2	19	\N
13.12	{"card": 13.12}	Jaja	{"ht1": "12.43", "tva1": "0.69", "total1": "13.12", "totalHt": "12.43", "totalTva": "0.69"}	513	{}	2023	2	19	\N
2.94	{"card": 2.94}	Jaja	{"ht1": "2.79", "tva1": "0.15", "total1": "2.94", "totalHt": "2.79", "totalTva": "0.15"}	514	{}	2023	2	19	\N
7.30	{"card": 7.3}	Jaja	{"ht1": "6.92", "tva1": "0.38", "total1": "7.30", "totalHt": "6.92", "totalTva": "0.38"}	515	{}	2023	2	19	\N
4.50	{"card": 4.5}	Jaja	{"ht3": "3.75", "tva3": "0.75", "total3": 4.5, "totalHt": "3.75", "totalTva": "0.75"}	516	{}	2023	2	19	\N
18.80	{"card": 18.8}	Jaja	{"ht1": "17.82", "tva1": "0.98", "total1": "18.80", "totalHt": "17.82", "totalTva": "0.98"}	517	{}	2023	2	19	\N
10.00	{"cash": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	518	{}	2023	2	19	\N
11.29	{"card": 11.29}	Jaja	{"ht1": "10.70", "tva1": "0.59", "total1": "11.29", "totalHt": "10.70", "totalTva": "0.59"}	519	{}	2023	2	19	\N
6.00	{"cash": 6}	Jaja	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	520	{}	2023	2	19	\N
6.00	{"cash": 6}	Jaja	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	522	{}	2023	2	19	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	523	{}	2023	2	19	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	524	{}	2023	2	19	\N
22.90	{"card": 22.9}	Jaja	{"ht1": "21.70", "tva1": "1.20", "total1": "22.90", "totalHt": "21.70", "totalTva": "1.20"}	525	{}	2023	2	19	\N
37.45	{"card": 37.45}	Jaja	{"ht1": "34.08", "ht3": "1.25", "tva1": "1.87", "tva3": "0.25", "total1": "35.95", "total3": 1.5, "totalHt": "35.33", "totalTva": "2.12"}	526	{}	2023	2	19	\N
12.00	{"card": 12}	Jaja	{"ht1": "11.38", "tva1": "0.62", "total1": "12.00", "totalHt": "11.38", "totalTva": "0.62"}	527	{}	2023	2	19	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	528	{}	2023	2	19	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.69", "tva1": "0.31", "total1": 6, "totalHt": "5.69", "totalTva": "0.31"}	529	{}	2023	2	19	\N
7.00	{"card": 7.00}	Jaja	{"ht1": "6.63", "tva1": "0.37", "total1": "7.00", "totalHt": "6.63", "totalTva": "0.37"}	521	{}	2023	2	19	\N
12.40	{"card": 12.4}	Jaja	{"ht1": "11.76", "tva1": "0.64", "total1": "12.40", "totalHt": "11.76", "totalTva": "0.64"}	530	{}	2023	2	21	\N
7.95	{"card": 7.95}	Jaja	{"ht1": "7.54", "tva1": "0.41", "total1": 7.95, "totalHt": "7.54", "totalTva": "0.41"}	531	{}	2023	2	21	\N
14.00	{"cash": 14}	Jaja	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	532	{}	2023	2	21	\N
15.10	{"card": 15.1}	Jaja	{"ht1": "14.31", "tva1": "0.79", "total1": "15.10", "totalHt": "14.31", "totalTva": "0.79"}	533	{}	2023	2	21	\N
4.00	{"card": 4}	Jaja	{"ht1": "3.79", "tva1": "0.21", "total1": 4, "totalHt": "3.79", "totalTva": "0.21"}	534	{}	2023	2	21	\N
104.39	{"card": 104.39}	Jaja	{"ht1": "98.93", "tva1": "5.46", "total1": "104.39", "totalHt": "98.93", "totalTva": "5.46"}	535	{}	2023	2	21	\N
8.00	{"card": 8}	Jaja	{"ht1": "7.58", "tva1": "0.42", "total1": 8, "totalHt": "7.58", "totalTva": "0.42"}	536	{}	2023	2	21	\N
29.85	{"card": 29.85}	Jaja	{"ht1": "22.04", "ht2": "6.46", "tva1": "1.21", "tva2": "0.14", "total1": "23.25", "total2": "6.60", "totalHt": "28.50", "totalTva": "1.35"}	537	{}	2023	2	21	\N
4.00	{"card": 4}	Jaja	{"ht1": "3.79", "tva1": "0.21", "total1": 4, "totalHt": "3.79", "totalTva": "0.21"}	538	{}	2023	2	21	\N
27.74	{"card": 27.74}	Jaja	{"ht1": "26.29", "tva1": "1.45", "total1": "27.74", "totalHt": "26.29", "totalTva": "1.45"}	539	{}	2023	2	21	\N
18.00	{"card": 18}	Jaja	{"ht1": "17.06", "tva1": "0.94", "total1": "18.00", "totalHt": "17.06", "totalTva": "0.94"}	540	{}	2023	2	21	\N
17.95	{"card": 17.95}	Jaja	{"ht1": "17.01", "tva1": "0.94", "total1": "17.95", "totalHt": "17.01", "totalTva": "0.94"}	541	{}	2023	2	21	\N
84.62	{"card": 84.62}	Jaja	{"ht1": "62.73", "ht2": "13.22", "ht3": "4.13", "tva1": "3.44", "tva2": "0.28", "tva3": "0.82", "total1": "66.17", "total2": "13.50", "total3": "4.95", "totalHt": "80.08", "totalTva": "4.54"}	542	{}	2023	2	21	\N
75.40	{"card": 75.4}	Jaja	{"ht1": "71.46", "tva1": "3.94", "total1": "75.40", "totalHt": "71.46", "totalTva": "3.94"}	543	{}	2023	2	21	\N
12.00	{"card": 12}	Jaja	{"ht1": "11.37", "tva1": "0.63", "total1": "12.00", "totalHt": "11.37", "totalTva": "0.63"}	544	{}	2023	2	21	\N
15.10	{"card": 15.1}	Jaja	{"ht1": "14.31", "tva1": "0.79", "total1": "15.10", "totalHt": "14.31", "totalTva": "0.79"}	545	{}	2023	2	21	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.69", "tva1": "0.31", "total1": 6, "totalHt": "5.69", "totalTva": "0.31"}	546	{}	2023	2	21	\N
40.00	{"card": 40}	Jaja	{"ht1": "37.91", "tva1": "2.09", "total1": "40.00", "totalHt": "37.91", "totalTva": "2.09"}	547	{}	2023	2	21	\N
6.00	{"cash": 6}	Jaja	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	548	{}	2023	2	21	\N
103.60	{"card": 103.6}	Jaja	{"ht1": "98.20", "tva1": "5.40", "total1": "103.60", "totalHt": "98.20", "totalTva": "5.40"}	549	{}	2023	2	21	\N
13.40	{"card": 13.4}	Jaja	{"ht1": "12.70", "tva1": "0.70", "total1": "13.40", "totalHt": "12.70", "totalTva": "0.70"}	550	{}	2023	2	21	\N
55.95	{"card": 55.95}	Jaja	{"ht1": "53.03", "tva1": "2.92", "total1": "55.95", "totalHt": "53.03", "totalTva": "2.92"}	551	{"{\\"newPrice\\": -2, \\"productId\\": \\"M_35\\", \\"reduction\\": 2, \\"discountType\\": \\"cash\\", \\"originalPrice\\": \\"0.00\\", \\"discountAmount\\": \\"2\\"}"}	2023	2	21	\N
16.65	{"card": 16.65}	Jaja	{"ht1": "15.78", "tva1": "0.87", "total1": "16.65", "totalHt": "15.78", "totalTva": "0.87"}	552	{}	2023	2	21	\N
0.00	{"card": 0}	Jaja	{}	553	{}	2023	2	21	\N
45.00	{"card": 45}	Jaja	{"ht1": "42.65", "tva1": "2.35", "total1": 45, "totalHt": "42.65", "totalTva": "2.35"}	554	{}	2023	2	21	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	555	{}	2023	2	21	\N
22.00	{"card": 22}	Jaja	{"ht1": "20.86", "tva1": "1.14", "total1": "22.00", "totalHt": "20.86", "totalTva": "1.14"}	556	{}	2023	2	21	\N
27.50	{"card": 27.5}	Jaja	{"ht1": "26.07", "tva1": "1.43", "total1": "27.50", "totalHt": "26.07", "totalTva": "1.43"}	557	{}	2023	2	21	\N
22.00	{"card": 22}	Jaja	{"ht1": "20.86", "tva1": "1.14", "total1": "22.00", "totalHt": "20.86", "totalTva": "1.14"}	558	{}	2023	2	21	\N
22.00	{"cash": 22}	Jaja	{"ht1": "20.86", "tva1": "1.14", "total1": "22.00", "totalHt": "20.86", "totalTva": "1.14"}	559	{}	2023	2	21	\N
50.60	{"card": 50.6}	Jaja	{"ht1": "47.95", "tva1": "2.65", "total1": "50.60", "totalHt": "47.95", "totalTva": "2.65"}	560	{}	2023	2	21	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	561	{}	2023	2	21	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	562	{}	2023	2	21	\N
10.95	{"card": 10.95}	Jaja	{"ht1": "10.38", "tva1": "0.57", "total1": "10.95", "totalHt": "10.38", "totalTva": "0.57"}	563	{}	2023	2	21	\N
36.70	{"cash": 36.7}	Jaja	{"ht1": "34.79", "tva1": "1.91", "total1": "36.70", "totalHt": "34.79", "totalTva": "1.91"}	564	{}	2023	2	21	\N
43.50	{"card": 43.5}	Jaja	{"ht1": "32.23", "ht2": "9.30", "tva1": "1.77", "tva2": "0.20", "total1": "34.00", "total2": "9.50", "totalHt": "41.53", "totalTva": "1.97"}	565	{}	2023	2	21	\N
5.00	{"card": 5}	Jaja	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	566	{}	2023	2	21	\N
21.00	{"card": 21}	Jaja	{"ht1": "19.91", "tva1": "1.09", "total1": "21.00", "totalHt": "19.91", "totalTva": "1.09"}	567	{}	2023	2	21	\N
10.00	{"cash": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	568	{}	2023	2	21	\N
5.00	{"cash": 5}	Jaja	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	569	{}	2023	2	21	\N
8.00	{"card": 8}	Jaja	{"ht1": "7.58", "tva1": "0.42", "total1": 8, "totalHt": "7.58", "totalTva": "0.42"}	570	{}	2023	2	21	\N
4.00	{"card": 4}	Jaja	{"ht1": "3.79", "tva1": "0.21", "total1": 4, "totalHt": "3.79", "totalTva": "0.21"}	571	{}	2023	2	21	\N
6.00	{"cash": 6}	Jaja	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	572	{}	2023	2	21	\N
3.00	{"cash": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	573	{}	2023	2	21	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	574	{}	2023	2	21	\N
16.38	{"card": 16.38}	Jaja	{"ht1": "15.53", "tva1": "0.85", "total1": "16.38", "totalHt": "15.53", "totalTva": "0.85"}	575	{}	2023	2	21	\N
26.40	{"card": 26.4}	Jaja	{"ht1": "20.75", "ht3": "3.75", "tva1": "1.15", "tva3": "0.75", "total1": "21.90", "total3": "4.50", "totalHt": "24.50", "totalTva": "1.90"}	576	{}	2023	2	21	\N
17.00	{"card": 17}	Jaja	{"ht1": "16.11", "tva1": "0.89", "total1": "17.00", "totalHt": "16.11", "totalTva": "0.89"}	577	{}	2023	2	21	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	578	{}	2023	2	21	\N
8.00	{"card": 8}	Jaja	{"ht1": "7.58", "tva1": "0.42", "total1": 8, "totalHt": "7.58", "totalTva": "0.42"}	579	{}	2023	2	21	\N
14.99	{"card": 14.99}	Jaja	{"ht1": "14.21", "tva1": "0.78", "total1": "14.99", "totalHt": "14.21", "totalTva": "0.78"}	580	{}	2023	2	21	\N
48.50	{"card": 48.5}	Jaja	{"ht1": "42.23", "ht3": "3.29", "tva1": "2.32", "tva3": "0.66", "total1": "44.55", "total3": 3.95, "totalHt": "45.52", "totalTva": "2.98"}	581	{}	2023	2	21	\N
30.90	{"card": 30.9}	Jaja	{"ht1": "19.86", "ht3": "8.29", "tva1": "1.09", "tva3": "1.66", "total1": "20.95", "total3": 9.95, "totalHt": "28.15", "totalTva": "2.75"}	582	{}	2023	2	21	\N
7.95	{"cash": 7.95}	Jaja	{"ht1": "2.80", "ht3": "4.17", "tva1": "0.15", "tva3": "0.83", "total1": "2.95", "total3": "5.00", "totalHt": "6.97", "totalTva": "0.98"}	583	{}	2023	2	21	\N
9.00	{"card": 9}	Jaja	{"ht1": "8.53", "tva1": "0.47", "total1": 9, "totalHt": "8.53", "totalTva": "0.47"}	584	{}	2023	2	21	\N
23.10	{"card": 23.1}	Jaja	{"ht1": "21.89", "tva1": "1.21", "total1": "23.10", "totalHt": "21.89", "totalTva": "1.21"}	585	{}	2023	2	21	\N
33.40	{"cash": 33.4}	Jaja	{"ht1": "31.66", "tva1": "1.74", "total1": "33.40", "totalHt": "31.66", "totalTva": "1.74"}	586	{}	2023	2	21	\N
15.10	{"card": 15.1}	Jaja	{"ht1": "14.31", "tva1": "0.79", "total1": "15.10", "totalHt": "14.31", "totalTva": "0.79"}	587	{}	2023	2	21	\N
4.00	{"card": 4}	Jaja	{"ht1": "3.79", "tva1": "0.21", "total1": 4, "totalHt": "3.79", "totalTva": "0.21"}	588	{}	2023	2	21	\N
26.00	{"card": 26}	Jaja	{"ht1": "24.65", "tva1": "1.35", "total1": "26.00", "totalHt": "24.65", "totalTva": "1.35"}	589	{}	2023	2	21	\N
15.10	{"card": 15.1}	Jaja	{"ht1": "14.31", "tva1": "0.79", "total1": "15.10", "totalHt": "14.31", "totalTva": "0.79"}	590	{}	2023	2	21	\N
8.00	{"cash": 8}	Jaja	{"ht1": "7.58", "tva1": "0.42", "total1": 8, "totalHt": "7.58", "totalTva": "0.42"}	591	{}	2023	2	21	\N
34.25	{"card": 34.25}	Jaja	{"ht1": "17.49", "ht3": "13.17", "tva1": "0.96", "tva3": "2.63", "total1": "18.45", "total3": "15.80", "totalHt": "30.66", "totalTva": "3.59"}	592	{}	2023	2	21	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.69", "tva1": "0.31", "total1": 6, "totalHt": "5.69", "totalTva": "0.31"}	593	{}	2023	2	21	\N
24.30	{"card": 24.3}	Jaja	{"ht1": "23.03", "tva1": "1.27", "total1": "24.30", "totalHt": "23.03", "totalTva": "1.27"}	594	{}	2023	2	21	\N
57.88	{"card": 57.88}	Jaja	{"ht1": "43.51", "ht3": "10.00", "tva1": "2.37", "tva3": "2.00", "total1": "45.88", "total3": "12.00", "totalHt": "53.51", "totalTva": "4.37"}	595	{}	2023	2	21	\N
33.80	{"card": 33.8}	Jaja	{"ht1": "32.04", "tva1": "1.76", "total1": "33.80", "totalHt": "32.04", "totalTva": "1.76"}	596	{}	2023	2	21	\N
4.00	{"card": 4}	Jaja	{"ht1": "3.79", "tva1": "0.21", "total1": 4, "totalHt": "3.79", "totalTva": "0.21"}	597	{}	2023	2	21	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	598	{}	2023	2	21	\N
18.73	{"card": 18.73}	Jaja	{"ht1": "17.75", "tva1": "0.98", "total1": "18.73", "totalHt": "17.75", "totalTva": "0.98"}	599	{}	2023	2	21	\N
5.95	{"cash": 5.95}	Jaja	{"ht1": "5.64", "tva1": "0.31", "total1": 5.95, "totalHt": "5.64", "totalTva": "0.31"}	601	{}	2023	2	21	\N
17.46	{"card": 17.46}	Jaja	{"ht1": "16.55", "tva1": "0.91", "total1": "17.46", "totalHt": "16.55", "totalTva": "0.91"}	602	{}	2023	2	21	\N
9.50	{"cash": 9.5}	Jaja	{"ht1": "9.01", "tva1": "0.49", "total1": "9.50", "totalHt": "9.01", "totalTva": "0.49"}	603	{}	2023	2	21	\N
19.20	{"cash": 19.2}	Jaja	{"ht1": "18.20", "tva1": "1.00", "total1": "19.20", "totalHt": "18.20", "totalTva": "1.00"}	604	{}	2023	2	21	\N
4.10	{"card": 4.1}	Jaja	{"ht1": "3.89", "tva1": "0.21", "total1": "4.10", "totalHt": "3.89", "totalTva": "0.21"}	605	{}	2023	2	21	\N
3.50	{"card": 3.5}	Jaja	{"ht1": "3.32", "tva1": "0.18", "total1": 3.5, "totalHt": "3.32", "totalTva": "0.18"}	606	{}	2023	2	21	\N
58.95	{"cash": 58.95}	Jaja	{"ht1": "55.88", "tva1": "3.07", "total1": "58.95", "totalHt": "55.88", "totalTva": "3.07"}	494	{}	2023	2	19	\N
48.75	{"card": 34.50, "cash": 14.25}	Jaja	{"ht1": "46.21", "tva1": "2.54", "total1": "48.75", "totalHt": "46.21", "totalTva": "2.54"}	600	{}	2023	2	21	\N
24.45	{"card": 24.45}	Jaja	{"ht1": "6.64", "ht3": "14.54", "tva1": "0.36", "tva3": "2.91", "total1": "7.00", "total3": "17.45", "totalHt": "21.18", "totalTva": "3.27"}	607	{}	2023	2	22	\N
16.15	{"card": 16.15}	Jaja	{"ht1": "15.31", "tva1": "0.84", "total1": "16.15", "totalHt": "15.31", "totalTva": "0.84"}	608	{}	2023	2	22	\N
25.80	{"cash": 25.8}	Jaja	{"ht1": "24.45", "tva1": "1.35", "total1": "25.80", "totalHt": "24.45", "totalTva": "1.35"}	609	{}	2023	2	22	\N
9.04	{"card": 9.04}	Jaja	{"ht1": "7.14", "ht3": "1.25", "tva1": "0.40", "tva3": "0.25", "total1": "7.54", "total3": 1.5, "totalHt": "8.39", "totalTva": "0.65"}	610	{}	2023	2	22	\N
8.45	{"card": 8.45}	Jaja	{"ht1": "8.01", "tva1": "0.44", "total1": "8.45", "totalHt": "8.01", "totalTva": "0.44"}	611	{}	2023	2	22	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	612	{}	2023	2	22	\N
34.00	{"card": 34}	Jaja	{"ht1": "32.22", "tva1": "1.78", "total1": "34.00", "totalHt": "32.22", "totalTva": "1.78"}	613	{}	2023	2	22	\N
22.00	{"card": 22}	Jaja	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	614	{}	2023	2	22	\N
22.00	{"card": 22}	Jaja	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	615	{}	2023	2	22	\N
17.20	{"card": 17.2}	Jaja	{"ht1": "16.30", "tva1": "0.90", "total1": "17.20", "totalHt": "16.30", "totalTva": "0.90"}	616	{}	2023	2	22	\N
43.95	{"card": 43.95}	Jaja	{"ht1": "41.65", "tva1": "2.30", "total1": "43.95", "totalHt": "41.65", "totalTva": "2.30"}	617	{}	2023	2	22	\N
12.00	{"card": 12}	Jaja	{"ht1": "11.37", "tva1": "0.63", "total1": "12.00", "totalHt": "11.37", "totalTva": "0.63"}	618	{}	2023	2	22	\N
36.70	{"cash": 36.7}	Jaja	{"ht1": "34.78", "tva1": "1.92", "total1": "36.70", "totalHt": "34.78", "totalTva": "1.92"}	619	{}	2023	2	22	\N
17.10	{"card": 17.1}	Jaja	{"ht1": "16.21", "tva1": "0.89", "total1": "17.10", "totalHt": "16.21", "totalTva": "0.89"}	620	{}	2023	2	22	\N
9.15	{"card": 9.15}	Jaja	{"ht1": "8.67", "tva1": "0.48", "total1": "9.15", "totalHt": "8.67", "totalTva": "0.48"}	621	{}	2023	2	22	\N
23.80	{"cash": 23.8}	Jaja	{"ht1": "22.56", "tva1": "1.24", "total1": "23.80", "totalHt": "22.56", "totalTva": "1.24"}	623	{}	2023	2	22	\N
4.00	{"card": 4}	Jaja	{"ht1": "3.79", "tva1": "0.21", "total1": 4, "totalHt": "3.79", "totalTva": "0.21"}	624	{}	2023	2	22	\N
4.00	{"card": 4}	Jaja	{"ht1": "3.79", "tva1": "0.21", "total1": 4, "totalHt": "3.79", "totalTva": "0.21"}	625	{}	2023	2	22	\N
1.95	{"card": 1.95}	Jaja	{"ht1": "1.85", "tva1": "0.10", "total1": 1.95, "totalHt": "1.85", "totalTva": "0.10"}	626	{}	2023	2	22	\N
30.00	{"card": 30}	Jaja	{"ht1": "28.44", "tva1": "1.56", "total1": "30.00", "totalHt": "28.44", "totalTva": "1.56"}	627	{}	2023	2	22	\N
26.00	{"card": 26}	Jaja	{"ht1": "24.65", "tva1": "1.35", "total1": "26.00", "totalHt": "24.65", "totalTva": "1.35"}	628	{}	2023	2	22	\N
16.55	{"cash": 16.55}	Jaja	{"ht1": "11.94", "ht3": "3.29", "tva1": "0.66", "tva3": "0.66", "total1": "12.60", "total3": 3.95, "totalHt": "15.23", "totalTva": "1.32"}	629	{}	2023	2	22	\N
16.55	{"card": 16.55}	Jaja	{"ht1": "11.94", "ht3": "3.29", "tva1": "0.66", "tva3": "0.66", "total1": "12.60", "total3": 3.95, "totalHt": "15.23", "totalTva": "1.32"}	630	{}	2023	2	22	\N
11.10	{"card": 11.1}	Jaja	{"ht1": "10.51", "tva1": "0.59", "total1": "11.10", "totalHt": "10.51", "totalTva": "0.59"}	631	{}	2023	2	22	\N
12.00	{"card": 12}	Jaja	{"ht1": "11.37", "tva1": "0.63", "total1": "12.00", "totalHt": "11.37", "totalTva": "0.63"}	632	{}	2023	2	22	\N
16.50	{"card": 16.5}	Jaja	{"ht1": "15.64", "tva1": "0.86", "total1": "16.50", "totalHt": "15.64", "totalTva": "0.86"}	633	{}	2023	2	22	\N
15.00	{"card": 15}	Jaja	{"ht1": "14.22", "tva1": "0.78", "total1": "15.00", "totalHt": "14.22", "totalTva": "0.78"}	634	{}	2023	2	22	\N
12.00	{"cash": 12}	Jaja	{"ht1": "11.37", "tva1": "0.63", "total1": 12, "totalHt": "11.37", "totalTva": "0.63"}	635	{}	2023	2	22	\N
51.40	{"card": 51.4}	Jaja	{"ht1": "47.29", "ht3": "1.25", "tva1": "2.61", "tva3": "0.25", "total1": "49.90", "total3": 1.5, "totalHt": "48.54", "totalTva": "2.86"}	636	{"{\\"newPrice\\": 3, \\"productId\\": 424, \\"reduction\\": 3.95, \\"discountType\\": \\"cash\\", \\"originalPrice\\": 6.95, \\"discountAmount\\": \\"3.95\\"}"}	2023	2	22	\N
6.00	{"cash": 6}	Jaja	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	637	{"{\\"newPrice\\": 0.75, \\"productId\\": 753, \\"reduction\\": 0.75, \\"discountType\\": \\"percent\\", \\"originalPrice\\": 1.5, \\"discountAmount\\": \\"50\\"}","{\\"newPrice\\": 2.25, \\"productId\\": 147, \\"reduction\\": 2.25, \\"discountType\\": \\"percent\\", \\"originalPrice\\": 4.5, \\"discountAmount\\": \\"50\\"}","{\\"newPrice\\": 3, \\"productId\\": \\"c-Kardemumbulle\\", \\"reduction\\": 3, \\"discountType\\": \\"percent\\", \\"originalPrice\\": \\"6.00\\", \\"discountAmount\\": \\"50\\"}"}	2023	2	22	\N
3.10	{"cash": 3.1}	Jaja	{"ht1": "2.94", "tva1": "0.16", "total1": 3.1, "totalHt": "2.94", "totalTva": "0.16"}	638	{}	2023	2	22	\N
2.00	{"card": 2}	Jaja	{"ht1": "1.90", "tva1": "0.10", "total1": 2, "totalHt": "1.90", "totalTva": "0.10"}	639	{}	2023	2	22	\N
22.10	{"card": 22.1}	Jaja	{"ht1": "20.94", "tva1": "1.16", "total1": "22.10", "totalHt": "20.94", "totalTva": "1.16"}	640	{}	2023	2	22	\N
6.00	{"cash": 6}	Jaja	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	641	{}	2023	2	22	\N
12.00	{"card": 12}	Jaja	{"ht1": "11.37", "tva1": "0.63", "total1": "12.00", "totalHt": "11.37", "totalTva": "0.63"}	642	{}	2023	2	22	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	643	{}	2023	2	22	\N
8.00	{"card": 8}	Jaja	{"ht1": "7.58", "tva1": "0.42", "total1": 8, "totalHt": "7.58", "totalTva": "0.42"}	644	{}	2023	2	22	\N
85.00	{"check": 85}	Jaja	{"ht1": "80.57", "tva1": "4.43", "total1": "85.00", "totalHt": "80.57", "totalTva": "4.43"}	645	{}	2023	2	22	\N
10.00	{"cash": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	646	{}	2023	2	22	\N
20.00	{"card": 20}	Jaja	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	647	{}	2023	2	22	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	648	{}	2023	2	22	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	649	{}	2023	2	22	\N
40.00	{"card": 40}	Jaja	{"ht1": "37.91", "tva1": "2.09", "total1": "40.00", "totalHt": "37.91", "totalTva": "2.09"}	650	{}	2023	2	22	\N
20.00	{"cash": 20}	Jaja	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	651	{}	2023	2	23	\N
9.95	{"cash": 9.95}	Jaja	{"ht1": "9.43", "tva1": "0.52", "total1": 9.95, "totalHt": "9.43", "totalTva": "0.52"}	652	{}	2023	2	23	\N
52.85	{"card": 52.85}	Jaja	{"ht1": "50.10", "tva1": "2.75", "total1": "52.85", "totalHt": "50.10", "totalTva": "2.75"}	653	{}	2023	2	23	\N
23.00	{"card": 23}	Jaja	{"ht1": "21.80", "tva1": "1.20", "total1": "23.00", "totalHt": "21.80", "totalTva": "1.20"}	654	{}	2023	2	23	\N
4.20	{"cash": 4.2}	Jaja	{"ht1": "3.98", "tva1": "0.22", "total1": 4.2, "totalHt": "3.98", "totalTva": "0.22"}	655	{}	2023	2	23	\N
21.15	{"cash": 21.15}	Jaja	{"ht1": "20.05", "tva1": "1.10", "total1": "21.15", "totalHt": "20.05", "totalTva": "1.10"}	656	{}	2023	2	23	\N
33.00	{"cash": 33}	Jaja	{"ht1": "18.97", "ht3": "10.83", "tva1": "1.03", "tva3": "2.17", "total1": "20.00", "total3": "13.00", "totalHt": "29.80", "totalTva": "3.20"}	657	{}	2023	2	23	\N
14.00	{"cash": 14}	Jaja	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	658	{}	2023	2	23	\N
8.00	{"card": 8}	Jaja	{"ht1": "7.58", "tva1": "0.42", "total1": 8, "totalHt": "7.58", "totalTva": "0.42"}	659	{}	2023	2	23	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.69", "tva1": "0.31", "total1": 6, "totalHt": "5.69", "totalTva": "0.31"}	660	{}	2023	2	23	\N
23.35	{"card": 23.35}	Jaja	{"ht1": "22.14", "tva1": "1.21", "total1": "23.35", "totalHt": "22.14", "totalTva": "1.21"}	661	{}	2023	2	23	\N
3.12	{"card": 3.12}	Jaja	{"ht1": "2.96", "tva1": "0.16", "total1": "3.12", "totalHt": "2.96", "totalTva": "0.16"}	662	{}	2023	2	23	\N
16.00	{"card": 16}	Jaja	{"ht1": "15.17", "tva1": "0.83", "total1": "16.00", "totalHt": "15.17", "totalTva": "0.83"}	663	{}	2023	2	23	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	664	{}	2023	2	23	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	665	{}	2023	2	23	\N
48.00	{"card": 48}	Jaja	{"ht1": "45.49", "tva1": "2.51", "total1": "48.00", "totalHt": "45.49", "totalTva": "2.51"}	666	{}	2023	2	23	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	667	{}	2023	2	23	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	668	{}	2023	2	23	\N
8.00	{"card": 8}	Jaja	{"ht1": "7.58", "tva1": "0.42", "total1": 8, "totalHt": "7.58", "totalTva": "0.42"}	669	{}	2023	2	23	\N
8.50	{"card": 8.5}	Jaja	{"ht1": "8.06", "tva1": "0.44", "total1": "8.50", "totalHt": "8.06", "totalTva": "0.44"}	670	{}	2023	2	23	\N
4.00	{"card": 4}	Jaja	{"ht1": "3.79", "tva1": "0.21", "total1": 4, "totalHt": "3.79", "totalTva": "0.21"}	671	{}	2023	2	23	\N
46.10	{"card": 46.1}	Jaja	{"ht1": "43.69", "tva1": "2.41", "total1": "46.10", "totalHt": "43.69", "totalTva": "2.41"}	672	{}	2023	2	23	\N
173.50	{"card": 173.5}	Jaja	{"ht1": "164.46", "tva1": "9.04", "total1": "173.50", "totalHt": "164.46", "totalTva": "9.04"}	673	{}	2023	2	23	\N
11.00	{"card": 11}	Jaja	{"ht1": "10.42", "tva1": "0.58", "total1": "11.00", "totalHt": "10.42", "totalTva": "0.58"}	674	{}	2023	2	23	\N
74.00	{"card": 74}	Jaja	{"ht1": "70.15", "tva1": "3.85", "total1": "74.00", "totalHt": "70.15", "totalTva": "3.85"}	675	{}	2023	2	23	\N
30.35	{"card": 30.35}	Jaja	{"ht1": "28.78", "tva1": "1.57", "total1": "30.35", "totalHt": "28.78", "totalTva": "1.57"}	676	{}	2023	2	23	\N
8.00	{"card": 8}	Jaja	{"ht1": "7.58", "tva1": "0.42", "total1": 8, "totalHt": "7.58", "totalTva": "0.42"}	677	{}	2023	2	23	\N
18.55	{"cash": 18.55}	Jaja	{"ht1": "15.44", "ht3": "1.88", "tva1": "0.86", "tva3": "0.37", "total1": "16.30", "total3": 2.25, "totalHt": "17.32", "totalTva": "1.23"}	678	{}	2023	2	23	\N
17.64	{"card": 17.64}	Jaja	{"ht1": "16.72", "tva1": "0.92", "total1": "17.64", "totalHt": "16.72", "totalTva": "0.92"}	679	{}	2023	2	23	\N
19.92	{"cash": 19.92}	Jaja	{"ht1": "18.86", "tva1": "1.06", "total1": "19.92", "totalHt": "18.86", "totalTva": "1.06"}	680	{}	2023	2	23	\N
65.15	{"card": 65.15}	Jaja	{"ht1": "58.01", "ht3": "3.29", "tva1": "3.19", "tva3": "0.66", "total1": "61.20", "total3": 3.95, "totalHt": "61.30", "totalTva": "3.85"}	681	{}	2023	2	23	\N
36.97	{"cash": 36.97}	Jaja	{"ht1": "35.05", "tva1": "1.92", "total1": "36.97", "totalHt": "35.05", "totalTva": "1.92"}	682	{}	2023	2	23	\N
79.80	{"card": 79.8}	Jaja	{"ht1": "75.64", "tva1": "4.16", "total1": "79.80", "totalHt": "75.64", "totalTva": "4.16"}	683	{}	2023	2	23	\N
10.00	{"cash": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	684	{}	2023	2	23	\N
16.40	{"card": 16.4}	Jaja	{"ht1": "15.54", "tva1": "0.86", "total1": "16.40", "totalHt": "15.54", "totalTva": "0.86"}	685	{}	2023	2	23	\N
13.95	{"card": 13.95}	Jaja	{"ht1": "13.22", "tva1": "0.73", "total1": 13.95, "totalHt": "13.22", "totalTva": "0.73"}	686	{}	2023	2	23	\N
1.95	{"cash": 1.95}	Jaja	{"ht1": "1.85", "tva1": "0.10", "total1": "1.95", "totalHt": "1.85", "totalTva": "0.10"}	687	{}	2023	2	23	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	688	{}	2023	2	23	\N
12.00	{"card": 12}	Jaja	{"ht1": "11.37", "tva1": "0.63", "total1": "12.00", "totalHt": "11.37", "totalTva": "0.63"}	689	{}	2023	2	23	\N
41.00	{"card": 41}	Jaja	{"ht1": "38.86", "tva1": "2.14", "total1": "41.00", "totalHt": "38.86", "totalTva": "2.14"}	690	{}	2023	2	23	\N
4.95	{"cash": 4.95}	Jaja	{"ht1": "4.69", "tva1": "0.26", "total1": "4.95", "totalHt": "4.69", "totalTva": "0.26"}	691	{}	2023	2	23	\N
22.95	{"card": 22.95}	Jaja	{"ht1": "21.75", "tva1": "1.20", "total1": "22.95", "totalHt": "21.75", "totalTva": "1.20"}	692	{}	2023	2	23	\N
86.30	{"card": 86.3}	Jaja	{"ht1": "70.41", "ht3": "10.00", "tva1": "3.89", "tva3": "2.00", "total1": "74.30", "total3": "12.00", "totalHt": "80.41", "totalTva": "5.89"}	693	{}	2023	2	23	\N
12.00	{"card": 12}	Jaja	{"ht1": "11.38", "tva1": "0.62", "total1": "12.00", "totalHt": "11.38", "totalTva": "0.62"}	694	{}	2023	2	23	\N
15.95	{"card": 15.95}	Jaja	{"ht1": "15.12", "tva1": "0.83", "total1": "15.95", "totalHt": "15.12", "totalTva": "0.83"}	695	{}	2023	2	23	\N
2.00	{"cash": 2}	Jaja	{"ht1": "1.90", "tva1": "0.10", "total1": 2, "totalHt": "1.90", "totalTva": "0.10"}	696	{}	2023	2	23	\N
27.20	{"card": 27.2}	Lotta	{"ht1": "25.78", "tva1": "1.42", "total1": "27.20", "totalHt": "25.78", "totalTva": "1.42"}	697	{}	2023	2	24	\N
6.00	{"card": 6}	Lotta	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	698	{}	2023	2	24	\N
6.00	{"card": 6}	Lotta	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	699	{}	2023	2	24	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	700	{}	2023	2	24	\N
2.00	{"card": 2}	Lotta	{"ht1": "1.90", "tva1": "0.10", "total1": 2, "totalHt": "1.90", "totalTva": "0.10"}	701	{}	2023	2	24	\N
47.05	{"card": 47.05}	Lotta	{"ht1": "17.91", "ht3": "23.46", "tva1": "0.99", "tva3": "4.69", "total1": "18.90", "total3": "28.15", "totalHt": "41.37", "totalTva": "5.68"}	702	{}	2023	2	24	\N
14.85	{"card": 14.85}	Lotta	{"ht1": "14.07", "tva1": "0.78", "total1": "14.85", "totalHt": "14.07", "totalTva": "0.78"}	703	{}	2023	2	24	\N
42.55	{"cash": 42.55}	Lotta	{"ht1": "24.74", "ht2": "7.35", "ht3": "7.46", "tva1": "1.36", "tva2": "0.15", "tva3": "1.49", "total1": "26.10", "total2": "7.50", "total3": "8.95", "totalHt": "39.55", "totalTva": "3.00"}	704	{}	2023	2	24	\N
15.00	{"card": 15}	Lotta	{"ht1": "14.22", "tva1": "0.78", "total1": 15, "totalHt": "14.22", "totalTva": "0.78"}	705	{}	2023	2	24	\N
49.90	{"card": 49.9}	Lotta	{"ht1": "31.71", "ht2": "13.22", "ht3": "2.46", "tva1": "1.74", "tva2": "0.28", "tva3": "0.49", "total1": "33.45", "total2": "13.50", "total3": "2.95", "totalHt": "47.39", "totalTva": "2.51"}	706	{}	2023	2	24	\N
19.30	{"card": 19.3}	Lotta	{"ht1": "18.29", "tva1": "1.01", "total1": "19.30", "totalHt": "18.29", "totalTva": "1.01"}	707	{}	2023	2	24	\N
174.40	{"card": 174.4}	Lotta	{"ht1": "73.89", "ht3": "80.38", "tva1": "4.06", "tva3": "16.07", "total1": "77.95", "total3": "96.45", "totalHt": "154.27", "totalTva": "20.13"}	708	{}	2023	2	24	\N
15.00	{"card": 15}	Lotta	{"ht1": "14.22", "tva1": "0.78", "total1": "15.00", "totalHt": "14.22", "totalTva": "0.78"}	709	{}	2023	2	24	\N
51.80	{"card": 51.8}	Lotta	{"ht1": "49.10", "tva1": "2.70", "total1": "51.80", "totalHt": "49.10", "totalTva": "2.70"}	710	{}	2023	2	24	\N
0.00	{"card": 0}	Lotta	{}	711	{}	2023	2	24	\N
15.00	{"card": 15}	Lotta	{"ht1": "14.22", "tva1": "0.78", "total1": 15, "totalHt": "14.22", "totalTva": "0.78"}	712	{}	2023	2	24	\N
52.90	{"card": 52.9}	Lotta	{"ht1": "28.43", "ht3": "19.08", "tva1": "1.57", "tva3": "3.82", "total1": "30.00", "total3": "22.90", "totalHt": "47.51", "totalTva": "5.39"}	713	{}	2023	2	24	\N
12.95	{"card": 12.95}	Lotta	{"ht3": "10.79", "tva3": "2.16", "total3": "12.95", "totalHt": "10.79", "totalTva": "2.16"}	714	{}	2023	2	24	\N
26.35	{"card": 26.35}	Lotta	{"ht1": "24.97", "tva1": "1.38", "total1": "26.35", "totalHt": "24.97", "totalTva": "1.38"}	715	{}	2023	2	24	\N
2.00	{"cash": 2}	Lotta	{"ht1": "1.90", "tva1": "0.10", "total1": 2, "totalHt": "1.90", "totalTva": "0.10"}	716	{}	2023	2	24	\N
15.35	{"cash": 15.35}	Lotta	{"ht1": "7.07", "ht3": "6.58", "tva1": "0.38", "tva3": "1.32", "total1": "7.45", "total3": "7.90", "totalHt": "13.65", "totalTva": "1.70"}	717	{}	2023	2	24	\N
3.50	{"card": 3.5}	Lotta	{"ht3": "2.92", "tva3": "0.58", "total3": "3.50", "totalHt": "2.92", "totalTva": "0.58"}	718	{}	2023	2	24	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	719	{}	2023	2	24	\N
12.00	{"card": 12}	Lotta	{"ht1": "11.37", "tva1": "0.63", "total1": "12.00", "totalHt": "11.37", "totalTva": "0.63"}	720	{}	2023	2	24	\N
6.00	{"card": 6}	Lotta	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	721	{}	2023	2	24	\N
14.00	{"card": 14}	Lotta	{"ht1": "13.28", "tva1": "0.72", "total1": "14.00", "totalHt": "13.28", "totalTva": "0.72"}	722	{}	2023	2	24	\N
20.90	{"card": 20.9}	Lotta	{"ht1": "9.48", "ht2": "5.83", "ht3": "4.13", "tva1": "0.52", "tva2": "0.12", "tva3": "0.82", "total1": 10, "total2": "5.95", "total3": "4.95", "totalHt": "19.44", "totalTva": "1.46"}	723	{}	2023	2	24	\N
7.00	{"card": 7}	Lotta	{"ht1": "6.64", "tva1": "0.36", "total1": "7.00", "totalHt": "6.64", "totalTva": "0.36"}	724	{}	2023	2	24	\N
59.75	{"card": 59.75}	Lotta	{"ht1": "26.44", "ht3": "26.54", "tva1": "1.46", "tva3": "5.31", "total1": "27.90", "total3": "31.85", "totalHt": "52.98", "totalTva": "6.77"}	725	{}	2023	2	24	\N
13.50	{"card": 13.5}	Lotta	{"ht1": "12.80", "tva1": "0.70", "total1": "13.50", "totalHt": "12.80", "totalTva": "0.70"}	726	{}	2023	2	24	\N
16.20	{"card": 16.2}	Lotta	{"ht1": "15.36", "tva1": "0.84", "total1": "16.20", "totalHt": "15.36", "totalTva": "0.84"}	727	{}	2023	2	24	\N
6.00	{"card": 6}	Lotta	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	728	{}	2023	2	24	\N
60.95	{"card": 60.95}	Lotta	{"ht1": "17.20", "ht3": "35.68", "tva1": "0.95", "tva3": "7.12", "total1": "18.15", "total3": "42.80", "totalHt": "52.88", "totalTva": "8.07"}	729	{}	2023	2	24	\N
21.95	{"card": 21.95}	Lotta	{"ht1": "20.80", "tva1": "1.15", "total1": "21.95", "totalHt": "20.80", "totalTva": "1.15"}	730	{}	2023	2	24	\N
19.25	{"card": 19.25}	Lotta	{"ht1": "18.25", "tva1": "1.00", "total1": "19.25", "totalHt": "18.25", "totalTva": "1.00"}	731	{}	2023	2	24	\N
29.40	{"card": 29.4}	Lotta	{"ht1": "27.87", "tva1": "1.53", "total1": "29.40", "totalHt": "27.87", "totalTva": "1.53"}	732	{}	2023	2	25	\N
36.95	{"card": 36.95}	Lotta	{"ht1": "6.64", "ht3": "24.96", "tva1": "0.36", "tva3": "4.99", "total1": "7.00", "total3": "29.95", "totalHt": "31.60", "totalTva": "5.35"}	733	{}	2023	2	25	\N
41.80	{"card": 41.8}	Lotta	{"ht1": "39.62", "tva1": "2.18", "total1": "41.80", "totalHt": "39.62", "totalTva": "2.18"}	734	{}	2023	2	25	\N
18.00	{"card": 18}	Lotta	{"ht1": "17.06", "tva1": "0.94", "total1": "18.00", "totalHt": "17.06", "totalTva": "0.94"}	735	{}	2023	2	25	\N
20.00	{"card": 20}	Lotta	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	736	{}	2023	2	25	\N
8.00	{"card": 8}	Lotta	{"ht1": "7.58", "tva1": "0.42", "total1": "8.00", "totalHt": "7.58", "totalTva": "0.42"}	737	{}	2023	2	25	\N
8.00	{"card": 8}	Lotta	{"ht1": "7.58", "tva1": "0.42", "total1": "8.00", "totalHt": "7.58", "totalTva": "0.42"}	738	{}	2023	2	25	\N
13.00	{"card": 13}	Lotta	{"ht1": "12.32", "tva1": "0.68", "total1": "13.00", "totalHt": "12.32", "totalTva": "0.68"}	739	{}	2023	2	25	\N
13.00	{"card": 13}	Lotta	{"ht1": "12.32", "tva1": "0.68", "total1": "13.00", "totalHt": "12.32", "totalTva": "0.68"}	740	{}	2023	2	25	\N
51.30	{"card": 51.3}	Lotta	{"ht1": "48.63", "tva1": "2.67", "total1": "51.30", "totalHt": "48.63", "totalTva": "2.67"}	741	{}	2023	2	25	\N
7.45	{"card": 7.45}	Lotta	{"ht1": "7.07", "tva1": "0.38", "total1": "7.45", "totalHt": "7.07", "totalTva": "0.38"}	742	{}	2023	2	25	\N
40.00	{"card": 40}	Lotta	{"ht1": "37.92", "tva1": "2.08", "total1": "40.00", "totalHt": "37.92", "totalTva": "2.08"}	743	{}	2023	2	25	\N
42.95	{"card": 42.95}	Lotta	{"ht1": "2.84", "ht3": "33.29", "tva1": "0.16", "tva3": "6.66", "total1": 3, "total3": "39.95", "totalHt": "36.13", "totalTva": "6.82"}	744	{}	2023	2	25	\N
60.40	{"card": 60.4}	Lotta	{"ht1": "24.13", "ht3": "29.13", "tva1": "1.32", "tva3": "5.82", "total1": "25.45", "total3": "34.95", "totalHt": "53.26", "totalTva": "7.14"}	745	{}	2023	2	25	\N
13.00	{"card": 13}	Lotta	{"ht1": "12.32", "tva1": "0.68", "total1": "13.00", "totalHt": "12.32", "totalTva": "0.68"}	746	{}	2023	2	25	\N
29.00	{"card": 29}	Lotta	{"ht1": "27.48", "tva1": "1.52", "total1": "29.00", "totalHt": "27.48", "totalTva": "1.52"}	747	{}	2023	2	25	\N
13.00	{"card": 13}	Lotta	{"ht1": "12.32", "tva1": "0.68", "total1": "13.00", "totalHt": "12.32", "totalTva": "0.68"}	748	{}	2023	2	25	\N
54.45	{"card": 54.45}	Lotta	{"ht1": "48.29", "ht3": "2.92", "tva1": "2.66", "tva3": "0.58", "total1": "50.95", "total3": "3.50", "totalHt": "51.21", "totalTva": "3.24"}	749	{}	2023	2	25	\N
45.00	{"card": 45}	Lotta	{"ht1": "42.66", "tva1": "2.34", "total1": "45.00", "totalHt": "42.66", "totalTva": "2.34"}	750	{}	2023	2	25	\N
92.25	{"card": 92.25}	Lotta	{"ht1": "84.14", "ht3": "2.92", "tva1": "4.61", "tva3": "0.58", "total1": "88.75", "total3": "3.50", "totalHt": "87.06", "totalTva": "5.19"}	751	{}	2023	2	25	\N
42.45	{"card": 42.45}	Lotta	{"ht1": "40.24", "tva1": "2.21", "total1": "42.45", "totalHt": "40.24", "totalTva": "2.21"}	752	{}	2023	2	25	\N
54.70	{"card": 54.7}	Lotta	{"ht1": "51.84", "tva1": "2.86", "total1": "54.70", "totalHt": "51.84", "totalTva": "2.86"}	753	{}	2023	2	25	\N
19.30	{"card": 19.3}	Lotta	{"ht1": "18.30", "tva1": "1.00", "total1": "19.30", "totalHt": "18.30", "totalTva": "1.00"}	754	{}	2023	2	25	\N
40.00	{"card": 40}	Lotta	{"ht1": "37.92", "tva1": "2.08", "total1": "40.00", "totalHt": "37.92", "totalTva": "2.08"}	755	{}	2023	2	25	\N
14.00	{"card": 14}	Lotta	{"ht1": "13.26", "tva1": "0.74", "total1": "14.00", "totalHt": "13.26", "totalTva": "0.74"}	756	{}	2023	2	25	\N
19.70	{"card": 19.7}	Lotta	{"ht1": "18.68", "tva1": "1.02", "total1": "19.70", "totalHt": "18.68", "totalTva": "1.02"}	757	{}	2023	2	25	\N
16.60	{"cash": 16.6}	Lotta	{"ht1": "15.73", "tva1": "0.87", "total1": "16.60", "totalHt": "15.73", "totalTva": "0.87"}	758	{}	2023	2	25	\N
9.00	{"cash": 9}	Lotta	{"ht1": "8.54", "tva1": "0.46", "total1": "9.00", "totalHt": "8.54", "totalTva": "0.46"}	759	{}	2023	2	25	\N
20.50	{"card": 20.5}	Lotta	{"ht1": "16.11", "ht3": "2.92", "tva1": "0.89", "tva3": "0.58", "total1": "17.00", "total3": "3.50", "totalHt": "19.03", "totalTva": "1.47"}	760	{}	2023	2	25	\N
48.30	{"card": 48.3}	Lotta	{"ht1": "45.78", "tva1": "2.52", "total1": "48.30", "totalHt": "45.78", "totalTva": "2.52"}	761	{}	2023	2	25	\N
19.50	{"card": 19.5}	Lotta	{"ht1": "12.80", "ht3": "5.00", "tva1": "0.70", "tva3": "1.00", "total1": "13.50", "total3": "6.00", "totalHt": "17.80", "totalTva": "1.70"}	762	{}	2023	2	25	\N
29.80	{"cash": 29.8}	Lotta	{"ht1": "28.25", "tva1": "1.55", "total1": "29.80", "totalHt": "28.25", "totalTva": "1.55"}	763	{}	2023	2	25	\N
164.30	{"card": 164.3}	Lotta	{"ht1": "108.99", "ht3": "41.09", "tva1": "6.01", "tva3": "8.21", "total1": "115.00", "total3": "49.30", "totalHt": "150.08", "totalTva": "14.22"}	764	{}	2023	2	25	\N
36.20	{"card": 36.2}	Lotta	{"ht1": "34.31", "tva1": "1.89", "total1": "36.20", "totalHt": "34.31", "totalTva": "1.89"}	765	{}	2023	2	25	\N
15.80	{"card": 15.8}	Lotta	{"ht1": "11.24", "ht3": "3.29", "tva1": "0.61", "tva3": "0.66", "total1": "11.85", "total3": 3.95, "totalHt": "14.53", "totalTva": "1.27"}	766	{}	2023	2	25	\N
12.95	{"card": 12.95}	Lotta	{"ht1": "12.27", "tva1": "0.68", "total1": 12.95, "totalHt": "12.27", "totalTva": "0.68"}	767	{}	2023	2	25	\N
14.50	{"card": 14.5}	Lotta	{"ht1": "13.75", "tva1": "0.75", "total1": "14.50", "totalHt": "13.75", "totalTva": "0.75"}	768	{}	2023	2	25	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	769	{}	2023	2	25	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	770	{}	2023	2	25	\N
7.00	{"card": 7}	Lotta	{"ht1": "6.64", "tva1": "0.36", "total1": "7.00", "totalHt": "6.64", "totalTva": "0.36"}	771	{}	2023	2	25	\N
7.00	{"card": 7}	Lotta	{"ht1": "6.64", "tva1": "0.36", "total1": "7.00", "totalHt": "6.64", "totalTva": "0.36"}	772	{}	2023	2	25	\N
7.00	{"card": 7}	Lotta	{"ht1": "6.64", "tva1": "0.36", "total1": "7.00", "totalHt": "6.64", "totalTva": "0.36"}	773	{}	2023	2	25	\N
58.20	{"card": 58.2}	Lotta	{"ht1": "49.53", "ht3": "4.96", "tva1": "2.72", "tva3": "0.99", "total1": "52.25", "total3": "5.95", "totalHt": "54.49", "totalTva": "3.71"}	774	{}	2023	2	25	\N
44.85	{"card": 44.85}	Lotta	{"ht1": "38.77", "ht3": "3.29", "tva1": "2.13", "tva3": "0.66", "total1": "40.90", "total3": 3.95, "totalHt": "42.06", "totalTva": "2.79"}	775	{}	2023	2	25	\N
47.35	{"card": 47.35}	Lotta	{"ht1": "32.56", "ht3": "10.83", "tva1": "1.79", "tva3": "2.17", "total1": "34.35", "total3": "13.00", "totalHt": "43.39", "totalTva": "3.96"}	776	{}	2023	2	25	\N
6.00	{"cash": 6}	Lotta	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	777	{}	2023	2	25	\N
128.00	{"card": 128}	Lotta	{"ht1": "94.79", "ht3": "23.33", "tva1": "5.21", "tva3": "4.67", "total1": "100.00", "total3": 28, "totalHt": "118.12", "totalTva": "9.88"}	778	{}	2023	2	25	\N
13.00	{"card": 13}	Lotta	{"ht1": "9.48", "ht3": "2.50", "tva1": "0.52", "tva3": "0.50", "total1": 10, "total3": "3.00", "totalHt": "11.98", "totalTva": "1.02"}	779	{}	2023	2	25	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	780	{}	2023	2	25	\N
9.15	{"card": 9.15}	Lotta	{"ht1": "8.67", "tva1": "0.48", "total1": "9.15", "totalHt": "8.67", "totalTva": "0.48"}	781	{}	2023	2	25	\N
24.80	{"card": 24.8}	Lotta	{"ht1": "23.51", "tva1": "1.29", "total1": "24.80", "totalHt": "23.51", "totalTva": "1.29"}	782	{}	2023	2	25	\N
12.40	{"cash": 12.4}	Lotta	{"ht1": "11.75", "tva1": "0.65", "total1": "12.40", "totalHt": "11.75", "totalTva": "0.65"}	783	{}	2023	2	25	\N
6.00	{"card": 6}	Yann	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	784	{}	2023	2	26	\N
56.00	{"card": 56.00}	Jaja	{"ht1": "53.09", "tva1": "2.91", "total1": "56.00", "totalHt": "53.09", "totalTva": "2.91"}	622	{}	2023	2	22	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	785	{}	2023	2	26	\N
14.00	{"card": 14}	Yann	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	786	{}	2023	2	26	\N
10.95	{"card": 10.95}	Yann	{"ht1": "10.38", "tva1": "0.57", "total1": 10.95, "totalHt": "10.38", "totalTva": "0.57"}	787	{}	2023	2	26	\N
16.15	{"card": 16.15}	Yann	{"ht1": "15.31", "tva1": "0.84", "total1": "16.15", "totalHt": "15.31", "totalTva": "0.84"}	788	{}	2023	2	26	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	789	{}	2023	2	26	\N
49.25	{"cash": 49.25}	Yann	{"ht1": "18.53", "ht2": "14.01", "ht3": "12.84", "tva1": "1.02", "tva2": "0.29", "tva3": "2.56", "total1": "19.55", "total2": "14.30", "total3": "15.40", "totalHt": "45.38", "totalTva": "3.87"}	790	{}	2023	2	26	\N
6.00	{"cash": 6}	Yann	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	791	{}	2023	2	26	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	792	{}	2023	2	26	\N
6.00	{"cash": 6}	Yann	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	793	{}	2023	2	26	\N
82.65	{"card": 82.65}	Yann	{"ht1": "78.34", "tva1": "4.31", "total1": "82.65", "totalHt": "78.34", "totalTva": "4.31"}	794	{}	2023	2	26	\N
14.00	{"cash": 14}	Yann	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	795	{}	2023	2	26	\N
56.00	{"cash": 56}	Yann	{"ht1": "53.09", "tva1": "2.91", "total1": "56.00", "totalHt": "53.09", "totalTva": "2.91"}	796	{}	2023	2	26	\N
15.00	{"card": 15}	Yann	{"ht1": "14.22", "tva1": "0.78", "total1": 15, "totalHt": "14.22", "totalTva": "0.78"}	797	{}	2023	2	26	\N
2.00	{"card": 2}	Yann	{"ht1": "1.90", "tva1": "0.10", "total1": 2, "totalHt": "1.90", "totalTva": "0.10"}	798	{}	2023	2	26	\N
30.35	{"card": 30.35}	Yann	{"ht1": "28.76", "tva1": "1.59", "total1": "30.35", "totalHt": "28.76", "totalTva": "1.59"}	799	{"{\\"newPrice\\": 1.5, \\"productId\\": \\"c-Kanelbulle\\", \\"reduction\\": 1.5, \\"discountType\\": \\"percent\\", \\"originalPrice\\": 3, \\"discountAmount\\": \\"50\\"}","{\\"newPrice\\": 1.5, \\"productId\\": \\"c-Blabärsbulle\\", \\"reduction\\": 1.5, \\"discountType\\": \\"percent\\", \\"originalPrice\\": 3, \\"discountAmount\\": \\"50\\"}","{\\"newPrice\\": 1.5, \\"productId\\": \\"c-Saffransbulle\\", \\"reduction\\": 1.5, \\"discountType\\": \\"percent\\", \\"originalPrice\\": 3, \\"discountAmount\\": \\"50\\"}"}	2023	2	26	\N
6.00	{"card": 6}	Yann	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	801	{}	2023	2	26	\N
19.90	{"card": 19.9}	Yann	{"ht1": "18.86", "tva1": "1.04", "total1": "19.90", "totalHt": "18.86", "totalTva": "1.04"}	802	{}	2023	2	26	\N
15.95	{"card": 15.95}	Yann	{"ht1": "15.11", "tva1": "0.84", "total1": "15.95", "totalHt": "15.11", "totalTva": "0.84"}	803	{}	2023	2	26	\N
6.00	{"card": 6}	Yann	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	804	{}	2023	2	26	\N
10.00	{"card": 10}	Yann	{"ht1": "9.47", "tva1": "0.53", "total1": "10.00", "totalHt": "9.47", "totalTva": "0.53"}	805	{}	2023	2	26	\N
8.00	{"cash": 8}	Yann	{"ht1": "7.58", "tva1": "0.42", "total1": "8.00", "totalHt": "7.58", "totalTva": "0.42"}	806	{}	2023	2	26	\N
4.00	{"cash": 4}	Yann	{"ht1": "3.80", "tva1": "0.20", "total1": "4.00", "totalHt": "3.80", "totalTva": "0.20"}	807	{}	2023	2	26	\N
1.80	{"cash": 1.8}	Yann	{"ht1": "1.71", "tva1": "0.09", "total1": 1.8, "totalHt": "1.71", "totalTva": "0.09"}	808	{}	2023	2	26	\N
9.50	{"card": 9.5}	Yann	{"ht1": "9.00", "tva1": "0.50", "total1": "9.50", "totalHt": "9.00", "totalTva": "0.50"}	809	{}	2023	2	26	\N
8.00	{"card": 8}	Yann	{"ht1": "7.58", "tva1": "0.42", "total1": "8.00", "totalHt": "7.58", "totalTva": "0.42"}	811	{}	2023	2	26	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	812	{}	2023	2	26	\N
3.00	{"cash": 3}	Yann	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	813	{}	2023	2	26	\N
9.90	{"cash": 9.9}	Yann	{"ht1": "9.38", "tva1": "0.52", "total1": "9.90", "totalHt": "9.38", "totalTva": "0.52"}	814	{}	2023	2	26	\N
4.00	{"card": 4}	Yann	{"ht1": "3.79", "tva1": "0.21", "total1": "4.00", "totalHt": "3.79", "totalTva": "0.21"}	815	{}	2023	2	26	\N
12.00	{"card": 12}	Yann	{"ht1": "11.38", "tva1": "0.62", "total1": "12.00", "totalHt": "11.38", "totalTva": "0.62"}	816	{}	2023	2	26	\N
42.00	{"card": 42}	Yann	{"ht1": "39.81", "tva1": "2.19", "total1": "42.00", "totalHt": "39.81", "totalTva": "2.19"}	818	{}	2023	2	26	\N
11.50	{"card": 11.5}	Yann	{"ht1": "10.90", "tva1": "0.60", "total1": "11.50", "totalHt": "10.90", "totalTva": "0.60"}	819	{}	2023	2	26	\N
3.00	{"card": 3}	Yann	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	820	{}	2023	2	26	\N
5.10	{"card": 5.1}	Yann	{"ht1": "3.41", "ht3": "1.25", "tva1": "0.19", "tva3": "0.25", "total1": "3.60", "total3": 1.5, "totalHt": "4.66", "totalTva": "0.44"}	821	{}	2023	2	26	\N
3.00	{"cash": 3}	Yann	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	822	{}	2023	2	26	\N
21.95	{"card": 21.95}	Yann	{"ht1": "20.81", "tva1": "1.14", "total1": "21.95", "totalHt": "20.81", "totalTva": "1.14"}	823	{}	2023	2	26	\N
24.00	{"card": 24}	Yann	{"ht1": "22.75", "tva1": "1.25", "total1": "24.00", "totalHt": "22.75", "totalTva": "1.25"}	824	{}	2023	2	26	\N
4.00	{"cash": 4}	Yann	{"ht1": "3.79", "tva1": "0.21", "total1": "4.00", "totalHt": "3.79", "totalTva": "0.21"}	825	{}	2023	2	26	\N
2.00	{"cash": 2}	Yann	{"ht1": "1.90", "tva1": "0.10", "total1": "2.00", "totalHt": "1.90", "totalTva": "0.10"}	826	{}	2023	2	26	\N
31.45	{"card": 31.45}	Yann	{"ht1": "29.35", "tva1": "2.10", "total1": "31.45", "totalHt": "29.35", "totalTva": "2.10"}	827	{}	2023	2	26	\N
6.00	{"card": 6}	Yann	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	828	{}	2023	2	26	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": "10.00", "totalHt": "9.48", "totalTva": "0.52"}	829	{}	2023	2	26	\N
742.00	{"card": 742}	Yann	{"ht1": "703.32", "tva1": "38.68", "total1": "742.00", "totalHt": "703.32", "totalTva": "38.68"}	830	{}	2023	2	28	\N
210.40	{"cash": 210.4}	Yann	{"ht1": "199.43", "tva1": "10.97", "total1": "210.40", "totalHt": "199.43", "totalTva": "10.97"}	831	{}	2023	2	28	\N
9.90	{"card": 9.9}	Yann	{"ht1": "9.38", "tva1": "0.52", "total1": "9.90", "totalHt": "9.38", "totalTva": "0.52"}	832	{}	2023	3	1	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	833	{}	2023	3	1	\N
20.00	{"card": 20}	Yann	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	834	{}	2023	3	1	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	835	{}	2023	3	1	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	836	{}	2023	3	1	\N
13.00	{"card": 13}	Yann	{"ht1": "12.33", "tva1": "0.67", "total1": "13.00", "totalHt": "12.33", "totalTva": "0.67"}	837	{}	2023	3	1	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	838	{}	2023	3	1	\N
6.00	{"card": 6}	Yann	{"ht1": "5.69", "tva1": "0.31", "total1": 6, "totalHt": "5.69", "totalTva": "0.31"}	839	{}	2023	3	1	\N
7.00	{"cash": 7}	Yann	{"ht1": "6.63", "tva1": "0.37", "total1": "7.00", "totalHt": "6.63", "totalTva": "0.37"}	840	{}	2023	3	1	\N
7.00	{"cash": 7}	Yann	{"ht1": "6.63", "tva1": "0.37", "total1": "7.00", "totalHt": "6.63", "totalTva": "0.37"}	841	{}	2023	3	1	\N
4.95	{"cash": 4.95}	Yann	{"ht1": "4.69", "tva1": "0.26", "total1": "4.95", "totalHt": "4.69", "totalTva": "0.26"}	842	{}	2023	3	1	\N
8.45	{"cash": 8.45}	Yann	{"ht1": "8.01", "tva1": "0.44", "total1": "8.45", "totalHt": "8.01", "totalTva": "0.44"}	843	{}	2023	3	1	\N
0.00	{"cash": 0}	Yann	{}	844	{}	2023	3	1	\N
52.00	{"card": 52}	Yann	{"ht1": "49.29", "tva1": "2.71", "total1": "52.00", "totalHt": "49.29", "totalTva": "2.71"}	845	{}	2023	3	1	\N
44.00	{"card": 44}	Yann	{"ht1": "41.70", "tva1": "2.30", "total1": "44.00", "totalHt": "41.70", "totalTva": "2.30"}	846	{}	2023	3	1	\N
27.50	{"card": 27.5}	Yann	{"ht1": "26.08", "tva1": "1.42", "total1": "27.50", "totalHt": "26.08", "totalTva": "1.42"}	847	{}	2023	3	1	\N
41.00	{"card": 41}	Yann	{"ht1": "38.86", "tva1": "2.14", "total1": "41.00", "totalHt": "38.86", "totalTva": "2.14"}	848	{}	2023	3	1	\N
74.85	{"card": 74.85}	Yann	{"ht1": "70.95", "tva1": "3.90", "total1": "74.85", "totalHt": "70.95", "totalTva": "3.90"}	849	{}	2023	3	1	\N
13.90	{"cash": 13.9}	Yann	{"ht1": "13.18", "tva1": "0.72", "total1": "13.90", "totalHt": "13.18", "totalTva": "0.72"}	850	{}	2023	3	1	\N
28.05	{"card": 28.05}	Yann	{"ht1": "26.59", "tva1": "1.46", "total1": "28.05", "totalHt": "26.59", "totalTva": "1.46"}	851	{}	2023	3	1	\N
22.00	{"card": 22}	Yann	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	852	{}	2023	3	1	\N
18.50	{"card": 18.5}	Yann	{"ht1": "17.54", "tva1": "0.96", "total1": "18.50", "totalHt": "17.54", "totalTva": "0.96"}	853	{}	2023	3	1	\N
13.00	{"cash": 13}	Yann	{"ht1": "12.32", "tva1": "0.68", "total1": "13.00", "totalHt": "12.32", "totalTva": "0.68"}	854	{}	2023	3	1	\N
38.75	{"card": 38.75}	Yann	{"ht1": "36.73", "tva1": "2.02", "total1": "38.75", "totalHt": "36.73", "totalTva": "2.02"}	855	{}	2023	3	1	\N
15.05	{"cash": 15.05}	Yann	{"ht1": "14.27", "tva1": "0.78", "total1": "15.05", "totalHt": "14.27", "totalTva": "0.78"}	856	{}	2023	3	1	\N
15.65	{"card": 15.65}	Yann	{"ht1": "11.99", "ht3": "2.50", "tva1": "0.66", "tva3": "0.50", "total1": "12.65", "total3": "3.00", "totalHt": "14.49", "totalTva": "1.16"}	857	{}	2023	3	1	\N
40.65	{"card": 40.65}	Yann	{"ht1": "38.54", "tva1": "2.11", "total1": "40.65", "totalHt": "38.54", "totalTva": "2.11"}	858	{}	2023	3	1	\N
7.00	{"cash": 7}	Yann	{"ht1": "6.63", "tva1": "0.37", "total1": "7.00", "totalHt": "6.63", "totalTva": "0.37"}	859	{}	2023	3	1	\N
19.80	{"card": 19.8}	Yann	{"ht1": "18.76", "tva1": "1.04", "total1": "19.80", "totalHt": "18.76", "totalTva": "1.04"}	860	{}	2023	3	1	\N
14.00	{"card": 14}	Yann	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	861	{}	2023	3	1	\N
27.90	{"card": 27.9}	Yann	{"ht1": "26.45", "tva1": "1.45", "total1": "27.90", "totalHt": "26.45", "totalTva": "1.45"}	862	{}	2023	3	1	\N
35.00	{"card": 35}	Yann	{"ht1": "33.17", "tva1": "1.83", "total1": "35.00", "totalHt": "33.17", "totalTva": "1.83"}	863	{}	2023	3	1	\N
3.00	{"card": 3}	Yann	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	864	{}	2023	3	1	\N
11.60	{"cash": 11.6}	Yann	{"ht1": "2.23", "ht3": "7.71", "tva1": "0.12", "tva3": "1.54", "total1": "2.35", "total3": "9.25", "totalHt": "9.94", "totalTva": "1.66"}	865	{}	2023	3	1	\N
47.65	{"card": 47.65}	Yann	{"ht1": "45.16", "tva1": "2.49", "total1": "47.65", "totalHt": "45.16", "totalTva": "2.49"}	866	{}	2023	3	1	\N
25.90	{"card": 25.9}	Yann	{"ht1": "24.55", "tva1": "1.35", "total1": "25.90", "totalHt": "24.55", "totalTva": "1.35"}	867	{}	2023	3	1	\N
7.50	{"card": 7.5}	Yann	{"ht1": "7.11", "tva1": "0.39", "total1": 7.5, "totalHt": "7.11", "totalTva": "0.39"}	868	{}	2023	3	1	\N
59.80	{"cash": 59.8}	Yann	{"ht1": "56.68", "tva1": "3.12", "total1": "59.80", "totalHt": "56.68", "totalTva": "3.12"}	869	{}	2023	3	2	\N
8.10	{"card": 8.1}	Yann	{"ht1": "4.83", "ht3": "2.50", "tva1": "0.27", "tva3": "0.50", "total1": "5.10", "total3": "3.00", "totalHt": "7.33", "totalTva": "0.77"}	871	{}	2023	3	2	\N
27.90	{"cash": 27.9}	Yann	{"ht1": "26.45", "tva1": "1.45", "total1": "27.90", "totalHt": "26.45", "totalTva": "1.45"}	872	{}	2023	3	2	\N
14.85	{"cash": 14.85}	Yann	{"ht1": "14.08", "tva1": "0.77", "total1": "14.85", "totalHt": "14.08", "totalTva": "0.77"}	873	{}	2023	3	2	\N
6.00	{"card": 6}	Yann	{"ht1": "5.69", "tva1": "0.31", "total1": 6, "totalHt": "5.69", "totalTva": "0.31"}	874	{}	2023	3	2	\N
4.00	{"card": 4}	Yann	{"ht1": "3.79", "tva1": "0.21", "total1": 4, "totalHt": "3.79", "totalTva": "0.21"}	875	{}	2023	3	2	\N
80.95	{"card": 80.95}	Yann	{"ht1": "76.74", "tva1": "4.21", "total1": "80.95", "totalHt": "76.74", "totalTva": "4.21"}	876	{}	2023	3	2	\N
32.00	{"cash": 32}	Yann	{"ht1": "30.33", "tva1": "1.67", "total1": "32.00", "totalHt": "30.33", "totalTva": "1.67"}	877	{}	2023	3	2	\N
8.90	{"cash": 8.9}	Yann	{"ht1": "8.43", "tva1": "0.47", "total1": "8.90", "totalHt": "8.43", "totalTva": "0.47"}	878	{}	2023	3	2	\N
21.50	{"cash": 21.5}	Yann	{"ht1": "20.38", "tva1": "1.12", "total1": "21.50", "totalHt": "20.38", "totalTva": "1.12"}	879	{}	2023	3	2	\N
30.00	{"card": 30}	Yann	{"ht1": "28.44", "tva1": "1.56", "total1": "30.00", "totalHt": "28.44", "totalTva": "1.56"}	880	{}	2023	3	2	\N
58.20	{"cash": 58.2}	Yann	{"ht1": "52.80", "ht3": "2.08", "tva1": "2.90", "tva3": "0.42", "total1": "55.70", "total3": 2.5, "totalHt": "54.88", "totalTva": "3.32"}	881	{}	2023	3	2	\N
66.65	{"card": 66.65}	Yann	{"ht1": "63.17", "tva1": "3.48", "total1": "66.65", "totalHt": "63.17", "totalTva": "3.48"}	882	{}	2023	3	2	\N
36.00	{"card": 36}	Yann	{"ht1": "34.12", "tva1": "1.88", "total1": "36.00", "totalHt": "34.12", "totalTva": "1.88"}	883	{}	2023	3	2	\N
10.00	{"card": 10}	Yann	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	884	{}	2023	3	2	\N
6.00	{"card": 6}	Yann	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	885	{}	2023	3	2	\N
60.00	{"card": 60}	Yann	{"ht1": "36.97", "ht3": "17.50", "tva1": "2.03", "tva3": "3.50", "total1": "39.00", "total3": 21, "totalHt": "54.47", "totalTva": "5.53"}	886	{}	2023	3	2	\N
10.05	{"card": 10.05}	Yann	{"ht1": "9.53", "tva1": "0.52", "total1": "10.05", "totalHt": "9.53", "totalTva": "0.52"}	887	{}	2023	3	2	\N
22.95	{"card": 22.95}	Yann	{"ht1": "21.75", "tva1": "1.20", "total1": "22.95", "totalHt": "21.75", "totalTva": "1.20"}	888	{}	2023	3	2	\N
80.00	{"card": 80}	Yann	{"ht1": "75.83", "tva1": "4.17", "total1": "80.00", "totalHt": "75.83", "totalTva": "4.17"}	889	{}	2023	3	2	\N
25.00	{"card": 25}	Yann	{"ht1": "23.70", "tva1": "1.30", "total1": "25.00", "totalHt": "23.70", "totalTva": "1.30"}	890	{}	2023	3	2	\N
12.00	{"card": 12}	Yann	{"ht1": "11.38", "tva1": "0.62", "total1": "12.00", "totalHt": "11.38", "totalTva": "0.62"}	891	{}	2023	3	2	\N
9.90	{"card": 9.9}	Yann	{"ht1": "9.38", "tva1": "0.52", "total1": "9.90", "totalHt": "9.38", "totalTva": "0.52"}	892	{}	2023	3	2	\N
52.55	{"card": 52.55}	Yann	{"ht1": "49.82", "tva1": "2.73", "total1": "52.55", "totalHt": "49.82", "totalTva": "2.73"}	893	{}	2023	3	2	\N
3.00	{"card": 3}	Yann	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	894	{}	2023	3	2	\N
41.15	{"cash": 41.15}	Yann	{"ht1": "31.70", "ht3": "6.42", "tva1": "1.75", "tva3": "1.28", "total1": "33.45", "total3": "7.70", "totalHt": "38.12", "totalTva": "3.03"}	895	{}	2023	3	2	\N
3.00	{"cash": 3}	Yann	{"ht1": "2.84", "tva1": "0.16", "total1": "3.00", "totalHt": "2.84", "totalTva": "0.16"}	896	{}	2023	3	2	\N
7.50	{"card": 7.5}	Lotta	{"ht1": "2.84", "ht3": "3.75", "tva1": "0.16", "tva3": "0.75", "total1": 3, "total3": 4.5, "totalHt": "6.59", "totalTva": "0.91"}	898	{}	2023	3	3	\N
10.00	{"cash": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	899	{}	2023	3	3	\N
25.85	{"card": 25.85}	Yann	{"ht1": "24.50", "tva1": "1.35", "total1": "25.85", "totalHt": "24.50", "totalTva": "1.35"}	870	{}	2023	3	2	\N
3.00	{"card": 3}	Yann	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	897	{}	2023	3	2	\N
3.00	{"card": 3}	Lotta	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	900	{}	2023	3	3	\N
16.00	{"card": 16}	Lotta	{"ht1": "15.17", "tva1": "0.83", "total1": "16.00", "totalHt": "15.17", "totalTva": "0.83"}	901	{}	2023	3	3	\N
58.85	{"card": 58.85}	Lotta	{"ht1": "55.78", "tva1": "3.07", "total1": "58.85", "totalHt": "55.78", "totalTva": "3.07"}	902	{}	2023	3	3	\N
15.00	{"card": 15}	Lotta	{"ht1": "6.63", "tva1": "0.37", "total1": "7.00", "totalHt": "6.63", "totalTva": "0.37"}	903	{}	2023	3	3	\N
10.00	{"cash": 10}	Agneta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	904	{}	2023	3	3	\N
10.00	{"card": 10}	Agneta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	905	{}	2023	3	3	\N
5.50	{"card": 5.5}	Agneta	{"ht1": "5.21", "tva1": "0.29", "total1": 5.5, "totalHt": "5.21", "totalTva": "0.29"}	906	{}	2023	3	3	\N
16.00	{"card": 16}	Agneta	{"ht1": "15.16", "tva1": "0.84", "total1": "16.00", "totalHt": "15.16", "totalTva": "0.84"}	907	{}	2023	3	3	\N
16.00	{"card": 16}	Agneta	{"ht1": "15.16", "tva1": "0.84", "total1": "16.00", "totalHt": "15.16", "totalTva": "0.84"}	908	{}	2023	3	3	\N
131.60	{"card": 131.6}	Agneta	{"ht1": "23.51", "ht3": "89.00", "tva1": "1.29", "tva3": "17.80", "total1": "24.80", "total3": "106.80", "totalHt": "112.51", "totalTva": "19.09"}	909	{}	2023	3	3	\N
18.00	{"cash": 18}	Agneta	{"ht1": "17.06", "tva1": "0.94", "total1": "18.00", "totalHt": "17.06", "totalTva": "0.94"}	910	{}	2023	3	3	\N
6.00	{"card": 6}	Agneta	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	911	{}	2023	3	3	\N
3.00	{"cash": 3}	Agneta	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	912	{}	2023	3	3	\N
53.85	{"card": 53.85}	Agneta	{"ht1": "48.91", "ht3": "1.88", "tva1": "2.69", "tva3": "0.37", "total1": "51.60", "total3": 2.25, "totalHt": "50.79", "totalTva": "3.06"}	913	{}	2023	3	3	\N
30.50	{"card": 30.5}	Agneta	{"ht1": "28.92", "tva1": "1.58", "total1": "30.50", "totalHt": "28.92", "totalTva": "1.58"}	914	{}	2023	3	3	\N
52.85	{"card": 52.85}	Agneta	{"ht1": "24.59", "ht2": "21.94", "ht3": "3.75", "tva1": "1.36", "tva2": "0.46", "tva3": "0.75", "total1": "25.95", "total2": "22.40", "total3": "4.50", "totalHt": "50.28", "totalTva": "2.57"}	915	{}	2023	3	3	\N
31.50	{"card": 31.5}	Agneta	{"ht1": "29.86", "tva1": "1.64", "total1": "31.50", "totalHt": "29.86", "totalTva": "1.64"}	916	{}	2023	3	3	\N
3.00	{"cash": 3}	Agneta	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	917	{}	2023	3	3	\N
121.20	{"check": 121.2}	Agneta	{"ht1": "108.72", "ht3": "5.42", "tva1": "5.98", "tva3": "1.08", "total1": "114.70", "total3": "6.50", "totalHt": "114.14", "totalTva": "7.06"}	918	{}	2023	3	3	\N
18.00	{"card": 18}	Agneta	{"ht1": "17.06", "tva1": "0.94", "total1": "18.00", "totalHt": "17.06", "totalTva": "0.94"}	919	{}	2023	3	3	\N
32.85	{"card": 32.85}	Agneta	{"ht1": "31.13", "tva1": "1.72", "total1": "32.85", "totalHt": "31.13", "totalTva": "1.72"}	920	{}	2023	3	3	\N
12.90	{"cash": 12.9}	Agneta	{"ht1": "12.23", "tva1": "0.67", "total1": "12.90", "totalHt": "12.23", "totalTva": "0.67"}	921	{}	2023	3	3	\N
28.85	{"card": 28.85}	Agneta	{"ht1": "25.92", "ht3": "1.25", "tva1": "1.43", "tva3": "0.25", "total1": "27.35", "total3": 1.5, "totalHt": "27.17", "totalTva": "1.68"}	922	{}	2023	3	3	\N
14.95	{"cash": 14.95}	Agneta	{"ht1": "14.17", "tva1": "0.78", "total1": "14.95", "totalHt": "14.17", "totalTva": "0.78"}	923	{}	2023	3	3	\N
5.50	{"card": 5.5}	Agneta	{"ht1": "5.21", "tva1": "0.29", "total1": 5.5, "totalHt": "5.21", "totalTva": "0.29"}	924	{}	2023	3	3	\N
37.90	{"card": 37.9}	Agneta	{"ht1": "14.17", "ht3": "19.12", "tva1": "0.78", "tva3": "3.83", "total1": "14.95", "total3": "22.95", "totalHt": "33.29", "totalTva": "4.61"}	925	{}	2023	3	3	\N
6.60	{"card": 6.6}	Agneta	{"ht1": "6.26", "tva1": "0.34", "total1": "6.60", "totalHt": "6.26", "totalTva": "0.34"}	926	{}	2023	3	3	\N
5.70	{"card": 5.7}	Agneta	{"ht1": "5.40", "tva1": "0.30", "total1": "5.70", "totalHt": "5.40", "totalTva": "0.30"}	927	{}	2023	3	3	\N
5.00	{"card": 5}	Agneta	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	928	{}	2023	3	3	\N
7.50	{"cash": 7.5}	Agneta	{"ht1": "7.11", "tva1": "0.39", "total1": "7.50", "totalHt": "7.11", "totalTva": "0.39"}	929	{}	2023	3	3	\N
16.05	{"card": 16.05}	Agneta	{"ht1": "13.79", "ht3": "1.25", "tva1": "0.76", "tva3": "0.25", "total1": "14.55", "total3": 1.5, "totalHt": "15.04", "totalTva": "1.01"}	930	{}	2023	3	3	\N
12.50	{"cash": 12.5}	Agneta	{"ht1": "11.85", "tva1": "0.65", "total1": "12.50", "totalHt": "11.85", "totalTva": "0.65"}	931	{}	2023	3	3	\N
2.95	{"cash": 2.95}	Agneta	{"ht1": "2.80", "tva1": "0.15", "total1": 2.95, "totalHt": "2.80", "totalTva": "0.15"}	932	{}	2023	3	3	\N
41.45	{"card": 41.45}	Agneta	{"ht1": "11.33", "ht3": "24.58", "tva1": "0.62", "tva3": "4.92", "total1": "11.95", "total3": "29.50", "totalHt": "35.91", "totalTva": "5.54"}	933	{}	2023	3	3	\N
10.00	{"cash": 10}	Agneta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	934	{}	2023	3	3	\N
6.00	{"card": 6}	Agneta	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	935	{}	2023	3	4	\N
10.00	{"card": 10}	Agneta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	936	{}	2023	3	4	\N
31.00	{"card": 31}	Agneta	{"ht1": "29.39", "tva1": "1.61", "total1": "31.00", "totalHt": "29.39", "totalTva": "1.61"}	937	{}	2023	3	4	\N
57.69	{"card": 57.69}	Agneta	{"ht1": "54.68", "tva1": "3.01", "total1": "57.69", "totalHt": "54.68", "totalTva": "3.01"}	938	{}	2023	3	4	\N
10.00	{"card": 10}	Agneta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	939	{}	2023	3	4	\N
98.95	{"card": 98.95}	Agneta	{"ht1": "93.79", "tva1": "5.16", "total1": "98.95", "totalHt": "93.79", "totalTva": "5.16"}	940	{}	2023	3	4	\N
6.00	{"card": 6}	Agneta	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	941	{}	2023	3	4	\N
12.80	{"card": 12.8}	Agneta	{"ht1": "12.13", "tva1": "0.67", "total1": "12.80", "totalHt": "12.13", "totalTva": "0.67"}	942	{}	2023	3	4	\N
209.25	{"card": 209.25}	Agneta	{"ht1": "167.62", "ht2": "19.98", "ht3": "10.00", "tva1": "9.23", "tva2": "0.42", "tva3": "2.00", "total1": "176.85", "total2": "20.40", "total3": "12.00", "totalHt": "197.60", "totalTva": "11.65"}	943	{}	2023	3	4	\N
45.75	{"card": 45.75}	Agneta	{"ht1": "43.37", "tva1": "2.38", "total1": "45.75", "totalHt": "43.37", "totalTva": "2.38"}	944	{}	2023	3	4	\N
10.00	{"card": 10}	Agneta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	945	{}	2023	3	4	\N
14.00	{"cash": 14}	Agneta	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	946	{}	2023	3	4	\N
10.00	{"cash": 10}	Agneta	{"ht1": "3.98", "ht2": "5.68", "tva1": "0.22", "tva2": "0.12", "total1": "4.20", "total2": "5.80", "totalHt": "9.66", "totalTva": "0.34"}	947	{}	2023	3	4	\N
5.50	{"card": 5.5}	Agneta	{"ht1": "5.22", "tva1": "0.28", "total1": "5.50", "totalHt": "5.22", "totalTva": "0.28"}	948	{}	2023	3	4	\N
6.00	{"card": 6}	Agneta	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	949	{}	2023	3	4	\N
28.10	{"card": 28.1}	Agneta	{"ht1": "26.64", "tva1": "1.46", "total1": "28.10", "totalHt": "26.64", "totalTva": "1.46"}	950	{}	2023	3	4	\N
5.00	{"card": 5}	Agneta	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	951	{}	2023	3	4	\N
3.00	{"cash": 3}	Agneta	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	952	{}	2023	3	4	\N
213.20	{"card": 213.2}	Agneta	{"ht1": "132.94", "ht3": "60.79", "tva1": "7.31", "tva3": "12.16", "total1": "140.25", "total3": "72.95", "totalHt": "193.73", "totalTva": "19.47"}	953	{}	2023	3	4	\N
59.45	{"card": 59.45}	Agneta	{"ht1": "56.36", "tva1": "3.09", "total1": "59.45", "totalHt": "56.36", "totalTva": "3.09"}	954	{}	2023	3	4	\N
80.00	{"card": 80}	Agneta	{"ht1": "75.83", "tva1": "4.17", "total1": "80.00", "totalHt": "75.83", "totalTva": "4.17"}	955	{}	2023	3	4	\N
6.00	{"card": 6}	Agneta	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	956	{}	2023	3	4	\N
21.00	{"card": 21}	Agneta	{"ht1": "19.90", "tva1": "1.10", "total1": "21.00", "totalHt": "19.90", "totalTva": "1.10"}	957	{}	2023	3	4	\N
50.45	{"cash": 50.45}	Agneta	{"ht1": "47.83", "tva1": "2.62", "total1": "50.45", "totalHt": "47.83", "totalTva": "2.62"}	958	{}	2023	3	4	\N
10.30	{"card": 10.3}	Agneta	{"ht1": "9.76", "tva1": "0.54", "total1": "10.30", "totalHt": "9.76", "totalTva": "0.54"}	959	{}	2023	3	4	\N
44.00	{"card": 44}	Agneta	{"ht1": "34.13", "tva1": "1.87", "total1": "36.00", "totalHt": "34.13", "totalTva": "1.87"}	960	{}	2023	3	4	\N
335.90	{"card": 335.9}	Lotta	{"ht1": "35.02", "ht3": "249.12", "tva1": "1.93", "tva3": "49.83", "total1": "36.95", "total3": "298.95", "totalHt": "284.14", "totalTva": "51.76"}	961	{}	2023	3	4	\N
33.80	{"card": 33.8}	Lotta	{"ht1": "32.04", "tva1": "1.76", "total1": "33.80", "totalHt": "32.04", "totalTva": "1.76"}	962	{}	2023	3	4	\N
36.00	{"card": 36}	Lotta	{"ht1": "34.12", "tva1": "1.88", "total1": "36.00", "totalHt": "34.12", "totalTva": "1.88"}	963	{}	2023	3	4	\N
8.00	{"card": 8}	Lotta	{"ht1": "7.59", "tva1": "0.41", "total1": "8.00", "totalHt": "7.59", "totalTva": "0.41"}	964	{}	2023	3	4	\N
18.00	{"card": 18}	Lotta	{"ht1": "17.07", "tva1": "0.93", "total1": "18.00", "totalHt": "17.07", "totalTva": "0.93"}	965	{}	2023	3	4	\N
32.20	{"card": 32.2}	Lotta	{"ht1": "30.53", "tva1": "1.67", "total1": "32.20", "totalHt": "30.53", "totalTva": "1.67"}	966	{}	2023	3	4	\N
18.95	{"card": 18.95}	Lotta	{"ht1": "5.69", "ht3": "10.79", "tva1": "0.31", "tva3": "2.16", "total1": "6.00", "total3": "12.95", "totalHt": "16.48", "totalTva": "2.47"}	967	{}	2023	3	4	\N
44.00	{"card": 44}	Lotta	{"ht1": "41.70", "tva1": "2.30", "total1": "44.00", "totalHt": "41.70", "totalTva": "2.30"}	968	{}	2023	3	4	\N
22.00	{"card": 22}	Lotta	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	969	{}	2023	3	4	\N
32.75	{"card": 32.75}	Lotta	{"ht1": "28.25", "ht3": "2.46", "tva1": "1.55", "tva3": "0.49", "total1": "29.80", "total3": "2.95", "totalHt": "30.71", "totalTva": "2.04"}	970	{}	2023	3	4	\N
19.20	{"card": 19.2}	Lotta	{"ht1": "16.78", "ht3": "1.25", "tva1": "0.92", "tva3": "0.25", "total1": "17.70", "total3": 1.5, "totalHt": "18.03", "totalTva": "1.17"}	971	{}	2023	3	4	\N
8.95	{"cash": 8.95}	Lotta	{"ht1": "8.48", "tva1": "0.47", "total1": 8.95, "totalHt": "8.48", "totalTva": "0.47"}	972	{}	2023	3	4	\N
20.00	{"card": 20}	Lotta	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	973	{}	2023	3	4	\N
47.25	{"card": 47.25}	Lotta	{"ht1": "40.09", "ht3": "4.13", "tva1": "2.21", "tva3": "0.82", "total1": "42.30", "total3": "4.95", "totalHt": "44.22", "totalTva": "3.03"}	974	{}	2023	3	4	\N
24.00	{"card": 24}	Lotta	{"ht1": "22.75", "tva1": "1.25", "total1": "24.00", "totalHt": "22.75", "totalTva": "1.25"}	975	{}	2023	3	4	\N
47.30	{"card": 47.3}	Lotta	{"ht1": "44.84", "tva1": "2.46", "total1": "47.30", "totalHt": "44.84", "totalTva": "2.46"}	976	{}	2023	3	4	\N
36.00	{"card": 36}	Lotta	{"ht1": "32.71", "ht3": "1.25", "tva1": "1.79", "tva3": "0.25", "total1": "34.50", "total3": 1.5, "totalHt": "33.96", "totalTva": "2.04"}	977	{}	2023	3	4	\N
8.15	{"card": 8.15}	Lotta	{"ht1": "7.72", "tva1": "0.43", "total1": "8.15", "totalHt": "7.72", "totalTva": "0.43"}	978	{}	2023	3	4	\N
14.00	{"card": 14}	Lotta	{"ht1": "13.28", "tva1": "0.72", "total1": "14.00", "totalHt": "13.28", "totalTva": "0.72"}	979	{}	2023	3	4	\N
8.00	{"card": 8}	Lotta	{"ht1": "7.58", "tva1": "0.42", "total1": "8.00", "totalHt": "7.58", "totalTva": "0.42"}	980	{}	2023	3	4	\N
146.85	{"cash": 146.85}	Lotta	{"ht1": "139.21", "tva1": "7.64", "total1": "146.85", "totalHt": "139.21", "totalTva": "7.64"}	981	{}	2023	3	4	\N
19.50	{"cash": 19.5}	Lotta	{"ht1": "18.50", "tva1": "1.00", "total1": "19.50", "totalHt": "18.50", "totalTva": "1.00"}	982	{}	2023	3	4	\N
16.00	{"card": 16}	Lotta	{"ht1": "15.17", "tva1": "0.83", "total1": "16.00", "totalHt": "15.17", "totalTva": "0.83"}	983	{}	2023	3	4	\N
53.00	{"card": 53}	Lotta	{"ht1": "17.06", "ht3": "29.17", "tva1": "0.94", "tva3": "5.83", "total1": "18.00", "total3": 35, "totalHt": "46.23", "totalTva": "6.77"}	984	{}	2023	3	4	\N
17.00	{"card": 17}	Lotta	{"ht1": "14.69", "ht3": "1.25", "tva1": "0.81", "tva3": "0.25", "total1": "15.50", "total3": 1.5, "totalHt": "15.94", "totalTva": "1.06"}	985	{}	2023	3	4	\N
1.50	{"card": 1.5}	Lotta	{"ht3": "1.25", "tva3": "0.25", "total3": 1.5, "totalHt": "1.25", "totalTva": "0.25"}	986	{}	2023	3	4	\N
34.00	{"card": 34}	Lotta	{"ht1": "32.23", "tva1": "1.77", "total1": "34.00", "totalHt": "32.23", "totalTva": "1.77"}	987	{}	2023	3	5	\N
97.00	{"card": 97}	Lotta	{"ht1": "91.94", "tva1": "5.06", "total1": "97.00", "totalHt": "91.94", "totalTva": "5.06"}	988	{}	2023	3	5	\N
8.00	{"card": 8}	Lotta	{"ht1": "7.58", "tva1": "0.42", "total1": "8.00", "totalHt": "7.58", "totalTva": "0.42"}	989	{}	2023	3	5	\N
18.95	{"card": 18.95}	Lotta	{"ht1": "17.97", "tva1": "0.98", "total1": "18.95", "totalHt": "17.97", "totalTva": "0.98"}	990	{}	2023	3	5	\N
34.50	{"card": 34.5}	Lotta	{"ht1": "32.70", "tva1": "1.80", "total1": "34.50", "totalHt": "32.70", "totalTva": "1.80"}	991	{}	2023	3	5	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	992	{}	2023	3	5	\N
22.00	{"card": 22}	Lotta	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	993	{}	2023	3	5	\N
39.75	{"card": 39.75}	Lotta	{"ht1": "37.67", "tva1": "2.08", "total1": "39.75", "totalHt": "37.67", "totalTva": "2.08"}	994	{}	2023	3	5	\N
3.00	{"card": 3}	Lotta	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	995	{}	2023	3	5	\N
18.00	{"card": 18}	Lotta	{"ht1": "17.06", "tva1": "0.94", "total1": "18.00", "totalHt": "17.06", "totalTva": "0.94"}	996	{}	2023	3	5	\N
32.95	{"card": 32.95}	Lotta	{"ht1": "26.54", "ht3": "4.13", "tva1": "1.46", "tva3": "0.82", "total1": "28.00", "total3": "4.95", "totalHt": "30.67", "totalTva": "2.28"}	997	{}	2023	3	5	\N
5.00	{"cash": 5}	Lotta	{"ht1": "4.74", "tva1": "0.26", "total1": "5.00", "totalHt": "4.74", "totalTva": "0.26"}	998	{}	2023	3	5	\N
50.95	{"card": 50.95}	Lotta	{"ht1": "48.30", "tva1": "2.65", "total1": "50.95", "totalHt": "48.30", "totalTva": "2.65"}	999	{}	2023	3	5	\N
99.75	{"card": 99.75}	Lotta	{"ht1": "90.01", "ht3": "4.00", "tva1": "4.94", "tva3": "0.80", "total1": "94.95", "total3": "4.80", "totalHt": "94.01", "totalTva": "5.74"}	1000	{}	2023	3	5	\N
6.00	{"card": 6}	Lotta	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	1001	{}	2023	3	5	\N
20.00	{"cash": 20}	Lotta	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	1002	{}	2023	3	5	\N
8.00	{"cash": 8}	Lotta	{"ht1": "7.58", "tva1": "0.42", "total1": "8.00", "totalHt": "7.58", "totalTva": "0.42"}	1003	{}	2023	3	5	\N
111.10	{"card": 111.1}	Lotta	{"ht1": "101.56", "ht3": "3.29", "tva1": "5.59", "tva3": "0.66", "total1": "107.15", "total3": "3.95", "totalHt": "104.85", "totalTva": "6.25"}	1004	{}	2023	3	5	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1005	{}	2023	3	5	\N
25.05	{"card": 25.05}	Lotta	{"ht1": "23.74", "tva1": "1.31", "total1": "25.05", "totalHt": "23.74", "totalTva": "1.31"}	1006	{}	2023	3	5	\N
27.10	{"card": 27.1}	Lotta	{"ht1": "25.69", "tva1": "1.41", "total1": "27.10", "totalHt": "25.69", "totalTva": "1.41"}	1007	{}	2023	3	5	\N
46.00	{"card": 46}	Lotta	{"ht1": "43.60", "tva1": "2.40", "total1": "46.00", "totalHt": "43.60", "totalTva": "2.40"}	1008	{}	2023	3	5	\N
3.00	{"card": 3}	Lotta	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	1009	{}	2023	3	5	\N
9.00	{"cash": 9}	Lotta	{"ht1": "8.53", "tva1": "0.47", "total1": "9.00", "totalHt": "8.53", "totalTva": "0.47"}	1010	{}	2023	3	5	\N
7.50	{"card": 7.5}	Lotta	{"ht1": "7.11", "tva1": "0.39", "total1": "7.50", "totalHt": "7.11", "totalTva": "0.39"}	1011	{}	2023	3	5	\N
17.00	{"card": 17}	Lotta	{"ht1": "16.11", "tva1": "0.89", "total1": "17.00", "totalHt": "16.11", "totalTva": "0.89"}	1012	{}	2023	3	5	\N
13.15	{"card": 13.15}	Lotta	{"ht1": "12.46", "tva1": "0.69", "total1": "13.15", "totalHt": "12.46", "totalTva": "0.69"}	1013	{}	2023	3	5	\N
9.50	{"card": 9.5}	Lotta	{"ht1": "9.00", "tva1": "0.50", "total1": "9.50", "totalHt": "9.00", "totalTva": "0.50"}	1014	{}	2023	3	5	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1015	{}	2023	3	5	\N
3.50	{"card": 3.5}	Lotta	{"ht1": "3.32", "tva1": "0.18", "total1": 3.5, "totalHt": "3.32", "totalTva": "0.18"}	1016	{}	2023	3	5	\N
3.00	{"cash": 3}	Lotta	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	1017	{}	2023	3	5	\N
13.00	{"card": 13}	Lotta	{"ht1": "2.85", "ht3": "8.33", "tva1": "0.15", "tva3": "1.67", "total1": "3.00", "total3": "10.00", "totalHt": "11.18", "totalTva": "1.82"}	1018	{}	2023	3	5	\N
88.45	{"cash": 88.45}	Lotta	{"ht1": "83.84", "tva1": "4.61", "total1": "88.45", "totalHt": "83.84", "totalTva": "4.61"}	1019	{}	2023	3	5	\N
0.00	{"cash": 0}	Lotta	{}	1020	{}	2023	3	5	\N
13.00	{"card": 13}	Lotta	{"ht1": "12.33", "tva1": "0.67", "total1": "13.00", "totalHt": "12.33", "totalTva": "0.67"}	1021	{}	2023	3	5	\N
12.60	{"card": 12.6}	Lotta	{"ht1": "11.94", "tva1": "0.66", "total1": "12.60", "totalHt": "11.94", "totalTva": "0.66"}	1022	{}	2023	3	5	\N
4.00	{"card": 4}	Lotta	{"ht1": "3.79", "tva1": "0.21", "total1": 4, "totalHt": "3.79", "totalTva": "0.21"}	1023	{}	2023	3	5	\N
4.00	{"card": 4}	Lotta	{"ht1": "3.79", "tva1": "0.21", "total1": 4, "totalHt": "3.79", "totalTva": "0.21"}	1024	{}	2023	3	5	\N
6.00	{"card": 6}	Lotta	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	1025	{}	2023	3	5	\N
6.30	{"cash": 6.3}	Jaja	{"ht1": "5.97", "tva1": "0.33", "total1": 6.3, "totalHt": "5.97", "totalTva": "0.33"}	1026	{}	2023	3	8	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1027	{}	2023	3	8	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1028	{}	2023	3	8	\N
76.20	{"card": 76.2}	Jaja	{"ht1": "72.23", "tva1": "3.97", "total1": "76.20", "totalHt": "72.23", "totalTva": "3.97"}	1029	{}	2023	3	8	\N
21.40	{"card": 21.4}	Jaja	{"ht1": "20.28", "tva1": "1.12", "total1": "21.40", "totalHt": "20.28", "totalTva": "1.12"}	1030	{}	2023	3	8	\N
4.50	{"cash": 4.5}	Jaja	{"ht1": "4.27", "tva1": "0.23", "total1": 4.5, "totalHt": "4.27", "totalTva": "0.23"}	1031	{}	2023	3	8	\N
20.85	{"card": 20.85}	Jaja	{"ht1": "19.76", "tva1": "1.09", "total1": "20.85", "totalHt": "19.76", "totalTva": "1.09"}	1032	{}	2023	3	8	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1033	{}	2023	3	8	\N
10.00	{"card": 10}	Jaja	{"ht3": "8.33", "tva3": "1.67", "total3": "10.00", "totalHt": "8.33", "totalTva": "1.67"}	1034	{}	2023	3	8	\N
23.00	{"card": 23}	Jaja	{"ht1": "21.80", "tva1": "1.20", "total1": "23.00", "totalHt": "21.80", "totalTva": "1.20"}	1035	{}	2023	3	8	\N
31.70	{"card": 31.7}	Jaja	{"ht1": "30.05", "tva1": "1.65", "total1": "31.70", "totalHt": "30.05", "totalTva": "1.65"}	1036	{}	2023	3	8	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.69", "tva1": "0.31", "total1": 6, "totalHt": "5.69", "totalTva": "0.31"}	1037	{}	2023	3	8	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	1038	{}	2023	3	8	\N
23.00	{"card": 23}	Jaja	{"ht1": "21.81", "tva1": "1.19", "total1": "23.00", "totalHt": "21.81", "totalTva": "1.19"}	1039	{}	2023	3	8	\N
29.50	{"card": 29.5}	Jaja	{"ht1": "27.96", "tva1": "1.54", "total1": "29.50", "totalHt": "27.96", "totalTva": "1.54"}	1040	{}	2023	3	8	\N
14.30	{"card": 14.3}	Jaja	{"ht1": "13.55", "tva1": "0.75", "total1": "14.30", "totalHt": "13.55", "totalTva": "0.75"}	1041	{}	2023	3	8	\N
78.07	{"card": 78.07}	Jaja	{"ht1": "74.00", "tva1": "4.07", "total1": "78.07", "totalHt": "74.00", "totalTva": "4.07"}	1042	{}	2023	3	8	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	1043	{}	2023	3	8	\N
35.20	{"card": 35.2}	Jaja	{"ht1": "33.36", "tva1": "1.84", "total1": "35.20", "totalHt": "33.36", "totalTva": "1.84"}	1044	{}	2023	3	8	\N
24.90	{"card": 24.9}	Jaja	{"ht1": "23.60", "tva1": "1.30", "total1": "24.90", "totalHt": "23.60", "totalTva": "1.30"}	1045	{}	2023	3	8	\N
15.95	{"card": 15.95}	Jaja	{"ht1": "15.12", "tva1": "0.83", "total1": "15.95", "totalHt": "15.12", "totalTva": "0.83"}	1046	{}	2023	3	8	\N
17.85	{"card": 17.85}	Jaja	{"ht1": "16.92", "tva1": "0.93", "total1": "17.85", "totalHt": "16.92", "totalTva": "0.93"}	1047	{}	2023	3	8	\N
40.85	{"card": 40.85}	Jaja	{"ht1": "38.72", "tva1": "2.13", "total1": "40.85", "totalHt": "38.72", "totalTva": "2.13"}	1048	{}	2023	3	8	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1049	{}	2023	3	8	\N
18.10	{"card": 18.1}	Jaja	{"ht1": "17.16", "tva1": "0.94", "total1": "18.10", "totalHt": "17.16", "totalTva": "0.94"}	1050	{}	2023	3	8	\N
132.00	{"card": 132}	Jaja	{"ht1": "125.12", "tva1": "6.88", "total1": "132.00", "totalHt": "125.12", "totalTva": "6.88"}	1051	{}	2023	3	8	\N
4.50	{"card": 4.5}	Jaja	{"ht1": "4.27", "tva1": "0.23", "total1": 4.5, "totalHt": "4.27", "totalTva": "0.23"}	1052	{}	2023	3	8	\N
13.10	{"card": 13.1}	Jaja	{"ht1": "12.43", "tva1": "0.67", "total1": "13.10", "totalHt": "12.43", "totalTva": "0.67"}	1053	{}	2023	3	8	\N
32.65	{"card": 32.65}	Jaja	{"ht1": "30.95", "tva1": "1.70", "total1": "32.65", "totalHt": "30.95", "totalTva": "1.70"}	1054	{}	2023	3	8	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	1055	{}	2023	3	8	\N
3.00	{"cash": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	1056	{}	2023	3	8	\N
20.40	{"card": 20.4}	Jaja	{"ht1": "19.34", "tva1": "1.06", "total1": "20.40", "totalHt": "19.34", "totalTva": "1.06"}	1057	{}	2023	3	8	\N
6.00	{"card": 6}	Jaja	{"ht1": "5.68", "tva1": "0.32", "total1": "6.00", "totalHt": "5.68", "totalTva": "0.32"}	1058	{}	2023	3	9	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.49", "tva1": "0.51", "total1": "10.00", "totalHt": "9.49", "totalTva": "0.51"}	1059	{}	2023	3	9	\N
4.50	{"card": 4.5}	Jaja	{"ht1": "4.27", "tva1": "0.23", "total1": 4.5, "totalHt": "4.27", "totalTva": "0.23"}	1060	{}	2023	3	9	\N
18.95	{"card": 18.95}	Jaja	{"ht1": "17.96", "tva1": "0.99", "total1": "18.95", "totalHt": "17.96", "totalTva": "0.99"}	1061	{}	2023	3	9	\N
82.90	{"card": 82.9}	Jaja	{"ht1": "78.59", "tva1": "4.31", "total1": "82.90", "totalHt": "78.59", "totalTva": "4.31"}	1062	{}	2023	3	9	\N
0.00	{"card": 0}	Jaja	{}	1063	{}	2023	3	9	\N
4.95	{"cash": 4.95}	Jaja	{"ht1": "4.69", "tva1": "0.26", "total1": 4.95, "totalHt": "4.69", "totalTva": "0.26"}	1064	{}	2023	3	9	\N
3.00	{"card": 3}	Jaja	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	1065	{}	2023	3	9	\N
26.00	{"card": 26}	Jaja	{"ht1": "24.65", "tva1": "1.35", "total1": "26.00", "totalHt": "24.65", "totalTva": "1.35"}	1066	{}	2023	3	9	\N
52.00	{"card": 52}	Jaja	{"ht1": "41.71", "tva1": "2.29", "total1": "44.00", "totalHt": "41.71", "totalTva": "2.29"}	1067	{}	2023	3	9	\N
22.00	{"card": 22}	Jaja	{"ht1": "20.85", "tva1": "1.15", "total1": "22.00", "totalHt": "20.85", "totalTva": "1.15"}	1068	{}	2023	3	9	\N
82.49	{"card": 82.49}	Jaja	{"ht1": "76.34", "ht3": "1.63", "tva1": "4.20", "tva3": "0.32", "total1": "80.54", "total3": 1.95, "totalHt": "77.97", "totalTva": "4.52"}	1069	{}	2023	3	9	\N
70.15	{"card": 70.15}	Jaja	{"ht1": "57.47", "ht2": "9.30", "tva1": "3.18", "tva2": "0.20", "total1": "60.65", "total2": "9.50", "totalHt": "66.77", "totalTva": "3.38"}	1070	{}	2023	3	9	\N
165.50	{"card": 165.5}	Jaja	{"ht1": "139.95", "ht2": "17.48", "tva1": "7.70", "tva2": "0.37", "total1": "147.65", "total2": "17.85", "totalHt": "157.43", "totalTva": "8.07"}	1071	{}	2023	3	9	\N
14.85	{"card": 14.85}	Jaja	{"ht1": "14.08", "tva1": "0.77", "total1": "14.85", "totalHt": "14.08", "totalTva": "0.77"}	1072	{}	2023	3	9	\N
5.95	{"cash": 5.95}	Jaja	{"ht1": "5.64", "tva1": "0.31", "total1": "5.95", "totalHt": "5.64", "totalTva": "0.31"}	1073	{}	2023	3	9	\N
15.00	{"cash": 15}	Jaja	{"ht1": "14.22", "tva1": "0.78", "total1": "15.00", "totalHt": "14.22", "totalTva": "0.78"}	1074	{}	2023	3	9	\N
10.50	{"card": 10.5}	Jaja	{"ht1": "9.95", "tva1": "0.55", "total1": "10.50", "totalHt": "9.95", "totalTva": "0.55"}	1075	{}	2023	3	9	\N
14.00	{"card": 14}	Jaja	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	1076	{}	2023	3	9	\N
26.55	{"card": 26.55}	Jaja	{"ht1": "25.16", "tva1": "1.39", "total1": "26.55", "totalHt": "25.16", "totalTva": "1.39"}	1077	{}	2023	3	9	\N
15.85	{"card": 15.85}	Jaja	{"ht1": "15.03", "tva1": "0.82", "total1": "15.85", "totalHt": "15.03", "totalTva": "0.82"}	1078	{}	2023	3	9	\N
7.95	{"card": 7.95}	Jaja	{"ht1": "7.54", "tva1": "0.41", "total1": "7.95", "totalHt": "7.54", "totalTva": "0.41"}	1079	{}	2023	3	9	\N
5.10	{"card": 5.1}	Jaja	{"ht1": "4.83", "tva1": "0.27", "total1": "5.10", "totalHt": "4.83", "totalTva": "0.27"}	1080	{}	2023	3	9	\N
20.95	{"card": 20.95}	Jaja	{"ht1": "19.85", "tva1": "1.10", "total1": "20.95", "totalHt": "19.85", "totalTva": "1.10"}	1081	{}	2023	3	9	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1082	{}	2023	3	9	\N
12.55	{"card": 12.55}	Jaja	{"ht1": "11.90", "tva1": "0.65", "total1": "12.55", "totalHt": "11.90", "totalTva": "0.65"}	1083	{}	2023	3	9	\N
11.95	{"card": 11.95}	Jaja	{"ht1": "11.32", "tva1": "0.63", "total1": "11.95", "totalHt": "11.32", "totalTva": "0.63"}	1084	{}	2023	3	9	\N
10.00	{"card": 10}	Jaja	{"ht1": "9.47", "tva1": "0.53", "total1": "10.00", "totalHt": "9.47", "totalTva": "0.53"}	1085	{}	2023	3	9	\N
14.00	{"card": 14}	Jaja	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	1086	{}	2023	3	9	\N
39.60	{"card": 39.6}	Jaja	{"ht1": "37.54", "tva1": "2.06", "total1": "39.60", "totalHt": "37.54", "totalTva": "2.06"}	1087	{}	2023	3	9	\N
20.00	{"card": 20}	Lotta	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	1088	{}	2023	3	10	\N
60.40	{"card": 60.4}	Lotta	{"ht1": "57.26", "tva1": "3.14", "total1": "60.40", "totalHt": "57.26", "totalTva": "3.14"}	1089	{}	2023	3	10	\N
13.70	{"cash": 13.7}	Lotta	{"ht1": "12.98", "tva1": "0.72", "total1": "13.70", "totalHt": "12.98", "totalTva": "0.72"}	1090	{}	2023	3	10	\N
17.85	{"cash": 17.85}	Lotta	{"ht1": "16.92", "tva1": "0.93", "total1": "17.85", "totalHt": "16.92", "totalTva": "0.93"}	1091	{}	2023	3	10	\N
14.80	{"card": 14.8}	Lotta	{"ht1": "14.03", "tva1": "0.77", "total1": "14.80", "totalHt": "14.03", "totalTva": "0.77"}	1092	{}	2023	3	10	\N
30.75	{"card": 30.75}	Lotta	{"ht1": "29.15", "tva1": "1.60", "total1": "30.75", "totalHt": "29.15", "totalTva": "1.60"}	1093	{}	2023	3	10	\N
37.95	{"card": 37.95}	Lotta	{"ht1": "27.49", "ht3": "7.46", "tva1": "1.51", "tva3": "1.49", "total1": "29.00", "total3": "8.95", "totalHt": "34.95", "totalTva": "3.00"}	1094	{}	2023	3	10	\N
12.95	{"card": 12.95}	Lotta	{"ht1": "12.27", "tva1": "0.68", "total1": 12.95, "totalHt": "12.27", "totalTva": "0.68"}	1095	{}	2023	3	10	\N
12.00	{"card": 12}	Lotta	{"ht1": "11.38", "tva1": "0.62", "total1": "12.00", "totalHt": "11.38", "totalTva": "0.62"}	1096	{}	2023	3	10	\N
40.40	{"cash": 40.4}	Lotta	{"ht1": "38.30", "tva1": "2.10", "total1": "40.40", "totalHt": "38.30", "totalTva": "2.10"}	1097	{}	2023	3	10	\N
25.40	{"card": 25.4}	Lotta	{"ht1": "14.12", "ht2": "10.28", "tva1": "0.78", "tva2": "0.22", "total1": "14.90", "total2": "10.50", "totalHt": "24.40", "totalTva": "1.00"}	1098	{}	2023	3	10	\N
49.85	{"card": 49.85}	Lotta	{"ht1": "36.83", "ht3": "9.17", "tva1": "2.02", "tva3": "1.83", "total1": "38.85", "total3": "11.00", "totalHt": "46.00", "totalTva": "3.85"}	1099	{}	2023	3	10	\N
40.00	{"card": 40}	Lotta	{"ht1": "37.92", "tva1": "2.08", "total1": "40.00", "totalHt": "37.92", "totalTva": "2.08"}	1100	{}	2023	3	10	\N
29.05	{"card": 29.05}	Lotta	{"ht1": "27.54", "tva1": "1.51", "total1": "29.05", "totalHt": "27.54", "totalTva": "1.51"}	1101	{}	2023	3	10	\N
40.10	{"card": 40.1}	Lotta	{"ht1": "38.01", "tva1": "2.09", "total1": "40.10", "totalHt": "38.01", "totalTva": "2.09"}	1102	{}	2023	3	10	\N
34.00	{"card": 34}	Lotta	{"ht1": "17.06", "ht3": "6.67", "tva1": "0.94", "tva3": "1.33", "total1": "18.00", "total3": "8.00", "totalHt": "23.73", "totalTva": "2.27"}	1103	{}	2023	3	10	\N
39.00	{"card": 39}	Lotta	{"ht1": "36.96", "tva1": "2.04", "total1": "39.00", "totalHt": "36.96", "totalTva": "2.04"}	1104	{}	2023	3	10	\N
24.75	{"card": 24.75}	Lotta	{"ht1": "13.27", "ht2": "5.68", "ht3": "4.13", "tva1": "0.73", "tva2": "0.12", "tva3": "0.82", "total1": "14.00", "total2": "5.80", "total3": 4.95, "totalHt": "23.08", "totalTva": "1.67"}	1105	{}	2023	3	10	\N
95.55	{"card": 95.55}	Lotta	{"ht1": "74.13", "ht3": "14.46", "tva1": "4.07", "tva3": "2.89", "total1": "78.20", "total3": "17.35", "totalHt": "88.59", "totalTva": "6.96"}	1106	{}	2023	3	10	\N
74.80	{"card": 74.8}	Lotta	{"ht1": "70.90", "tva1": "3.90", "total1": "74.80", "totalHt": "70.90", "totalTva": "3.90"}	1107	{}	2023	3	10	\N
18.90	{"card": 18.9}	Lotta	{"ht1": "13.22", "ht3": "4.13", "tva1": "0.73", "tva3": "0.82", "total1": "13.95", "total3": "4.95", "totalHt": "17.35", "totalTva": "1.55"}	1108	{}	2023	3	10	\N
41.80	{"card": 41.8}	Lotta	{"ht1": "39.62", "tva1": "2.18", "total1": "41.80", "totalHt": "39.62", "totalTva": "2.18"}	1109	{}	2023	3	10	\N
29.85	{"cash": 29.85}	Lotta	{"ht1": "28.29", "tva1": "1.56", "total1": "29.85", "totalHt": "28.29", "totalTva": "1.56"}	1110	{}	2023	3	10	\N
3.00	{"card": 3}	Lotta	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	1111	{}	2023	3	10	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1112	{}	2023	3	10	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1113	{}	2023	3	10	\N
27.00	{"card": 27}	Lotta	{"ht1": "25.59", "tva1": "1.41", "total1": "27.00", "totalHt": "25.59", "totalTva": "1.41"}	1114	{}	2023	3	10	\N
9.00	{"card": 9}	Lotta	{"ht1": "8.52", "tva1": "0.48", "total1": "9.00", "totalHt": "8.52", "totalTva": "0.48"}	1115	{}	2023	3	11	\N
54.60	{"card": 54.6}	Lotta	{"ht1": "40.42", "ht2": "5.88", "ht3": "4.96", "tva1": "2.23", "tva2": "0.12", "tva3": "0.99", "total1": "42.65", "total2": "6.00", "total3": "5.95", "totalHt": "51.26", "totalTva": "3.34"}	1116	{}	2023	3	11	\N
59.90	{"card": 59.9}	Lotta	{"ht1": "56.77", "tva1": "3.13", "total1": "59.90", "totalHt": "56.77", "totalTva": "3.13"}	1117	{}	2023	3	11	\N
8.95	{"card": 8.95}	Lotta	{"ht1": "8.48", "tva1": "0.47", "total1": 8.95, "totalHt": "8.48", "totalTva": "0.47"}	1118	{}	2023	3	11	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1119	{}	2023	3	11	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1120	{}	2023	3	11	\N
12.05	{"card": 12.05}	Lotta	{"ht1": "11.42", "tva1": "0.63", "total1": "12.05", "totalHt": "11.42", "totalTva": "0.63"}	1121	{}	2023	3	11	\N
37.30	{"card": 37.3}	Lotta	{"ht1": "32.04", "ht3": "2.92", "tva1": "1.76", "tva3": "0.58", "total1": "33.80", "total3": "3.50", "totalHt": "34.96", "totalTva": "2.34"}	1122	{}	2023	3	11	\N
28.35	{"card": 28.35}	Lotta	{"ht1": "26.88", "tva1": "1.47", "total1": "28.35", "totalHt": "26.88", "totalTva": "1.47"}	1123	{}	2023	3	11	\N
3.00	{"cash": 3}	Lotta	{"ht1": "2.84", "tva1": "0.16", "total1": 3, "totalHt": "2.84", "totalTva": "0.16"}	1124	{}	2023	3	11	\N
15.00	{"card": 15}	Lotta	{"ht1": "14.22", "tva1": "0.78", "total1": "15.00", "totalHt": "14.22", "totalTva": "0.78"}	1125	{}	2023	3	11	\N
14.00	{"card": 14}	Lotta	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	1126	{}	2023	3	11	\N
18.90	{"cash": 18.9}	Lotta	{"ht1": "17.91", "tva1": "0.99", "total1": "18.90", "totalHt": "17.91", "totalTva": "0.99"}	1127	{}	2023	3	11	\N
5.95	{"card": 5.95}	Lotta	{"ht1": "5.64", "tva1": "0.31", "total1": 5.95, "totalHt": "5.64", "totalTva": "0.31"}	1128	{}	2023	3	11	\N
56.90	{"card": 56.9}	Lotta	{"ht1": "53.95", "tva1": "2.95", "total1": "56.90", "totalHt": "53.95", "totalTva": "2.95"}	1129	{}	2023	3	11	\N
10.85	{"card": 10.85}	Lotta	{"ht1": "10.29", "tva1": "0.56", "total1": "10.85", "totalHt": "10.29", "totalTva": "0.56"}	1130	{}	2023	3	11	\N
5.90	{"card": 5.9}	Lotta	{"ht1": "5.59", "tva1": "0.31", "total1": "5.90", "totalHt": "5.59", "totalTva": "0.31"}	1131	{}	2023	3	11	\N
130.95	{"card": 130.95}	Lotta	{"ht1": "92.89", "ht3": "27.46", "tva1": "5.11", "tva3": "5.49", "total1": "98.00", "total3": "32.95", "totalHt": "120.35", "totalTva": "10.60"}	1132	{}	2023	3	11	\N
14.00	{"cash": 14}	Lotta	{"ht1": "13.27", "tva1": "0.73", "total1": "14.00", "totalHt": "13.27", "totalTva": "0.73"}	1133	{}	2023	3	11	\N
127.25	{"card": 127.25}	Lotta	{"ht1": "95.07", "ht2": "10.77", "ht3": "13.29", "tva1": "5.23", "tva2": "0.23", "tva3": "2.66", "total1": "100.30", "total2": "11.00", "total3": 15.95, "totalHt": "119.13", "totalTva": "8.12"}	1134	{}	2023	3	11	\N
76.95	{"card": 76.95}	Lotta	{"ht1": "72.93", "tva1": "4.02", "total1": "76.95", "totalHt": "72.93", "totalTva": "4.02"}	1135	{}	2023	3	11	\N
9.10	{"card": 9.1}	Lotta	{"ht1": "8.62", "tva1": "0.48", "total1": "9.10", "totalHt": "8.62", "totalTva": "0.48"}	1136	{}	2023	3	11	\N
53.70	{"card": 53.7}	Lotta	{"ht1": "37.73", "ht3": "11.58", "tva1": "2.07", "tva3": "2.32", "total1": "39.80", "total3": "13.90", "totalHt": "49.31", "totalTva": "4.39"}	1137	{}	2023	3	11	\N
7.00	{"card": 7}	Lotta	{"ht1": "6.63", "tva1": "0.37", "total1": "7.00", "totalHt": "6.63", "totalTva": "0.37"}	1138	{}	2023	3	11	\N
6.00	{"card": 6}	Lotta	{"ht1": "5.69", "tva1": "0.31", "total1": "6.00", "totalHt": "5.69", "totalTva": "0.31"}	1139	{}	2023	3	11	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1140	{}	2023	3	11	\N
13.00	{"card": 13}	Lotta	{"ht1": "12.32", "tva1": "0.68", "total1": "13.00", "totalHt": "12.32", "totalTva": "0.68"}	1141	{}	2023	3	11	\N
133.30	{"card": 133.3}	Lotta	{"ht1": "120.72", "ht3": "4.96", "tva1": "6.63", "tva3": "0.99", "total1": "127.35", "total3": "5.95", "totalHt": "125.68", "totalTva": "7.62"}	1142	{}	2023	3	11	\N
9.45	{"card": 9.45}	Lotta	{"ht1": "4.69", "ht3": "3.75", "tva1": "0.26", "tva3": "0.75", "total1": 4.95, "total3": 4.5, "totalHt": "8.44", "totalTva": "1.01"}	1143	{}	2023	3	11	\N
42.80	{"card": 42.8}	Lotta	{"ht1": "34.88", "ht3": "5.00", "tva1": "1.92", "tva3": "1.00", "total1": "36.80", "total3": "6.00", "totalHt": "39.88", "totalTva": "2.92"}	1144	{}	2023	3	11	\N
12.00	{"card": 12}	Lotta	{"ht1": "11.38", "tva1": "0.62", "total1": "12.00", "totalHt": "11.38", "totalTva": "0.62"}	1145	{}	2023	3	11	\N
3.50	{"card": 3.5}	Lotta	{"ht1": "3.32", "tva1": "0.18", "total1": "3.50", "totalHt": "3.32", "totalTva": "0.18"}	1146	{}	2023	3	11	\N
151.75	{"card": 151.75}	Lotta	{"ht1": "5.22", "ht3": "121.89", "tva1": "0.28", "tva3": "24.36", "total1": "5.50", "total3": "146.25", "totalHt": "127.11", "totalTva": "24.64"}	1147	{}	2023	3	11	\N
20.00	{"card": 20}	Lotta	{"ht1": "18.96", "tva1": "1.04", "total1": "20.00", "totalHt": "18.96", "totalTva": "1.04"}	1148	{}	2023	3	11	\N
2.00	{"card": 2}	Lotta	{"ht1": "1.90", "tva1": "0.10", "total1": 2, "totalHt": "1.90", "totalTva": "0.10"}	1149	{}	2023	3	11	\N
11.50	{"card": 11.5}	Lotta	{"ht1": "10.90", "tva1": "0.60", "total1": "11.50", "totalHt": "10.90", "totalTva": "0.60"}	1150	{}	2023	3	11	\N
17.70	{"cash": 17.7}	Lotta	{"ht1": "16.79", "tva1": "0.91", "total1": "17.70", "totalHt": "16.79", "totalTva": "0.91"}	1151	{}	2023	3	11	\N
12.40	{"card": 12.4}	Lotta	{"ht1": "11.75", "tva1": "0.65", "total1": "12.40", "totalHt": "11.75", "totalTva": "0.65"}	1152	{}	2023	3	11	\N
6.90	{"card": 6.9}	Lotta	{"ht1": "2.27", "ht3": "3.75", "tva1": "0.13", "tva3": "0.75", "total1": "2.40", "total3": "4.50", "totalHt": "6.02", "totalTva": "0.88"}	1153	{}	2023	3	11	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1154	{}	2023	3	11	\N
4.50	{"card": 4.5}	Lotta	{"ht1": "4.27", "tva1": "0.23", "total1": 4.5, "totalHt": "4.27", "totalTva": "0.23"}	1155	{}	2023	3	11	\N
85.60	{"card": 85.6}	Lotta	{"ht1": "54.84", "ht2": "6.66", "ht3": "17.46", "tva1": "3.01", "tva2": "0.14", "tva3": "3.49", "total1": "57.85", "total2": "6.80", "total3": "20.95", "totalHt": "78.96", "totalTva": "6.64"}	1156	{}	2023	3	11	\N
12.95	{"card": 12.95}	Lotta	{"ht1": "12.27", "tva1": "0.68", "total1": 12.95, "totalHt": "12.27", "totalTva": "0.68"}	1157	{}	2023	3	11	\N
10.00	{"card": 10}	Lotta	{"ht1": "9.48", "tva1": "0.52", "total1": 10, "totalHt": "9.48", "totalTva": "0.52"}	1158	{}	2023	3	11	\N
8.00	{"cash": 8}	Lotta	{"ht1": "7.58", "tva1": "0.42", "total1": "8.00", "totalHt": "7.58", "totalTva": "0.42"}	1159	{}	2023	3	11	\N
20.90	{"cash": 20.9}	Lotta	{"ht1": "19.81", "tva1": "1.09", "total1": "20.90", "totalHt": "19.81", "totalTva": "1.09"}	1160	{}	2023	3	11	\N
5.95	{"card": 5.95}	Lotta	{"ht1": "5.64", "tva1": "0.31", "total1": 5.95, "totalHt": "5.64", "totalTva": "0.31"}	1161	{}	2023	3	11	\N
9.50	{"card": 9.5}	Lotta	{"ht1": "4.27", "ht3": "4.17", "tva1": "0.23", "tva3": "0.83", "total1": 4.5, "total3": "5.00", "totalHt": "8.44", "totalTva": "1.06"}	1162	{}	2023	3	11	\N
64.00	{"card": 64}	Lotta	{"ht1": "60.66", "tva1": "3.34", "total1": "64.00", "totalHt": "60.66", "totalTva": "3.34"}	1163	{}	2023	3	11	\N
126.90	{"card": 126.9}	Lotta	{"ht3": "105.76", "tva3": "21.14", "total3": "126.90", "totalHt": "105.76", "totalTva": "21.14"}	1164	{}	2023	3	11	\N
69.35	{"cash": 69.35}	Lotta	{"ht1": "32.56", "ht3": "29.17", "tva1": "1.79", "tva3": "5.83", "total1": "34.35", "total3": 35, "totalHt": "61.73", "totalTva": "7.62"}	1165	{}	2023	3	11	\N
\.


--
-- Data for Name: sales_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_products (product_name, product_quantity, product_price, product_taxe, sale_id, product_id, sale_year, sale_month, sale_day) FROM stdin;
Alimentation	1	27.00	5.5	1	nb-1	2023	2	6
Alimentation	1	6.00	5.5	2	nb-1	2023	2	7
Rårörda lingon	1	8.95	5.5	3	447	2023	2	7
Alimentation	3	25.50	5.5	3	nb-3	2023	2	7
Cheez doodles 35g	1	4.20	5.5	3	84	2023	2	7
Ballerina Original	1	4.50	5.5	3	30	2023	2	7
Bullar x4	2	20.00	5.5	3	c-Bullar x4	2023	2	7
Delicatoboll singel	3	4.50	5.5	3	80	2023	2	7
Alimentation	1	53.50	5.5	4	nb-1	2023	2	7
Delicatoboll singel	2	3.00	5.5	5	80	2023	2	7
Kanel x4	1	10.00	5.5	6	c-Kanel x4	2023	2	7
Alimentation	1	6.00	5.5	6	nb-2	2023	2	7
Magazine	1	5.80	2.1	7	nb-1	2023	2	7
Kardemumbulle	2	6.00	5.5	8	c-Kardemumbulle	2023	2	7
Klassiska Köttbullar	1	12.95	5.5	8	247	2023	2	7
Alimentation	1	0.98	5.5	8	nb-2	2023	2	7
Bregott extrasaltat	1	3.60	5.5	8	506	2023	2	7
Kardemumbulle	2	6.00	5.5	9	c-Kardemumbulle	2023	2	7
Rödbetssallad 400g	2	13.00	5.5	10	462	2023	2	7
Alimentation	1	3.25	5.5	10	nb-1	2023	2	7
Bulle	1	3.00	5.5	10	c-Bulle	2023	2	7
100 Frön & Havssalt	1	4.50	5.5	10	3	2023	2	7
Kardemumma Malen 18g	1	3.95	5.5	11	236	2023	2	7
Taco spice mix	1	2.50	20	11	527	2023	2	7
Taco sauce hot	1	4.50	5.5	11	529	2023	2	7
Semla	1	4.00	5.5	11	c-Semla	2023	2	7
Alimentation	2	16.00	5.5	12	nb-1	2023	2	7
Zingo apelsin	1	2.00	5.5	12	786	2023	2	7
Blabärsbulle	1	3.00	5.5	13	c-Blabärsbulle	2023	2	7
Alimentation	1	6.00	5.5	13	nb-2	2023	2	7
Filmjölk 3%	3	10.50	5.5	14	122	2023	2	7
Guld Marie	3	7.50	5.5	14	181	2023	2	7
Brunost	1	17.95	5.5	14	51	2023	2	7
Kanel x4	1	10.00	5.5	14	c-Kanel x4	2023	2	7
Frödinge Princesstårta	1	15.00	5.5	15	144	2023	2	7
Magazine	1	11.50	2.1	15	nb-2	2023	2	7
Magazine	1	9.50	2.1	15	nb-3	2023	2	7
Mästar matjessill	2	11.90	5.5	15	771	2023	2	7
Grebbestads® Ansjovisfilé Original	4	27.80	5.5	15	171	2023	2	7
Prinskorv	2	13.90	5.5	15	424	2023	2	7
Falukorv Sverige	2	11.90	5.5	15	113	2023	2	7
Gammeldags enrisrökt korv	1	8.95	5.5	15	157	2023	2	7
Klassiska Köttbullar	2	25.90	5.5	15	247	2023	2	7
Lingonsylt	1	8.95	5.5	15	300	2023	2	7
Kardemummaskorpor finax	1	5.95	5.5	15	763	2023	2	7
Bullar x4	2	20.00	5.5	15	c-Bullar x4	2023	2	7
Semla	2	8.00	5.5	16	c-Semla	2023	2	7
Räkost	1	8.95	5.5	17	438	2023	2	7
Kalles kaviar original	2	11.00	5.5	17	773	2023	2	7
Kallrökt Lax 150g Korshags	1	13.95	5.5	17	226	2023	2	7
Hovmästarsås glasburk	1	4.50	5.5	17	200	2023	2	7
Idealmakaroner gammeldags	1	4.20	5.5	17	203	2023	2	7
Kardemummaskorpor finax	1	5.95	5.5	17	763	2023	2	7
Slotts stark senap tub	1	5.95	5.5	17	760	2023	2	7
Slotts senap original tub	1	5.95	5.5	17	481	2023	2	7
Tomatketchup Original	1	5.00	5.5	17	535	2023	2	7
Guld Marie	1	2.50	5.5	17	181	2023	2	7
Ballerina Original	1	4.50	5.5	17	30	2023	2	7
Prickig korv skiv	1	3.95	5.5	17	422	2023	2	7
Potatissallad	1	3.95	5.5	17	417	2023	2	7
Potatissallad	1	5.95	5.5	17	418	2023	2	7
Riskakor Ost glutenfria	1	4.75	5.5	17	458	2023	2	7
Åseda Gräddost 38%	1	17.95	5.5	17	24	2023	2	7
Västerbottensost 35% normalbit	1	21.95	5.5	17	554	2023	2	7
Yes Original	1	9.95	20	17	699	2023	2	7
Alimentation	1	6.00	5.5	17	nb-19	2023	2	7
Semla	1	4.00	5.5	17	c-Semla	2023	2	7
Kanel x4	1	10.00	5.5	18	c-Kanel x4	2023	2	7
Bulle	1	3.00	5.5	19	c-Bulle	2023	2	7
Alimentation	1	2.00	5.5	19	nb-2	2023	2	7
Kallrökt Lax 150g Korshags	1	13.95	5.5	20	226	2023	2	7
Tyrkisk Peber Original	1	3.50	5.5	21	545	2023	2	7
Knäcke trekant normalgräddat	1	3.50	5.5	21	254	2023	2	7
Bullar x4	1	10.00	5.5	22	c-Bullar x4	2023	2	7
Bulle	1	3.00	5.5	23	c-Bulle	2023	2	7
Bullar x4	1	10.00	5.5	23	c-Bullar x4	2023	2	7
Hovmästarsås glasburk	1	4.50	5.5	24	200	2023	2	7
Alimentation	1	6.95	5.5	24	nb-2	2023	2	7
Ahlgrens bilar	1	2.95	5.5	25	8	2023	2	7
Estrella dillchips	1	4.20	5.5	25	84	2023	2	7
Marabou Black Saltlakrits	1	3.10	5.5	25	334	2023	2	7
Djungelvrål	1	1.95	5.5	25	101	2023	2	7
Guld Marie	1	2.50	5.5	25	181	2023	2	7
Flädersaft	1	9.95	5.5	25	137	2023	2	7
Alimentation	1	8.00	5.5	26	nb-1	2023	2	7
Bulle	1	3.00	5.5	26	c-Bulle	2023	2	7
Alimentation	1	2.00	5.5	26	nb-3	2023	2	7
Alimentation	1	5.00	5.5	27	nb-1	2023	2	7
Magazine	1	13.90	2.1	28	nb-1	2023	2	7
Magazine	1	5.00	5.5	28	nb-2	2023	2	7
Kanelbulle	1	3.00	5.5	28	c-Kanelbulle	2023	2	7
Kanelbulle	1	3.00	5.5	29	c-Kanelbulle	2023	2	8
Kardemumbulle	1	3.00	5.5	29	c-Kardemumbulle	2023	2	8
Alimentation	1	5.00	5.5	30	nb-1	2023	2	8
Finn Crisp Original	1	4.95	5.5	30	128	2023	2	8
Finn Crisp caraway	1	4.95	5.5	30	127	2023	2	8
Värmeljus 59mm Maxi 10h	1	12.95	20	30	694	2023	2	8
Alimentation	1	1.50	5.5	31	nb-1	2023	2	8
Estrella dillchips	2	8.40	5.5	31	84	2023	2	8
Ahlgrens bilar Sursockrade	1	2.95	5.5	31	11	2023	2	8
Finn Crisp Original	1	4.95	5.5	31	128	2023	2	8
Kardemumma Malen 18g	1	3.95	5.5	31	236	2023	2	8
Bullar x4	1	10.00	5.5	32	c-Bullar x4	2023	2	8
Idealmakaroner gammeldags	1	4.20	5.5	33	203	2023	2	8
Såpa grön 750ml	1	4.50	20	33	638	2023	2	8
​ ​Rödbetor skivade 710g	1	7.50	5.5	33	460	2023	2	8
Magazine	1	5.80	2.1	33	nb-4	2023	2	8
Alimentation	1	4.10	5.5	33	nb-5	2023	2	8
Falu Råg-rut Knäckebröd	1	5.95	5.5	34	111	2023	2	8
Alimentation	1	17.95	5.5	34	nb-2	2023	2	8
Alimentation	1	1.00	5.5	34	nb-3	2023	2	8
Skagenröra	2	11.90	5.5	34	491	2023	2	8
Jordnötsringar	1	3.50	5.5	34	214	2023	2	8
Skogaholmslimpa skiv Tina och servera	1	6.95	5.5	34	498	2023	2	8
Soupe aux pois cassé/lardons	1	8.00	5.5	35	M_19	2023	2	8
Semla	1	4.00	5.5	35	c-Semla	2023	2	8
Gravad Lax 150g Korshags	1	13.95	5.5	36	167	2023	2	8
Marabou Frukt Mandel 200g	1	5.95	5.5	36	338	2023	2	8
Mini croustades	1	7.50	5.5	36	758	2023	2	8
Lingonsylt	1	8.95	5.5	36	300	2023	2	8
Smörgåsgurka 715g	1	7.50	5.5	36	508	2023	2	8
Yes Original	1	9.95	20	36	699	2023	2	8
Prinskorv	1	6.95	5.5	36	424	2023	2	8
Bullar x4	1	5.00	5.5	36	c-Bullar x4	2023	2	8
Alimentation	1	3.86	5.5	37	nb-1	2023	2	8
Kanelbulle	1	3.00	5.5	37	c-Kanelbulle	2023	2	8
Mjölkchoklad Kaka	1	3.10	5.5	37	362	2023	2	8
Boulettes de viande	1	16.00	5.5	38	M_1	2023	2	8
Pavé de saumon	1	18.00	5.5	38	M_21	2023	2	8
Blabärsbulle	1	3.00	5.5	38	c-Blabärsbulle	2023	2	8
Kanelbulle	1	3.00	5.5	38	c-Kanelbulle	2023	2	8
Rekorderlig Päron Cider	1	3.50	5.5	38	449	2023	2	8
Alimentation	1	4.00	5.5	38	nb-6	2023	2	8
Kardemumbulle	1	3.00	5.5	39	c-Kardemumbulle	2023	2	8
Semla	1	4.00	5.5	39	c-Semla	2023	2	8
Pavé de saumon	1	18.00	5.5	40	M_21	2023	2	8
Semla	1	4.00	5.5	40	c-Semla	2023	2	8
Alimentation	1	2.00	5.5	40	nb-3	2023	2	8
Alimentation	1	6.95	5.5	41	nb-1	2023	2	8
Assiette nordique - Saumon	1	0.00	5.5	42	M_33	2023	2	8
Soupe aux pois cassé/lardons	1	0.00	5.5	42	M_19	2023	2	8
Entrée - Plat Saumon	1	24.00	5.5	42	M_30	2023	2	8
Bullar x4	1	10.00	5.5	42	c-Bullar x4	2023	2	8
Loka mango lime	1	2.00	5.5	42	734	2023	2	8
Kalles kaviar original	10	55.00	5.5	43	773	2023	2	8
Cheez doodles 160g	3	12.60	5.5	43	63	2023	2	8
Skogaholmslimpa skiv Tina och servera	1	6.95	5.5	43	498	2023	2	8
Kanelbulle	1	3.00	5.5	44	c-Kanelbulle	2023	2	8
Café/Thé	1	2.00	5.5	45	c-Café/Thé	2023	2	8
Kardemumbulle	1	3.00	5.5	45	c-Kardemumbulle	2023	2	8
Guld Marie	1	2.50	5.5	46	181	2023	2	8
Kalles kaviar original	2	11.00	5.5	46	773	2023	2	8
Alimentation	1	2.80	5.5	46	nb-6	2023	2	8
Knäcke rund brungräddat	1	7.95	5.5	46	250	2023	2	8
Soldatens ärtsoppa extra fläsk	1	9.95	5.5	46	514	2023	2	8
Kanelbulle	2	6.00	5.5	46	c-Kanelbulle	2023	2	8
Potatissallad	1	5.95	5.5	46	418	2023	2	8
Loka mango lime	1	2.00	5.5	47	734	2023	2	8
Loka Citron	1	2.00	5.5	47	305	2023	2	8
Magazine	1	9.90	2.1	48	nb-1	2023	2	8
Cheez doodles 160g	1	4.20	5.5	48	63	2023	2	8
Nyponsoppa original	1	5.95	5.5	48	377	2023	2	8
Lakrisal	1	1.20	5.5	48	283	2023	2	8
Billys pizza original	1	3.00	5.5	48	402	2023	2	8
Décoration/Alcool	1	12.00	20	48	nb-6	2023	2	8
Alimentation	1	4.50	5.5	49	nb-1	2023	2	8
Loka Päron	1	2.00	5.5	49	316	2023	2	8
Kanelbulle	1	3.00	5.5	49	c-Kanelbulle	2023	2	8
Blabärsbulle	1	3.00	5.5	49	c-Blabärsbulle	2023	2	8
Bullar x4	2	20.00	5.5	50	c-Bullar x4	2023	2	8
Alimentation	1	7.50	5.5	50	nb-2	2023	2	8
Vetekaka	1	7.95	5.5	51	555	2023	2	8
Bullar x4	1	10.00	5.5	51	c-Bullar x4	2023	2	8
Bulle	2	6.00	5.5	51	c-Bulle	2023	2	8
Alimentation	1	4.50	5.5	52	nb-1	2023	2	8
Kanelbulle	1	3.00	5.5	52	c-Kanelbulle	2023	2	8
Blabärsbulle	1	3.00	5.5	52	c-Blabärsbulle	2023	2	8
Loka Päron	1	2.00	5.5	52	316	2023	2	8
Knäcke rund brungräddat	1	7.95	5.5	53	250	2023	2	8
Ahlgrens bilar lakrits däck	2	5.90	5.5	53	10	2023	2	8
Finn Crisp Original	2	9.90	5.5	53	128	2023	2	8
Plopp dubbel stycksak	2	3.40	5.5	53	405	2023	2	8
Grebbestads® Ansjovisfilé Original	3	20.85	5.5	53	171	2023	2	8
Alimentation	1	2.60	5.5	53	nb-6	2023	2	8
Kung Oscar pepparkakor	1	5.95	5.5	54	746	2023	2	8
Knäcke trekant brungräddat	1	3.50	5.5	54	253	2023	2	8
Rårörda lingon	1	8.95	5.5	54	447	2023	2	8
Fiskbuljong 6-pack	1	4.60	5.5	54	130	2023	2	8
Tändstickor	1	3.95	20	54	689	2023	2	8
Läkerol Cassis	1	2.10	5.5	54	275	2023	2	8
Bullar x4	1	10.00	5.5	54	c-Bullar x4	2023	2	8
Alimentation	2	5.90	5.5	55	nb-1	2023	2	8
Cheez doodles 160g	1	4.20	5.5	55	63	2023	2	8
Smörgåsrån Vete	1	3.95	20	55	509	2023	2	8
Plopp dubbel stycksak	2	3.40	5.5	55	405	2023	2	8
Alimentation	1	17.95	5.5	55	nb-6	2023	2	8
Marabou Mjölk Choklad 200g	1	5.95	5.5	55	342	2023	2	8
Kanelbulle	2	6.00	5.5	55	c-Kanelbulle	2023	2	8
Bregott extrasaltat	1	3.60	5.5	55	506	2023	2	8
Alimentation	1	4.00	5.5	56	nb-1	2023	2	8
Läkerol Bon Bons	1	2.10	5.5	57	273	2023	2	8
Läkerol Eucalyptus	1	2.10	5.5	57	276	2023	2	8
Apelsinkrokant Chokladkaka	1	5.00	5.5	57	16	2023	2	8
Alimentation	1	3.22	5.5	57	nb-4	2023	2	8
Alimentation	2	12.00	5.5	58	nb-1	2023	2	8
Pripps Blå 3.5% 6-p BRK	1	3.50	5.5	58	426	2023	2	8
Loka Citron	1	2.00	5.5	58	305	2023	2	8
Grahamsmjöl	4	25.02	5.5	59	165	2023	2	8
Guld Marie	1	2.50	5.5	60	181	2023	2	8
Magnet	1	3.50	20	60	616	2023	2	8
Semla	1	4.00	5.5	61	c-Semla	2023	2	8
Alimentation	1	2.00	5.5	61	nb-2	2023	2	8
Bullar x4	1	10.00	5.5	61	c-Bullar x4	2023	2	8
Västerbottensost 35% normalbit	1	21.95	5.5	61	554	2023	2	8
Ballerina Original	1	4.50	5.5	61	30	2023	2	8
Inlagd Sill	1	4.95	5.5	61	206	2023	2	8
Alimentation	1	2.30	5.5	62	nb-1	2023	2	8
Bullar x4	1	10.00	5.5	63	c-Bullar x4	2023	2	8
Alimentation	1	10.50	5.5	64	nb-1	2023	2	8
Prinskorv	1	6.95	5.5	64	424	2023	2	8
Hovmästarsås glasburk	1	4.50	5.5	64	200	2023	2	8
Kallrökt Lax 150g Korshags	1	13.95	5.5	64	226	2023	2	8
Korvbröd 10-pack Tina och servera	1	4.50	5.5	64	257	2023	2	8
Filmjölk 3%	1	3.50	5.5	64	122	2023	2	8
Estrella dillchips	1	4.20	5.5	64	84	2023	2	8
Bullar x4	1	10.00	5.5	64	c-Bullar x4	2023	2	8
Alimentation	1	2.00	5.5	64	nb-9	2023	2	8
Brunost	2	35.90	5.5	65	51	2023	2	8
Kalles kaviar original	1	5.50	5.5	65	773	2023	2	8
Alimentation	1	29.50	5.5	65	nb-2	2023	2	8
Alimentation	8	32.00	5.5	66	nb-1	2023	2	8
Ahlgrens bilar	4	11.80	5.5	66	8	2023	2	8
Estrella dillchips	3	12.60	5.5	66	84	2023	2	8
Kela koka kräftor	1	23.95	5.5	66	780	2023	2	8
Finn Crisp caraway	2	9.90	5.5	67	127	2023	2	8
Bullar x4	1	10.00	5.5	68	c-Bullar x4	2023	2	8
Semla	2	8.00	5.5	68	c-Semla	2023	2	8
Rekorderlig Päron Cider	1	3.50	5.5	68	449	2023	2	8
Bulle	1	3.00	5.5	69	c-Bulle	2023	2	8
Alimentation	1	2.00	5.5	69	nb-2	2023	2	8
Inlagd Sill	1	4.95	5.5	70	206	2023	2	8
Semla	2	8.00	5.5	71	c-Semla	2023	2	9
Café/Thé	1	2.00	5.5	71	c-Café/Thé	2023	2	9
100 Frön & Havssalt	1	4.50	5.5	71	3	2023	2	9
Inlagd Sill	1	4.95	5.5	71	206	2023	2	9
OP Anderson baby	2	7.00	20	71	743	2023	2	9
Finn Crisp caraway	4	19.80	5.5	72	127	2023	2	9
Café/Thé	1	2.00	5.5	73	c-Café/Thé	2023	2	9
Bullar x4	1	10.00	5.5	73	c-Bullar x4	2023	2	9
Knäcke trekant brungräddat	2	7.00	5.5	73	253	2023	2	9
Tutti frutti tablettask	1	1.50	5.5	73	742	2023	2	9
Viol Tablettask	1	1.30	5.5	73	558	2023	2	9
Saumon filet nature	1	10.95	5.5	74	736	2023	2	9
Rårörda lingon	1	8.95	5.5	74	447	2023	2	9
Alimentation	1	9.95	5.5	74	nb-3	2023	2	9
Kanelbulle	1	3.00	5.5	75	c-Kanelbulle	2023	2	9
Kardemumbulle	1	3.00	5.5	75	c-Kardemumbulle	2023	2	9
Alimentation	1	10.00	5.5	76	nb-1	2023	2	9
Alimentation	1	10.00	5.5	77	nb-1	2023	2	9
Alimentation	2	20.00	5.5	78	nb-1	2023	2	9
Boulettes de viande	1	16.00	5.5	79	M_1	2023	2	9
Café/Thé	1	2.00	5.5	79	c-Café/Thé	2023	2	9
Kardemumbulle	1	3.00	5.5	79	c-Kardemumbulle	2023	2	9
Kanel x4	1	10.00	5.5	80	c-Kanel x4	2023	2	9
Bullar x4	1	10.00	5.5	81	c-Bullar x4	2023	2	9
Alimentation	1	7.50	5.5	82	nb-1	2023	2	9
Boulettes de viande	1	16.00	5.5	83	M_1	2023	2	9
Falukorv ring Sverige	1	10.95	5.5	83	112	2023	2	9
Rårörda lingon	1	8.95	5.5	83	447	2023	2	9
Bullar x4	1	10.00	5.5	83	c-Bullar x4	2023	2	9
Marabou Frukt Mandel 200g	1	5.95	5.5	83	338	2023	2	9
Apelsinkrokant Chokladkaka	1	5.00	5.5	83	16	2023	2	9
Alimentation	1	0.95	5.5	83	nb-7	2023	2	9
Kalles kaviar original	3	16.50	5.5	84	773	2023	2	9
Le Suédois Pour Les Nuls	1	7.95	5.5	84	298	2023	2	9
Kalles kaviar original	2	11.00	5.5	85	773	2023	2	9
Bullar x4	1	10.00	5.5	85	c-Bullar x4	2023	2	9
Wasa Glutenfri Naturell	1	6.95	5.5	86	562	2023	2	9
Små delikatess köttbullar	1	9.95	5.5	86	501	2023	2	9
OP Anderson baby	1	3.50	20	86	743	2023	2	9
Kanel x4	1	10.00	5.5	86	c-Kanel x4	2023	2	9
Kardemum x4	1	10.00	5.5	86	c-Kardemum x4	2023	2	9
Hovmästarsås glasburk	1	4.50	5.5	87	200	2023	2	9
Kanel x4	1	10.00	5.5	87	c-Kanel x4	2023	2	9
Runda Kanel	1	5.95	5.5	87	464	2023	2	9
Pepparkakor Annas	1	5.95	5.5	88	396	2023	2	9
Knäcke trekant brungräddat	1	3.50	5.5	88	253	2023	2	9
Poëlée Pytt i Panna	1	16.00	5.5	89	M_3	2023	2	9
Froosh Mango Orange	1	4.50	5.5	89	147	2023	2	9
Bulle	1	3.00	5.5	89	c-Bulle	2023	2	9
Estrella chips sourcream & onion	1	4.20	5.5	90	66	2023	2	9
Dipmix Ranch	1	1.95	5.5	90	92	2023	2	9
Marabou Mjölk Choklad 200g	1	5.95	5.5	90	342	2023	2	9
Kalles kaviar original	3	16.50	5.5	91	773	2023	2	9
Ballerina kladdkaka	1	4.50	5.5	91	29	2023	2	9
Kanelbulle	1	3.00	5.5	92	c-Kanelbulle	2023	2	9
Kung Oscar pepparkakor	1	5.95	5.5	92	746	2023	2	9
Inlagd Sill	1	4.95	5.5	93	206	2023	2	9
Semla	2	8.00	5.5	94	c-Semla	2023	2	9
Alimentation	1	1.50	5.5	94	nb-2	2023	2	9
Kanelbulle	1	3.00	5.5	95	c-Kanelbulle	2023	2	9
Blabärsbulle	1	3.00	5.5	96	c-Blabärsbulle	2023	2	9
Semlor x4	1	15.00	5.5	97	c-Semlor x4	2023	2	9
Kalles kaviar original	1	5.50	5.5	98	773	2023	2	9
Café/Thé	2	4.00	5.5	99	c-Café/Thé	2023	2	9
Gula ärtor kapsel	1	3.95	5.5	99	179	2023	2	9
Semla	2	8.00	5.5	100	c-Semla	2023	2	9
Estrella chips grill	1	4.20	5.5	101	172	2023	2	9
Polka Grisar	1	3.95	5.5	101	412	2023	2	9
Små delikatess köttbullar	1	9.95	5.5	101	501	2023	2	9
Guld Marie	1	2.50	5.5	101	181	2023	2	9
Alimentation	1	8.00	5.5	101	nb-5	2023	2	9
Kardemumbulle	1	3.00	5.5	101	c-Kardemumbulle	2023	2	9
Frödinge Princesstårta	1	15.00	5.5	101	144	2023	2	9
Semla	2	8.00	5.5	102	c-Semla	2023	2	9
Bullar x4	1	10.00	5.5	102	c-Bullar x4	2023	2	9
Grebbestads® Ansjovisfilé Original	2	13.90	5.5	102	171	2023	2	9
Kanelbulle	1	3.00	5.5	103	c-Kanelbulle	2023	2	9
Bullar x4	1	10.00	5.5	105	c-Bullar x4	2023	2	9
Café/Thé	1	2.00	5.5	105	c-Café/Thé	2023	2	9
Falu Råg-rut Knäckebröd	1	5.95	5.5	106	111	2023	2	9
Alimentation	1	6.95	5.5	106	nb-3	2023	2	9
OP Anderson pack x12	1	30.00	20	106	737	2023	2	9
Skärgårdssill	1	4.95	5.5	106	492	2023	2	9
Kanel x4	1	10.00	5.5	107	c-Kanel x4	2023	2	9
Marabou helnöt 200g	1	5.95	5.5	107	798	2023	2	9
Pepparkaka Jul plåtburk	1	10.95	5.5	107	395	2023	2	9
Marabou schweizer nöt 200g	1	5.95	5.5	107	799	2023	2	9
Inlagd Sill	1	8.95	5.5	107	207	2023	2	9
Fiskbullar i dillsås	2	13.90	5.5	107	132	2023	2	9
Kalles kaviar original	2	11.00	5.5	107	773	2023	2	9
Gula ärtor kapsel	1	3.95	5.5	107	179	2023	2	9
Noblesse Apelsin Crisp	1	6.95	5.5	107	369	2023	2	9
Skagenröra	1	5.95	5.5	107	491	2023	2	9
Kanelbulle	1	3.00	5.5	108	c-Kanelbulle	2023	2	9
Västerbottensost 35% normalbit	1	21.95	5.5	109	554	2023	2	9
Tacosås Medium	2	9.00	5.5	110	530	2023	2	10
Taco spice mix	2	5.00	20	110	527	2023	2	10
Taco shells	1	7.95	5.5	110	532	2023	2	10
Soupe aux pois cassé/lardons	1	8.00	5.5	383	M_19	2023	2	17
Bullar x4	1	10.00	5.5	392	c-Bullar x4	2023	2	17
Knäcke rund normalgräddat	1	7.95	5.5	414	251	2023	2	17
Bullar x4	1	10.00	5.5	112	c-Bullar x4	2023	2	10
Kanel x4	1	10.00	5.5	113	c-Kanel x4	2023	2	10
Kanel x4	1	10.00	5.5	425	c-Kanel x4	2023	2	18
Boulettes de viande	1	0.00	5.5	436	M_1	2023	2	18
Décoration/Alcool	1	6.00	20	445	nb-2	2023	2	18
Café/Thé	1	2.00	5.5	454	c-Café/Thé	2023	2	18
Alimentation	1	5.00	5.5	467	nb-1	2023	2	18
Décoration/Alcool	1	24.50	20	477	nb-2	2023	2	18
Kanel x4	1	10.00	5.5	490	c-Kanel x4	2023	2	19
Kanelbulle	1	3.00	5.5	116	c-Kanelbulle	2023	2	10
Bullar x4	2	10.00	5.5	117	c-Bullar x4	2023	2	10
Alimentation	1	6.00	5.5	117	nb-2	2023	2	10
Décoration/Alcool	1	4.50	20	117	nb-3	2023	2	10
Hovmästarsås glasburk	6	27.00	5.5	118	200	2023	2	10
Rårörda lingon	1	8.95	5.5	119	447	2023	2	10
Kalles kaviar original	1	5.50	5.5	119	773	2023	2	10
Skärgårdssill	1	4.95	5.5	119	492	2023	2	10
Citronpeppar glasburk	1	3.95	5.5	119	70	2023	2	10
Fiskbullar i dillsås	1	6.95	5.5	119	132	2023	2	10
Alimentation	2	12.00	5.5	120	nb-1	2023	2	10
Alimentation	1	6.95	5.5	120	nb-2	2023	2	10
Knäcke trekant normalgräddat	2	7.00	5.5	120	254	2023	2	10
Tvålull 100g Bra miljöval	1	4.95	20	120	692	2023	2	10
Kanelbulle	1	3.00	5.5	120	c-Kanelbulle	2023	2	10
Ballerina Original	1	4.50	5.5	121	30	2023	2	10
Bullar x4	1	10.00	5.5	122	c-Bullar x4	2023	2	10
Alimentation	2	8.00	5.5	122	nb-2	2023	2	10
Alimentation	1	7.90	5.5	122	nb-3	2023	2	10
Ljus Sirap	1	4.50	5.5	123	302	2023	2	10
Frödinge Princesstårta	1	15.00	5.5	123	144	2023	2	10
5-minuters Sill	2	15.90	5.5	124	4	2023	2	10
Mästar matjessill	1	5.95	5.5	124	771	2023	2	10
Kanelbulle	2	6.00	5.5	125	c-Kanelbulle	2023	2	10
Entrée - Plat	1	22.00	5.5	126	M_8	2023	2	10
Assiette de hareng	1	0.00	5.5	126	M_4	2023	2	10
Soupe aux pois cassé/lardons	1	8.00	5.5	126	M_19	2023	2	10
Café/Thé	2	4.00	5.5	126	c-Café/Thé	2023	2	10
Poëlée Pytt i Panna	1	0.00	5.5	126	M_3	2023	2	10
Kanelbulle	1	3.00	5.5	126	c-Kanelbulle	2023	2	10
Kardemumbulle	1	3.00	5.5	126	c-Kardemumbulle	2023	2	10
Marabou Black Saltlakrits	1	3.10	5.5	126	334	2023	2	10
Slotts senap original tub	1	5.95	5.5	127	481	2023	2	10
Pavé de saumon	1	0.00	5.5	127	M_21	2023	2	10
Verre de vin	1	4.00	5.5	127	M_34	2023	2	10
Soupe aux pois cassé/lardons	1	0.00	5.5	127	M_19	2023	2	10
Entrée - Plat Saumon	1	24.00	5.5	127	M_30	2023	2	10
Runda Kanel	1	5.95	5.5	127	464	2023	2	10
Finn Crisp caraway	1	4.95	5.5	127	127	2023	2	10
Sandwich Chives	2	4.00	5.5	127	474	2023	2	10
Bullar x4	2	20.00	5.5	127	c-Bullar x4	2023	2	10
Plat végétarien	1	16.00	5.5	128	M_36	2023	2	10
Verre de vin	1	4.00	5.5	128	M_34	2023	2	10
Kanel x4	2	20.00	5.5	128	c-Kanel x4	2023	2	10
Bullar x4	1	10.00	5.5	128	c-Bullar x4	2023	2	10
Slotts senap original tub	1	5.95	5.5	128	481	2023	2	10
Runda Kanel	1	5.95	5.5	128	464	2023	2	10
Sandwich Chives	2	4.00	5.5	128	474	2023	2	10
Entrée - Plat	2	44.00	5.5	129	M_8	2023	2	10
Soupe aux pois cassé/lardons	1	8.00	5.5	129	M_19	2023	2	10
Assiette de hareng	1	0.00	5.5	129	M_4	2023	2	10
Boulettes de viande	2	0.00	5.5	129	M_1	2023	2	10
Assiette saumon	1	0.00	5.5	129	M_5	2023	2	10
Café/Thé	2	4.00	5.5	129	c-Café/Thé	2023	2	10
Fransk Lök Sill	1	4.95	5.5	129	140	2023	2	10
Inlagd Sill	1	4.95	5.5	129	206	2023	2	10
Kanelbulle	1	3.00	5.5	129	c-Kanelbulle	2023	2	10
Kardemumbulle	1	3.00	5.5	129	c-Kardemumbulle	2023	2	10
Skärgårdssill	1	4.95	5.5	130	492	2023	2	10
Kanel x4	1	10.00	5.5	130	c-Kanel x4	2023	2	10
Kalles kaviar original	1	5.50	5.5	130	773	2023	2	10
Kardemumma Malen 18g	1	3.95	5.5	130	236	2023	2	10
Kardemumbulle	2	6.00	5.5	130	c-Kardemumbulle	2023	2	10
Assiette saumon	1	8.00	5.5	131	M_5	2023	2	10
Kanel x4	1	10.00	5.5	132	c-Kanel x4	2023	2	10
Soupe aux pois cassé/lardons	1	0.00	5.5	133	M_19	2023	2	10
Boulettes de viande	1	0.00	5.5	133	M_1	2023	2	10
Entrée - Plat	1	22.00	5.5	133	M_8	2023	2	10
Plat végétarien	1	16.00	5.5	133	M_36	2023	2	10
Café/Thé	1	2.00	5.5	133	c-Café/Thé	2023	2	10
Kanelbulle	1	3.00	5.5	133	c-Kanelbulle	2023	2	10
Kanel x4	1	10.00	5.5	134	c-Kanel x4	2023	2	10
Bullar x4	1	10.00	5.5	134	c-Bullar x4	2023	2	10
Alimentation	1	4.95	5.5	135	nb-1	2023	2	10
Filmjölk 3%	2	7.00	5.5	135	122	2023	2	10
Ballerina Original	1	4.50	5.5	135	30	2023	2	10
Semla	2	8.00	5.5	136	c-Semla	2023	2	10
Gott & Blandat Supersur	1	2.95	5.5	136	162	2023	2	10
Alimentation	1	4.50	5.5	136	nb-2	2023	2	10
Gott & blandat fizzy pop	1	2.95	5.5	136	801	2023	2	10
Marabou 30 praliner med nougatfyllning	1	9.95	5.5	136	333	2023	2	10
Kanelbulle	1	3.00	5.5	137	c-Kanelbulle	2023	2	10
Café/Thé	1	2.00	5.5	137	c-Café/Thé	2023	2	10
Alimentation	1	4.00	5.5	137	nb-1	2023	2	10
Kardemumbulle	1	3.00	5.5	138	c-Kardemumbulle	2023	2	10
Blabärsbulle	1	3.00	5.5	138	c-Blabärsbulle	2023	2	10
Mästar matjessill	1	5.95	5.5	138	771	2023	2	10
Skärgårdssill	1	4.95	5.5	138	492	2023	2	10
Skinkost 175g	1	7.95	5.5	138	496	2023	2	10
Klassiska Köttbullar	1	12.95	5.5	138	247	2023	2	10
Dippmix Dill & Gräslök	1	1.95	5.5	138	95	2023	2	10
Dipmix Sourcream onion	1	1.95	5.5	138	94	2023	2	10
Kladdkaka	2	0.00	5.5	139	M_2	2023	2	10
Plat - Dessert	1	20.00	5.5	139	M_16	2023	2	10
Boulettes de viande	2	0.00	5.5	139	M_1	2023	2	10
Assiette nordique	1	0.00	5.5	139	M_35	2023	2	10
Entrée - Plat - Dessert	1	28.00	5.5	139	M_10	2023	2	10
Café/Thé	2	4.00	5.5	139	c-Café/Thé	2023	2	10
Bullar x4	1	10.00	5.5	140	c-Bullar x4	2023	2	10
Café/Thé	1	2.00	5.5	140	c-Café/Thé	2023	2	10
Bullar x4	1	10.00	5.5	141	c-Bullar x4	2023	2	10
Café/Thé	4	8.00	5.5	141	c-Café/Thé	2023	2	10
Bullar x4	1	10.00	5.5	142	c-Bullar x4	2023	2	10
Alimentation	2	2.00	5.5	142	nb-2	2023	2	10
Rågkusar osötad Tina och servera	1	8.95	5.5	143	434	2023	2	10
Kardemumma Malen 18g	1	3.95	5.5	143	236	2023	2	10
Gula ärtor kapsel	1	3.95	5.5	143	179	2023	2	10
Alimentation	2	8.00	5.5	143	nb-4	2023	2	10
​ Smörgåsgurka 370g	1	5.50	5.5	144	507	2023	2	10
Ljus Sirap	1	4.50	5.5	144	302	2023	2	10
Marabou Schweizer Nöt Single	2	2.00	5.5	144	347	2023	2	10
Skagenröra	1	5.95	5.5	144	491	2023	2	10
Cheez doodles 160g	1	4.20	5.5	144	63	2023	2	10
Cheez doodles 35g	1	1.50	20	144	62	2023	2	10
Estrella chips sourcream & onion	1	4.20	5.5	144	66	2023	2	10
Mazarin singel	2	3.00	5.5	144	353	2023	2	10
Delicatoboll singel	2	3.00	5.5	144	80	2023	2	10
Punschrulle singel	4	6.00	5.5	144	430	2023	2	10
Haribo nappar frukt	2	3.00	5.5	144	752	2023	2	10
Sandwich EMP	1	6.00	5.5	383	c-Sandwich EMP	2023	2	17
Alimentation	1	22.00	5.5	393	nb-1	2023	2	17
Åseda Gräddost 38%	1	17.95	5.5	414	24	2023	2	17
Kanelbulle	1	3.00	5.5	426	c-Kanelbulle	2023	2	18
Soupe aux pois cassé/lardons	1	0.00	5.5	436	M_19	2023	2	18
Filmjölk 3%	1	4.95	5.5	446	122	2023	2	18
Bullar x4	1	10.00	5.5	455	c-Bullar x4	2023	2	18
Alimentation	2	10.00	5.5	468	nb-1	2023	2	18
Décoration/Alcool	2	2.00	20	477	nb-3	2023	2	18
Cheez doodles 160g	2	8.40	5.5	491	63	2023	2	19
Punschrulle singel	2	3.00	5.5	499	430	2023	2	19
Kardemumbulle	1	3.00	5.5	508	c-Kardemumbulle	2023	2	19
Dipmix Ranch	1	1.95	5.5	519	92	2023	2	19
Sac	1	0.10	5.5	533	c-Sac	2023	2	21
Potatissallad	1	5.95	5.5	541	418	2023	2	21
Entrée - Plat	1	22.00	5.5	551	M_8	2023	2	21
Finkornig rom röd	1	9.95	5.5	564	770	2023	2	21
Semla	3	12.00	5.5	576	c-Semla	2023	2	21
Sac	1	0.10	5.5	585	c-Sac	2023	2	21
Cloetta guld	1	2.00	5.5	595	740	2023	2	21
Alimentation	1	5.56	5.5	602	nb-3	2023	2	21
Kardemumbulle	1	3.00	5.5	612	c-Kardemumbulle	2023	2	22
Sac	1	0.10	5.5	620	c-Sac	2023	2	22
Café/Thé	2	4.00	5.5	632	c-Café/Thé	2023	2	22
Bullar x4	1	10.00	5.5	646	c-Bullar x4	2023	2	22
Punschrulle singel	1	1.50	5.5	656	430	2023	2	23
Läkerol Cassis	1	2.10	5.5	672	275	2023	2	23
Emser	1	2.25	20	678	106	2023	2	23
Kanelbulle	2	6.00	5.5	682	c-Kanelbulle	2023	2	23
Alimentation	1	8.95	5.5	693	nb-2	2023	2	23
Läkerol Original	3	6.30	5.5	702	278	2023	2	24
Décoration/Alcool	1	6.95	20	708	nb-5	2023	2	24
Décoration/Alcool	1	3.50	20	718	nb-1	2023	2	24
Décoration/Alcool	1	12.00	20	729	nb-4	2023	2	24
Kanel x4	1	10.00	5.5	736	c-Kanel x4	2023	2	25
Décoration/Alcool	1	5.00	5.5	746	nb-2	2023	2	25
Semla	2	8.00	5.5	752	c-Semla	2023	2	25
Alimentation	1	2.00	5.5	759	nb-2	2023	2	25
Nyponsoppa original	1	5.95	5.5	764	377	2023	2	25
Décoration/Alcool	1	32.95	20	764	nb-12	2023	2	25
Knäcke rund normalgräddat	1	7.95	5.5	774	251	2023	2	25
Skinkost 175g	1	7.95	5.5	782	496	2023	2	25
Entrée - Plat	1	22.00	5.5	794	M_8	2023	2	26
Semla	1	4.00	5.5	805	c-Semla	2023	2	26
Semla	3	12.00	5.5	818	c-Semla	2023	2	26
Magazine	1	5.95	2.1	144	nb-12	2023	2	10
Bullar x4	1	10.00	5.5	384	c-Bullar x4	2023	2	17
Semlor x4	1	15.00	5.5	394	c-Semlor x4	2023	2	17
Kalles kaviar original	2	11.00	5.5	414	773	2023	2	17
Kardemumbulle	1	3.00	5.5	426	c-Kardemumbulle	2023	2	18
Entrée - Plat	1	22.00	5.5	436	M_8	2023	2	18
Husman	1	3.95	5.5	446	201	2023	2	18
Husman	1	3.95	5.5	455	201	2023	2	18
Kardemum x4	1	10.00	5.5	468	c-Kardemum x4	2023	2	18
Finn Crisp Original	1	4.95	5.5	477	128	2023	2	18
Lakrisal	1	1.20	5.5	491	283	2023	2	19
Kanel x4	2	20.00	5.5	500	c-Kanel x4	2023	2	19
Emser	2	4.50	20	508	106	2023	2	19
Café/Thé	1	2.00	5.5	520	c-Café/Thé	2023	2	19
Semlor x4	1	15.00	5.5	533	c-Semlor x4	2023	2	21
Semla	2	8.00	5.5	542	c-Semla	2023	2	21
Blabärsbulle	2	6.00	5.5	551	c-Blabärsbulle	2023	2	21
Grebbestads® Ansjovisfilé Original	1	6.95	5.5	564	171	2023	2	21
Zoo Tablettask	2	3.00	20	576	567	2023	2	21
Semla	2	8.00	5.5	586	c-Semla	2023	2	21
Décoration/Alcool	1	5.00	5.5	595	nb-10	2023	2	21
Kardemumbulle	1	3.00	5.5	603	c-Kardemumbulle	2023	2	21
Soupe aux pois cassé/lardons	1	0.00	5.5	613	M_19	2023	2	22
Smash	1	4.95	5.5	621	502	2023	2	22
Semla	2	8.00	5.5	633	c-Semla	2023	2	22
Semlor x4	1	15.00	5.5	647	c-Semlor x4	2023	2	22
Zingo apelsin	1	2.00	5.5	657	786	2023	2	23
Noblesse Havssalt crisp	1	6.50	5.5	672	370	2023	2	23
Läkerol Salvi	1	2.10	5.5	678	282	2023	2	23
Semla	2	8.00	5.5	683	c-Semla	2023	2	23
Kardemum x4	1	10.00	5.5	693	c-Kardemum x4	2023	2	23
Décoration/Alcool	2	2.60	5.5	693	nb-12	2023	2	23
Emser	1	2.25	20	702	106	2023	2	24
Décoration/Alcool	1	3.50	20	708	nb-6	2023	2	24
Bullar x4	1	10.00	5.5	719	c-Bullar x4	2023	2	24
Bullar x4	1	10.00	5.5	729	c-Bullar x4	2023	2	24
Semla	2	8.00	5.5	737	c-Semla	2023	2	25
Café/Thé	2	4.00	5.5	747	c-Café/Thé	2023	2	25
Bullar x4	1	10.00	5.5	752	c-Bullar x4	2023	2	25
Café/Thé	1	2.00	5.5	759	c-Café/Thé	2023	2	25
Kung Oscar pepparkakor	1	5.95	5.5	764	746	2023	2	25
Bullar x4	1	10.00	5.5	764	c-Bullar x4	2023	2	25
Falu Råg-rut Knäckebröd	1	5.95	5.5	774	111	2023	2	25
Semla	1	4.00	5.5	783	c-Semla	2023	2	25
Poëlée Pytt i Panna	1	0.00	5.5	794	M_3	2023	2	26
Dipmix Sourcream onion	1	1.95	5.5	794	94	2023	2	26
Kanelbulle	1	3.00	5.5	805	c-Kanelbulle	2023	2	26
Bullar x4	1	10.00	5.5	819	c-Bullar x4	2023	2	26
Magazine	1	4.45	5.5	144	nb-13	2023	2	10
Bullar x4	1	10.00	5.5	385	c-Bullar x4	2023	2	17
Café/Thé	1	2.00	5.5	394	c-Café/Thé	2023	2	17
Décoration/Alcool	1	14.50	20	414	nb-5	2023	2	17
Bullar x4	1	10.00	5.5	427	c-Bullar x4	2023	2	18
Boulettes de viande	1	0.00	5.5	436	M_1	2023	2	18
Finn Crisp Original	1	4.95	5.5	446	128	2023	2	18
Västerbottensost 35% normalbit	1	21.95	5.5	455	554	2023	2	18
Kanelbulle	1	3.00	5.5	468	c-Kanelbulle	2023	2	18
Gravad Lax 150g Korshags	1	13.95	5.5	477	167	2023	2	18
Tutti frutti tablettask	1	1.50	5.5	491	742	2023	2	19
Semlor x4	1	15.00	5.5	501	c-Semlor x4	2023	2	19
Kex Chocklad	2	4.00	5.5	509	239	2023	2	19
Semla	1	4.00	5.5	520	c-Semla	2023	2	19
Semla	1	4.00	5.5	534	c-Semla	2023	2	21
Räkost	4	35.77	5.5	542	438	2023	2	21
Delikatess Sesam knäcke	1	5.95	5.5	551	82	2023	2	21
Alimentation	1	16.00	5.5	565	nb-1	2023	2	21
Semla	3	12.00	5.5	577	c-Semla	2023	2	21
Falukorv ring Sverige	1	10.95	5.5	586	112	2023	2	21
Marabou helnöt 200g	1	5.95	5.5	595	798	2023	2	21
Ballerina kladdkaka	1	4.50	5.5	603	29	2023	2	21
Semla	3	12.00	5.5	613	c-Semla	2023	2	22
Estrella dillchips	1	4.20	5.5	621	84	2023	2	22
Oboy 700g	1	8.50	5.5	633	828	2023	2	22
Café/Thé	1	2.00	5.5	647	c-Café/Thé	2023	2	22
Décoration/Alcool	1	13.00	20	657	nb-1	2023	2	23
Pavé de saumon	5	90.00	5.5	673	M_21	2023	2	23
Alimentation	1	0.50	5.5	678	nb-3	2023	2	23
Sac	1	0.10	5.5	683	c-Sac	2023	2	23
Décoration/Alcool	1	12.00	20	693	nb-4	2023	2	23
Fransk Lök Sill	1	4.95	5.5	703	140	2023	2	24
Kex Chocklad	2	4.00	5.5	708	239	2023	2	24
Décoration/Alcool	3	6.00	20	708	nb-13	2023	2	24
Semla	3	12.00	5.5	720	c-Semla	2023	2	24
Décoration/Alcool	1	5.00	20	729	nb-6	2023	2	24
Semla	2	8.00	5.5	738	c-Semla	2023	2	25
Vetekaka	1	8.95	5.5	747	555	2023	2	25
Kanelbulle	2	6.00	5.5	752	c-Kanelbulle	2023	2	25
Alimentation	2	10.00	5.5	760	nb-1	2023	2	25
Pärlsocker	1	3.50	5.5	764	389	2023	2	25
Rågkusar osötad Tina och servera	1	8.95	5.5	774	434	2023	2	25
Läkerol Eucalyptus	4	8.40	5.5	783	276	2023	2	25
Entrée - Plat	1	22.00	5.5	794	M_8	2023	2	26
Fiskbullar i hummersås MSC	1	6.95	5.5	794	133	2023	2	26
Kardemumbulle	1	3.00	5.5	805	c-Kardemumbulle	2023	2	26
Haribo nappar sur	1	1.50	5.5	819	753	2023	2	26
Magazine	2	8.00	5.5	144	nb-14	2023	2	10
Gravad Lax 150g Korshags	2	27.90	5.5	145	167	2023	2	10
Filmjölk 3%	2	7.00	5.5	145	122	2023	2	10
Skärgårdssill	3	14.85	5.5	145	492	2023	2	10
Små delikatess köttbullar	2	19.90	5.5	145	501	2023	2	10
Kalles kaviar original	2	11.00	5.5	145	773	2023	2	10
Gräddsås 3-pack	1	4.65	5.5	145	164	2023	2	10
Rårörda lingon	1	8.95	5.5	145	447	2023	2	10
Finn Crisp caraway	3	14.85	5.5	145	127	2023	2	10
Falu Råg-rut Knäckebröd	2	11.90	5.5	145	111	2023	2	10
Västerbottensost 35% normalbit	1	21.95	5.5	145	554	2023	2	10
Knäcke rund brungräddat	1	7.95	5.5	145	250	2023	2	10
Kardemumbulle	1	3.00	5.5	146	c-Kardemumbulle	2023	2	10
Alimentation	1	5.00	5.5	142	nb-1	2023	2	10
Kanelbulle	1	3.00	5.5	148	c-Kanelbulle	2023	2	10
Café/Thé	1	2.00	5.5	148	c-Café/Thé	2023	2	10
​ ​Rödbetor skivade 710g	1	7.50	5.5	148	460	2023	2	10
OP Anderson baby	3	10.50	20	148	743	2023	2	10
Punschrulle singel	3	4.50	5.5	148	430	2023	2	10
Café/Thé	2	4.00	5.5	149	c-Café/Thé	2023	2	10
Loka Päron	1	2.00	5.5	149	316	2023	2	10
Semla	1	4.00	5.5	149	c-Semla	2023	2	10
Festis Päron EKO BRIK	2	4.00	5.5	150	120	2023	2	10
Cheez doodles 160g	1	4.20	5.5	151	63	2023	2	10
Pepparkakor Annas	1	5.95	5.5	152	396	2023	2	10
Tändstickor 8-Pack	1	3.95	20	152	690	2023	2	10
Alimentation	1	6.00	5.5	153	nb-1	2023	2	10
Estrella dillchips	1	4.20	5.5	154	84	2023	2	10
Djungelvrål	1	1.95	5.5	154	101	2023	2	10
Läkerol Raspberry Licorice	1	2.10	5.5	154	279	2023	2	10
Marabou Schweizer Nöt Single	2	2.00	5.5	154	347	2023	2	10
Vetekaka	1	8.95	5.5	155	555	2023	2	10
Sac	1	0.10	5.5	155	c-Sac	2023	2	10
Citronpeppar glasburk	1	3.95	5.5	155	70	2023	2	10
Marabou Mjölkchocklad Single	1	1.00	5.5	155	343	2023	2	10
Dipmix Sourcream onion	2	3.90	5.5	155	94	2023	2	10
Cheez doodles 160g	1	4.20	5.5	155	63	2023	2	10
Inlagd Sill	1	4.95	5.5	156	206	2023	2	10
Semla	1	4.00	5.5	156	c-Semla	2023	2	10
Kanelbulle	2	6.00	5.5	156	c-Kanelbulle	2023	2	10
Alimentation	1	5.10	5.5	157	nb-1	2023	2	10
Cheez doodles 160g	1	4.20	5.5	157	63	2023	2	10
Daim dubbel	1	2.00	5.5	157	78	2023	2	10
Delicatoboll singel	2	3.00	5.5	157	80	2023	2	10
Sac	1	0.10	5.5	157	c-Sac	2023	2	10
Alimentation	1	2.45	5.5	158	nb-1	2023	2	10
Bullar x4	1	10.00	5.5	158	c-Bullar x4	2023	2	10
OP Anderson baby	4	14.00	20	159	743	2023	2	10
Smörgåsgurka 715g	1	7.50	5.5	160	508	2023	2	11
Kanel x4	1	10.00	5.5	160	c-Kanel x4	2023	2	11
Alimentation	1	6.95	5.5	161	nb-1	2023	2	11
Kanel x4	1	10.00	5.5	161	c-Kanel x4	2023	2	11
Kanelbulle	1	3.00	5.5	161	c-Kanelbulle	2023	2	11
Mästar matjessill	1	5.95	5.5	162	771	2023	2	11
Kanel x4	1	10.00	5.5	163	c-Kanel x4	2023	2	11
Kanelbulle	1	3.00	5.5	163	c-Kanelbulle	2023	2	11
Alimentation	1	6.95	5.5	163	nb-3	2023	2	11
Hovmästarsås glasburk	1	4.50	5.5	164	200	2023	2	11
Gravad Lax 150g Korshags	1	13.95	5.5	164	167	2023	2	11
Kallrökt Lax 150g Korshags	1	13.95	5.5	164	226	2023	2	11
Värmeljus 59mm Maxi 10h	1	12.95	20	164	694	2023	2	11
Bullar x4	1	10.00	5.5	164	c-Bullar x4	2023	2	11
Décoration/Alcool	1	38.00	20	164	nb-6	2023	2	11
Semla	2	8.00	5.5	165	c-Semla	2023	2	11
Saumon filet nature	1	10.95	5.5	166	736	2023	2	11
Gravad Lax 150g Korshags	1	13.95	5.5	166	167	2023	2	11
Kung Oscar pepparkakor	1	5.95	5.5	167	746	2023	2	11
Kallrökt Lax 150g Korshags	1	13.95	5.5	167	226	2023	2	11
Alimentation	1	1.00	5.5	167	nb-3	2023	2	11
Bullar x4	1	10.00	5.5	167	c-Bullar x4	2023	2	11
Alimentation	1	2.70	5.5	167	nb-5	2023	2	11
Boston gurka	1	5.50	5.5	168	42	2023	2	11
Micropopcorn Salt 3 pack	1	5.55	5.5	168	358	2023	2	11
Sac	1	0.10	5.5	168	c-Sac	2023	2	11
Bullar x4	1	10.00	5.5	168	c-Bullar x4	2023	2	11
Bullar x4	1	10.00	5.5	169	c-Bullar x4	2023	2	11
Antikljus x8	1	10.00	5.5	170	571	2023	2	11
Inlagd Sill	6	53.70	5.5	171	207	2023	2	11
Alimentation	1	7.50	5.5	172	nb-1	2023	2	11
Boulettes de viande	1	0.00	5.5	173	M_1	2023	2	11
Assiette de hareng	1	0.00	5.5	173	M_4	2023	2	11
Entrée - Plat	1	22.00	5.5	173	M_8	2023	2	11
Loka Päron	1	2.00	5.5	173	316	2023	2	11
Bullar x4	1	10.00	5.5	174	c-Bullar x4	2023	2	11
Kanel x4	1	10.00	5.5	175	c-Kanel x4	2023	2	11
Ättikssprit 12%	1	4.50	5.5	176	26	2023	2	11
Knäcke trekant normalgräddat	1	3.50	5.5	176	254	2023	2	11
Boulettes de viande	1	16.00	5.5	177	M_1	2023	2	11
Assiette de hareng	1	0.00	5.5	177	M_4	2023	2	11
Entrée - Plat	1	22.00	5.5	177	M_8	2023	2	11
Festis Päron EKO BRIK	1	2.00	5.5	177	120	2023	2	11
Kanelbulle	1	3.00	5.5	177	c-Kanelbulle	2023	2	11
Loka Citron	1	2.00	5.5	177	305	2023	2	11
Kanel x4	1	10.00	5.5	178	c-Kanel x4	2023	2	11
Bullar x4	1	10.00	5.5	178	c-Bullar x4	2023	2	11
Plat végétarien	1	16.00	5.5	179	M_36	2023	2	11
Plat végétarien	1	16.00	5.5	180	M_36	2023	2	11
Boulettes de viande	3	0.00	5.5	181	M_1	2023	2	11
Pavé de saumon	1	0.00	5.5	181	M_21	2023	2	11
Assiette de hareng	2	0.00	5.5	181	M_4	2023	2	11
Entrée - Plat Saumon	1	24.00	5.5	181	M_30	2023	2	11
Entrée - Plat	1	22.00	5.5	181	M_8	2023	2	11
Alimentation	2	32.00	5.5	181	nb-6	2023	2	11
Mariestads Öl 3.5% 50cL	1	3.50	5.5	181	349	2023	2	11
Rekorderlig Päron Cider	2	7.00	5.5	181	449	2023	2	11
Knäcke rund normalgräddat	1	7.95	5.5	182	251	2023	2	11
Kanel x4	1	10.00	5.5	182	c-Kanel x4	2023	2	11
Décoration/Alcool	1	90.00	20	183	nb-1	2023	2	11
Ahlgrens bilar Sursockrade	1	2.95	5.5	183	11	2023	2	11
Kanelbulle	1	3.00	5.5	183	c-Kanelbulle	2023	2	11
Kanelbulle	1	3.00	5.5	184	c-Kanelbulle	2023	2	11
Café/Thé	1	2.00	5.5	184	c-Café/Thé	2023	2	11
Décoration/Alcool	1	5.10	5.5	185	nb-1	2023	2	11
Kardemumbulle	1	3.00	5.5	186	c-Kardemumbulle	2023	2	11
Blabärsbulle	1	3.00	5.5	186	c-Blabärsbulle	2023	2	11
Boulettes de viande	1	0.00	5.5	187	M_1	2023	2	11
Glace vanille coulis baie polaire	1	0.00	5.5	187	M_24	2023	2	11
Plat - Dessert	1	20.00	5.5	187	M_16	2023	2	11
Bullar x4	1	10.00	5.5	187	c-Bullar x4	2023	2	11
Café/Thé	1	2.00	5.5	187	c-Café/Thé	2023	2	11
Plat végétarien	1	0.00	5.5	188	M_36	2023	2	11
Kladdkaka	1	0.00	5.5	188	M_2	2023	2	11
Plat - Dessert	1	20.00	5.5	188	M_16	2023	2	11
Café/Thé	1	2.00	5.5	188	c-Café/Thé	2023	2	11
Semlor x4	1	15.00	5.5	189	c-Semlor x4	2023	2	11
Semlor x4	1	15.00	5.5	190	c-Semlor x4	2023	2	11
Ahlgrens bilar Sursockrade	1	2.95	5.5	190	11	2023	2	11
Bullar x4	1	10.00	5.5	190	c-Bullar x4	2023	2	11
Bullar x4	1	10.00	5.5	191	c-Bullar x4	2023	2	11
Apelsinkrokant Chokladkaka	1	5.95	20	192	16	2023	2	11
Boston gurka	1	5.50	5.5	192	42	2023	2	11
Knäcke trekant brungräddat	1	3.50	5.5	192	253	2023	2	11
Knäcke trekant normalgräddat	3	10.50	5.5	192	254	2023	2	11
Kanel x4	1	10.00	5.5	193	c-Kanel x4	2023	2	11
Kanel x4	1	10.00	5.5	194	c-Kanel x4	2023	2	11
Kanelbulle	1	3.00	5.5	195	c-Kanelbulle	2023	2	11
Blabärsbulle	1	3.00	5.5	195	c-Blabärsbulle	2023	2	11
Tändstickor 8-Pack	1	3.95	20	196	690	2023	2	11
Kalles kaviar original	1	5.50	5.5	196	773	2023	2	11
Kronljus stearin 20cm ø22mm vit	1	24.95	5.5	196	612	2023	2	11
Semla	2	8.00	5.5	196	c-Semla	2023	2	11
Bullar x4	1	10.00	5.5	197	c-Bullar x4	2023	2	11
Kallrökt Lax 150g Korshags	1	13.95	5.5	198	226	2023	2	11
Bullar x4	1	10.00	5.5	198	c-Bullar x4	2023	2	11
Café/Thé	2	4.00	5.5	199	c-Café/Thé	2023	2	11
Bullar x4	1	10.00	5.5	199	c-Bullar x4	2023	2	11
Semla	1	4.00	5.5	199	c-Semla	2023	2	11
Knäcke trekant normalgräddat	1	3.50	5.5	200	254	2023	2	11
Bullar x4	1	10.00	5.5	200	c-Bullar x4	2023	2	11
Polarbröd Rågkaka	1	8.95	5.5	200	407	2023	2	11
Le Suédois Pour Les Nuls	1	7.95	5.5	200	298	2023	2	11
Skärgårdssill	1	4.95	5.5	201	492	2023	2	11
Räksallad	1	5.95	5.5	201	441	2023	2	11
Kardemumbulle	1	3.00	5.5	201	c-Kardemumbulle	2023	2	11
Blabärsbulle	1	3.00	5.5	201	c-Blabärsbulle	2023	2	11
Alimentation	1	6.95	5.5	202	nb-1	2023	2	11
Kanelbulle	1	3.00	5.5	202	c-Kanelbulle	2023	2	11
Mästar matjessill	1	5.95	5.5	203	771	2023	2	11
Ahlgrens bilar	1	2.95	5.5	204	8	2023	2	11
Finn Crisp Original	3	14.85	5.5	204	128	2023	2	11
Finn Crisp caraway	1	4.95	5.5	204	127	2023	2	11
Magazine	1	9.90	2.1	204	nb-4	2023	2	11
Magazine	1	12.90	2.1	204	nb-5	2023	2	11
Magazine	1	3.00	5.5	204	nb-6	2023	2	11
Kanel x4	1	10.00	5.5	205	c-Kanel x4	2023	2	11
Formule sand	1	10.00	5.5	206	c-Formule sand	2023	2	11
Café/Thé	1	2.00	5.5	206	c-Café/Thé	2023	2	11
Tunnbröd Litet	1	6.95	5.5	206	541	2023	2	11
Inlagd Sill	1	4.95	5.5	206	206	2023	2	11
Wasa Glutenfri Naturell	1	6.95	5.5	206	562	2023	2	11
Potatissallad	1	5.95	5.5	206	418	2023	2	11
Rödbetssallad 400g	1	6.50	5.5	206	462	2023	2	11
Skärgårdssill	1	4.95	5.5	206	492	2023	2	11
Alimentation	1	17.95	5.5	206	nb-9	2023	2	11
Saumon filet nature	1	10.95	5.5	206	736	2023	2	11
Kallrökt Lax 150g Korshags	1	13.95	5.5	206	226	2023	2	11
Kanel x4	1	10.00	5.5	206	c-Kanel x4	2023	2	11
Åseda Gräddost 38%	1	17.95	5.5	207	24	2023	2	11
Falukorv ring Sverige	1	10.95	5.5	207	112	2023	2	11
Finn Crisp Original	1	4.95	5.5	207	128	2023	2	11
​ ​Rödbetor skivade 710g	1	7.50	5.5	207	460	2023	2	11
Cheez Cruncherz	1	4.95	5.5	207	60	2023	2	11
Taco sauce hot	1	4.50	5.5	207	529	2023	2	11
Tacosås Medium	1	4.50	5.5	207	530	2023	2	11
Slotts senap original tub	1	7.95	5.5	207	483	2023	2	11
Slotts senap original tub	1	5.95	5.5	207	481	2023	2	11
Polarbröd Rågkaka	1	8.95	5.5	207	407	2023	2	11
Owl smörsmak popcorn	1	5.95	5.5	207	762	2023	2	11
Hallon/Lakrits Skalle	1	2.50	5.5	207	182	2023	2	11
Sandwich EMP	2	12.00	5.5	385	c-Sandwich EMP	2023	2	17
Tunnbröd Litet	2	13.90	5.5	394	541	2023	2	17
Décoration/Alcool	1	19.50	20	414	nb-6	2023	2	17
Décoration/Alcool	1	16.95	20	427	nb-2	2023	2	18
Assiette saumon	1	0.00	5.5	436	M_5	2023	2	18
100 Frön & Havssalt	1	4.95	5.5	446	3	2023	2	18
Magazine	1	7.00	5.5	456	nb-1	2023	2	18
Marabou helnöt 200g	2	11.90	5.5	468	798	2023	2	18
Pepparkaka Jul plåtburk	1	10.95	5.5	477	395	2023	2	18
Taco spice mix	2	5.00	20	491	527	2023	2	19
Semla	2	8.00	5.5	501	c-Semla	2023	2	19
Noblesse Havssalt crisp	1	6.50	5.5	509	370	2023	2	19
Kanelbulle	1	3.00	5.5	521	c-Kanelbulle	2023	2	19
Kardemum x4	1	10.00	5.5	535	c-Kardemum x4	2023	2	21
Skärgårdssill	1	4.95	5.5	535	492	2023	2	21
Prinskorv	1	6.95	5.5	542	424	2023	2	21
Cheez doodles 160g	1	4.20	5.5	552	63	2023	2	21
Loka Naturell Brk	1	2.00	5.5	565	314	2023	2	21
Magazine	1	5.00	5.5	577	nb-2	2023	2	21
Hovmästarsås glasburk	1	4.50	5.5	586	200	2023	2	21
Frödinge Princesstårta	1	15.00	5.5	595	144	2023	2	21
Café/Thé	1	2.00	5.5	603	c-Café/Thé	2023	2	21
Entrée - Plat	1	22.00	5.5	613	M_8	2023	2	22
Boulettes de viande	1	16.00	5.5	622	M_1	2023	2	22
Café/Thé	1	2.00	5.5	634	c-Café/Thé	2023	2	22
Kanelbulle	1	3.00	5.5	647	c-Kanelbulle	2023	2	22
Décoration/Alcool	2	16.00	5.5	657	nb-2	2023	2	23
Poëlée Pytt i Panna	1	16.00	5.5	673	M_3	2023	2	23
Frasvaflor 210g	2	5.90	5.5	678	829	2023	2	23
Saumon filet nature	2	21.90	5.5	683	736	2023	2	23
Décoration/Alcool	1	16.95	5.5	693	nb-5	2023	2	23
Inlagd Sill	2	9.90	5.5	703	206	2023	2	24
Café/Thé	2	4.00	5.5	708	c-Café/Thé	2023	2	24
Kardemumbulle	1	3.00	5.5	721	c-Kardemumbulle	2023	2	24
Décoration/Alcool	1	2.90	20	729	nb-7	2023	2	24
Soupe aux pois cassé/lardons	1	8.00	5.5	739	M_19	2023	2	25
Kaffe mellanrost brygg	1	12.95	5.5	747	220	2023	2	25
Fullkornsvälling 1 år	1	14.95	5.5	752	155	2023	2	25
Kanelbulle	1	3.00	5.5	760	c-Kanelbulle	2023	2	25
Kex Chocklad	4	8.00	5.5	764	239	2023	2	25
Bullar x4	1	10.00	5.5	774	c-Bullar x4	2023	2	25
Kanelbulle	2	6.00	5.5	784	c-Kanelbulle	2023	2	26
Dipmix Rostad Paprika och Vitlök	1	1.95	5.5	794	93	2023	2	26
Soldatens ärtsoppa extra fläsk	1	9.95	5.5	794	514	2023	2	26
Semla	2	8.00	5.5	806	c-Semla	2023	2	26
Kanelbulle	1	3.00	5.5	820	c-Kanelbulle	2023	2	26
Marabou Mjölkchocklad Single	1	1.00	5.5	207	343	2023	2	11
Kanelbulle	1	3.00	5.5	386	c-Kanelbulle	2023	2	17
Alimentation	1	20.00	5.5	395	nb-1	2023	2	17
Décoration/Alcool	1	2.95	20	414	nb-4	2023	2	17
Semla	2	8.00	5.5	428	c-Semla	2023	2	18
Entrée - Plat	1	22.00	5.5	436	M_8	2023	2	18
Läkerol Salvi	1	2.10	5.5	446	282	2023	2	18
Finn Crisp Original	4	19.80	5.5	457	128	2023	2	18
Alimentation	4	4.00	5.5	469	nb-1	2023	2	18
Décoration/Alcool	1	12.95	20	477	nb-7	2023	2	18
Kanelbulle	2	6.00	5.5	492	c-Kanelbulle	2023	2	19
Owl smörsmak popcorn	1	4.95	5.5	502	762	2023	2	19
Finn Crisp Original	1	4.95	5.5	509	128	2023	2	19
Semla	1	4.00	5.5	521	c-Semla	2023	2	19
Kardemumbulle	1	3.00	5.5	535	c-Kardemumbulle	2023	2	21
Estrella dillchips	1	4.20	5.5	535	84	2023	2	21
Oboy 700g	1	8.50	5.5	542	828	2023	2	21
Knäcke trekant normalgräddat	1	3.50	5.5	552	254	2023	2	21
Semla	3	12.00	5.5	565	c-Semla	2023	2	21
Kardemumbulle	1	3.00	5.5	578	c-Kardemumbulle	2023	2	21
Klassiskt Potatismos	1	9.95	5.5	586	248	2023	2	21
Festis Päron EKO BRIK	1	2.00	5.5	595	120	2023	2	21
Semlor x4	1	15.00	5.5	604	c-Semlor x4	2023	2	21
Assiette de hareng	1	0.00	5.5	614	M_4	2023	2	22
Boulettes de viande	1	16.00	5.5	622	M_1	2023	2	22
Kanel x4	1	10.00	5.5	634	c-Kanel x4	2023	2	22
Semla	1	4.00	5.5	648	c-Semla	2023	2	22
Loka mango lime	1	2.00	5.5	657	734	2023	2	23
Boulettes de viande	1	16.00	5.5	673	M_1	2023	2	23
Dipmix Rostad Paprika och Vitlök	4	7.80	5.5	678	93	2023	2	23
Karen volf digestive	1	2.95	5.5	683	784	2023	2	23
Décoration/Alcool	1	5.50	5.5	693	nb-6	2023	2	23
Poëlée Pytt i Panna	1	0.00	5.5	704	M_3	2023	2	24
Décoration/Alcool	1	4.50	20	704	nb-8	2023	2	24
Delicatoboll singel	4	6.00	5.5	708	80	2023	2	24
Décoration/Alcool	1	80.00	20	708	nb-15	2023	2	24
Kanelbulle	1	3.00	5.5	721	c-Kanelbulle	2023	2	24
Décoration/Alcool	1	8.95	20	729	nb-8	2023	2	24
Alimentation	1	5.00	5.5	739	nb-2	2023	2	25
Décoration/Alcool	1	3.10	5.5	747	nb-4	2023	2	25
Knäcke trekant normalgräddat	1	3.50	5.5	752	254	2023	2	25
Café/Thé	2	4.00	5.5	760	c-Café/Thé	2023	2	25
Vetekaka	1	8.95	5.5	765	555	2023	2	25
Kex Chocklad	2	4.00	5.5	775	239	2023	2	25
Bullar x4	1	10.00	5.5	785	c-Bullar x4	2023	2	26
Dippmix Fresh Island	1	1.95	5.5	794	96	2023	2	26
Bullar x4	1	10.00	5.5	794	c-Bullar x4	2023	2	26
Sandwich cheese paprika	1	2.00	5.5	807	473	2023	2	26
Läkerol Cassis	1	2.10	5.5	821	275	2023	2	26
Café/Thé	1	2.00	5.5	207	c-Café/Thé	2023	2	11
Gräddsås 3-pack	1	4.65	5.5	387	164	2023	2	17
Magazine	1	5.80	2.1	387	nb-15	2023	2	17
Alimentation	1	8.00	5.5	396	nb-1	2023	2	17
Décoration/Alcool	1	1.80	5.5	415	nb-1	2023	2	17
Semlor x4	1	15.00	5.5	428	c-Semlor x4	2023	2	18
Bullar x4	1	10.00	5.5	436	c-Bullar x4	2023	2	18
Falukorv Sverige	1	5.95	5.5	446	113	2023	2	18
Rågmjöl Grovt	1	6.95	5.5	458	436	2023	2	18
Alimentation	1	3.00	5.5	470	nb-1	2023	2	18
Décoration/Alcool	1	4.50	20	478	nb-1	2023	2	18
Bullar x4	1	10.00	5.5	493	c-Bullar x4	2023	2	19
Alimentation	1	5.00	5.5	503	nb-1	2023	2	19
Marabou Pigall Dubbel	1	1.70	5.5	509	344	2023	2	19
Kanelbulle	1	3.00	5.5	522	c-Kanelbulle	2023	2	19
Semla	2	8.00	5.5	535	c-Semla	2023	2	21
Grahamsmjöl	1	6.95	5.5	542	165	2023	2	21
Polarbröd Rågkaka	1	8.95	5.5	552	407	2023	2	21
Café/Thé	2	4.00	5.5	565	c-Café/Thé	2023	2	21
Semla	2	8.00	5.5	579	c-Semla	2023	2	21
Havssaltskola	1	4.95	5.5	587	793	2023	2	21
Alimentation	1	4.00	5.5	595	nb-7	2023	2	21
Semla	1	4.00	5.5	604	c-Semla	2023	2	21
Boulettes de viande	1	0.00	5.5	614	M_1	2023	2	22
Poëlée Pytt i Panna	1	16.00	5.5	622	M_3	2023	2	22
Blabärsbulle	1	3.00	5.5	634	c-Blabärsbulle	2023	2	22
Café/Thé	1	2.00	5.5	648	c-Café/Thé	2023	2	22
Décoration/Alcool	1	14.00	5.5	658	nb-1	2023	2	23
Assiette nordique - Saumon	2	36.00	5.5	673	M_33	2023	2	23
Alimentation	1	4.84	5.5	679	nb-1	2023	2	23
Ballerina Original	2	9.00	5.5	683	30	2023	2	23
Décoration/Alcool	1	4.95	5.5	693	nb-7	2023	2	23
Glace vanille coulis baie polaire	1	0.00	5.5	704	M_24	2023	2	24
Haribo nappar frukt	2	3.00	5.5	708	752	2023	2	24
Measuring jug 0.1L	1	4.50	5.5	708	789	2023	2	24
Ljus Sirap	1	4.50	5.5	722	302	2023	2	24
Décoration/Alcool	1	4.95	20	729	nb-9	2023	2	24
Soupe aux pois cassé/lardons	1	8.00	5.5	740	M_19	2023	2	25
Café/Thé	2	4.00	5.5	748	c-Café/Thé	2023	2	25
Klassiska Köttbullar	1	12.95	5.5	753	247	2023	2	25
Décoration/Alcool	1	3.50	20	760	nb-4	2023	2	25
Prickig korv skiv	1	3.95	5.5	765	422	2023	2	25
Tändstickor	1	3.95	20	775	689	2023	2	25
Semla	1	4.00	5.5	786	c-Semla	2023	2	26
Dippmix Ranch	1	1.95	5.5	794	97	2023	2	26
Sandwich Chives	1	2.00	5.5	807	474	2023	2	26
Salta Katten	1	1.50	20	821	470	2023	2	26
Kardemumbulle	2	6.00	5.5	207	c-Kardemumbulle	2023	2	11
Assiette de hareng	1	8.00	5.5	387	M_4	2023	2	17
Magazine	1	6.00	2.1	387	nb-16	2023	2	17
Alimentation	1	16.00	5.5	397	nb-1	2023	2	17
Dipmix Sourcream onion	1	1.95	5.5	415	94	2023	2	17
Bullar x4	1	10.00	5.5	428	c-Bullar x4	2023	2	18
Finn Crisp Original	1	4.95	5.5	436	128	2023	2	18
Felix Krögarpytt Klassisk	1	7.95	5.5	446	117	2023	2	18
Alimentation	1	1.00	5.5	458	nb-3	2023	2	18
Felix Krögarpytt Klassisk	1	7.95	5.5	470	117	2023	2	18
Sac	1	0.10	5.5	479	c-Sac	2023	2	19
Alimentation	1	10.00	5.5	494	nb-3	2023	2	19
Finn Crisp Original	1	4.95	5.5	503	128	2023	2	19
Ballerina kladdkaka	1	4.50	5.5	509	29	2023	2	19
Blabärsbulle	1	3.00	5.5	522	c-Blabärsbulle	2023	2	19
Sac	1	0.10	5.5	535	c-Sac	2023	2	21
Magazine	1	13.50	2.1	542	nb-6	2023	2	21
Semlor x4	3	45.00	5.5	554	c-Semlor x4	2023	2	21
Magazine	1	9.50	2.1	565	nb-5	2023	2	21
Semla	2	8.00	5.5	580	c-Semla	2023	2	21
Lakrisal	1	1.20	5.5	587	283	2023	2	21
Alimentation	1	2.95	5.5	595	nb-8	2023	2	21
Sac	2	0.20	5.5	604	c-Sac	2023	2	21
Entrée - Plat	1	22.00	5.5	614	M_8	2023	2	22
Semla	2	8.00	5.5	622	c-Semla	2023	2	22
Semla	3	12.00	5.5	635	c-Semla	2023	2	22
Semla	1	4.00	5.5	649	c-Semla	2023	2	22
Semla	2	8.00	5.5	659	c-Semla	2023	2	23
Kanelbulle	3	9.00	5.5	673	c-Kanelbulle	2023	2	23
Alimentation	1	4.30	5.5	679	nb-2	2023	2	23
Västerbottensost 35% normalbit	1	21.95	5.5	683	554	2023	2	23
Décoration/Alcool	1	2.50	5.5	693	nb-8	2023	2	23
Plat - Dessert	1	20.00	5.5	704	M_16	2023	2	24
Décoration/Alcool	2	10.00	5.5	709	nb-1	2023	2	24
Mörk Sirap	1	4.50	5.5	722	363	2023	2	24
Décoration/Alcool	2	10.00	5.5	730	nb-1	2023	2	24
Alimentation	1	5.00	5.5	740	nb-2	2023	2	25
Kanelbulle	1	3.00	5.5	748	c-Kanelbulle	2023	2	25
Inlagd Sill	2	9.90	5.5	753	206	2023	2	25
Knäcke trekant normalgräddat	1	3.50	5.5	761	254	2023	2	25
Grebbestads® Ansjovisfilé Original	1	6.95	5.5	765	171	2023	2	25
Pepparkaka Jul plåtburk	1	10.95	5.5	775	395	2023	2	25
Bullar x4	1	10.00	5.5	786	c-Bullar x4	2023	2	26
Alimentation	1	14.00	5.5	795	nb-1	2023	2	26
Imsdal 50cL	1	1.80	5.5	808	830	2023	2	26
Tutti frutti tablettask	1	1.50	5.5	821	742	2023	2	26
Zingo apelsin	1	2.00	5.5	207	786	2023	2	11
Wasa Glutenfri Naturell	2	13.90	5.5	208	562	2023	2	11
Magazine	1	9.95	2.1	208	nb-2	2023	2	11
Filmjölk 3%	1	3.50	5.5	208	122	2023	2	11
Magazine	1	1.00	5.5	208	nb-4	2023	2	11
Kalles kaviar original	1	5.50	5.5	208	773	2023	2	11
Semla	1	4.00	5.5	208	c-Semla	2023	2	11
Finn Crisp Original	1	4.95	5.5	209	128	2023	2	11
Finn Crisp caraway	1	4.95	5.5	209	127	2023	2	11
Skärgårdssill	1	4.95	5.5	209	492	2023	2	11
Kardemumbulle	2	6.00	5.5	209	c-Kardemumbulle	2023	2	11
Bullar x4	1	10.00	5.5	210	c-Bullar x4	2023	2	11
Alimentation	1	5.00	5.5	211	nb-1	2023	2	11
Hudsalva Idomin 50g	1	3.95	20	211	601	2023	2	11
Café/Thé	2	4.00	5.5	212	c-Café/Thé	2023	2	11
Kardemumbulle	2	6.00	5.5	212	c-Kardemumbulle	2023	2	11
Ballerina kladdkaka	1	4.50	5.5	212	29	2023	2	11
Semla	2	8.00	5.5	213	c-Semla	2023	2	11
Falu Råg-rut Knäckebröd	1	5.95	5.5	213	111	2023	2	11
Alimentation	1	6.10	5.5	214	nb-1	2023	2	11
Lingonsylt	1	8.95	5.5	214	300	2023	2	11
Estrella chips sourcream & onion	1	4.20	5.5	214	66	2023	2	11
Loka Päron	1	2.00	5.5	215	316	2023	2	11
Alimentation	1	4.00	5.5	215	nb-2	2023	2	11
Slotts senap original tub	1	7.95	5.5	216	483	2023	2	11
Punschrulle singel	2	3.00	5.5	217	430	2023	2	11
Décoration/Alcool	1	24.00	20	218	nb-1	2023	2	12
Décoration/Alcool	2	9.00	20	218	nb-2	2023	2	12
Décoration/Alcool	3	90.00	5.5	218	nb-3	2023	2	12
Filmjölk 3%	1	3.50	5.5	218	122	2023	2	12
Filmjölk 3%	1	3.50	5.5	219	122	2023	2	12
Kalles kaviar original	2	11.00	5.5	219	773	2023	2	12
Nyponsoppa original	1	5.95	5.5	219	377	2023	2	12
Felix Krögarpytt Klassisk	1	7.95	5.5	219	117	2023	2	12
Alimentation	1	7.00	5.5	219	nb-5	2023	2	12
100 Frön & Havssalt	1	4.50	5.5	220	3	2023	2	12
Västerbottensost 35% normalbit	1	21.95	5.5	220	554	2023	2	12
Kanel x4	1	10.00	5.5	220	c-Kanel x4	2023	2	12
Kanel x4	1	10.00	5.5	221	c-Kanel x4	2023	2	12
Bullar x4	1	10.00	5.5	221	c-Bullar x4	2023	2	12
Kardemum x4	1	10.00	5.5	221	c-Kardemum x4	2023	2	12
Kallrökt Lax 150g Korshags	1	13.95	5.5	222	226	2023	2	12
Hovmästarsås glasburk	1	4.50	5.5	222	200	2023	2	12
Saumon filet nature	1	10.95	5.5	222	736	2023	2	12
Blabärsbulle	1	3.00	5.5	223	c-Blabärsbulle	2023	2	12
Kanelbulle	1	3.00	5.5	224	c-Kanelbulle	2023	2	12
Kardemumbulle	1	3.00	5.5	224	c-Kardemumbulle	2023	2	12
Bullar x4	2	20.00	5.5	225	c-Bullar x4	2023	2	12
Boston gurka	1	5.50	5.5	226	42	2023	2	12
Kalles kaviar original	4	22.00	5.5	226	773	2023	2	12
Gravad Lax 150g Korshags	1	13.95	5.5	227	167	2023	2	12
Bullar x4	1	10.00	5.5	227	c-Bullar x4	2023	2	12
Ahlgrens bilar	1	2.95	5.5	228	8	2023	2	12
Rotmos pulver	1	9.95	5.5	228	463	2023	2	12
Fiskbullar i dillsås	1	6.95	5.5	228	132	2023	2	12
Fiskbullar i hummersås MSC	1	6.95	5.5	228	133	2023	2	12
Läkerol Salmiak	1	2.10	5.5	228	281	2023	2	12
Alimentation	1	17.95	5.5	228	nb-6	2023	2	12
Små delikatess köttbullar	2	19.90	5.5	228	501	2023	2	12
Falukorv ring Sverige	1	10.95	5.5	228	112	2023	2	12
Sac	1	0.10	5.5	228	c-Sac	2023	2	12
Bullar x4	2	20.00	5.5	229	c-Bullar x4	2023	2	12
Kanelbulle	2	6.00	5.5	229	c-Kanelbulle	2023	2	12
Klassiska Köttbullar	1	12.95	5.5	229	247	2023	2	12
Tutti frutti tablettask	1	1.50	5.5	229	742	2023	2	12
Filmjölk 3%	1	3.50	5.5	229	122	2023	2	12
Alimentation	1	1.00	5.5	229	nb-6	2023	2	12
Assiette saumon	1	0.00	5.5	230	M_5	2023	2	12
Boulettes de viande	1	0.00	5.5	230	M_1	2023	2	12
Entrée - Plat	1	22.00	5.5	230	M_8	2023	2	12
Blabärsbulle	1	3.00	5.5	230	c-Blabärsbulle	2023	2	12
Semla	1	4.00	5.5	230	c-Semla	2023	2	12
Boulettes de viande	1	16.00	5.5	231	M_1	2023	2	12
Assiette nordique	1	0.00	5.5	231	M_35	2023	2	12
Boulettes de viande	1	0.00	5.5	231	M_1	2023	2	12
Entrée - Plat	1	22.00	5.5	231	M_8	2023	2	12
Semla	1	4.00	5.5	231	c-Semla	2023	2	12
Haribo nappar sur	1	1.50	5.5	231	753	2023	2	12
Läkerol Eucalyptus	1	2.10	5.5	231	276	2023	2	12
Marabou Frukt Mandel 200g	1	5.95	5.5	231	338	2023	2	12
Gott & blandat Salt	1	2.95	5.5	232	161	2023	2	12
Magazine	1	8.50	2.1	232	nb-1	2023	2	12
Semla	2	8.00	5.5	232	c-Semla	2023	2	12
Magazine	1	1.60	5.5	232	nb-4	2023	2	12
Snabbmarsan vaniljsås 7p	1	3.50	5.5	232	511	2023	2	12
Bullar x4	1	10.00	5.5	233	c-Bullar x4	2023	2	12
Festis Hallon EKO BRIK	2	4.00	5.5	233	119	2023	2	12
Magazine	1	4.10	5.5	233	nb-3	2023	2	12
Assiette saumon	1	8.00	5.5	234	M_5	2023	2	12
Poëlée Pytt i Panna	1	16.00	5.5	234	M_3	2023	2	12
Semla	2	8.00	5.5	234	c-Semla	2023	2	12
Magazine	1	1.48	5.5	235	nb-1	2023	2	12
Magazine	1	2.46	5.5	236	nb-1	2023	2	12
Blockljus	1	13.80	20	237	577	2023	2	12
Gravad Lax 150g Korshags	1	13.95	5.5	237	167	2023	2	12
Hovmästarsås glasburk	1	4.50	5.5	237	200	2023	2	12
Kung Oscar pepparkakor	1	5.95	5.5	237	746	2023	2	12
Assiette nordique - Saumon	1	18.00	5.5	238	M_33	2023	2	12
Boulettes de viande	1	16.00	5.5	238	M_1	2023	2	12
Boulettes de viande	1	0.00	5.5	238	M_1	2023	2	12
Plat - Dessert	1	20.00	5.5	238	M_16	2023	2	12
Kladdkaka	1	0.00	5.5	238	M_2	2023	2	12
Rekorderlig Päron Cider	2	7.00	5.5	238	449	2023	2	12
Loka Citron	1	2.00	5.5	238	305	2023	2	12
Kanelbulle	1	3.00	5.5	238	c-Kanelbulle	2023	2	12
Semla	1	4.00	5.5	238	c-Semla	2023	2	12
Café/Thé	3	6.00	5.5	238	c-Café/Thé	2023	2	12
Décoration/Alcool	1	80.00	20	239	nb-1	2023	2	12
Brunost	1	17.95	5.5	240	51	2023	2	12
Cheez doodles 160g	1	4.20	5.5	240	63	2023	2	12
Kanel x4	1	10.00	5.5	241	c-Kanel x4	2023	2	12
Bullar x4	1	10.00	5.5	242	c-Bullar x4	2023	2	12
Semla	1	4.00	5.5	242	c-Semla	2023	2	12
Brunsås 3-pack	1	4.65	5.5	243	52	2023	2	12
Djungelvrål	3	5.85	5.5	243	101	2023	2	12
Marabou Schweizer Nöt Single	1	1.00	5.5	243	347	2023	2	12
Kex Chocklad	1	2.00	5.5	243	239	2023	2	12
Marabou 30 praliner med nougatfyllning	1	9.95	5.5	243	333	2023	2	12
Kanelbulle	1	3.00	5.5	243	c-Kanelbulle	2023	2	12
Loka Päron	1	2.00	5.5	243	316	2023	2	12
Ahlgrens bilar Sursockrade	1	2.95	5.5	244	11	2023	2	12
Semla	2	8.00	5.5	245	c-Semla	2023	2	12
Café/Thé	1	2.00	5.5	245	c-Café/Thé	2023	2	12
Mini croustades	2	13.90	5.5	245	758	2023	2	12
Kanelbulle	2	6.00	5.5	246	c-Kanelbulle	2023	2	12
​ Smörgåsgurka 370g	1	5.50	5.5	246	507	2023	2	12
Delicatoboll singel	1	1.50	5.5	246	80	2023	2	12
Semla	1	4.00	5.5	247	c-Semla	2023	2	12
Tyrkisk Peber Original	1	3.50	5.5	247	545	2023	2	12
Vaniljsocker	1	3.95	5.5	247	768	2023	2	12
Gott & Blandat Supersur	1	2.95	5.5	248	162	2023	2	12
Kung Oscar pepparkakor	1	5.95	5.5	249	746	2023	2	12
Taco shells	1	7.95	5.5	249	532	2023	2	12
Kalles kaviar original	1	5.50	5.5	249	773	2023	2	12
Finn Crisp Original	1	4.95	5.5	249	128	2023	2	12
Alimentation	1	5.00	5.5	249	nb-5	2023	2	12
Kanelbulle	2	6.00	5.5	250	c-Kanelbulle	2023	2	12
Café/Thé	1	2.00	5.5	250	c-Café/Thé	2023	2	12
Kanelbulle	1	3.00	5.5	251	c-Kanelbulle	2023	2	12
Alimentation	1	5.50	5.5	251	nb-3	2023	2	12
Café/Thé	2	4.00	5.5	251	c-Café/Thé	2023	2	12
Citronpeppar glasburk	1	3.95	5.5	251	70	2023	2	12
Semla	3	12.00	5.5	252	c-Semla	2023	2	12
Café/Thé	3	6.00	5.5	252	c-Café/Thé	2023	2	12
Sandwich cheese paprika	1	2.00	5.5	252	473	2023	2	12
Sandwich cheese paprika	1	2.00	5.5	253	473	2023	2	12
Sandwich tomat basilika	1	2.10	5.5	253	477	2023	2	12
Alimentation	1	0.10	5.5	253	nb-3	2023	2	12
Finn Crisp Original	1	4.95	5.5	254	128	2023	2	12
Kanel x4	2	20.00	5.5	255	c-Kanel x4	2023	2	12
Semla	1	4.00	5.5	255	c-Semla	2023	2	12
Café/Thé	3	6.00	5.5	255	c-Café/Thé	2023	2	12
Filmjölk 3%	1	4.70	5.5	255	122	2023	2	12
Alimentation	1	2.00	5.5	255	nb-5	2023	2	12
Alimentation	1	3.00	5.5	255	nb-6	2023	2	12
Bullar x4	1	10.00	5.5	256	c-Bullar x4	2023	2	12
Kanel x4	2	20.00	5.5	257	c-Kanel x4	2023	2	12
Alimentation	1	0.05	5.5	258	nb-1	2023	2	12
Finn Crisp caraway	2	9.90	5.5	259	127	2023	2	14
Rårörda lingon	1	8.95	5.5	259	447	2023	2	14
Blockljus	1	5.00	5.5	259	808	2023	2	14
Knäcke trekant normalgräddat	6	21.00	5.5	260	254	2023	2	14
Alimentation	2	35.90	5.5	261	nb-1	2023	2	14
Skogaholmslimpa skiv Tina och servera	1	6.95	5.5	261	498	2023	2	14
Klassiska Köttbullar	1	12.95	5.5	261	247	2023	2	14
Noblesse Original Crisp	2	13.90	5.5	261	372	2023	2	14
Kardemumma Malen 18g	1	3.95	5.5	261	236	2023	2	14
Marabou Schweizer nöt	1	3.10	5.5	261	346	2023	2	14
Mjölkchoklad Kaka	6	18.60	5.5	261	362	2023	2	14
Cheez doodles 160g	1	4.20	5.5	261	63	2023	2	14
Emser	1	2.25	20	261	106	2023	2	14
Chokladpudding	2	7.90	5.5	261	69	2023	2	14
Kardemumbulle	2	6.00	5.5	261	c-Kardemumbulle	2023	2	14
Sac	2	0.20	5.5	261	c-Sac	2023	2	14
Gräddsås 3-pack	2	9.30	5.5	261	164	2023	2	14
Rårörda lingon	1	8.95	5.5	261	447	2023	2	14
Bullar x4	1	10.00	5.5	262	c-Bullar x4	2023	2	14
Semla	2	8.00	5.5	262	c-Semla	2023	2	14
Kalles kaviar original	3	16.50	5.5	263	773	2023	2	14
Bullar x4	1	10.00	5.5	264	c-Bullar x4	2023	2	14
Kardemumbulle	1	3.00	5.5	265	c-Kardemumbulle	2023	2	14
Kanelbulle	1	3.00	5.5	265	c-Kanelbulle	2023	2	14
Djungelvrål	1	1.95	5.5	266	101	2023	2	14
Hallon/Lakrits Skalle	1	2.50	5.5	266	182	2023	2	14
Dippmix Ranch	1	1.95	5.5	266	97	2023	2	14
Salta Katten	1	1.50	20	266	470	2023	2	14
Läkerol Licorice Seasalt	2	4.20	5.5	266	277	2023	2	14
Semla	3	12.00	5.5	266	c-Semla	2023	2	14
Kardemumbulle	1	3.00	5.5	266	c-Kardemumbulle	2023	2	14
Bullar x4	1	10.00	5.5	267	c-Bullar x4	2023	2	14
Alimentation	1	10.80	5.5	267	nb-2	2023	2	14
Alimentation	1	30.90	5.5	114	nb-1	2023	2	10
Entrée - Plat	1	22.00	5.5	268	M_8	2023	2	14
Assiette de hareng	1	0.00	5.5	268	M_4	2023	2	14
Boulettes de viande	1	0.00	5.5	268	M_1	2023	2	14
Entrée - Plat	1	22.00	5.5	269	M_8	2023	2	14
Soupe aux pois cassé/lardons	1	0.00	5.5	269	M_19	2023	2	14
Poëlée Pytt i Panna	1	0.00	5.5	269	M_3	2023	2	14
Kaffe skånerost brygg RA	2	25.90	5.5	270	222	2023	2	14
Läkerol Salvi	2	4.20	5.5	270	282	2023	2	14
Riskakor Gräddfil Lök glutenfria	1	4.75	5.5	270	457	2023	2	14
Soupe aux pois cassé/lardons	1	0.00	5.5	271	M_19	2023	2	14
Poëlée Pytt i Panna	1	0.00	5.5	271	M_3	2023	2	14
Entrée - Plat	1	22.00	5.5	271	M_8	2023	2	14
Assiette nordique	1	0.00	5.5	272	M_35	2023	2	14
Plat végétarien	1	0.00	5.5	272	M_36	2023	2	14
Entrée - Plat	1	22.00	5.5	272	M_8	2023	2	14
Kanelbulle	1	3.00	5.5	272	c-Kanelbulle	2023	2	14
Kardemumbulle	1	3.00	5.5	272	c-Kardemumbulle	2023	2	14
Soupe aux pois cassé/lardons	1	0.00	5.5	273	M_19	2023	2	14
Soupe aux pois cassé/lardons	1	0.00	5.5	273	M_19	2023	2	14
Plat végétarien	1	0.00	5.5	273	M_36	2023	2	14
Assiette nordique - Saumon	1	0.00	5.5	273	M_33	2023	2	14
Entrée - Plat Saumon	1	24.00	5.5	273	M_30	2023	2	14
Entrée - Plat	1	22.00	5.5	273	M_8	2023	2	14
Café/Thé	2	4.00	5.5	273	c-Café/Thé	2023	2	14
Mjölkchoklad Kaka	2	6.20	5.5	274	362	2023	2	14
Riskakor Gräddfil Lök glutenfria	1	4.75	5.5	274	457	2023	2	14
Alimentation	1	6.95	5.5	274	nb-3	2023	2	14
Gravad Lax 150g Korshags	2	27.90	5.5	274	167	2023	2	14
Västerbottensost 35% normalbit	1	21.95	5.5	274	554	2023	2	14
Kanelbulle	1	3.00	5.5	274	c-Kanelbulle	2023	2	14
Semlor x4	1	15.00	5.5	275	c-Semlor x4	2023	2	14
Filmjölk 3%	2	9.90	5.5	275	122	2023	2	14
​ Smörgåsgurka 370g	1	5.50	5.5	275	507	2023	2	14
Rågkusar osötad Tina och servera	1	8.95	5.5	275	434	2023	2	14
Lönneberga leverpastej	2	7.90	5.5	275	299	2023	2	14
Dipmix Rostad Paprika och Vitlök	1	1.95	5.5	276	93	2023	2	14
Bullar x4	1	10.00	5.5	277	c-Bullar x4	2023	2	14
Loka Päron	1	2.00	5.5	277	316	2023	2	14
Semla	1	4.00	5.5	277	c-Semla	2023	2	14
Café/Thé	1	2.00	5.5	277	c-Café/Thé	2023	2	14
Dumle sachet 120g	1	4.50	5.5	278	827	2023	2	14
Finn Crisp caraway	1	4.95	5.5	279	127	2023	2	14
Kalles kaviar original	2	11.00	5.5	280	773	2023	2	14
Ballerina kladdkaka	1	4.50	5.5	281	29	2023	2	14
Blabärsbulle	2	3.00	5.5	281	c-Blabärsbulle	2023	2	14
Ballerina Original	1	4.50	5.5	281	30	2023	2	14
Kardemum x4	1	5.00	5.5	281	c-Kardemum x4	2023	2	14
Saffran x4	1	5.00	5.5	281	c-Saffran x4	2023	2	14
Kanel x4	1	5.00	5.5	281	c-Kanel x4	2023	2	14
Kalles kaviar original	1	5.50	5.5	282	773	2023	2	14
Kanelbulle	1	3.00	5.5	283	c-Kanelbulle	2023	2	14
Kanel x4	1	10.00	5.5	283	c-Kanel x4	2023	2	14
Gravad Lax 150g Korshags	2	27.90	5.5	283	167	2023	2	14
Festis Hallon EKO BRIK	1	2.00	5.5	284	119	2023	2	14
Café/Thé	1	2.00	5.5	284	c-Café/Thé	2023	2	14
Blabärsbulle	1	3.00	5.5	284	c-Blabärsbulle	2023	2	14
Saffransbulle	1	3.00	5.5	284	c-Saffransbulle	2023	2	14
Café/Thé	1	2.00	5.5	285	c-Café/Thé	2023	2	14
Kanelbulle	1	3.00	5.5	285	c-Kanelbulle	2023	2	14
Kardemumbulle	2	6.00	5.5	285	c-Kardemumbulle	2023	2	14
Café/Thé	1	2.00	5.5	286	c-Café/Thé	2023	2	14
Blabärsbulle	1	3.00	5.5	286	c-Blabärsbulle	2023	2	14
Rekorderlig Päron Cider	1	3.50	5.5	287	449	2023	2	14
Kanelbulle	1	3.00	5.5	287	c-Kanelbulle	2023	2	14
Loka Citron	1	2.00	5.5	288	305	2023	2	14
Blabärsbulle	1	3.00	5.5	288	c-Blabärsbulle	2023	2	14
Bullar x4	1	10.00	5.5	289	c-Bullar x4	2023	2	14
Kanelbulle	1	3.00	5.5	290	c-Kanelbulle	2023	2	14
Alimentation	1	3.70	5.5	291	nb-1	2023	2	14
Marabou 30 praliner med nougatfyllning	1	9.95	5.5	292	333	2023	2	14
Kronjäst för söta degar färsk	1	2.00	5.5	293	261	2023	2	14
Kardemumma Malen 18g	1	3.95	5.5	293	236	2023	2	14
Skärgårdssill	1	4.95	5.5	293	492	2023	2	14
Skagenröra	1	5.95	5.5	293	491	2023	2	14
Soldatens ärtsoppa extra fläsk	1	9.95	5.5	293	514	2023	2	14
Finkornig rom röd	1	9.95	5.5	293	770	2023	2	14
Semla	2	8.00	5.5	293	c-Semla	2023	2	14
Café/Thé	1	2.00	5.5	294	c-Café/Thé	2023	2	14
Kanelbulle	3	9.00	5.5	294	c-Kanelbulle	2023	2	14
Daim Chokladkaka	1	3.10	5.5	294	77	2023	2	14
Iron Swedish Logo	1	3.70	20	295	604	2023	2	14
Blabärsbulle	1	3.00	5.5	296	c-Blabärsbulle	2023	2	14
Oboy 700g	1	8.50	5.5	297	828	2023	2	14
Semlor x4	1	15.00	5.5	297	c-Semlor x4	2023	2	14
Smörgåsgurka 715g	1	7.50	5.5	298	508	2023	2	14
Semla	2	8.00	5.5	298	c-Semla	2023	2	14
Saffransbulle	1	3.00	5.5	298	c-Saffransbulle	2023	2	14
Kanelbulle	2	6.00	5.5	299	c-Kanelbulle	2023	2	14
Loka Citron	1	2.00	5.5	299	305	2023	2	14
Kanelbulle	2	6.00	5.5	300	c-Kanelbulle	2023	2	14
Loka Citron	1	2.00	5.5	300	305	2023	2	14
Dipmix Rostad Paprika och Vitlök	1	1.95	5.5	301	93	2023	2	14
Räkost	1	8.95	5.5	301	438	2023	2	14
Kex Chocklad	1	2.00	5.5	301	239	2023	2	14
Inlagd Sill	1	4.95	5.5	301	206	2023	2	14
Citronpeppar glasburk	1	3.95	5.5	301	70	2023	2	14
Sandwich Chives	1	2.00	5.5	301	474	2023	2	14
Sandwich tomat basilika	1	2.10	5.5	301	477	2023	2	14
Falu Chia & Havssalt rågrut	1	5.95	5.5	301	757	2023	2	14
Kanelbulle	1	3.00	5.5	301	c-Kanelbulle	2023	2	14
Saffransbulle	1	3.00	5.5	301	c-Saffransbulle	2023	2	14
Gravad Lax 150g Korshags	1	13.95	5.5	301	167	2023	2	14
Små delikatess köttbullar	1	9.95	5.5	301	501	2023	2	14
Semla	2	8.00	5.5	302	c-Semla	2023	2	14
Café/Thé	2	4.00	5.5	302	c-Café/Thé	2023	2	14
Kardemumbulle	2	6.00	5.5	302	c-Kardemumbulle	2023	2	14
Semla	2	8.00	5.5	303	c-Semla	2023	2	15
Semla	2	8.00	5.5	305	c-Semla	2023	2	15
Guld Marie	1	2.50	5.5	306	181	2023	2	15
Cheez doodles 160g	1	4.20	5.5	306	63	2023	2	15
Festis Päron EKO BRIK	1	2.00	5.5	306	120	2023	2	15
Froosh Peach & Passion Fruit	1	4.50	5.5	306	148	2023	2	15
Kanelbulle	2	6.00	5.5	306	c-Kanelbulle	2023	2	15
Runda Kanel	1	5.95	5.5	307	464	2023	2	15
Bullar x4	1	10.00	5.5	307	c-Bullar x4	2023	2	15
Blåbärssoppa original	1	5.95	5.5	307	36	2023	2	15
Semlor x4	1	15.00	5.5	307	c-Semlor x4	2023	2	15
Sandwich EMP	1	6.00	5.5	307	c-Sandwich EMP	2023	2	15
Estrella chips sourcream & onion	1	4.20	5.5	308	66	2023	2	15
Estrella dillchips	1	4.20	5.5	308	84	2023	2	15
Kardemumbulle	1	3.00	5.5	308	c-Kardemumbulle	2023	2	15
Semla	1	4.00	5.5	308	c-Semla	2023	2	15
Marabou 30 praliner med nougatfyllning	1	9.95	5.5	308	333	2023	2	15
Blabärsbulle	1	3.00	5.5	309	c-Blabärsbulle	2023	2	15
Kanelbulle	1	3.00	5.5	309	c-Kanelbulle	2023	2	15
Hallon/Lakrits Skalle	1	2.50	5.5	310	182	2023	2	15
Gott & blandat Salt	1	2.95	5.5	310	161	2023	2	15
Rödbetssallad 400g	1	6.50	5.5	310	462	2023	2	15
Läkerol Cactus	1	2.10	5.5	310	274	2023	2	15
Läkerol Raspberry Licorice	1	2.10	5.5	310	279	2023	2	15
Läkerol Licorice Seasalt	1	2.10	5.5	310	277	2023	2	15
Läkerol Eucalyptus	1	2.10	5.5	310	276	2023	2	15
100 Frön & Havssalt	1	4.95	5.5	310	3	2023	2	15
Blabärsbulle	1	3.00	5.5	310	c-Blabärsbulle	2023	2	15
Kanelbulle	1	3.00	5.5	310	c-Kanelbulle	2023	2	15
Alimentation	1	3.10	5.5	310	nb-11	2023	2	15
Ahlgrens bilar	2	5.90	5.5	311	8	2023	2	15
Snören cola	1	2.95	5.5	311	513	2023	2	15
Alimentation	1	4.30	5.5	311	nb-3	2023	2	15
Alimentation	1	6.45	5.5	311	nb-4	2023	2	15
Alimentation	1	2.00	5.5	311	nb-5	2023	2	15
Kanelbulle	1	3.00	5.5	312	c-Kanelbulle	2023	2	15
Sandwich EMP	1	6.00	5.5	312	c-Sandwich EMP	2023	2	15
Sandwich EMP	1	6.00	5.5	313	c-Sandwich EMP	2023	2	15
Pepparkaka Jul plåtburk	1	10.95	5.5	314	395	2023	2	15
Semla	3	12.00	5.5	314	c-Semla	2023	2	15
Alimentation	1	12.00	5.5	315	nb-1	2023	2	15
Assiette saumon	1	0.00	5.5	316	M_5	2023	2	15
Entrée - Plat	1	22.00	5.5	316	M_8	2023	2	15
Pavé de saumon	1	18.00	5.5	316	M_21	2023	2	15
Boulettes de viande	1	0.00	5.5	316	M_1	2023	2	15
Loka Citron	2	4.00	5.5	316	305	2023	2	15
Semla	1	4.00	5.5	317	c-Semla	2023	2	15
Loka Citron	1	2.00	5.5	317	305	2023	2	15
Ättikssprit 12%	1	4.50	5.5	317	26	2023	2	15
Boulettes de viande	1	16.00	5.5	318	M_1	2023	2	15
Boulettes de viande	1	16.00	5.5	318	M_1	2023	2	15
Kanelbulle	1	3.00	5.5	318	c-Kanelbulle	2023	2	15
Café/Thé	1	2.00	5.5	318	c-Café/Thé	2023	2	15
Poëlée Pytt i Panna	1	16.00	5.5	319	M_3	2023	2	15
Poëlée Pytt i Panna	1	16.00	5.5	319	M_3	2023	2	15
Kanelbulle	1	3.00	5.5	319	c-Kanelbulle	2023	2	15
Café/Thé	2	4.00	5.5	319	c-Café/Thé	2023	2	15
Finn Crisp caraway	1	4.95	5.5	319	127	2023	2	15
Tvålull 100g Bra miljöval	1	4.95	20	320	692	2023	2	15
Rödbetor aptit skivad	1	3.95	5.5	320	459	2023	2	15
Marsan vaniljsås färdig	2	9.90	5.5	320	350	2023	2	15
​ Smörgåsgurka 370g	1	5.50	5.5	320	507	2023	2	15
Mandelmassa 500g	1	14.95	5.5	320	330	2023	2	15
Falu Råg-rut Knäckebröd	1	5.95	5.5	320	111	2023	2	15
Sac	1	0.10	5.5	320	c-Sac	2023	2	15
Svartvinbärssaft	1	9.95	5.5	321	525	2023	2	15
Alimentation	3	13.50	5.5	322	nb-1	2023	2	15
Vaniljsocker	2	7.90	5.5	323	768	2023	2	15
Marabou 30 praliner med nougatfyllning	1	9.95	5.5	323	333	2023	2	15
Festis Päron EKO BRIK	1	2.00	5.5	323	120	2023	2	15
Semlor x4	1	15.00	5.5	323	c-Semlor x4	2023	2	15
Kalles kaviar original	1	5.50	5.5	324	773	2023	2	15
Fiskbullar i dillsås	1	6.95	5.5	324	132	2023	2	15
Alimentation	3	15.00	5.5	325	nb-1	2023	2	15
Alimentation	1	3.00	5.5	326	nb-1	2023	2	15
Brunost	1	17.95	5.5	326	51	2023	2	15
Noblesse Mörk Choklad Krisp	1	6.95	5.5	327	371	2023	2	15
Finn Crisp Original	1	4.95	5.5	328	128	2023	2	15
Semlor x4	1	15.00	5.5	328	c-Semlor x4	2023	2	15
Assiette nordique - Saumon	1	18.00	5.5	329	M_33	2023	2	15
Assiette nordique - Saumon	1	18.00	5.5	329	M_33	2023	2	15
Mariestads Öl 3.5% 50cL	1	3.50	5.5	329	349	2023	2	15
Alimentation	1	4.00	5.5	329	nb-4	2023	2	15
Bullar x4	3	30.00	5.5	329	c-Bullar x4	2023	2	15
Magazine	1	10.50	2.1	329	nb-6	2023	2	15
Décoration/Alcool	1	6.00	20	329	nb-7	2023	2	15
Décoration/Alcool	1	13.00	20	329	nb-8	2023	2	15
Décoration/Alcool	1	12.95	20	329	nb-9	2023	2	15
Yes Original	1	9.95	20	329	699	2023	2	15
Décoration/Alcool	1	4.50	20	329	nb-11	2023	2	15
Décoration/Alcool	1	8.28	5.5	329	nb-12	2023	2	15
Rekorderlig Päron Cider	1	3.50	5.5	329	449	2023	2	15
Estrella dillchips	1	4.20	5.5	329	84	2023	2	15
Finn Crisp Original	2	9.90	5.5	330	128	2023	2	15
Piffi Allkrydda	1	5.75	5.5	331	399	2023	2	15
Bullar x4	1	10.00	5.5	332	c-Bullar x4	2023	2	15
Rågkusar osötad Tina och servera	1	8.95	5.5	332	434	2023	2	15
Delicatoboll singel	4	6.00	5.5	333	80	2023	2	15
Bullar x4	2	20.00	5.5	333	c-Bullar x4	2023	2	15
Läkerol Salmiak	3	6.30	5.5	333	281	2023	2	15
Magazine	1	10.50	2.1	333	nb-4	2023	2	15
Finn Crisp Original	1	4.95	5.5	334	128	2023	2	15
Delicatoboll singel	1	1.50	5.5	334	80	2023	2	15
Finn Crisp caraway	1	4.95	5.5	335	127	2023	2	15
Magazine	1	5.00	5.5	335	nb-2	2023	2	15
Kanelbulle	1	3.00	5.5	335	c-Kanelbulle	2023	2	15
Café/Thé	3	6.00	5.5	335	c-Café/Thé	2023	2	15
Sac	1	0.10	5.5	335	c-Sac	2023	2	15
Finn Crisp caraway	1	4.95	5.5	336	127	2023	2	15
Delikatess Sesam knäcke	1	5.95	5.5	336	82	2023	2	15
Décoration/Alcool	2	15.90	20	336	nb-4	2023	2	15
Décoration/Alcool	1	4.50	5.5	336	nb-4	2023	2	15
Décoration/Alcool	1	5.00	5.5	336	nb-5	2023	2	15
Pepparkaka Jul plåtburk	2	21.90	5.5	337	395	2023	2	15
Skagenröra	1	5.95	5.5	337	491	2023	2	15
Skärgårdssill	1	4.95	5.5	337	492	2023	2	15
Finn Crisp caraway	1	4.95	5.5	337	127	2023	2	15
Ahlgrens bilar lakrits däck	1	2.95	5.5	337	10	2023	2	15
Hallon/Lakrits Skalle	1	2.50	5.5	337	182	2023	2	15
Alimentation	1	2.72	5.5	337	nb-7	2023	2	15
Kardemumbulle	1	3.00	5.5	337	c-Kardemumbulle	2023	2	15
Sac	1	0.10	5.5	337	c-Sac	2023	2	15
Décoration/Alcool	1	80.00	20	338	nb-1	2023	2	15
Hovmästarsås glasburk	1	4.50	5.5	339	200	2023	2	15
Mästar matjessill	1	5.95	5.5	339	771	2023	2	15
Finn Crisp caraway	1	4.95	5.5	339	127	2023	2	15
Inlagd Sill	1	4.95	5.5	339	206	2023	2	15
Kanelbulle	1	3.00	5.5	340	c-Kanelbulle	2023	2	15
Magazine	1	5.95	2.1	340	nb-2	2023	2	15
Pommac 1.4L	1	4.00	5.5	341	415	2023	2	15
Fiskbullar i dillsås	1	6.95	5.5	341	132	2023	2	15
Bullar x4	1	10.00	5.5	341	c-Bullar x4	2023	2	15
Semla	2	8.00	5.5	341	c-Semla	2023	2	15
Loka Päron	1	2.00	5.5	341	316	2023	2	15
Kanelbulle	1	3.00	5.5	342	c-Kanelbulle	2023	2	15
Prinskorv	1	6.95	5.5	342	424	2023	2	15
Estrella linschips sourcream onion	1	3.95	5.5	342	741	2023	2	15
Djungelvrål	1	1.95	5.5	342	101	2023	2	15
Magazine	1	5.42	5.5	342	nb-5	2023	2	15
Gravad Lax 150g Korshags	1	13.95	5.5	344	167	2023	2	15
Magazine	1	6.95	5.5	344	nb-2	2023	2	15
Finn Crisp Original	4	19.80	5.5	345	128	2023	2	16
Kanelbulle	1	3.00	5.5	346	c-Kanelbulle	2023	2	16
Blabärsbulle	1	3.00	5.5	346	c-Blabärsbulle	2023	2	16
Kanelbulle	1	3.00	5.5	347	c-Kanelbulle	2023	2	16
Blabärsbulle	1	3.00	5.5	347	c-Blabärsbulle	2023	2	16
Kardemumbulle	1	3.00	5.5	348	c-Kardemumbulle	2023	2	16
Semla	1	4.00	5.5	349	c-Semla	2023	2	16
Kanelbulle	1	3.00	5.5	349	c-Kanelbulle	2023	2	16
Café/Thé	2	4.00	5.5	349	c-Café/Thé	2023	2	16
Décoration/Alcool	1	5.95	20	350	nb-2	2023	2	16
Alimentation	1	1.00	5.5	350	nb-1	2023	2	16
Citronpeppar glasburk	1	3.95	5.5	350	70	2023	2	16
Potatismjöl	1	3.30	5.5	350	416	2023	2	16
Bullar x4	1	10.00	5.5	351	c-Bullar x4	2023	2	16
Små delikatess köttbullar	1	9.95	5.5	352	501	2023	2	16
Runda Kanel	1	5.95	5.5	353	464	2023	2	16
Pepparkakor Annas	1	5.95	5.5	353	396	2023	2	16
Delicatoboll singel	2	3.00	5.5	353	80	2023	2	16
Kung Oscar pepparkakor	1	5.95	5.5	354	746	2023	2	16
Froosh Peach & Passion Fruit	1	4.50	5.5	355	148	2023	2	16
Kanelbulle	2	6.00	5.5	355	c-Kanelbulle	2023	2	16
Froosh Mango Orange	1	4.50	5.5	355	147	2023	2	16
Fiskbullar i buljong	2	13.90	5.5	356	131	2023	2	16
Brunost	1	17.95	5.5	356	51	2023	2	16
Räksallad	1	5.95	5.5	356	441	2023	2	16
Skagenröra	1	5.95	5.5	356	491	2023	2	16
Boulettes de viande	1	16.00	5.5	357	M_1	2023	2	16
Bullar x4	2	20.00	5.5	357	c-Bullar x4	2023	2	16
Café/Thé	1	2.00	5.5	387	c-Café/Thé	2023	2	17
Alimentation	2	13.90	5.5	387	nb-12	2023	2	17
Alimentation	1	1.20	5.5	397	nb-2	2023	2	17
Dippmix Ranch	1	1.95	5.5	415	97	2023	2	17
Kanelbulle	1	3.00	5.5	428	c-Kanelbulle	2023	2	18
Bullar x4	1	10.00	5.5	437	c-Bullar x4	2023	2	18
Magazine	1	5.95	2.1	446	nb-8	2023	2	18
Kanelbulle	1	3.00	5.5	458	c-Kanelbulle	2023	2	18
Gammeldags enrisrökt korv	1	8.95	5.5	470	157	2023	2	18
Kanel x4	1	10.00	5.5	479	c-Kanel x4	2023	2	19
Alimentation	1	16.00	5.5	494	nb-2	2023	2	19
Semla	2	8.00	5.5	503	c-Semla	2023	2	19
Singoalla original	1	4.50	5.5	509	490	2023	2	19
Bullar x4	1	10.00	5.5	523	c-Bullar x4	2023	2	19
Kalles kaviar original	2	11.00	5.5	535	773	2023	2	21
Inlagd Sill	1	4.95	5.5	535	206	2023	2	21
Décoration/Alcool	1	4.95	20	542	nb-7	2023	2	21
Kardemumbulle	1	3.00	5.5	555	c-Kardemumbulle	2023	2	21
Kardemumbulle	1	3.00	5.5	566	c-Kardemumbulle	2023	2	21
Loka mango lime	1	2.00	5.5	580	734	2023	2	21
Polarbröd Rågkaka	1	8.95	5.5	587	407	2023	2	21
Décoration/Alcool	1	12.00	20	595	nb-9	2023	2	21
Läkerol Original	1	2.10	5.5	605	278	2023	2	21
Assiette de hareng	1	0.00	5.5	615	M_4	2023	2	22
Husman	2	7.90	5.5	623	201	2023	2	22
Kanel x4	1	10.00	5.5	636	c-Kanel x4	2023	2	22
Café/Thé	1	2.00	5.5	649	c-Café/Thé	2023	2	22
Kanelbulle	2	6.00	5.5	660	c-Kanelbulle	2023	2	23
Semla	1	4.00	5.5	673	c-Semla	2023	2	23
Ahlgrens bilar	2	5.90	5.5	679	8	2023	2	23
Tunnbröd Litet	1	6.95	5.5	683	541	2023	2	23
Décoration/Alcool	1	3.95	5.5	693	nb-9	2023	2	23
Semla	1	4.00	5.5	704	c-Semla	2023	2	24
Café/Thé	1	2.00	5.5	709	c-Café/Thé	2023	2	24
Kanelbulle	1	3.00	5.5	722	c-Kanelbulle	2023	2	24
Prickig korv skiv	1	3.95	5.5	730	422	2023	2	24
Boulettes de viande	1	16.00	5.5	741	M_1	2023	2	25
Kex Chocklad	1	2.00	5.5	748	239	2023	2	25
Skärgårdssill	1	4.95	5.5	753	492	2023	2	25
5-minuters Sill	1	7.95	5.5	761	4	2023	2	25
Nyponsoppa Utan Tillsatt Socker	1	5.95	5.5	765	378	2023	2	25
Semlor x4	1	15.00	5.5	775	c-Semlor x4	2023	2	25
Saumon filet nature	1	10.95	5.5	787	736	2023	2	26
Pavé de saumon	1	18.00	5.5	796	M_21	2023	2	26
Kardemumbulle	1	3.00	5.5	809	c-Kardemumbulle	2023	2	26
Saffransbulle	1	3.00	5.5	822	c-Saffransbulle	2023	2	26
Läkerol Licorice Seasalt	1	2.10	5.5	357	277	2023	2	16
Jordnötsringar	1	3.50	5.5	364	214	2023	2	16
Kalles kaviar original	1	5.50	5.5	368	773	2023	2	16
Alimentation	2	3.00	5.5	373	nb-5	2023	2	16
Cheez doodles 35g	2	3.00	20	379	62	2023	2	17
Semla	1	4.00	5.5	387	c-Semla	2023	2	17
Alimentation	2	3.00	5.5	387	nb-13	2023	2	17
Alimentation	1	22.00	5.5	398	nb-1	2023	2	17
Ahlgrens bilar	1	2.95	5.5	415	8	2023	2	17
Décoration/Alcool	1	11.20	5.5	428	nb-5	2023	2	18
Falukorv ring Sverige	1	10.95	5.5	438	112	2023	2	18
Bullar x4	1	10.00	5.5	446	c-Bullar x4	2023	2	18
Semla	1	4.00	5.5	458	c-Semla	2023	2	18
Små delikatess köttbullar	1	9.95	5.5	470	501	2023	2	18
Kanelbulle	1	3.00	5.5	479	c-Kanelbulle	2023	2	19
Entrée - Plat	1	22.00	5.5	494	M_8	2023	2	19
Café/Thé	2	4.00	5.5	503	c-Café/Thé	2023	2	19
Kanel x4	1	10.00	5.5	510	c-Kanel x4	2023	2	19
Bullar x4	1	10.00	5.5	524	c-Bullar x4	2023	2	19
Potatissallad	1	5.95	5.5	535	418	2023	2	21
Finn Crisp Original	1	4.95	5.5	543	128	2023	2	21
Assiette nordique - Saumon	1	18.00	5.5	556	M_33	2023	2	21
Loka Citron	1	2.00	5.5	566	305	2023	2	21
Alimentation	1	3.04	5.5	580	nb-3	2023	2	21
Semla	1	4.00	5.5	588	c-Semla	2023	2	21
Skogaholmslimpa skiv Tina och servera	1	6.95	5.5	596	498	2023	2	21
Sandwich cheese paprika	1	2.00	5.5	605	473	2023	2	21
Boulettes de viande	1	0.00	5.5	615	M_1	2023	2	22
Inlagd Sill	1	8.95	5.5	623	207	2023	2	22
Kardemum x4	1	10.00	5.5	636	c-Kardemum x4	2023	2	22
Alimentation	1	40.00	5.5	650	nb-1	2023	2	22
Rårörda lingon	2	17.89	5.5	661	447	2023	2	23
Alimentation	1	2.50	5.5	673	nb-7	2023	2	23
Viol Tablettask	2	2.60	5.5	679	558	2023	2	23
Polarbröd Rågkaka	1	8.95	5.5	683	407	2023	2	23
Semla	1	4.00	5.5	694	c-Semla	2023	2	23
Magazine	1	7.50	2.1	704	nb-5	2023	2	24
Kardemumbulle	1	3.00	5.5	709	c-Kardemumbulle	2023	2	24
Café/Thé	1	2.00	5.5	722	c-Café/Thé	2023	2	24
Semla	2	8.00	5.5	730	c-Semla	2023	2	24
Boulettes de viande	1	16.00	5.5	741	M_1	2023	2	25
Semla	1	4.00	5.5	748	c-Semla	2023	2	25
Slotts senap original tub	1	5.95	5.5	753	481	2023	2	25
Inlagd Sill	1	4.95	5.5	761	206	2023	2	25
Décoration/Alcool	1	10.40	5.5	765	nb-5	2023	2	25
Décoration/Alcool	1	5.00	5.5	775	nb-5	2023	2	25
Dippmix Ranch	1	1.95	5.5	788	97	2023	2	26
Poëlée Pytt i Panna	1	16.00	5.5	796	M_3	2023	2	26
Rödbetssallad 400g	1	6.50	5.5	809	462	2023	2	26
Kex Chocklad	3	6.00	5.5	823	239	2023	2	26
Froosh Mango Orange	1	4.50	5.5	357	147	2023	2	16
Décoration/Alcool	1	6.00	5.5	364	nb-6	2023	2	16
Skärgårdssill	1	4.95	5.5	368	492	2023	2	16
Alimentation	1	8.95	5.5	373	nb-6	2023	2	16
Ballerina Original	1	4.50	5.5	379	30	2023	2	17
Inlagd Sill	1	4.95	5.5	387	206	2023	2	17
Alimentation	1	4.50	5.5	387	nb-14	2023	2	17
Alimentation	1	22.00	5.5	399	nb-1	2023	2	17
Djungelvrål	1	1.95	5.5	415	101	2023	2	17
Bullar x4	2	20.00	5.5	429	c-Bullar x4	2023	2	18
Ahlgrens bilar	1	2.95	5.5	438	8	2023	2	18
Magazine	1	5.00	5.5	446	nb-10	2023	2	18
Alimentation	1	2.00	5.5	458	nb-5	2023	2	18
Slotts senap original tub	1	5.95	5.5	470	481	2023	2	18
Bullar x4	1	10.00	5.5	480	c-Bullar x4	2023	2	19
Husman	1	3.95	5.5	494	201	2023	2	19
Sac	1	0.10	5.5	503	c-Sac	2023	2	19
Räkost	1	8.95	5.5	511	438	2023	2	19
Kalles kaviar original	1	5.50	5.5	525	773	2023	2	19
Rödbetssallad 400g	1	6.50	5.5	535	462	2023	2	21
Knäckebröd Frukost	1	5.50	5.5	543	255	2023	2	21
Café/Thé	1	2.00	5.5	556	c-Café/Thé	2023	2	21
Semlor x4	1	15.00	5.5	567	c-Semlor x4	2023	2	21
Dippmix Dill & Gräslök	1	1.95	5.5	580	95	2023	2	21
Décoration/Alcool	1	5.00	5.5	589	nb-2	2023	2	21
Klassiska Köttbullar	1	12.95	5.5	596	247	2023	2	21
Smoothie blåbär hallon ENGL	1	3.50	5.5	606	504	2023	2	21
Entrée - Plat	1	22.00	5.5	615	M_8	2023	2	22
Fiskbullar i buljong	1	6.95	5.5	623	131	2023	2	22
Bullar x4	1	10.00	5.5	636	c-Bullar x4	2023	2	22
Kanel x4	1	10.00	5.5	651	c-Kanel x4	2023	2	23
Jordnötsringar	1	3.50	5.5	661	214	2023	2	23
Alimentation	1	2.90	5.5	674	nb-1	2023	2	23
Alimentation	1	1.32	5.5	680	nb-7	2023	2	23
Bullar x4	1	10.00	5.5	684	c-Bullar x4	2023	2	23
Zingo apelsin	1	2.00	5.5	694	786	2023	2	23
Cheez doodles 35g	1	1.50	20	704	62	2023	2	24
Falukorv ring Sverige	4	43.80	5.5	710	112	2023	2	24
Bullar x4	1	10.00	5.5	723	c-Bullar x4	2023	2	24
Estrella dillchips	1	4.20	5.5	731	84	2023	2	24
Semla	1	4.00	5.5	741	c-Semla	2023	2	25
Assiette nordique	1	8.00	5.5	749	M_35	2023	2	25
Mästar matjessill	1	5.95	5.5	753	771	2023	2	25
​ Smörgåsgurka 370g	1	5.50	5.5	761	507	2023	2	25
Knäcke rund brungräddat	1	7.95	5.5	766	250	2023	2	25
Kung Oscar pepparkakor	1	5.95	5.5	775	746	2023	2	25
Estrella chips grill	1	4.20	5.5	788	172	2023	2	26
Plat végétarien	1	16.00	5.5	796	M_36	2023	2	26
Café/Thé	2	4.00	5.5	810	c-Café/Thé	2023	2	26
Rekorderlig Päron Cider	2	7.00	5.5	823	449	2023	2	26
Magazine	1	6.80	2.1	357	nb-6	2023	2	16
Semlor x4	1	15.00	5.5	365	c-Semlor x4	2023	2	16
Bullar x4	1	10.00	5.5	368	c-Bullar x4	2023	2	16
Alimentation	4	6.00	5.5	373	nb-7	2023	2	16
Kanelbulle	2	6.00	5.5	379	c-Kanelbulle	2023	2	17
Fiskbullar i hummersås MSC	1	6.95	5.5	387	133	2023	2	17
Punschrulle singel	1	1.50	5.5	387	430	2023	2	17
Alimentation	1	19.00	5.5	400	nb-1	2023	2	17
Décoration/Alcool	1	1.00	5.5	415	nb-6	2023	2	17
Bullar x4	1	10.00	5.5	430	c-Bullar x4	2023	2	18
Magazine	1	11.00	2.1	438	nb-1	2023	2	18
Dumle sachet 120g	1	4.50	5.5	447	827	2023	2	18
Alimentation	1	6.95	5.5	459	nb-1	2023	2	18
Décoration/Alcool	1	14.95	20	470	nb-6	2023	2	18
Bullar x4	1	10.00	5.5	481	c-Bullar x4	2023	2	19
Blabärsbulle	1	3.00	5.5	494	c-Blabärsbulle	2023	2	19
Skinkost 175g	2	15.90	5.5	504	496	2023	2	19
Fransk Lök Sill	1	4.95	5.5	511	140	2023	2	19
Ättika 24%	1	3.95	5.5	525	25	2023	2	19
Små delikatess köttbullar	2	19.89	5.5	535	501	2023	2	21
Husman	1	3.95	5.5	543	201	2023	2	21
Loka mango lime	1	2.00	5.5	556	734	2023	2	21
Billys pizza original	2	6.00	5.5	567	402	2023	2	21
Mazarin singel	2	3.00	5.5	581	353	2023	2	21
Semlor x4	1	15.00	5.5	589	c-Semlor x4	2023	2	21
Noblesse Original Crisp	1	6.95	5.5	596	372	2023	2	21
Décoration/Alcool	1	12.95	20	607	nb-1	2023	2	22
Semla	2	8.00	5.5	616	c-Semla	2023	2	22
Semla	1	4.00	5.5	624	c-Semla	2023	2	22
Semla	2	8.00	5.5	636	c-Semla	2023	2	22
Bullar x4	1	10.00	5.5	651	c-Bullar x4	2023	2	23
Alimentation	1	0.01	5.5	661	nb-3	2023	2	23
Kex Chocklad	2	4.00	5.5	674	239	2023	2	23
Sac	1	0.10	5.5	680	c-Sac	2023	2	23
Läkerol Eucalyptus	2	4.20	5.5	685	276	2023	2	23
Kardemumbulle	2	6.00	5.5	694	c-Kardemumbulle	2023	2	23
Décoration/Alcool	1	2.95	20	704	nb-7	2023	2	24
Semla	2	8.00	5.5	710	c-Semla	2023	2	24
Décoration/Alcool	1	4.95	20	723	nb-2	2023	2	24
Cheez doodles 160g	1	4.20	5.5	731	63	2023	2	24
Kardemumbulle	1	3.00	5.5	741	c-Kardemumbulle	2023	2	25
Soupe aux pois cassé/lardons	1	8.00	5.5	749	M_19	2023	2	25
Semlor x4	1	15.00	5.5	753	c-Semlor x4	2023	2	25
Mariestads Öl 3.5% 50cL	1	3.50	5.5	761	349	2023	2	25
Dippmix Fresh Island	2	3.90	5.5	766	96	2023	2	25
Gravad Lax 150g Korshags	1	13.95	5.5	776	167	2023	2	25
Bullar x4	1	10.00	5.5	788	c-Bullar x4	2023	2	26
Kanelbulle	2	6.00	5.5	796	c-Kanelbulle	2023	2	26
Kanelbulle	1	3.00	5.5	810	c-Kanelbulle	2023	2	26
Lingonsylt	1	8.95	5.5	823	300	2023	2	26
Semla	1	4.00	5.5	357	c-Semla	2023	2	16
Alimentation	2	10.00	5.5	366	nb-1	2023	2	16
Décoration/Alcool	8	39.60	20	366	nb-11	2023	2	16
Knäcke rund brungräddat	1	7.95	5.5	369	250	2023	2	16
Alimentation	1	5.78	5.5	373	nb-8	2023	2	16
Zoo Tablettask	2	3.00	20	379	567	2023	2	17
Tvålull 100g Bra miljöval	1	4.95	20	387	692	2023	2	17
Alimentation	1	22.00	5.5	401	nb-1	2023	2	17
Semla	3	12.00	5.5	416	c-Semla	2023	2	17
Knäcke rund brungräddat	1	7.95	5.5	430	250	2023	2	18
Fullkornsvälling 1 år	2	29.90	5.5	438	155	2023	2	18
Ahlgrens bilar Sursockrade	1	2.95	5.5	447	11	2023	2	18
Bullar x4	1	10.00	5.5	459	c-Bullar x4	2023	2	18
Rödbetor aptit skivad	1	3.95	5.5	470	459	2023	2	18
Dipmix Sourcream onion	1	1.95	5.5	481	94	2023	2	19
Festis Hallon EKO BRIK	1	2.00	5.5	494	119	2023	2	19
Mästar matjessill	1	5.95	5.5	504	771	2023	2	19
Skärgårdssill	1	4.95	5.5	511	492	2023	2	19
Rårörda lingon	1	8.95	5.5	525	447	2023	2	19
Felix Krögarpytt Klassisk	2	15.90	5.5	535	117	2023	2	21
Rödbetor aptit skivad	1	3.95	5.5	535	459	2023	2	21
Décoration/Alcool	1	49.00	5.5	543	nb-4	2023	2	21
Café/Thé	1	2.00	5.5	557	c-Café/Thé	2023	2	21
Café/Thé	1	2.00	5.5	568	c-Café/Thé	2023	2	21
Plopp dubbel stycksak	1	1.70	5.5	581	405	2023	2	21
Kex Chocklad	1	2.00	5.5	589	239	2023	2	21
Noblesse Mörk Choklad Krisp	1	6.95	5.5	596	371	2023	2	21
Décoration/Alcool	1	2.00	5.5	607	nb-2	2023	2	22
Kex Chocklad	3	6.00	5.5	616	239	2023	2	22
Semla	1	4.00	5.5	625	c-Semla	2023	2	22
Rödbetssallad	1	4.95	5.5	636	461	2023	2	22
Flädersaft	1	9.95	5.5	652	137	2023	2	23
Dippmix Dill & Gräslök	1	1.95	5.5	661	95	2023	2	23
Semla	1	4.00	5.5	674	c-Semla	2023	2	23
Cheez doodles 160g	1	4.20	5.5	680	63	2023	2	23
Läkerol Bon Bons	1	2.10	5.5	685	273	2023	2	23
Kardemumbulle	2	6.00	5.5	695	c-Kardemumbulle	2023	2	23
Läkerol Cassis	1	2.10	5.5	704	275	2023	2	24
Semlor x4	1	15.00	5.5	712	c-Semlor x4	2023	2	24
Magazine	1	5.95	2.1	723	nb-3	2023	2	24
Salt Skalle	1	2.50	5.5	731	469	2023	2	24
Bullar x4	1	10.00	5.5	741	c-Bullar x4	2023	2	25
Décoration/Alcool	1	3.50	20	749	nb-4	2023	2	25
Bullar x4	1	10.00	5.5	754	c-Bullar x4	2023	2	25
Grebbestads® Ansjovisfilé Original	1	6.95	5.5	761	171	2023	2	25
Marschaller med lock ø103mm brinntid 8tim	1	3.95	20	766	621	2023	2	25
Semper pepparkakor GF	1	5.90	5.5	776	766	2023	2	25
Bullar x4	1	10.00	5.5	789	c-Bullar x4	2023	2	26
Semlor x4	1	15.00	5.5	797	c-Semlor x4	2023	2	26
Saffransbulle	1	3.00	5.5	810	c-Saffransbulle	2023	2	26
Kanel x4	2	20.00	5.5	824	c-Kanel x4	2023	2	26
Magazine	2	2.00	5.5	358	nb-1	2023	2	16
Décoration/Alcool	1	29.50	20	366	nb-2	2023	2	16
Alimentation	1	5.00	5.5	370	nb-1	2023	2	16
Alimentation	1	2.00	5.5	373	nb-9	2023	2	16
Café/Thé	1	2.00	5.5	380	c-Café/Thé	2023	2	17
​ Smörgåsgurka 370g	1	5.50	5.5	387	507	2023	2	17
Knäcke trekant brungräddat	2	7.00	5.5	402	253	2023	2	17
Rödbetor aptit skivad	1	3.95	5.5	417	459	2023	2	17
Slotts senap original tub	1	7.95	5.5	430	483	2023	2	18
Gott & Blandat Original	1	2.95	5.5	438	160	2023	2	18
Tyrkisk Peber Original	1	3.50	5.5	447	545	2023	2	18
Alimentation	2	8.00	5.5	460	nb-1	2023	2	18
Décoration/Alcool	1	1.00	5.5	471	nb-1	2023	2	18
Gulaschsoppa Österrikisk	1	7.95	5.5	481	180	2023	2	19
Loka Päron	1	2.00	5.5	494	316	2023	2	19
Décoration/Alcool	1	7.95	20	504	nb-4	2023	2	19
Kanelbulle	1	3.00	5.5	512	c-Kanelbulle	2023	2	19
Ströbröd	1	4.50	5.5	525	520	2023	2	19
Alimentation	1	6.00	5.5	535	nb-10	2023	2	21
Décoration/Alcool	1	8.00	5.5	543	nb-5	2023	2	21
Sandwich tomat basilika	5	10.50	5.5	557	477	2023	2	21
Semla	2	8.00	5.5	568	c-Semla	2023	2	21
Grebbestads® Ansjovisfilé Original	1	6.95	5.5	581	171	2023	2	21
Dippmix Fresh Island	2	3.90	5.5	589	96	2023	2	21
Semla	1	4.00	5.5	597	c-Semla	2023	2	21
Kanelbulle	1	3.00	5.5	607	c-Kanelbulle	2023	2	22
Mjölkchoklad Kaka	1	3.10	5.5	616	362	2023	2	22
Djungelvrål	1	1.95	5.5	626	101	2023	2	22
Prickig korv skiv	1	3.95	5.5	636	422	2023	2	22
Kalles kaviar randiga	2	9.00	5.5	653	774	2023	2	23
Alimentation	1	3.12	5.5	662	nb-1	2023	2	23
Sac	1	0.10	5.5	674	c-Sac	2023	2	23
Estrella dillchips	1	4.20	5.5	680	84	2023	2	23
Läkerol Cactus	1	2.10	5.5	685	274	2023	2	23
Semla	1	4.00	5.5	695	c-Semla	2023	2	23
Semlor x4	1	15.00	5.5	705	c-Semlor x4	2023	2	24
Assiette nordique	1	8.00	5.5	713	M_35	2023	2	24
Magazine	1	5.00	5.5	724	nb-1	2023	2	24
Décoration/Alcool	1	5.40	5.5	731	nb-5	2023	2	24
Alimentation	1	2.30	5.5	741	nb-6	2023	2	25
Boulettes de viande	1	16.00	5.5	749	M_1	2023	2	25
Daim Chokladkaka	1	3.10	5.5	754	77	2023	2	25
Slotts senap original tub	1	5.95	5.5	761	481	2023	2	25
Klassiska Köttbullar	1	12.95	5.5	767	247	2023	2	25
Ballerina kladdkaka	1	4.50	5.5	776	29	2023	2	25
Magazine	1	8.50	2.1	790	nb-1	2023	2	26
Mandel biskvier	1	3.50	5.5	790	325	2023	2	26
Festis Hallon EKO BRIK	1	2.00	5.5	798	119	2023	2	26
Semla	2	8.00	5.5	811	c-Semla	2023	2	26
Café/Thé	2	4.00	5.5	824	c-Café/Thé	2023	2	26
Magazine	2	11.90	5.5	358	nb-2	2023	2	16
Décoration/Alcool	1	39.95	5.5	366	nb-3	2023	2	16
Daim dubbel	1	2.00	5.5	370	78	2023	2	16
Kanelbulle	1	3.00	5.5	374	c-Kanelbulle	2023	2	16
Kanelbulle	1	3.00	5.5	380	c-Kanelbulle	2023	2	17
Åseda Gräddost 38%	1	17.95	5.5	387	24	2023	2	17
Grebbestads® Ansjovisfilé Original	2	13.90	5.5	402	171	2023	2	17
Felix Krögarpytt Klassisk	1	7.95	5.5	417	117	2023	2	17
Läkerol Licorice Seasalt	1	2.10	5.5	430	277	2023	2	18
Tyrkisk Peber Original	1	3.50	5.5	439	545	2023	2	18
Bullar x4	1	10.00	5.5	448	c-Bullar x4	2023	2	18
Alimentation	1	3.95	5.5	460	nb-2	2023	2	18
Sandwich cheese paprika	1	2.00	5.5	471	473	2023	2	18
Kanelbulle	1	3.00	5.5	482	c-Kanelbulle	2023	2	19
Grebbestads® Ansjovisfilé Original	2	13.90	5.5	495	171	2023	2	19
Smörgåsrån Vete	2	7.90	20	504	509	2023	2	19
Semla	2	8.00	5.5	513	c-Semla	2023	2	19
Bullar x4	2	20.00	5.5	526	c-Bullar x4	2023	2	19
Semla	2	8.00	5.5	536	c-Semla	2023	2	21
Semla	1	4.00	5.5	543	c-Semla	2023	2	21
Décoration/Alcool	1	15.00	5.5	557	nb-3	2023	2	21
Magazine	1	1.00	5.5	569	nb-1	2023	2	21
Tändstickor 8-Pack	1	3.95	20	581	690	2023	2	21
Sac	1	0.10	5.5	589	c-Sac	2023	2	21
Kanelbulle	1	3.00	5.5	598	c-Kanelbulle	2023	2	21
Café/Thé	1	2.00	5.5	607	c-Café/Thé	2023	2	22
Sac	1	0.10	5.5	616	c-Sac	2023	2	22
Boulettes de viande	1	16.00	5.5	627	M_1	2023	2	22
Cheez doodles 35g	1	1.50	20	636	62	2023	2	22
Knäcke rund brungräddat	1	7.95	5.5	653	250	2023	2	23
Poëlée Pytt i Panna	1	16.00	5.5	663	M_3	2023	2	23
Runda Kanel	1	5.95	5.5	675	464	2023	2	23
Delicatoboll singel	1	1.50	5.5	680	80	2023	2	23
Semla	1	4.00	5.5	685	c-Semla	2023	2	23
Café/Thé	1	2.00	5.5	695	c-Café/Thé	2023	2	23
Bullar x4	1	10.00	5.5	706	c-Bullar x4	2023	2	24
Assiette nordique	1	0.00	5.5	713	M_35	2023	2	24
Café/Thé	1	2.00	5.5	724	c-Café/Thé	2023	2	24
Gott & blandat Salt	1	2.95	5.5	731	161	2023	2	24
Ballerina kladdkaka	1	4.50	5.5	742	29	2023	2	25
Café/Thé	1	2.00	5.5	749	c-Café/Thé	2023	2	25
Marabou Black Saltlakrits	2	6.20	5.5	754	334	2023	2	25
Kanelbulle	1	3.00	5.5	761	c-Kanelbulle	2023	2	25
Alimentation	1	2.00	5.5	768	nb-1	2023	2	25
Décoration/Alcool	1	13.00	20	776	nb-4	2023	2	25
Magazine	1	5.80	2.1	790	nb-2	2023	2	26
Skärgårdssill	1	4.95	5.5	799	492	2023	2	26
Alimentation	1	10.00	5.5	812	nb-1	2023	2	26
Alimentation	2	11.90	5.5	358	nb-1	2023	2	16
Kung Oscar pepparkakor	1	5.95	5.5	366	746	2023	2	16
Inlagd Sill	1	4.95	5.5	370	206	2023	2	16
Blabärsbulle	1	3.00	5.5	374	c-Blabärsbulle	2023	2	16
Kardemumbulle	1	3.00	5.5	380	c-Kardemumbulle	2023	2	17
Små delikatess köttbullar	1	9.95	5.5	387	501	2023	2	17
Bregott extrasaltat	2	14.40	5.5	402	506	2023	2	17
Dipmix Rostad Paprika och Vitlök	4	7.80	5.5	418	93	2023	2	17
Hovmästarsås glasburk	1	4.50	5.5	430	200	2023	2	18
Lakrisal	1	1.20	5.5	439	283	2023	2	18
Mini croustades	1	7.50	5.5	449	758	2023	2	18
Café/Thé	1	2.00	5.5	461	c-Café/Thé	2023	2	18
Gott & blandat Salt	1	2.95	5.5	471	161	2023	2	18
Bullar x4	1	10.00	5.5	483	c-Bullar x4	2023	2	19
Rågkusar osötad Tina och servera	1	8.95	5.5	495	434	2023	2	19
Räkost	3	26.83	5.5	504	438	2023	2	19
Décoration/Alcool	1	0.50	5.5	513	nb-2	2023	2	19
M&m’s 100g	1	2.95	5.5	526	805	2023	2	19
Cheez doodles 160g	1	4.20	5.5	537	63	2023	2	21
Décoration/Alcool	1	8.00	5.5	544	nb-1	2023	2	21
Décoration/Alcool	1	16.00	5.5	558	nb-1	2023	2	21
Semla	1	4.00	5.5	569	c-Semla	2023	2	21
Marabou 30 praliner med nougatfyllning	1	9.95	5.5	581	333	2023	2	21
Semlor x4	1	15.00	5.5	590	c-Semlor x4	2023	2	21
Falukorv Sverige	1	5.95	5.5	599	113	2023	2	21
Décoration/Alcool	1	4.50	20	607	nb-5	2023	2	22
Semla	2	8.00	5.5	617	c-Semla	2023	2	22
Semla	1	4.00	5.5	627	c-Semla	2023	2	22
Prinskorv	1	3.00	5.5	636	424	2023	2	22
Knäcke rund normalgräddat	1	7.95	5.5	653	251	2023	2	23
Kardemumbulle	1	3.00	5.5	664	c-Kardemumbulle	2023	2	23
Boulettes de viande	1	16.00	5.5	675	M_1	2023	2	23
Viol Tablettask	2	2.60	5.5	680	558	2023	2	23
Café/Thé	2	4.00	5.5	685	c-Café/Thé	2023	2	23
Rödbetor aptit skivad	1	3.95	5.5	695	459	2023	2	23
Skagenröra	1	5.95	5.5	706	491	2023	2	24
Boulettes de viande	1	0.00	5.5	713	M_1	2023	2	24
Décoration/Alcool	2	13.90	20	725	nb-3	2023	2	24
Bullar x4	1	10.00	5.5	732	c-Bullar x4	2023	2	25
Ahlgrens bilar	1	2.95	5.5	742	8	2023	2	25
Semla	2	8.00	5.5	749	c-Semla	2023	2	25
Assiette saumon	1	8.00	5.5	755	M_5	2023	2	25
Kardemumbulle	1	3.00	5.5	761	c-Kardemumbulle	2023	2	25
Singoalla original	1	4.50	5.5	768	490	2023	2	25
Semla	1	4.00	5.5	776	c-Semla	2023	2	25
Décoration/Alcool	1	4.50	20	790	nb-3	2023	2	26
Grebbestads® Ansjovisfilé Original	1	6.95	5.5	799	171	2023	2	26
Kanelbulle	1	3.00	5.5	813	c-Kanelbulle	2023	2	26
Alimentation	2	2.00	5.5	358	nb-2	2023	2	16
Tändstickor	1	3.95	20	366	689	2023	2	16
Décoration/Alcool	6	3.00	5.5	366	nb-12	2023	2	16
Semlor x4	1	15.00	5.5	371	c-Semlor x4	2023	2	16
Ballerina Original	1	4.50	5.5	375	30	2023	2	16
Décoration/Alcool	1	1.00	20	381	nb-1	2023	2	17
Semla	1	4.00	5.5	388	c-Semla	2023	2	17
Alimentation	1	17.95	5.5	403	nb-2	2023	2	17
Dippmix Ranch	1	1.95	5.5	418	97	2023	2	17
Ballerina kladdkaka	1	4.50	5.5	430	29	2023	2	18
Smörgåsgurka 715g	2	15.00	5.5	440	508	2023	2	18
Kalles kaviar original	1	5.50	5.5	449	773	2023	2	18
Kanelbulle	2	6.00	5.5	461	c-Kanelbulle	2023	2	18
Dipmix Rostad Paprika och Vitlök	1	1.95	5.5	471	93	2023	2	18
Kanel x4	1	10.00	5.5	484	c-Kanel x4	2023	2	19
Kalles kaviar original	2	11.00	5.5	495	773	2023	2	19
Décoration/Alcool	1	6.00	5.5	504	nb-6	2023	2	19
Jordnötsringar	1	3.50	5.5	513	214	2023	2	19
Salta Katten	1	1.50	20	526	470	2023	2	19
Kex Chocklad	2	4.00	5.5	537	239	2023	2	21
Semla	1	4.00	5.5	544	c-Semla	2023	2	21
Semla	1	4.00	5.5	558	c-Semla	2023	2	21
Semla	2	8.00	5.5	570	c-Semla	2023	2	21
Frödinge Princesstårta	1	15.00	5.5	581	144	2023	2	21
Sac	1	0.10	5.5	590	c-Sac	2023	2	21
Blabärsbulle	1	3.00	5.5	599	c-Blabärsbulle	2023	2	21
Café/Thé	2	4.00	5.5	608	c-Café/Thé	2023	2	22
Alimentation	1	17.95	5.5	617	nb-2	2023	2	22
Bullar x4	1	10.00	5.5	627	c-Bullar x4	2023	2	22
Haribo nappar sur	1	0.75	5.5	637	753	2023	2	22
Skogaholmslimpa skiv Tina och servera	1	6.95	5.5	653	498	2023	2	23
Kanelbulle	1	3.00	5.5	665	c-Kanelbulle	2023	2	23
Boulettes de viande	1	16.00	5.5	675	M_1	2023	2	23
Kardemumbulle	1	3.00	5.5	680	c-Kardemumbulle	2023	2	23
Gravad Lax 150g Korshags	1	13.95	5.5	686	167	2023	2	23
Kex Chocklad	1	2.00	5.5	696	239	2023	2	23
Décoration/Alcool	1	10.00	5.5	706	nb-3	2023	2	24
Entrée - Plat	1	22.00	5.5	713	M_8	2023	2	24
Gula ärtor kapsel	1	3.95	5.5	725	179	2023	2	24
Skagenröra	1	5.95	5.5	732	491	2023	2	25
Poëlée Pytt i Panna	1	16.00	5.5	743	M_3	2023	2	25
Rårörda lingon	1	8.95	5.5	749	447	2023	2	25
Boulettes de viande	1	16.00	5.5	755	M_1	2023	2	25
Semla	1	4.00	5.5	761	c-Semla	2023	2	25
Semla	2	8.00	5.5	768	c-Semla	2023	2	25
Kardemumbulle	2	6.00	5.5	776	c-Kardemumbulle	2023	2	25
Décoration/Alcool	1	4.95	20	790	nb-4	2023	2	26
Ingefära malen påse	1	1.95	5.5	790	205	2023	2	26
Kallrökt Lax 150g Korshags	1	13.95	5.5	799	226	2023	2	26
Skärgårdssill	2	9.90	5.5	814	492	2023	2	26
Kanelbulle	1	3.00	5.5	360	c-Kanelbulle	2023	2	16
Décoration/Alcool	1	29.95	20	366	nb-6	2023	2	16
Semla	1	4.00	5.5	371	c-Semla	2023	2	16
Apelsinkrokant Chokladkaka	1	5.95	20	375	16	2023	2	16
Kardemumbulle	2	6.00	5.5	382	c-Kardemumbulle	2023	2	17
Assiette de hareng	1	8.00	5.5	388	M_4	2023	2	17
Semlor x4	1	15.00	5.5	404	c-Semlor x4	2023	2	17
Dipmix Sourcream onion	1	1.95	5.5	418	94	2023	2	17
Rekorderlig Päron Cider	1	3.50	5.5	430	449	2023	2	18
Kalles kaviar original	1	5.50	5.5	440	773	2023	2	18
Knäckebröd Frukost	1	5.50	5.5	450	255	2023	2	18
Estrella chips sourcream & onion	1	4.20	5.5	462	66	2023	2	18
Bullar x4	1	10.00	5.5	472	c-Bullar x4	2023	2	18
Blabärsbulle	1	3.00	5.5	484	c-Blabärsbulle	2023	2	19
Knäcke trekant brungräddat	1	3.50	5.5	495	253	2023	2	19
Kex Chocklad	2	4.00	5.5	505	239	2023	2	19
Décoration/Alcool	1	1.12	5.5	513	nb-4	2023	2	19
Singoalla original	2	9.00	5.5	526	490	2023	2	19
Magazine	1	6.60	2.1	537	nb-4	2023	2	21
Semlor x4	1	15.00	5.5	545	c-Semlor x4	2023	2	21
Café/Thé	1	2.00	5.5	558	c-Café/Thé	2023	2	21
Semla	1	4.00	5.5	571	c-Semla	2023	2	21
Alimentation	1	2.95	5.5	581	nb-7	2023	2	21
Semla	2	8.00	5.5	591	c-Semla	2023	2	21
Décoration/Alcool	1	5.00	5.5	599	nb-3	2023	2	21
Kanelbulle	2	6.00	5.5	608	c-Kanelbulle	2023	2	22
Gott & Blandat Original	1	2.95	5.5	617	160	2023	2	22
Boulettes de viande	1	16.00	5.5	628	M_1	2023	2	22
Froosh Mango Orange	1	2.25	5.5	637	147	2023	2	22
Alimentation	2	10.00	5.5	653	nb-5	2023	2	23
Pavé de saumon	1	18.00	5.5	666	M_21	2023	2	23
Kanelbulle	1	3.00	5.5	675	c-Kanelbulle	2023	2	23
Kanelbulle	1	3.00	5.5	680	c-Kanelbulle	2023	2	23
Alimentation	1	1.95	5.5	687	nb-1	2023	2	23
Semlor x4	1	15.00	5.5	697	c-Semlor x4	2023	2	24
Magazine	1	13.50	2.1	706	nb-4	2023	2	24
Décoration/Alcool	2	8.00	20	713	nb-5	2023	2	24
Semlor x4	1	15.00	5.5	725	c-Semlor x4	2023	2	24
Finkornig rom röd	1	9.95	5.5	732	770	2023	2	25
Assiette de hareng	1	0.00	5.5	743	M_4	2023	2	25
Semlor x4	1	15.00	5.5	750	c-Semlor x4	2023	2	25
Boulettes de viande	1	16.00	5.5	755	M_1	2023	2	25
Cheez doodles 35g	4	6.00	20	762	62	2023	2	25
Café/Thé	2	4.00	5.5	769	c-Café/Thé	2023	2	25
Blabärsbulle	2	6.00	5.5	777	c-Blabärsbulle	2023	2	25
Décoration/Alcool	1	5.95	20	790	nb-5	2023	2	26
Kanelbulle	1	1.50	5.5	799	c-Kanelbulle	2023	2	26
Café/Thé	2	4.00	5.5	815	c-Café/Thé	2023	2	26
Café/Thé	1	2.00	5.5	360	c-Café/Thé	2023	2	16
Décoration/Alcool	1	4.50	20	366	nb-7	2023	2	16
Estrella dillchips	1	4.20	5.5	371	84	2023	2	16
Alimentation	4	6.00	5.5	375	nb-3	2023	2	16
Café/Thé	1	2.00	5.5	382	c-Café/Thé	2023	2	17
Klassiska Köttbullar	1	12.95	5.5	388	247	2023	2	17
Oatly ikaffe	1	4.80	5.5	405	204	2023	2	17
Dippmix Fresh Island	1	1.95	5.5	418	96	2023	2	17
Bullar x4	1	10.00	5.5	431	c-Bullar x4	2023	2	18
Husman	1	3.95	5.5	440	201	2023	2	18
Räkost	1	8.95	5.5	450	438	2023	2	18
Rödbetor aptit skivad	1	3.95	5.5	462	459	2023	2	18
Café/Thé	1	2.00	5.5	472	c-Café/Thé	2023	2	18
Bullar x4	1	10.00	5.5	485	c-Bullar x4	2023	2	19
Kanelbulle	2	6.00	5.5	495	c-Kanelbulle	2023	2	19
Boulettes de viande	1	16.00	5.5	506	M_1	2023	2	19
Kanelbulle	2	6.00	5.5	506	c-Kanelbulle	2023	2	19
Décoration/Alcool	1	2.94	5.5	514	nb-1	2023	2	19
Semla	1	4.00	5.5	526	c-Semla	2023	2	19
Knäcke rund normalgräddat	1	7.95	5.5	537	251	2023	2	21
Sac	1	0.10	5.5	545	c-Sac	2023	2	21
Café/Thé	1	2.00	5.5	559	c-Café/Thé	2023	2	21
Semla	1	4.00	5.5	572	c-Semla	2023	2	21
Blabärsbulle	1	3.00	5.5	581	c-Blabärsbulle	2023	2	21
Alimentation	3	4.50	5.5	592	nb-1	2023	2	21
Décoration/Alcool	2	3.00	5.5	599	nb-4	2023	2	21
Läkerol Eucalyptus	2	4.20	5.5	608	276	2023	2	22
Daim Chokladkaka	1	3.10	5.5	617	77	2023	2	22
Bullar x4	1	10.00	5.5	628	c-Bullar x4	2023	2	22
Kardemumbulle	2	3.00	5.5	637	c-Kardemumbulle	2023	2	22
Café/Thé	2	4.00	5.5	653	c-Café/Thé	2023	2	23
Pavé de saumon	1	18.00	5.5	666	M_21	2023	2	23
Semla	1	4.00	5.5	675	c-Semla	2023	2	23
Estrella chips grill	1	4.20	5.5	675	172	2023	2	23
Smörgåsrån Vete	1	3.95	20	681	509	2023	2	23
Saffransbulle	1	3.00	5.5	688	c-Saffransbulle	2023	2	23
Alimentation	1	12.00	5.5	697	nb-2	2023	2	24
Décoration/Alcool	1	2.95	20	706	nb-5	2023	2	24
Serviette	2	7.00	20	713	641	2023	2	24
Décoration/Alcool	1	5.00	20	725	nb-4	2023	2	24
Knäcke trekant normalgräddat	1	3.50	5.5	732	254	2023	2	25
Boulettes de viande	1	0.00	5.5	743	M_1	2023	2	25
Estrella saltade chips	1	4.20	5.5	750	791	2023	2	25
Kardemumbulle	1	3.00	5.5	756	c-Kardemumbulle	2023	2	25
Kex Chocklad	2	4.00	5.5	762	239	2023	2	25
Kanelbulle	2	6.00	5.5	769	c-Kanelbulle	2023	2	25
OP Anderson baby	8	28.00	20	778	743	2023	2	25
Kanelbulle	1	3.00	5.5	790	c-Kanelbulle	2023	2	26
Blabärsbulle	1	1.50	5.5	799	c-Blabärsbulle	2023	2	26
Alimentation	1	4.00	5.5	816	nb-1	2023	2	26
Kanelbulle	1	3.00	5.5	361	c-Kanelbulle	2023	2	16
Vikingar Bok	1	16.00	20	366	697	2023	2	16
Loka Citron	1	2.00	5.5	366	305	2023	2	16
Räkost	1	8.95	5.5	371	438	2023	2	16
Saffransbulle	1	3.00	5.5	376	c-Saffransbulle	2023	2	16
Café/Thé	1	2.00	5.5	388	c-Café/Thé	2023	2	17
Marabou schweizer nöt 200g	1	5.95	5.5	405	799	2023	2	17
Alimentation	2	2.00	5.5	418	nb-5	2023	2	17
Skärgårdssill	1	4.95	5.5	432	492	2023	2	18
Frasvaflor 210g	1	2.95	5.5	440	829	2023	2	18
Magazine	2	10.00	5.5	450	nb-3	2023	2	18
Kanelbulle	1	3.00	5.5	462	c-Kanelbulle	2023	2	18
Semla	1	4.00	5.5	472	c-Semla	2023	2	18
Kardemumbulle	2	6.00	5.5	486	c-Kardemumbulle	2023	2	19
Semla	2	8.00	5.5	495	c-Semla	2023	2	19
Soupe aux pois cassé/lardons	1	8.00	5.5	506	M_19	2023	2	19
Décoration/Alcool	1	2.80	5.5	515	nb-1	2023	2	19
Kardemumbulle	2	6.00	5.5	527	c-Kardemumbulle	2023	2	19
Magazine	1	7.00	5.5	537	nb-5	2023	2	21
Sandwich EMP	1	6.00	5.5	546	c-Sandwich EMP	2023	2	21
Décoration/Alcool	1	16.00	5.5	559	nb-1	2023	2	21
Café/Thé	1	2.00	5.5	572	c-Café/Thé	2023	2	21
Café/Thé	1	2.00	5.5	581	c-Café/Thé	2023	2	21
Kalles kaviar randiga	2	9.00	5.5	592	774	2023	2	21
Décoration/Alcool	1	1.78	5.5	599	nb-5	2023	2	21
Djungelvrål	1	1.95	5.5	608	101	2023	2	22
Polarbröd Rågkaka	1	8.95	5.5	617	407	2023	2	22
Läkerol Original	3	6.30	5.5	629	278	2023	2	22
Marabou Schweizer nöt	1	3.10	5.5	638	346	2023	2	22
Semla	1	4.00	5.5	653	c-Semla	2023	2	23
Semla	3	12.00	5.5	666	c-Semla	2023	2	23
Kardemummaskorpor finax	1	5.95	5.5	675	763	2023	2	23
Smash	2	9.90	5.5	681	502	2023	2	23
Semla	2	8.00	5.5	689	c-Semla	2023	2	23
Alimentation	1	0.20	5.5	697	nb-3	2023	2	24
Mini croustades	1	7.50	5.5	706	758	2023	2	24
Tändstickor 8-Pack	1	3.95	20	713	690	2023	2	24
Polarbröd Rågkaka	1	8.95	5.5	725	407	2023	2	24
Décoration/Alcool	1	29.95	20	733	nb-1	2023	2	25
Entrée - Plat	1	22.00	5.5	743	M_8	2023	2	25
Rågkusar osötad Tina och servera	2	17.90	5.5	750	434	2023	2	25
Kanelbulle	1	3.00	5.5	756	c-Kanelbulle	2023	2	25
Jordnötsringar	1	3.50	5.5	762	214	2023	2	25
Kanel x4	1	10.00	5.5	770	c-Kanel x4	2023	2	25
Décoration/Alcool	1	100.00	5.5	778	nb-2	2023	2	25
Saffransbulle	1	3.00	5.5	790	c-Saffransbulle	2023	2	26
Saffransbulle	1	1.50	5.5	799	c-Saffransbulle	2023	2	26
Café/Thé	1	2.00	5.5	816	c-Café/Thé	2023	2	26
Kanelbulle	2	6.00	5.5	362	c-Kanelbulle	2023	2	16
Décoration/Alcool	1	2.95	5.5	366	nb-9	2023	2	16
Dipmix Sourcream onion	1	1.95	5.5	371	94	2023	2	16
Alimentation	2	12.00	5.5	377	nb-1	2023	2	16
Gräddsås 3-pack	1	4.65	5.5	388	164	2023	2	17
Noblesse Havssalt crisp	1	6.50	5.5	405	370	2023	2	17
Alimentation	1	5.00	5.5	419	nb-1	2023	2	17
Skagenröra	2	11.90	5.5	432	491	2023	2	18
Sandwich Chives	1	2.00	5.5	440	474	2023	2	18
Rödbetssallad 400g	1	6.50	5.5	451	462	2023	2	18
Västerbottensost 35% normalbit	1	21.95	5.5	463	554	2023	2	18
Kanelbulle	1	3.00	5.5	473	c-Kanelbulle	2023	2	18
Café/Thé	1	2.00	5.5	486	c-Café/Thé	2023	2	19
Sac	1	0.10	5.5	495	c-Sac	2023	2	19
Assiette de hareng	1	8.00	5.5	506	M_4	2023	2	19
Kalles kaviar randiga	1	4.50	5.5	515	774	2023	2	19
Semla	1	4.00	5.5	527	c-Semla	2023	2	19
Sac	1	0.10	5.5	537	c-Sac	2023	2	21
Décoration/Alcool	1	40.00	5.5	547	nb-1	2023	2	21
Semla	1	4.00	5.5	559	c-Semla	2023	2	21
Blabärsbulle	1	3.00	5.5	573	c-Blabärsbulle	2023	2	21
Loka Naturell Brk	1	2.00	5.5	582	314	2023	2	21
Finn Crisp Original	1	4.95	5.5	592	128	2023	2	21
Knäcke trekant normalgräddat	1	3.50	5.5	600	254	2023	2	21
Inlagd Sill	1	4.95	5.5	609	206	2023	2	22
Kanelbulle	1	3.00	5.5	617	c-Kanelbulle	2023	2	22
Läkerol Eucalyptus	3	6.30	5.5	629	276	2023	2	22
Café/Thé	1	2.00	5.5	639	c-Café/Thé	2023	2	22
Kanelbulle	1	3.00	5.5	653	c-Kanelbulle	2023	2	23
Kanelbulle	1	3.00	5.5	667	c-Kanelbulle	2023	2	23
Alimentation	1	5.00	5.5	675	nb-6	2023	2	23
Västerbottensost 35% normalbit	1	21.95	5.5	681	554	2023	2	23
Café/Thé	2	4.00	5.5	689	c-Café/Thé	2023	2	23
Kanelbulle	1	3.00	5.5	698	c-Kanelbulle	2023	2	24
Semla	2	8.00	5.5	707	c-Semla	2023	2	24
Tändstickor	1	3.95	20	713	689	2023	2	24
Décoration/Alcool	1	12.95	20	725	nb-6	2023	2	24
Décoration/Alcool	1	5.00	5.5	733	nb-2	2023	2	25
Alimentation	1	2.00	5.5	743	nb-5	2023	2	25
Décoration/Alcool	1	7.90	5.5	750	nb-4	2023	2	25
Semla	2	8.00	5.5	756	c-Semla	2023	2	25
Kanelbulle	2	6.00	5.5	762	c-Kanelbulle	2023	2	25
Alimentation	1	5.00	5.5	771	nb-2	2023	2	25
Bullar x4	1	10.00	5.5	779	c-Bullar x4	2023	2	25
Semla	1	4.00	5.5	790	c-Semla	2023	2	26
Kardemumbulle	1	3.00	5.5	800	c-Kardemumbulle	2023	2	26
Kanelbulle	2	6.00	5.5	816	c-Kanelbulle	2023	2	26
Skärgårdssill	1	4.95	5.5	363	492	2023	2	16
Salta Katten	5	7.50	20	366	470	2023	2	16
Dippmix Dill & Gräslök	1	1.95	5.5	371	95	2023	2	16
Inlagd Sill	1	4.95	5.5	378	206	2023	2	16
Fiskbullar i hummersås MSC	1	6.95	5.5	388	133	2023	2	17
Alimentation	1	6.95	5.5	406	nb-1	2023	2	17
Alimentation	2	10.00	5.5	420	nb-1	2023	2	18
Kanelbulle	1	3.00	5.5	432	c-Kanelbulle	2023	2	18
Kela koka kräftor	1	23.95	5.5	440	780	2023	2	18
Pepparkaksmix	1	5.95	5.5	451	781	2023	2	18
Bullar x4	1	10.00	5.5	463	c-Bullar x4	2023	2	18
Frukt & Mandel Chokladkaka	1	3.10	5.5	473	151	2023	2	18
Bullar x4	2	20.00	5.5	487	c-Bullar x4	2023	2	19
Marabou 30 praliner med nougatfyllning	1	9.95	5.5	495	333	2023	2	19
Décoration/Alcool	1	12.00	5.5	506	nb-5	2023	2	19
Zoo Tablettask	3	4.50	20	516	567	2023	2	19
Café/Thé	1	2.00	5.5	527	c-Café/Thé	2023	2	19
Semla	1	4.00	5.5	538	c-Semla	2023	2	21
Kanelbulle	1	3.00	5.5	548	c-Kanelbulle	2023	2	21
Semlor x4	3	45.00	5.5	560	c-Semlor x4	2023	2	21
Kardemumbulle	1	3.00	5.5	574	c-Kardemumbulle	2023	2	21
Alimentation	1	1.00	5.5	582	nb-2	2023	2	21
Tändstickor 8-Pack	1	3.95	20	592	690	2023	2	21
Räkost	1	8.95	5.5	600	438	2023	2	21
Fransk Lök Sill	2	9.90	5.5	609	140	2023	2	22
Café/Thé	2	4.00	5.5	618	c-Café/Thé	2023	2	22
Tändstickor	1	3.95	20	629	689	2023	2	22
Bullar x4	1	10.00	5.5	640	c-Bullar x4	2023	2	22
Semlor x4	1	15.00	5.5	654	c-Semlor x4	2023	2	23
Kardemumbulle	1	3.00	5.5	667	c-Kardemumbulle	2023	2	23
Knäcke rund brungräddat	1	7.95	5.5	675	250	2023	2	23
Räkost	1	8.95	5.5	681	438	2023	2	23
Ahlgrens bilar	2	5.90	5.5	681	8	2023	2	23
Alimentation	2	35.90	5.5	690	nb-1	2023	2	23
Kardemumbulle	1	3.00	5.5	698	c-Kardemumbulle	2023	2	24
Décoration/Alcool	1	3.00	5.5	707	nb-2	2023	2	24
Décoration/Alcool	1	12.95	20	714	nb-1	2023	2	24
Bullar x4	1	10.00	5.5	726	c-Bullar x4	2023	2	24
Café/Thé	1	2.00	5.5	733	c-Café/Thé	2023	2	25
Décoration/Alcool	1	39.95	20	744	nb-1	2023	2	25
Marabou daim 200g	1	5.95	5.5	751	797	2023	2	25
Potatissallad	1	5.95	5.5	751	418	2023	2	25
Semla	2	8.00	5.5	757	c-Semla	2023	2	25
Kung Oscar pepparkakor	1	5.95	5.5	763	746	2023	2	25
Café/Thé	1	2.00	5.5	771	c-Café/Thé	2023	2	25
Cheez doodles 35g	2	3.00	20	779	62	2023	2	25
Sandwich franska örter	1	2.10	5.5	790	475	2023	2	26
Blabärsbulle	1	3.00	5.5	800	c-Blabärsbulle	2023	2	26
Plat végétarien	1	0.00	5.5	817	M_36	2023	2	26
Inlagd Sill	1	4.95	5.5	363	206	2023	2	16
Blabärsbulle	1	3.00	5.5	367	c-Blabärsbulle	2023	2	16
Alimentation	1	2.90	5.5	371	nb-7	2023	2	16
Skärgårdssill	1	4.95	5.5	378	492	2023	2	16
Bullar x4	1	10.00	5.5	388	c-Bullar x4	2023	2	17
Alimentation	1	9.90	5.5	407	nb-1	2023	2	17
Gravad Lax 150g Korshags	1	13.95	5.5	421	167	2023	2	18
Bullar x4	1	10.00	5.5	433	c-Bullar x4	2023	2	18
Alimentation	2	10.00	5.5	440	nb-7	2023	2	18
Finn Crisp Original	1	4.95	5.5	451	128	2023	2	18
Knäcke trekant brungräddat	2	7.00	5.5	464	253	2023	2	18
Café/Thé	1	2.00	5.5	473	c-Café/Thé	2023	2	18
Alimentation	1	2.95	5.5	487	nb-2	2023	2	19
Assiette saumon	1	8.00	5.5	496	M_5	2023	2	19
Boulettes de viande	1	16.00	5.5	506	M_1	2023	2	19
Semper digestivekex GF	1	6.90	5.5	517	765	2023	2	19
Kanelbulle	1	3.00	5.5	528	c-Kanelbulle	2023	2	19
Magazine	1	3.86	5.5	539	nb-1	2023	2	21
Blabärsbulle	1	3.00	5.5	548	c-Blabärsbulle	2023	2	21
Kalles kaviar original	1	5.50	5.5	560	773	2023	2	21
Estrella dillchips	1	4.20	5.5	575	84	2023	2	21
HavreGryn Fiber	1	5.95	5.5	582	188	2023	2	21
Tändstickor	3	11.85	20	592	689	2023	2	21
​ Smörgåsgurka 370g	1	5.50	5.5	600	507	2023	2	21
Skärgårdssill	1	4.95	5.5	609	492	2023	2	22
Semla	2	8.00	5.5	618	c-Semla	2023	2	22
Smörgåsrån Vete	1	3.95	20	630	509	2023	2	22
Semla	3	12.00	5.5	640	c-Semla	2023	2	22
Semla	2	8.00	5.5	654	c-Semla	2023	2	23
Bullar x4	1	10.00	5.5	668	c-Bullar x4	2023	2	23
Pepparkaksmix	1	5.95	5.5	675	781	2023	2	23
Kalles kaviar randiga	1	4.50	5.5	681	774	2023	2	23
Alimentation	1	5.00	5.5	690	nb-2	2023	2	23
Kanelbulle	2	6.00	5.5	699	c-Kanelbulle	2023	2	24
Läkerol Licorice Seasalt	1	2.10	5.5	707	277	2023	2	24
Lapin Kulta 3.5% BRK	1	3.50	5.5	715	295	2023	2	24
Knäcke trekant normalgräddat	1	3.50	5.5	726	254	2023	2	24
Ahlgrens bilar	2	5.90	5.5	734	8	2023	2	25
Kanelbulle	1	3.00	5.5	744	c-Kanelbulle	2023	2	25
Boulettes de viande	1	16.00	5.5	751	M_1	2023	2	25
Café/Thé	1	2.00	5.5	757	c-Café/Thé	2023	2	25
Pepparkaka Jul plåtburk	1	10.95	5.5	763	395	2023	2	25
Café/Thé	1	2.00	5.5	772	c-Café/Thé	2023	2	25
Bullar x4	1	10.00	5.5	780	c-Bullar x4	2023	2	25
Sandwich Chives	1	2.00	5.5	790	474	2023	2	26
Kardemumbulle	1	3.00	5.5	801	c-Kardemumbulle	2023	2	26
Salade de fruits	1	0.00	5.5	817	M_23	2023	2	26
Brunost	1	17.95	5.5	363	51	2023	2	16
Grebbestads® Ansjovisfilé Original	1	6.95	5.5	367	171	2023	2	16
Café/Thé	2	4.00	5.5	372	c-Café/Thé	2023	2	16
Kalles kaviar original	1	5.50	5.5	378	773	2023	2	16
Kanelbulle	1	3.00	5.5	389	c-Kanelbulle	2023	2	17
Café/Thé	2	4.00	5.5	408	c-Café/Thé	2023	2	17
Skärgårdssill	1	4.95	5.5	421	492	2023	2	18
Boulettes de viande	1	16.00	5.5	434	M_1	2023	2	18
Semlor x4	2	30.00	5.5	440	c-Semlor x4	2023	2	18
Västerbottensost 35% normalbit	1	21.95	5.5	452	554	2023	2	18
Estrella chips sourcream & onion	1	4.20	5.5	464	66	2023	2	18
Kanelbulle	1	3.00	5.5	474	c-Kanelbulle	2023	2	18
Sac	1	0.10	5.5	487	c-Sac	2023	2	19
Café/Thé	1	2.00	5.5	496	c-Café/Thé	2023	2	19
Gott & Blandat Original	1	2.95	5.5	506	160	2023	2	19
Semper pepparkakor GF	1	5.90	5.5	517	766	2023	2	19
Kanelbulle	2	6.00	5.5	529	c-Kanelbulle	2023	2	19
Magazine	1	6.90	5.5	539	nb-2	2023	2	21
Décoration/Alcool	8	103.60	5.5	549	nb-1	2023	2	21
Sac	1	0.10	5.5	560	c-Sac	2023	2	21
Magazine	1	3.38	5.5	575	nb-1	2023	2	21
Yes Original	1	9.95	20	582	699	2023	2	21
Café/Thé	3	6.00	5.5	593	c-Café/Thé	2023	2	21
Knäcke trekant brungräddat	1	3.50	5.5	600	253	2023	2	21
Kanelbulle	2	6.00	5.5	609	c-Kanelbulle	2023	2	22
Husman	1	3.95	5.5	619	201	2023	2	22
Kalles kaviar randiga	1	4.50	5.5	630	774	2023	2	22
Sac	1	0.10	5.5	640	c-Sac	2023	2	22
Läkerol Original	2	4.20	5.5	655	278	2023	2	23
Semla	2	8.00	5.5	669	c-Semla	2023	2	23
Alimentation	1	3.90	5.5	676	nb-1	2023	2	23
Bullar x4	1	10.00	5.5	681	c-Bullar x4	2023	2	23
Sac	1	0.10	5.5	690	c-Sac	2023	2	23
Bullar x4	1	10.00	5.5	700	c-Bullar x4	2023	2	24
Läkerol Salmiak	1	2.10	5.5	707	281	2023	2	24
Inlagd Sill	1	4.95	5.5	715	206	2023	2	24
Semla	2	8.00	5.5	727	c-Semla	2023	2	24
Pepparkaka Jul plåtburk	1	10.95	5.5	734	395	2023	2	25
Riskakor Ost glutenfria	1	4.75	5.5	745	458	2023	2	25
Plat végétarien	1	16.00	5.5	751	M_36	2023	2	25
Cheez doodles 160g	1	4.20	5.5	751	63	2023	2	25
Kanelbulle	2	6.00	5.5	757	c-Kanelbulle	2023	2	25
Mandelkubb	1	6.95	5.5	763	328	2023	2	25
Alimentation	1	5.00	5.5	772	nb-2	2023	2	25
Gott & blandat Salt	1	2.95	5.5	781	161	2023	2	25
Kanelbulle	1	3.00	5.5	791	c-Kanelbulle	2023	2	26
Blabärsbulle	1	3.00	5.5	801	c-Blabärsbulle	2023	2	26
Café/Thé	1	2.00	5.5	817	c-Café/Thé	2023	2	26
Sac	1	0.10	5.5	363	c-Sac	2023	2	16
Décoration/Alcool	1	6.95	5.5	367	nb-3	2023	2	16
Bullar x4	1	10.00	5.5	372	c-Bullar x4	2023	2	16
Cheez doodles 160g	1	4.20	5.5	379	63	2023	2	17
Alimentation	1	1.60	5.5	389	nb-2	2023	2	17
Bullar x4	1	10.00	5.5	408	c-Bullar x4	2023	2	17
Alimentation	2	10.00	5.5	422	nb-1	2023	2	18
Café/Thé	2	4.00	5.5	434	c-Café/Thé	2023	2	18
Kardemum x4	1	10.00	5.5	441	c-Kardemum x4	2023	2	18
Knäcke rund brungräddat	1	7.95	5.5	452	250	2023	2	18
Alimentation	1	5.10	5.5	464	nb-3	2023	2	18
Café/Thé	1	2.00	5.5	474	c-Café/Thé	2023	2	18
Kanelbulle	2	6.00	5.5	488	c-Kanelbulle	2023	2	19
Smash	1	4.95	5.5	497	502	2023	2	19
Gott & blandat bär & frukt	1	2.95	5.5	506	800	2023	2	19
Kanelbulle	2	6.00	5.5	517	c-Kanelbulle	2023	2	19
Ballerina Original	1	4.50	5.5	530	30	2023	2	21
Kanel x4	1	10.00	5.5	539	c-Kanel x4	2023	2	21
Knäcke trekant brungräddat	1	3.50	5.5	550	253	2023	2	21
Kanel x4	1	10.00	5.5	561	c-Kanel x4	2023	2	21
Dippmix Fresh Island	1	1.95	5.5	575	96	2023	2	21
Semla	3	12.00	5.5	582	c-Semla	2023	2	21
Semlor x4	1	15.00	5.5	594	c-Semlor x4	2023	2	21
Skärgårdssill	3	14.85	5.5	600	492	2023	2	21
Décoration/Alcool	1	4.54	5.5	610	nb-1	2023	2	22
Klassiska Köttbullar	1	12.95	5.5	619	247	2023	2	22
Semla	2	8.00	5.5	630	c-Semla	2023	2	22
Kanelbulle	2	6.00	5.5	641	c-Kanelbulle	2023	2	22
Sac	1	0.10	5.5	656	c-Sac	2023	2	23
Tyrkisk Peber Original	1	3.50	5.5	670	545	2023	2	23
Kung Oscar pepparkakor	1	5.95	5.5	676	746	2023	2	23
Gula ärtor kapsel	1	3.95	5.5	682	179	2023	2	23
Alimentation	1	4.95	5.5	691	nb-1	2023	2	23
Café/Thé	1	2.00	5.5	701	c-Café/Thé	2023	2	24
Läkerol Raspberry Licorice	1	2.10	5.5	707	279	2023	2	24
Rårörda lingon	1	8.95	5.5	715	447	2023	2	24
Ljus Sirap	1	4.50	5.5	727	302	2023	2	24
Skogaholmslimpa skiv Tina och servera	1	6.95	5.5	734	498	2023	2	25
Riskakor Gräddfil Lök glutenfria	1	4.75	5.5	745	457	2023	2	25
Décoration/Alcool	1	3.50	20	751	nb-3	2023	2	25
Gräddsås 3-pack	1	4.65	5.5	751	164	2023	2	25
Alimentation	1	3.70	5.5	757	nb-4	2023	2	25
Runda Kanel	1	5.95	5.5	763	464	2023	2	25
Café/Thé	1	2.00	5.5	773	c-Café/Thé	2023	2	25
Kanelbulle	1	3.00	5.5	781	c-Kanelbulle	2023	2	25
Blabärsbulle	1	3.00	5.5	791	c-Blabärsbulle	2023	2	26
Flädersaft	2	19.90	5.5	802	137	2023	2	26
Plat - Dessert	1	20.00	5.5	817	M_16	2023	2	26
Cheez doodles 160g	1	4.20	5.5	364	63	2023	2	16
Sac	1	0.10	5.5	367	c-Sac	2023	2	16
Alimentation	2	5.90	5.5	373	nb-1	2023	2	16
Kex Chocklad	2	4.00	5.5	379	239	2023	2	17
Assiette saumon	1	8.00	5.5	390	M_5	2023	2	17
Alimentation	1	46.85	5.5	409	nb-1	2023	2	17
Bullar x4	1	10.00	5.5	423	c-Bullar x4	2023	2	18
Bullar x4	1	10.00	5.5	434	c-Bullar x4	2023	2	18
Semlor x4	1	15.00	5.5	442	c-Semlor x4	2023	2	18
Cheese slicer	1	10.95	5.5	452	788	2023	2	18
Semla	2	8.00	5.5	465	c-Semla	2023	2	18
Semla	1	4.00	5.5	474	c-Semla	2023	2	18
Café/Thé	2	4.00	5.5	488	c-Café/Thé	2023	2	19
Smash	1	4.95	5.5	498	502	2023	2	19
Festis Hallon EKO BRIK	1	2.00	5.5	506	119	2023	2	19
Bullar x4	1	10.00	5.5	518	c-Bullar x4	2023	2	19
Finn Crisp Original	1	4.95	5.5	530	128	2023	2	21
Magazine	1	6.88	5.5	539	nb-4	2023	2	21
Skärgårdssill	2	9.90	5.5	550	492	2023	2	21
Semla	2	8.00	5.5	562	c-Semla	2023	2	21
Dippmix Ranch	1	1.95	5.5	575	97	2023	2	21
Décoration/Alcool	1	5.00	20	583	nb-1	2023	2	21
Semla	2	8.00	5.5	594	c-Semla	2023	2	21
Inlagd Sill	1	8.95	5.5	600	207	2023	2	21
Zoo Tablettask	1	1.50	20	610	567	2023	2	22
Plopp dubbel stycksak	1	1.70	5.5	619	405	2023	2	22
Sac	1	0.10	5.5	630	c-Sac	2023	2	22
Semla	2	8.00	5.5	642	c-Semla	2023	2	22
Kung Oscar pepparkakor	1	5.95	5.5	656	746	2023	2	23
Alimentation	1	5.00	5.5	670	nb-2	2023	2	23
Djungelvrål	2	3.90	5.5	676	101	2023	2	23
Ströbröd	1	4.50	5.5	682	520	2023	2	23
Alimentation	2	11.90	5.5	692	nb-1	2023	2	23
Alimentation	2	10.00	5.5	702	nb-1	2023	2	24
Kex Chocklad	1	2.00	5.5	707	239	2023	2	24
Rågkusar osötad Tina och servera	1	8.95	5.5	715	434	2023	2	24
Décoration/Alcool	1	3.70	5.5	727	nb-3	2023	2	24
Bullar x4	1	10.00	5.5	734	c-Bullar x4	2023	2	25
Ballerina kladdkaka	1	4.50	5.5	745	29	2023	2	25
Décoration/Alcool	1	2.00	5.5	751	nb-4	2023	2	25
Bullar x4	1	10.00	5.5	751	c-Bullar x4	2023	2	25
Café/Thé	2	4.00	5.5	758	c-Café/Thé	2023	2	25
Vetekaka	1	8.95	5.5	764	555	2023	2	25
Tändstickor 8-Pack	3	11.85	20	764	690	2023	2	25
Alimentation	1	5.00	5.5	773	nb-2	2023	2	25
Décoration/Alcool	1	3.20	5.5	781	nb-3	2023	2	25
Bullar x4	1	10.00	5.5	792	c-Bullar x4	2023	2	26
Flädersaft	1	9.95	5.5	803	137	2023	2	26
Kanelbulle	2	6.00	5.5	817	c-Kanelbulle	2023	2	26
Felix Krögarpytt Klassisk	2	15.90	5.5	364	117	2023	2	16
Knäcke trekant normalgräddat	1	3.50	5.5	368	254	2023	2	16
Alimentation	1	9.95	5.5	373	nb-2	2023	2	16
Mjölkchoklad Kaka	1	3.10	5.5	379	362	2023	2	17
Alimentation	1	2.65	5.5	379	nb-10	2023	2	17
Soupe aux légumes de saison	1	8.00	5.5	390	M_20	2023	2	17
Alimentation	1	20.40	5.5	410	nb-1	2023	2	17
Pepparkaka Jul plåtburk	1	10.95	5.5	423	395	2023	2	18
Alimentation	1	3.60	5.5	435	nb-1	2023	2	18
Alimentation	1	1.00	5.5	442	nb-2	2023	2	18
Semla	1	4.00	5.5	453	c-Semla	2023	2	18
Kardemum x4	1	10.00	5.5	465	c-Kardemum x4	2023	2	18
Kanelbulle	1	3.00	5.5	475	c-Kanelbulle	2023	2	18
Polarbröd Rågkaka	1	8.95	5.5	489	407	2023	2	19
Semla	1	4.00	5.5	498	c-Semla	2023	2	19
Rekorderlig Päron Cider	1	3.50	5.5	506	449	2023	2	19
Décoration/Alcool	1	1.44	5.5	519	nb-1	2023	2	19
Karen volf digestive	1	2.95	5.5	530	784	2023	2	21
Sac	1	0.10	5.5	539	c-Sac	2023	2	21
Soupe aux pois cassé/lardons	1	8.00	5.5	551	M_19	2023	2	21
Café/Thé	1	2.00	5.5	562	c-Café/Thé	2023	2	21
Djungelvrål	1	1.95	5.5	575	101	2023	2	21
Décoration/Alcool	1	2.95	5.5	583	nb-2	2023	2	21
Sac	1	0.10	5.5	594	c-Sac	2023	2	21
Rekorderlig Päron Cider	1	3.50	5.5	600	449	2023	2	21
Kanelbulle	1	3.00	5.5	610	c-Kanelbulle	2023	2	22
Läkerol Raspberry Licorice	1	2.10	5.5	619	279	2023	2	22
Semla	2	8.00	5.5	631	c-Semla	2023	2	22
Café/Thé	2	4.00	5.5	642	c-Café/Thé	2023	2	22
Mazarin singel	1	1.50	5.5	656	353	2023	2	23
Semla	1	4.00	5.5	671	c-Semla	2023	2	23
Tyrkisk Peber Original	1	3.50	5.5	676	545	2023	2	23
Grebbestads® Ansjovisfilé Original	2	13.90	5.5	682	171	2023	2	23
Alimentation	1	10.95	5.5	692	nb-2	2023	2	23
Décoration/Alcool	2	9.00	20	702	nb-2	2023	2	24
Poëlée Pytt i Panna	1	16.00	5.5	708	M_3	2023	2	24
Ahlgrens bilar	1	2.95	5.5	708	8	2023	2	24
Fazer Oat choco	1	2.00	5.5	716	739	2023	2	24
Kardemumbulle	2	6.00	5.5	728	c-Kardemumbulle	2023	2	24
Semla	2	8.00	5.5	734	c-Semla	2023	2	25
Ballerina Original	1	4.50	5.5	745	30	2023	2	25
Café/Thé	2	4.00	5.5	751	c-Café/Thé	2023	2	25
Bullar x4	1	10.00	5.5	758	c-Bullar x4	2023	2	25
Såpa grön 750ml	1	4.50	20	764	638	2023	2	25
Norrlands Guld 3.5 % BRK	1	3.50	5.5	774	374	2023	2	25
Smash	1	4.95	5.5	782	502	2023	2	25
Kanelbulle	2	6.00	5.5	793	c-Kanelbulle	2023	2	26
Kanelbulle	1	3.00	5.5	803	c-Kanelbulle	2023	2	26
Boulettes de viande	1	0.00	5.5	818	M_1	2023	2	26
Alimentation	1	5.00	5.5	364	nb-3	2023	2	16
Gott & Blandat Original	1	2.95	5.5	368	160	2023	2	16
Alimentation	1	12.95	5.5	373	nb-3	2023	2	16
Plopp dubbel stycksak	1	1.70	5.5	379	405	2023	2	17
Décoration/Alcool	1	2.95	20	379	nb-11	2023	2	17
Bullar x4	1	10.00	5.5	390	c-Bullar x4	2023	2	17
Alimentation	1	107.95	5.5	411	nb-1	2023	2	17
Alimentation	1	0.40	5.5	423	nb-3	2023	2	18
Slotts senap original tub	1	7.95	5.5	435	483	2023	2	18
Semla	3	12.00	5.5	443	c-Semla	2023	2	18
Café/Thé	1	2.00	5.5	453	c-Café/Thé	2023	2	18
Décoration/Alcool	1	14.95	20	465	nb-3	2023	2	18
Café/Thé	1	2.00	5.5	475	c-Café/Thé	2023	2	18
Finn Crisp Original	1	4.95	5.5	489	128	2023	2	19
Ahlgrens bilar Sursockrade	2	5.90	5.5	498	11	2023	2	19
Café/Thé	1	2.00	5.5	506	c-Café/Thé	2023	2	19
Loka mango lime	1	2.00	5.5	519	734	2023	2	19
Knäcke rund normalgräddat	1	7.95	5.5	531	251	2023	2	21
Magazine	1	10.00	5.5	540	nb-1	2023	2	21
Boulettes de viande	1	16.00	5.5	551	M_1	2023	2	21
Felix Krögarpytt Klassisk	1	7.95	5.5	563	117	2023	2	21
Ahlgrens bilar Sursockrade	1	2.95	5.5	575	11	2023	2	21
Blabärsbulle	3	9.00	5.5	584	c-Blabärsbulle	2023	2	21
Lakrisal	1	1.20	5.5	594	283	2023	2	21
Kung Oscar pepparkakor	1	5.95	5.5	601	746	2023	2	21
Inlagd Sill	1	4.95	5.5	611	206	2023	2	22
Semla	4	16.00	5.5	619	c-Semla	2023	2	22
Kardemumbulle	1	3.00	5.5	631	c-Kardemumbulle	2023	2	22
Kardemumbulle	1	3.00	5.5	643	c-Kardemumbulle	2023	2	22
Kex Chocklad	1	2.00	5.5	656	239	2023	2	23
Kanelbulle	2	6.00	5.5	656	c-Kanelbulle	2023	2	23
Pavé de saumon	1	18.00	5.5	672	M_21	2023	2	23
Marabou Schweizer nöt	1	3.10	5.5	676	346	2023	2	23
Festis Päron EKO BRIK	2	4.00	5.5	682	120	2023	2	23
Sac	1	0.10	5.5	692	c-Sac	2023	2	23
Décoration/Alcool	2	7.90	20	702	nb-3	2023	2	24
Assiette saumon	1	8.00	5.5	708	M_5	2023	2	24
Ahlgrens bilar	1	2.95	5.5	717	8	2023	2	24
Husman	1	3.95	5.5	729	201	2023	2	24
Bullar x4	1	10.00	5.5	735	c-Bullar x4	2023	2	25
Fiskbullar i hummersås MSC	1	6.95	5.5	745	133	2023	2	25
Semla	1	4.00	5.5	751	c-Semla	2023	2	25
Haribo nappar cola	1	1.50	5.5	758	751	2023	2	25
Frödinge Princesstårta	1	15.00	5.5	764	144	2023	2	25
Polarbröd Rågkaka	1	8.95	5.5	764	407	2023	2	25
Semla	2	8.00	5.5	764	c-Semla	2023	2	25
Décoration/Alcool	2	4.00	5.5	764	nb-16	2023	2	25
Décoration/Alcool	1	5.95	20	774	nb-2	2023	2	25
Alimentation	1	1.00	5.5	782	nb-3	2023	2	25
Boulettes de viande	1	0.00	5.5	794	M_1	2023	2	26
Saffransbulle	1	3.00	5.5	803	c-Saffransbulle	2023	2	26
Glace vanille coulis baie polaire	1	0.00	5.5	818	M_24	2023	2	26
Décoration/Alcool	1	34.95	20	364	nb-4	2023	2	16
Ahlgrens bilar	1	2.95	5.5	368	8	2023	2	16
Alimentation	1	6.95	5.5	373	nb-4	2023	2	16
Marabou Pigall Dubbel	1	1.70	5.5	379	344	2023	2	17
Finn Crisp caraway	1	4.95	5.5	390	127	2023	2	17
Alimentation	1	14.10	5.5	412	nb-2	2023	2	17
Finn Crisp Original	1	4.95	5.5	424	128	2023	2	18
Bullar x4	1	10.00	5.5	435	c-Bullar x4	2023	2	18
Kanelbulle	2	6.00	5.5	444	c-Kanelbulle	2023	2	18
Kanelbulle	1	3.00	5.5	453	c-Kanelbulle	2023	2	18
Café/Thé	2	4.00	5.5	466	c-Café/Thé	2023	2	18
Alimentation	1	5.00	5.5	476	nb-1	2023	2	18
Kanelbulle	2	6.00	5.5	489	c-Kanelbulle	2023	2	19
Polka Grisar	1	3.95	5.5	499	412	2023	2	19
Décoration/Alcool	1	12.00	20	507	nb-1	2023	2	19
Dippmix Ranch	1	1.95	5.5	519	97	2023	2	19
Kanelbulle	2	6.00	5.5	532	c-Kanelbulle	2023	2	21
Semla	2	8.00	5.5	540	c-Semla	2023	2	21
Assiette nordique	1	-2.00	5.5	551	M_35	2023	2	21
Alimentation	1	3.00	5.5	563	nb-2	2023	2	21
Salta Katten	1	1.50	20	576	470	2023	2	21
Semlor x4	1	15.00	5.5	585	c-Semlor x4	2023	2	21
Marabou Schweizer nöt	1	3.10	5.5	595	346	2023	2	21
Décoration/Alcool	1	2.78	5.5	595	nb-11	2023	2	21
Räkost	1	8.95	5.5	602	438	2023	2	21
Mandel biskvier	1	3.50	5.5	611	325	2023	2	22
Semlor x4	1	15.00	5.5	620	c-Semlor x4	2023	2	22
Sac	1	0.10	5.5	631	c-Sac	2023	2	22
Semla	2	8.00	5.5	644	c-Semla	2023	2	22
Daim dubbel	1	2.00	5.5	656	78	2023	2	23
Pavé de saumon	1	18.00	5.5	672	M_21	2023	2	23
Bullar x4	1	10.00	5.5	676	c-Bullar x4	2023	2	23
Alimentation	1	2.58	5.5	682	nb-5	2023	2	23
Décoration/Alcool	1	5.95	5.5	693	nb-10	2023	2	23
Décoration/Alcool	4	8.40	5.5	693	nb-11	2023	2	23
Salta Katten	6	9.00	20	702	470	2023	2	24
Assiette de hareng	1	8.00	5.5	708	M_4	2023	2	24
Tutti frutti tablettask	3	4.50	5.5	717	742	2023	2	24
Estrella chips grill	1	4.20	5.5	729	172	2023	2	24
Semla	2	8.00	5.5	735	c-Semla	2023	2	25
Décoration/Alcool	1	34.95	20	745	nb-6	2023	2	25
Blabärsbulle	1	3.00	5.5	751	c-Blabärsbulle	2023	2	25
Ballerina Original	1	4.50	5.5	751	30	2023	2	25
Alimentation	1	1.10	5.5	758	nb-4	2023	2	25
Grebbestads® Ansjovisfilé Original	3	20.85	5.5	764	171	2023	2	25
Soldatens ärtsoppa extra fläsk	1	9.95	5.5	774	514	2023	2	25
Mjölkchoklad Kaka	1	3.10	5.5	782	362	2023	2	25
Soupe aux pois cassé/lardons	1	0.00	5.5	794	M_19	2023	2	26
Kanelbulle	1	3.00	5.5	804	c-Kanelbulle	2023	2	26
Plat - Dessert	1	20.00	5.5	818	M_16	2023	2	26
Boulettes de viande	1	16.00	5.5	357	M_1	2023	2	16
Alimentation	1	22.00	5.5	391	nb-1	2023	2	17
Marabou Schweizer nöt	1	3.10	5.5	413	346	2023	2	17
Kardemum x4	1	10.00	5.5	424	c-Kardemum x4	2023	2	18
Alimentation	1	2.10	5.5	435	nb-4	2023	2	18
Viol Tablettask	3	3.90	5.5	445	558	2023	2	18
Blabärsbulle	1	3.00	5.5	454	c-Blabärsbulle	2023	2	18
Kardemumbulle	2	6.00	5.5	466	c-Kardemumbulle	2023	2	18
Alimentation	2	10.00	5.5	477	nb-1	2023	2	18
Alimentation	3	4.50	5.5	489	nb-4	2023	2	19
Delicatoboll singel	1	1.50	5.5	499	80	2023	2	19
Polka Grisar	1	3.95	5.5	508	412	2023	2	19
Estrella linschips sourcream onion	1	3.95	5.5	519	741	2023	2	19
Semla	2	8.00	5.5	532	c-Semla	2023	2	21
Semla	3	12.00	5.5	541	c-Semla	2023	2	21
Boulettes de viande	1	0.00	5.5	551	M_1	2023	2	21
Inlagd Sill	4	19.80	5.5	564	206	2023	2	21
Finn Crisp Original	2	9.90	5.5	576	128	2023	2	21
Semla	2	8.00	5.5	585	c-Semla	2023	2	21
Mjölkchoklad Kaka	1	3.10	5.5	595	362	2023	2	21
Ahlgrens bilar	1	2.95	5.5	602	8	2023	2	21
Kanelbulle	1	3.00	5.5	612	c-Kanelbulle	2023	2	22
Festis Päron EKO BRIK	1	2.00	5.5	620	120	2023	2	22
Semla	2	8.00	5.5	632	c-Semla	2023	2	22
Alimentation	1	85.00	5.5	645	nb-1	2023	2	22
Läkerol Original	1	2.10	5.5	656	278	2023	2	23
Haribo nappar sur	1	1.50	5.5	672	753	2023	2	23
Semla	2	8.00	5.5	677	c-Semla	2023	2	23
Alimentation	1	2.04	5.5	682	nb-6	2023	2	23
Alimentation	1	4.55	5.5	693	nb-1	2023	2	23
Viol Tablettask	2	2.60	5.5	702	558	2023	2	24
Assiette nordique - Saumon	1	18.00	5.5	708	M_33	2023	2	24
Knäcke trekant normalgräddat	1	3.50	5.5	708	254	2023	2	24
Smörgåsrån Vete	2	7.90	20	717	509	2023	2	24
Décoration/Alcool	2	9.00	20	729	nb-5	2023	2	24
Kardemum x4	1	10.00	5.5	736	c-Kardemum x4	2023	2	25
Semla	2	8.00	5.5	746	c-Semla	2023	2	25
Oboy 700g	1	8.50	5.5	751	828	2023	2	25
Alimentation	1	5.00	5.5	759	nb-1	2023	2	25
Prickig korv skiv	3	11.85	5.5	764	422	2023	2	25
Café/Thé	2	4.00	5.5	764	c-Café/Thé	2023	2	25
Kung Oscar pepparkakor	1	5.95	5.5	774	746	2023	2	25
Dippmix Fresh Island	4	7.80	5.5	782	96	2023	2	25
Soupe aux pois cassé/lardons	1	0.00	5.5	794	M_19	2023	2	26
Kardemumma Malen 18g	1	3.95	5.5	794	236	2023	2	26
Blabärsbulle	1	3.00	5.5	804	c-Blabärsbulle	2023	2	26
Bullar x4	1	10.00	5.5	818	c-Bullar x4	2023	2	26
Alimentation	1	4.00	5.5	825	nb-1	2023	2	26
Alimentation	1	2.00	5.5	826	nb-1	2023	2	26
Alimentation	1	31.45	5.5	827	nb-1	2023	2	26
Alimentation	1	6.00	5.5	828	nb-1	2023	2	26
Alimentation	1	10.00	5.5	829	nb-1	2023	2	26
Alimentation	1	742.00	5.5	830	nb-1	2023	2	28
Alimentation	1	210.40	5.5	831	nb-1	2023	2	28
Skärgårdssill	2	9.90	5.5	832	492	2023	3	1
Bullar x4	1	10.00	5.5	833	c-Bullar x4	2023	3	1
Bullar x4	2	20.00	5.5	834	c-Bullar x4	2023	3	1
Bullar x4	1	10.00	5.5	835	c-Bullar x4	2023	3	1
Bullar x4	1	10.00	5.5	836	c-Bullar x4	2023	3	1
Bullar x4	1	10.00	5.5	837	c-Bullar x4	2023	3	1
Café/Thé	1	2.00	5.5	837	c-Café/Thé	2023	3	1
Alimentation	1	1.00	5.5	837	nb-3	2023	3	1
Formule sand	1	10.00	5.5	838	c-Formule sand	2023	3	1
Sandwich EMP	1	6.00	5.5	839	c-Sandwich EMP	2023	3	1
Kardemumbulle	1	3.00	5.5	840	c-Kardemumbulle	2023	3	1
Semla	1	4.00	5.5	840	c-Semla	2023	3	1
Kanelbulle	1	3.00	5.5	841	c-Kanelbulle	2023	3	1
Semla	1	4.00	5.5	841	c-Semla	2023	3	1
Alimentation	1	4.95	5.5	842	nb-1	2023	3	1
Djungelvrål	1	1.95	5.5	843	101	2023	3	1
Tyrkisk Peber Original	1	3.50	5.5	843	545	2023	3	1
Blabärsbulle	1	3.00	5.5	843	c-Blabärsbulle	2023	3	1
Boulettes de viande	1	16.00	5.5	845	M_1	2023	3	1
Pavé de saumon	1	18.00	5.5	845	M_21	2023	3	1
Assiette nordique - Saumon	1	18.00	5.5	845	M_33	2023	3	1
Assiette de hareng	1	0.00	5.5	846	M_4	2023	3	1
Boulettes de viande	1	0.00	5.5	846	M_1	2023	3	1
Entrée - Plat	1	22.00	5.5	846	M_8	2023	3	1
Assiette de hareng	1	0.00	5.5	846	M_4	2023	3	1
Boulettes de viande	1	0.00	5.5	846	M_1	2023	3	1
Entrée - Plat	1	22.00	5.5	846	M_8	2023	3	1
Semla	4	16.00	5.5	847	c-Semla	2023	3	1
Café/Thé	1	2.00	5.5	847	c-Café/Thé	2023	3	1
Mörk Sirap	1	4.50	5.5	847	363	2023	3	1
Alimentation	1	5.00	5.5	847	nb-3	2023	3	1
Pavé de saumon	1	18.00	5.5	848	M_21	2023	3	1
Assiette nordique - Saumon	1	18.00	5.5	848	M_33	2023	3	1
Kanelbulle	1	3.00	5.5	848	c-Kanelbulle	2023	3	1
Café/Thé	1	2.00	5.5	848	c-Café/Thé	2023	3	1
Filmjölk 3%	3	14.85	5.5	849	122	2023	3	1
Frödinge Princesstårta	1	15.00	5.5	849	144	2023	3	1
Alimentation	3	45.00	5.5	849	nb-3	2023	3	1
Fiskbullar i dillsås	2	13.90	5.5	850	132	2023	3	1
Kanel x4	1	10.00	5.5	851	c-Kanel x4	2023	3	1
Skagenröra	1	5.95	5.5	851	491	2023	3	1
Gott & blandat Salt	2	5.90	5.5	851	161	2023	3	1
Alimentation	1	6.20	5.5	851	nb-4	2023	3	1
Assiette nordique	1	0.00	5.5	852	M_35	2023	3	1
Boulettes de viande	1	0.00	5.5	852	M_1	2023	3	1
Entrée - Plat	1	22.00	5.5	852	M_8	2023	3	1
Bullar x4	1	10.00	5.5	853	c-Bullar x4	2023	3	1
Smörgåsgurka 715g	1	7.50	5.5	853	508	2023	3	1
Marabou Mjölkchocklad Single	1	1.00	5.5	853	343	2023	3	1
Kanelbulle	1	3.00	5.5	854	c-Kanelbulle	2023	3	1
Semla	2	8.00	5.5	854	c-Semla	2023	3	1
Café/Thé	1	2.00	5.5	854	c-Café/Thé	2023	3	1
Kalles kaviar original	1	5.50	5.5	855	773	2023	3	1
Slotts senap original tub	1	5.95	5.5	855	481	2023	3	1
Grebbestads® Ansjovisfilé Original	2	13.90	5.5	855	171	2023	3	1
Mariestads Öl 3.5% 50cL	1	3.50	5.5	855	349	2023	3	1
Finn Crisp caraway	1	4.95	5.5	855	127	2023	3	1
Löksill	1	4.95	5.5	855	320	2023	3	1
Gräddsås 3-pack	2	9.30	5.5	856	164	2023	3	1
Piffi Allkrydda	1	5.75	5.5	856	399	2023	3	1
Plopp dubbel stycksak	1	1.70	5.5	857	405	2023	3	1
Felix Krögarpytt Klassisk	1	10.95	5.5	857	117	2023	3	1
Paskfjadrar	2	3.00	20	857	845	2023	3	1
Kalles kaviar original	5	27.50	5.5	858	773	2023	3	1
Ramslök & Citron Sill	1	4.10	5.5	858	445	2023	3	1
Löksill	1	4.95	5.5	858	320	2023	3	1
Senapssill	1	4.10	5.5	858	485	2023	3	1
Semla	1	4.00	5.5	859	c-Semla	2023	3	1
Alimentation	1	3.00	5.5	859	nb-2	2023	3	1
Cheez doodles 160g	2	8.40	5.5	860	63	2023	3	1
Kalles kaviar original	1	5.50	5.5	860	773	2023	3	1
Ahlgrens bilar	2	5.90	5.5	860	8	2023	3	1
Kanel x4	1	10.00	5.5	861	c-Kanel x4	2023	3	1
Café/Thé	2	4.00	5.5	861	c-Café/Thé	2023	3	1
Gravad Lax 150g Korshags	2	27.90	5.5	862	167	2023	3	1
Soupe aux légumes de saison	1	8.00	5.5	863	M_20	2023	3	1
Boulettes de viande	1	16.00	5.5	863	M_1	2023	3	1
Kanelbulle	1	3.00	5.5	863	c-Kanelbulle	2023	3	1
Semla	1	4.00	5.5	863	c-Semla	2023	3	1
Café/Thé	2	4.00	5.5	863	c-Café/Thé	2023	3	1
Kanelbulle	1	3.00	5.5	864	c-Kanelbulle	2023	3	1
Décoration/Alcool	1	7.75	20	865	nb-1	2023	3	1
Décoration/Alcool	1	1.50	20	865	nb-2	2023	3	1
Décoration/Alcool	1	2.35	5.5	865	nb-3	2023	3	1
Ballerina kladdkaka	2	9.00	5.5	866	29	2023	3	1
Guld Marie	1	2.50	5.5	866	181	2023	3	1
Sandwich tomat basilika	1	2.10	5.5	866	477	2023	3	1
Filmjölk 3%	1	4.95	5.5	866	122	2023	3	1
Kallrökt Lax 150g Korshags	1	13.95	5.5	866	226	2023	3	1
Felix Krögarpytt Klassisk	1	10.95	5.5	872	117	2023	3	2
Finn Crisp Original	1	4.95	5.5	878	128	2023	3	2
Fiskbullar i buljong	3	20.85	5.5	882	131	2023	3	2
Senapssill	1	4.10	5.5	889	485	2023	3	2
Kanelbulle	1	3.00	5.5	895	c-Kanelbulle	2023	3	2
Pepparkaka Jul plåtburk	1	10.95	5.5	902	395	2023	3	3
Kanelbulle	1	3.00	5.5	911	c-Kanelbulle	2023	3	3
Magazine	1	7.90	2.1	915	nb-4	2023	3	3
Semla	3	12.00	5.5	920	c-Semla	2023	3	3
Finn Crisp Original	1	4.95	5.5	925	128	2023	3	3
Norrlands Guld 3.5 % BRK	1	3.50	5.5	933	374	2023	3	3
Lakrisal	2	2.40	5.5	940	283	2023	3	4
Smörgåsgurka 715g	1	7.50	5.5	943	508	2023	3	4
Cheez doodles 160g	1	4.20	5.5	950	63	2023	3	4
Kaldolmar i sas	1	15.00	5.5	958	852	2023	3	4
Finn Crisp Original	1	4.95	5.5	962	128	2023	3	4
Kalles kaviar original	4	22.00	5.5	969	773	2023	3	4
Skagenröra	1	5.95	5.5	974	491	2023	3	4
Billys pizza original	1	3.00	5.5	977	402	2023	3	4
Amerikansk Dressing Original	1	5.40	5.5	981	13	2023	3	4
Smash	1	4.95	5.5	981	502	2023	3	4
Alimentation	1	97.00	5.5	988	nb-1	2023	3	5
Kanelbulle	1	3.00	5.5	995	c-Kanelbulle	2023	3	5
Bullar x4	2	20.00	5.5	1000	c-Bullar x4	2023	3	5
Husman	2	7.90	5.5	1007	201	2023	3	5
Kanelbulle	1	3.00	5.5	1014	c-Kanelbulle	2023	3	5
Läkerol Cassis	6	12.60	5.5	1022	275	2023	3	5
Finn Crisp caraway	1	4.95	5.5	1032	127	2023	3	8
Delikatess Sesam knäcke	1	5.95	5.5	1040	82	2023	3	8
Alimentation	2	10.00	5.5	1044	nb-4	2023	3	8
Alimentation	1	132.00	5.5	1051	nb-1	2023	3	8
Alimentation	1	2.00	5.5	1059	nb-3	2023	3	9
Semla	1	4.00	5.5	1067	c-Semla	2023	3	9
Rödbetor aptit skivad	1	3.95	5.5	1070	459	2023	3	9
Vetekaka	1	8.95	5.5	1077	555	2023	3	9
Kanelbulle	1	3.00	5.5	1084	c-Kanelbulle	2023	3	9
Kanelbulle	1	3.00	5.5	1090	c-Kanelbulle	2023	3	10
Décoration/Alcool	1	8.00	5.5	1097	nb-2	2023	3	10
Senapssill	1	4.10	5.5	1101	485	2023	3	10
Magazine	1	5.80	2.1	1105	nb-2	2023	3	10
Mästar matjessill	1	5.95	5.5	1107	771	2023	3	10
Bullar x4	1	10.00	5.5	1113	c-Bullar x4	2023	3	10
Kanelbulle	1	3.00	5.5	1121	c-Kanelbulle	2023	3	11
Boulettes de viande	1	16.00	5.5	1129	M_1	2023	3	11
Salade de fruits	1	6.00	5.5	1133	M_23	2023	3	11
Magazine	1	4.90	5.5	1136	nb-1	2023	3	11
Knäcke trekant brungräddat	3	10.50	5.5	1142	253	2023	3	11
Décoration/Alcool	1	5.95	20	1142	nb-18	2023	3	11
Décoration/Alcool	1	2.00	5.5	1147	nb-8	2023	3	11
Små delikatess köttbullar	1	9.95	5.5	1156	501	2023	3	11
Décoration/Alcool	1	4.95	20	1164	nb-1	2023	3	11
Estrella chips grill	1	4.20	5.5	866	172	2023	3	1
Fiskbullar i hummersås MSC	1	6.95	5.5	872	133	2023	3	2
Alimentation	1	3.95	5.5	878	nb-2	2023	3	2
Gravad Lax 150g Korshags	1	13.95	5.5	882	167	2023	3	2
Sandwich tomat basilika	1	2.10	5.5	889	477	2023	3	2
Café/Thé	2	4.00	5.5	895	c-Café/Thé	2023	3	2
Kanelbulle	1	3.00	5.5	903	c-Kanelbulle	2023	3	3
Kanelbulle	1	3.00	5.5	912	c-Kanelbulle	2023	3	3
Kanelbulle	1	3.00	5.5	915	c-Kanelbulle	2023	3	3
Finn Crisp caraway	1	4.95	5.5	920	127	2023	3	3
Ballerina kladdkaka	1	4.50	5.5	926	29	2023	3	3
Décoration/Alcool	1	29.50	20	933	nb-4	2023	3	3
Rårörda lingon	1	8.95	5.5	940	447	2023	3	4
Kanelbulle	2	6.00	5.5	940	c-Kanelbulle	2023	3	4
Västerbottensost 35% normalbit	3	65.85	5.5	943	554	2023	3	4
Magazine	1	5.00	5.5	951	nb-1	2023	3	4
Rödbetssallad	1	4.95	5.5	958	461	2023	3	4
Kalles kaviar original	2	11.00	5.5	962	773	2023	3	4
Alimentation	1	3.40	5.5	970	nb-1	2023	3	4
Rödbetssallad	1	4.95	5.5	974	461	2023	3	4
Dipmix Ranch	1	1.95	5.5	977	92	2023	3	4
Ballerina Original	2	9.00	5.5	981	30	2023	3	4
Cheez doodles 160g	1	4.20	5.5	981	63	2023	3	4
Semla	2	8.00	5.5	989	c-Semla	2023	3	5
Bullar x4	1	10.00	5.5	996	c-Bullar x4	2023	3	5
Punschrulle singel	1	1.50	5.5	1000	430	2023	3	5
Décoration/Alcool	1	15.50	5.5	1000	nb-10	2023	3	5
Sport knäckebröd	1	4.20	5.5	1007	517	2023	3	5
Semla	1	4.00	5.5	1014	c-Semla	2023	3	5
Semla	1	4.00	5.5	1023	c-Semla	2023	3	5
Bullar x4	1	10.00	5.5	1033	c-Bullar x4	2023	3	8
Små delikatess köttbullar	1	9.95	5.5	1040	501	2023	3	8
Estrella dillchips	1	4.20	5.5	1044	84	2023	3	8
Ballerina kladdkaka	1	4.50	5.5	1052	29	2023	3	8
Kalles kaviar randiga	1	4.50	5.5	1060	774	2023	3	9
Boulettes de viande	1	16.00	5.5	1068	M_1	2023	3	9
​ Smörgåsgurka 370g	1	5.50	5.5	1070	507	2023	3	9
Polarbröd Rågkaka	1	8.95	5.5	1077	407	2023	3	9
Kardemumbulle	1	3.00	5.5	1084	c-Kardemumbulle	2023	3	9
Alimentation	1	3.10	5.5	1090	nb-5	2023	3	10
Décoration/Alcool	1	6.95	5.5	1097	nb-3	2023	3	10
Bullar x4	2	20.00	5.5	1101	c-Bullar x4	2023	3	10
Kardemumbulle	2	6.00	5.5	1105	c-Kardemumbulle	2023	3	10
Grebbestads® Ansjovisfilé Original	1	6.95	5.5	1107	171	2023	3	10
Semlor x4	1	15.00	5.5	1114	c-Semlor x4	2023	3	10
Skärgårdssill	1	4.95	5.5	1121	492	2023	3	11
Café/Thé	1	2.00	5.5	1129	c-Café/Thé	2023	3	11
Blabärsbulle	1	3.00	5.5	1134	c-Blabärsbulle	2023	3	11
Delicatoboll singel	1	1.50	5.5	1134	80	2023	3	11
Estrella dillchips	1	4.20	5.5	1136	84	2023	3	11
Rårörda lingon	1	8.95	5.5	1142	447	2023	3	11
Bullar x4	2	20.00	5.5	1148	c-Bullar x4	2023	3	11
HavreGryn Fiber	1	5.95	5.5	1156	188	2023	3	11
Décoration/Alcool	1	19.50	20	1164	nb-3	2023	3	11
Marsan vaniljsås färdig	1	4.95	5.5	867	350	2023	3	1
Alimentation	3	14.85	5.5	873	nb-1	2023	3	2
Alimentation	1	14.00	5.5	879	nb-1	2023	3	2
Kalles kaviar original	2	11.00	5.5	882	773	2023	3	2
Gravad Lax 150g Korshags	1	13.95	5.5	889	167	2023	3	2
Décoration/Alcool	1	4.80	20	895	nb-4	2023	3	2
Alimentation	1	4.00	5.5	903	nb-3	2023	3	3
Knäckebröd Frukost	1	5.50	5.5	913	255	2023	3	3
Delicatoboll singel	1	1.50	5.5	913	80	2023	3	3
Café/Thé	1	2.00	5.5	915	c-Café/Thé	2023	3	3
Finn Crisp Original	2	9.90	5.5	920	128	2023	3	3
Läkerol Raspberry Licorice	1	2.10	5.5	926	279	2023	3	3
Löksill	1	4.95	5.5	933	320	2023	3	3
Salt Skalle	1	2.50	5.5	940	469	2023	3	4
Guld Marie	1	2.50	5.5	940	181	2023	3	4
Magazine	1	10.50	2.1	943	nb-12	2023	3	4
Kanelbulle	1	3.00	5.5	952	c-Kanelbulle	2023	3	4
Kardemumma Malen 18g	1	3.95	5.5	958	236	2023	3	4
Pavé de saumon	1	18.00	5.5	963	M_21	2023	3	4
Läkerol Original	4	8.40	5.5	970	278	2023	3	4
Citronpeppar glasburk	1	3.95	5.5	974	70	2023	3	4
Felix Krögarpytt Klassisk	1	10.95	5.5	977	117	2023	3	4
Gott & Blandat Original	3	8.85	5.5	981	160	2023	3	4
Blabärsbulle	2	6.00	5.5	990	c-Blabärsbulle	2023	3	5
Semla	2	8.00	5.5	996	c-Semla	2023	3	5
Décoration/Alcool	1	4.80	20	1000	nb-9	2023	3	5
Smörgåsgurka 715g	2	15.00	5.5	1007	508	2023	3	5
Bullar x4	1	10.00	5.5	1015	c-Bullar x4	2023	3	5
Semla	1	4.00	5.5	1024	c-Semla	2023	3	5
Läkerol Salmiak	3	6.30	5.5	1026	281	2023	3	8
Décoration/Alcool	1	10.00	20	1034	nb-1	2023	3	8
Alimentation	1	5.00	5.5	1040	nb-4	2023	3	8
Soldatens ärtsoppa extra fläsk	1	9.95	5.5	1045	514	2023	3	8
Viol Tablettask	1	1.30	5.5	1053	558	2023	3	8
Polarbröd Rågkaka	1	8.95	5.5	1061	407	2023	3	9
Boulettes de viande	1	0.00	5.5	1068	M_1	2023	3	9
Magazine	1	9.50	2.1	1070	nb-11	2023	3	9
Ahlgrens bilar	1	2.95	5.5	1077	8	2023	3	9
Kanelbulle	1	3.00	5.5	1085	c-Kanelbulle	2023	3	9
Knäcke rund normalgräddat	1	7.95	5.5	1091	251	2023	3	10
Bullar x4	1	10.00	5.5	1097	c-Bullar x4	2023	3	10
Ramslök & Citron Sill	1	4.95	5.5	1101	445	2023	3	10
Magazine	1	1.50	5.5	1105	nb-4	2023	3	10
Kalles kaviar randiga	1	5.95	5.5	1107	774	2023	3	10
Semla	1	4.00	5.5	1114	c-Semla	2023	3	10
Senapssill	1	4.10	5.5	1121	485	2023	3	11
Bullar x4	1	10.00	5.5	1129	c-Bullar x4	2023	3	11
Löfbergs Mellanrost	1	12.95	5.5	1134	303	2023	3	11
Magazine	1	11.00	2.1	1134	nb-13	2023	3	11
Semlor x4	1	15.00	5.5	1137	c-Semlor x4	2023	3	11
Marabou Schweizer nöt	2	6.20	5.5	1142	346	2023	3	11
Café/Thé	1	2.00	5.5	1149	c-Café/Thé	2023	3	11
Serviette	1	3.50	20	1156	641	2023	3	11
Décoration/Alcool	1	9.50	20	1164	nb-4	2023	3	11
Kanel x4	1	10.00	5.5	867	c-Kanel x4	2023	3	1
Kanelbulle	2	6.00	5.5	874	c-Kanelbulle	2023	3	2
Alimentation	1	4.00	5.5	879	nb-2	2023	3	2
Soupe aux légumes de saison	1	8.00	5.5	883	M_20	2023	3	2
Kalles kaviar original	9	49.50	5.5	889	773	2023	3	2
Décoration/Alcool	1	4.00	5.5	895	nb-5	2023	3	2
Bullar x4	1	10.00	5.5	904	c-Bullar x4	2023	3	3
Filmjölk 3%	1	4.95	5.5	913	122	2023	3	3
Magazine	1	14.50	2.1	915	nb-7	2023	3	3
Kanelbulle	2	6.00	5.5	920	c-Kanelbulle	2023	3	3
Cheez doodles 160g	1	4.20	5.5	927	63	2023	3	3
Bullar x4	1	10.00	5.5	934	c-Bullar x4	2023	3	3
Runda Kanel	1	5.95	5.5	940	464	2023	3	4
Alimentation	1	2.65	5.5	940	nb-13	2023	3	4
Bullar x4	1	10.00	5.5	944	c-Bullar x4	2023	3	4
Décoration/Alcool	2	70.00	20	953	nb-1	2023	3	4
​ Smörgåsgurka 370g	2	11.00	5.5	958	507	2023	3	4
Pavé de saumon	1	18.00	5.5	963	M_21	2023	3	4
Kex Chocklad	1	2.00	5.5	970	239	2023	3	4
Slotts senap original tub	1	7.95	5.5	974	483	2023	3	4
Cheez doodles 35g	1	1.50	20	977	62	2023	3	4
Pripps Blå 3.5% 6-p BRK	2	7.00	5.5	982	426	2023	3	4
Bullar x4	1	10.00	5.5	990	c-Bullar x4	2023	3	5
Kanel x4	1	10.00	5.5	997	c-Kanel x4	2023	3	5
Kardemumbulle	2	6.00	5.5	1001	c-Kardemumbulle	2023	3	5
Felix Krögarpytt Klassisk	1	10.95	5.5	1008	117	2023	3	5
Lapin Kulta 3.5% BRK	1	3.50	5.5	1016	295	2023	3	5
Café/Thé	1	2.00	5.5	1025	c-Café/Thé	2023	3	5
Bullar x4	1	10.00	5.5	1027	c-Bullar x4	2023	3	8
Dipmix Ranch	1	1.95	5.5	1035	92	2023	3	8
Alimentation	1	7.00	5.5	1040	nb-5	2023	3	8
Köttsoppa m grönsaker	1	5.95	5.5	1045	258	2023	3	8
Gott & Blandat Original	1	2.95	5.5	1053	160	2023	3	8
Bullar x4	1	10.00	5.5	1061	c-Bullar x4	2023	3	9
Entrée - Plat	1	22.00	5.5	1068	M_8	2023	3	9
Sac	1	0.10	5.5	1070	c-Sac	2023	3	9
Magazine	1	5.70	5.5	1077	nb-4	2023	3	9
Blabärsbulle	1	3.00	5.5	1085	c-Blabärsbulle	2023	3	9
Finn Crisp Original	2	9.90	5.5	1091	128	2023	3	10
Hovmästarsås glasburk	1	4.50	5.5	1097	200	2023	3	10
Semlor x4	1	15.00	5.5	1102	c-Semlor x4	2023	3	10
Magazine	1	6.50	5.5	1105	nb-5	2023	3	10
Pepparkakor Annas	1	5.95	5.5	1107	396	2023	3	10
Café/Thé	1	2.00	5.5	1114	c-Café/Thé	2023	3	10
Senapssill  Stor	1	8.95	5.5	1122	487	2023	3	11
Finn Crisp Original	1	4.95	5.5	1129	128	2023	3	11
Kalles kaviar randiga	1	5.95	5.5	1134	774	2023	3	11
Räkost	1	8.95	5.5	1134	438	2023	3	11
Vetekaka	1	8.95	5.5	1137	555	2023	3	11
Såpa grön 750ml	1	4.50	20	1143	638	2023	3	11
Cheez doodles 160g	1	4.20	5.5	1150	63	2023	3	11
Décoration/Alcool	1	2.95	20	1156	nb-7	2023	3	11
Décoration/Alcool	1	80.00	20	1164	nb-5	2023	3	11
Alimentation	1	10.95	5.5	867	nb-2	2023	3	1
Semla	1	4.00	5.5	875	c-Semla	2023	3	2
Norrlands Guld 3.5 % BRK	1	3.50	5.5	879	374	2023	3	2
Kladdkaka	1	6.00	5.5	883	M_2	2023	3	2
Hovmästarsås glasburk	1	4.50	5.5	890	200	2023	3	2
Aggfarg	1	2.90	20	895	839	2023	3	2
Bullar x4	1	10.00	5.5	905	c-Bullar x4	2023	3	3
Knäcke trekant normalgräddat	1	3.50	5.5	913	254	2023	3	3
Kanelbulle	2	6.00	5.5	913	c-Kanelbulle	2023	3	3
Décoration/Alcool	1	4.50	20	915	nb-8	2023	3	3
Mandel biskvier	2	7.00	5.5	921	325	2023	3	3
Delicatoboll singel	1	1.50	5.5	927	80	2023	3	3
Kardemumbulle	2	6.00	5.5	935	c-Kardemumbulle	2023	3	4
Brunsås 3-pack	1	4.65	5.5	940	52	2023	3	4
Knäcke rund brungräddat	1	7.95	5.5	944	250	2023	3	4
Décoration/Alcool	1	2.95	20	953	nb-2	2023	3	4
Mörk Sirap	1	4.50	5.5	958	363	2023	3	4
Décoration/Alcool	2	4.00	5.5	964	nb-1	2023	3	4
Frödinge Princesstårta	1	15.00	5.5	970	144	2023	3	4
Semla	2	8.00	5.5	974	c-Semla	2023	3	4
Korvbröd 10-pack Tina och servera	1	4.50	5.5	977	257	2023	3	4
Ballerina Original	1	4.50	5.5	982	30	2023	3	4
Alimentation	1	2.95	5.5	990	nb-3	2023	3	5
Kardemum x4	1	10.00	5.5	997	c-Kardemum x4	2023	3	5
Bullar x4	2	20.00	5.5	1002	c-Bullar x4	2023	3	5
Små delikatess köttbullar	1	9.95	5.5	1008	501	2023	3	5
Saffransbulle	1	3.00	5.5	1017	c-Saffransbulle	2023	3	5
Décoration/Alcool	1	4.00	5.5	1025	nb-2	2023	3	5
Kanel x4	1	10.00	5.5	1028	c-Kanel x4	2023	3	8
Dippmix Fresh Island	1	1.95	5.5	1035	96	2023	3	8
Sac	1	0.10	5.5	1040	c-Sac	2023	3	8
Kalles kaviar randiga	2	9.00	5.5	1045	774	2023	3	8
Gott & blandat Salt	1	2.95	5.5	1053	161	2023	3	8
Boulettes de viande	1	16.00	5.5	1062	M_1	2023	3	9
Alimentation	2	4.00	5.5	1062	nb-9	2023	3	9
Finn Crisp caraway	1	4.95	5.5	1069	127	2023	3	9
Poëlée Pytt i Panna	1	0.00	5.5	1071	M_3	2023	3	9
Nyponsoppa original	1	5.95	5.5	1071	377	2023	3	9
Magazine	4	12.00	5.5	1071	nb-21	2023	3	9
HavreGryn Fiber	1	5.95	5.5	1078	188	2023	3	9
Café/Thé	2	4.00	5.5	1085	c-Café/Thé	2023	3	9
Bullar x4	1	10.00	5.5	1092	c-Bullar x4	2023	3	10
Pepparkaksmix	1	5.95	5.5	1098	781	2023	3	10
Alimentation	1	5.00	5.5	1102	nb-2	2023	3	10
Décoration/Alcool	2	9.90	20	1106	nb-1	2023	3	10
Serviette	1	4.50	20	1106	655	2023	3	10
Kanelbulle	1	3.00	5.5	1108	c-Kanelbulle	2023	3	10
Kanelbulle	1	3.00	5.5	1114	c-Kanelbulle	2023	3	10
Grebbestads® Ansjovisfilé Original	2	13.90	5.5	1122	171	2023	3	11
Knäcke rund brungräddat	1	7.95	5.5	1129	250	2023	3	11
Cheez doodles 160g	1	4.20	5.5	1134	63	2023	3	11
Läkerol Salmiak	1	2.10	5.5	1134	281	2023	3	11
Runda Kanel	1	5.95	5.5	1137	464	2023	3	11
Finn Crisp Original	1	4.95	5.5	1143	128	2023	3	11
Kanelbulle	2	6.00	5.5	1150	c-Kanelbulle	2023	3	11
Décoration/Alcool	1	14.50	20	1156	nb-8	2023	3	11
Rödbetssallad 400g	1	6.50	5.5	1165	462	2023	3	11
Smörgåsgurka 715g	1	7.50	5.5	868	508	2023	3	1
Assiette de hareng	1	8.00	5.5	876	M_4	2023	3	2
Saffransbulle	2	6.00	5.5	880	c-Saffransbulle	2023	3	2
Pavé de saumon	1	0.00	5.5	883	M_21	2023	3	2
Skärgårdssill	1	4.95	5.5	890	492	2023	3	2
Rödbetssallad 400g	1	6.50	5.5	895	462	2023	3	2
Kalles kaviar original	1	5.50	5.5	906	773	2023	3	3
Hovmästarsås glasburk	1	4.50	5.5	913	200	2023	3	3
Kanel x4	3	30.00	5.5	916	c-Kanel x4	2023	3	3
Ahlgrens bilar	2	5.90	5.5	921	8	2023	3	3
Décoration/Alcool	1	5.00	5.5	928	nb-1	2023	3	3
Bullar x4	1	10.00	5.5	936	c-Bullar x4	2023	3	4
F-müsli Guld nöt	1	6.95	5.5	940	109	2023	3	4
Pepparkakor Annas	1	5.95	5.5	944	396	2023	3	4
Grebbestads® Ansjovisfilé Original	4	27.80	5.5	953	171	2023	3	4
Senapssill	1	4.10	5.5	958	485	2023	3	4
Café/Thé	1	2.00	5.5	964	c-Café/Thé	2023	3	4
Décoration/Alcool	1	2.95	20	970	nb-5	2023	3	4
Décoration/Alcool	1	3.00	5.5	974	nb-7	2023	3	4
Bullar x4	1	10.00	5.5	977	c-Bullar x4	2023	3	4
Ballerina kladdkaka	1	4.50	5.5	982	29	2023	3	4
Marsan vaniljsås	3	10.50	5.5	991	767	2023	3	5
Semla	2	8.00	5.5	997	c-Semla	2023	3	5
Décoration/Alcool	1	8.00	5.5	1003	nb-1	2023	3	5
Knäckebröd Frukost	1	5.50	5.5	1008	255	2023	3	5
Marabou Mjölkchocklad Single	1	1.00	5.5	1018	343	2023	3	5
Bullar x4	3	30.00	5.5	1029	c-Bullar x4	2023	3	8
Semlor x4	1	15.00	5.5	1035	c-Semlor x4	2023	3	8
Bullar x4	1	10.00	5.5	1041	c-Bullar x4	2023	3	8
Blåbärssoppa original	1	5.95	5.5	1046	36	2023	3	8
Ahlgrens bilar Sursockrade	1	2.95	5.5	1053	11	2023	3	8
Boulettes de viande	1	16.00	5.5	1062	M_1	2023	3	9
Ahlgrens bilar	2	5.90	5.5	1069	8	2023	3	9
Glace vanille coulis baie polaire	1	0.00	5.5	1071	M_24	2023	3	9
Brunost	1	17.95	5.5	1071	51	2023	3	9
Alimentation	1	2.95	5.5	1078	nb-2	2023	3	9
Bullar x4	1	10.00	5.5	1086	c-Bullar x4	2023	3	9
Oatly ikaffe	1	4.80	5.5	1092	204	2023	3	10
Lingonsylt	1	8.95	5.5	1098	300	2023	3	10
Finn Crisp Original	1	4.95	5.5	1102	128	2023	3	10
Cheez doodles 160g	2	8.40	5.5	1106	63	2023	3	10
Bullar x4	2	20.00	5.5	1106	c-Bullar x4	2023	3	10
Café/Thé	1	2.00	5.5	1108	c-Café/Thé	2023	3	10
Kardemumbulle	1	3.00	5.5	1114	c-Kardemumbulle	2023	3	10
Felix Krögarpytt Klassisk	1	10.95	5.5	1122	117	2023	3	11
Kalles kaviar randiga	1	5.95	5.5	1130	774	2023	3	11
Gräddsås 3-pack	1	4.65	5.5	1134	164	2023	3	11
Ballerina Original	1	4.50	5.5	1134	30	2023	3	11
Lapponia 50cL 21%	1	15.95	20	1134	613	2023	3	11
Gott & Blandat Original	1	2.95	5.5	1137	160	2023	3	11
Bullar x4	1	10.00	5.5	1144	c-Bullar x4	2023	3	11
Décoration/Alcool	1	1.30	5.5	1150	nb-3	2023	3	11
Magazine	1	6.80	2.1	1156	nb-9	2023	3	11
Potatissallad	1	5.95	5.5	1165	418	2023	3	11
Räksallad	1	5.95	5.5	1165	441	2023	3	11
Jordnötsringar	1	3.50	5.5	869	214	2023	3	2
Norrlands Guld 3.5 % BRK	1	3.50	5.5	876	374	2023	3	2
Kanelbulle	1	3.00	5.5	880	c-Kanelbulle	2023	3	2
Salade de fruits	1	0.00	5.5	883	M_23	2023	3	2
Ramslök & Citron Sill	1	4.10	5.5	890	445	2023	3	2
Potatissallad	1	5.95	5.5	895	418	2023	3	2
Soupe aux pois cassé/lardons	1	8.00	5.5	907	M_19	2023	3	3
Falukorv ring Sverige	1	10.95	5.5	913	112	2023	3	3
Punschrulle singel	1	1.50	5.5	916	430	2023	3	3
Pepparkakor Annas	1	5.95	5.5	922	396	2023	3	3
Décoration/Alcool	1	2.50	5.5	929	nb-1	2023	3	3
Bullar x4	1	10.00	5.5	937	c-Bullar x4	2023	3	4
Semla	2	8.00	5.5	940	c-Semla	2023	3	4
Karen volf digestive	1	2.95	5.5	944	784	2023	3	4
Kalles kaviar original	15	82.50	5.5	953	773	2023	3	4
Grebbestads® Ansjovisfilé Original	1	6.95	5.5	958	171	2023	3	4
Loka Päron	1	2.00	5.5	964	316	2023	3	4
Décoration/Alcool	1	1.00	5.5	970	nb-6	2023	3	4
Décoration/Alcool	1	4.95	20	974	nb-8	2023	3	4
Estrella dillchips	1	4.20	5.5	978	84	2023	3	4
Rekorderlig Päron Cider	1	3.50	5.5	982	449	2023	3	4
Tutti frutti tablettask	4	6.00	5.5	991	742	2023	3	5
Décoration/Alcool	1	4.95	20	997	nb-4	2023	3	5
Café/Thé	1	2.00	5.5	1004	c-Café/Thé	2023	3	5
Gott & Blandat Original	1	2.95	5.5	1008	160	2023	3	5
Café/Thé	1	2.00	5.5	1018	c-Café/Thé	2023	3	5
Oboy 700g	1	8.50	5.5	1029	828	2023	3	8
Semla	1	4.00	5.5	1035	c-Semla	2023	3	8
Estrella dillchips	1	4.20	5.5	1041	84	2023	3	8
Bullar x4	1	10.00	5.5	1046	c-Bullar x4	2023	3	8
Gott & Blandat Supersur	1	2.95	5.5	1053	162	2023	3	8
Semla	2	8.00	5.5	1062	c-Semla	2023	3	9
Finn Crisp Original	1	4.95	5.5	1069	128	2023	3	9
Plat - Dessert	1	20.00	5.5	1071	M_16	2023	3	9
Magazine	3	17.85	2.1	1071	nb-11	2023	3	9
F-müsli Guld nöt	1	6.95	5.5	1078	109	2023	3	9
Semla	1	4.00	5.5	1086	c-Semla	2023	3	9
Kalles kaviar randiga	4	23.80	5.5	1093	774	2023	3	10
Magazine	1	10.50	2.1	1098	nb-3	2023	3	10
Läkerol Eucalyptus	1	2.10	5.5	1102	276	2023	3	10
Jordnötsringar	1	3.50	5.5	1106	214	2023	3	10
Décoration/Alcool	1	12.60	5.5	1106	nb-13	2023	3	10
Décoration/Alcool	1	4.95	20	1108	nb-3	2023	3	10
Kanelbulle	1	3.00	5.5	1115	c-Kanelbulle	2023	3	11
Décoration/Alcool	1	3.50	20	1122	nb-4	2023	3	11
Gott & blandat Salt	1	2.95	5.5	1130	161	2023	3	11
Bullens Pilsnerkorv	1	6.95	5.5	1134	55	2023	3	11
Klassiska Köttbullar	1	12.95	5.5	1134	247	2023	3	11
Kex Chocklad	1	2.00	5.5	1134	239	2023	3	11
Noblesse Original Crisp	1	6.95	5.5	1137	372	2023	3	11
Runda Kanel	3	17.85	5.5	1144	464	2023	3	11
Pripps Blå 3.5% 6-p BRK	1	3.50	5.5	1151	426	2023	3	11
Kaffe mellanrost brygg	1	12.95	5.5	1157	220	2023	3	11
Inlagd Sill	1	8.95	5.5	1165	207	2023	3	11
Noblesse Apelsin Crisp	1	6.95	5.5	869	369	2023	3	2
Löksill	1	4.95	5.5	876	320	2023	3	2
Kanel x4	1	10.00	5.5	880	c-Kanel x4	2023	3	2
Plat - Dessert Saumon	1	22.00	5.5	883	M_31	2023	3	2
Mästar matjessill	1	5.95	5.5	890	771	2023	3	2
Décoration/Alcool	1	3.00	5.5	896	nb-1	2023	3	2
Assiette nordique	1	8.00	5.5	907	M_35	2023	3	3
Estrella dillchips	2	8.40	5.5	913	84	2023	3	3
Kardemumbulle	1	3.00	5.5	917	c-Kardemumbulle	2023	3	3
Räkost	1	8.95	5.5	922	438	2023	3	3
Haribo nappar frukt	1	1.50	5.5	929	752	2023	3	3
Kalles kaviar original	3	16.50	5.5	937	773	2023	3	4
Café/Thé	2	4.00	5.5	940	c-Café/Thé	2023	3	4
Kallrökt Lax 150g Korshags	1	13.95	5.5	944	226	2023	3	4
Kronljus 25cm 30st	1	29.95	5.5	953	610	2023	3	4
Semla	2	8.00	5.5	959	c-Semla	2023	3	4
Boulettes de viande	1	16.00	5.5	965	M_1	2023	3	4
Café/Thé	2	4.00	5.5	971	c-Café/Thé	2023	3	4
Pavé de saumon	1	18.00	5.5	975	M_21	2023	3	4
Husman	1	3.95	5.5	978	201	2023	3	4
Café/Thé	3	6.00	5.5	983	c-Café/Thé	2023	3	4
Bien joué Alphonse	1	6.00	5.5	991	849	2023	3	5
Kanelbulle	1	3.00	5.5	998	c-Kanelbulle	2023	3	5
Rårörda lingon	3	26.85	5.5	1004	447	2023	3	5
Cheez doodles 160g	1	4.20	5.5	1008	63	2023	3	5
Décoration/Alcool	1	10.00	20	1018	nb-3	2023	3	5
Delicatoboll singel	4	6.00	5.5	1029	80	2023	3	8
Sac	1	0.10	5.5	1035	c-Sac	2023	3	8
Sac	1	0.10	5.5	1041	c-Sac	2023	3	8
Oatly ikaffe	1	4.80	5.5	1047	204	2023	3	8
Skogaholmslimpa skiv Tina och servera	1	6.95	5.5	1054	498	2023	3	8
Bullar x4	1	10.00	5.5	1062	c-Bullar x4	2023	3	9
Frödinge Princesstårta	1	15.00	5.5	1069	144	2023	3	9
Verre de vin	1	4.00	5.5	1071	M_34	2023	3	9
Inlagd Sill	1	8.95	5.5	1071	207	2023	3	9
Kalles kaviar randiga	1	5.95	5.5	1079	774	2023	3	9
Alimentation	1	39.60	5.5	1087	nb-1	2023	3	9
Tunnbröd Litet	1	6.95	5.5	1093	541	2023	3	10
Knäcke Fäbod original	1	8.95	5.5	1099	249	2023	3	10
Läkerol Original	1	2.10	5.5	1102	278	2023	3	10
Estrella chips grill	1	4.20	5.5	1106	172	2023	3	10
Lingonsylt	1	8.95	5.5	1108	300	2023	3	10
Kardemumbulle	1	3.00	5.5	1115	c-Kardemumbulle	2023	3	11
Ströbröd	1	4.50	5.5	1123	520	2023	3	11
Djungelvrål	1	1.95	5.5	1130	101	2023	3	11
Owl smörsmak popcorn	1	5.95	5.5	1134	762	2023	3	11
Läkerol Salvi	1	2.10	5.5	1134	282	2023	3	11
Décoration/Alcool	2	13.90	20	1137	nb-6	2023	3	11
Knäcke Fäbod original	1	8.95	5.5	1144	249	2023	3	11
Mariestads Öl 3.5% 50cL	1	3.50	5.5	1151	349	2023	3	11
Bullar x4	1	10.00	5.5	1158	c-Bullar x4	2023	3	11
Décoration/Alcool	1	7.00	5.5	1165	nb-5	2023	3	11
Alimentation	1	29.00	5.5	869	nb-3	2023	3	2
Loka mango lime	1	2.00	5.5	876	734	2023	3	2
Saffran x4	1	10.00	5.5	880	c-Saffran x4	2023	3	2
Bullar x4	1	10.00	5.5	884	c-Bullar x4	2023	3	2
Kalles kaviar original	1	5.50	5.5	890	773	2023	3	2
Kardemumbulle	1	3.00	5.5	897	c-Kardemumbulle	2023	3	2
Assiette nordique	1	8.00	5.5	908	M_35	2023	3	3
Viol Tablettask	1	1.30	5.5	913	558	2023	3	3
Knäcke trekant normalgräddat	1	3.50	5.5	918	254	2023	3	3
Café/Thé	1	2.00	5.5	918	c-Café/Thé	2023	3	3
Dippmix Dill & Gräslök	1	1.95	5.5	922	95	2023	3	3
Tyrkisk Peber Original	1	3.50	5.5	929	545	2023	3	3
Ljus Sirap	1	4.50	5.5	937	302	2023	3	4
Alimentation	1	34.95	5.5	940	nb-10	2023	3	4
Filmjölk 3%	1	4.95	5.5	944	122	2023	3	4
Boulettes de viande	1	16.00	5.5	954	M_1	2023	3	4
Décoration/Alcool	1	2.30	5.5	959	nb-2	2023	3	4
Café/Thé	1	2.00	5.5	965	c-Café/Thé	2023	3	4
Kanelbulle	1	3.00	5.5	971	c-Kanelbulle	2023	3	4
Semla	1	4.00	5.5	975	c-Semla	2023	3	4
Café/Thé	1	2.00	5.5	979	c-Café/Thé	2023	3	4
Bullar x4	1	10.00	5.5	983	c-Bullar x4	2023	3	4
Bonne nuit Alphonse	1	12.00	5.5	991	847	2023	3	5
Café/Thé	1	2.00	5.5	998	c-Café/Thé	2023	3	5
​ Smörgåsgurka 370g	1	5.50	5.5	1004	507	2023	3	5
Estrella linschips sourcream onion	1	3.95	5.5	1008	741	2023	3	5
Bullar x4	1	10.00	5.5	1019	c-Bullar x4	2023	3	5
Estrella chips grill	1	4.20	5.5	1029	172	2023	3	8
Alimentation	1	14.00	5.5	1036	nb-1	2023	3	8
Alimentation	1	3.58	5.5	1042	nb-1	2023	3	8
Ramslök & Citron Sill	1	4.10	5.5	1047	445	2023	3	8
Cheez doodles 160g	1	4.20	5.5	1054	63	2023	3	8
Café/Thé	1	2.00	5.5	1062	c-Café/Thé	2023	3	9
Räkost	2	17.89	5.5	1069	438	2023	3	9
Café/Thé	3	6.00	5.5	1071	c-Café/Thé	2023	3	9
Plopp dubbel stycksak	1	1.70	5.5	1071	405	2023	3	9
Kronjäst för söta degar färsk	1	2.00	5.5	1079	261	2023	3	9
Bullar x4	2	20.00	5.5	1088	c-Bullar x4	2023	3	10
Décoration/Alcool	1	7.95	20	1094	nb-1	2023	3	10
Décoration/Alcool	2	11.00	20	1099	nb-2	2023	3	10
Kex Chocklad	2	4.00	5.5	1102	239	2023	3	10
Nyponsoppa original	1	5.95	5.5	1106	377	2023	3	10
Décoration/Alcool	2	4.00	5.5	1106	nb-14	2023	3	10
Felix Krögarpytt Klassisk	2	21.90	5.5	1109	117	2023	3	10
Blabärsbulle	1	3.00	5.5	1115	c-Blabärsbulle	2023	3	11
Räkost	1	8.95	5.5	1123	438	2023	3	11
Alimentation	1	5.90	5.5	1131	nb-1	2023	3	11
Små delikatess köttbullar	1	9.95	5.5	1134	501	2023	3	11
Läkerol Licorice Seasalt	1	2.10	5.5	1134	277	2023	3	11
Mjölkchoklad Kaka	1	3.10	5.5	1134	362	2023	3	11
Café/Thé	2	4.00	5.5	1138	c-Café/Thé	2023	3	11
Décoration/Alcool	1	6.00	20	1144	nb-4	2023	3	11
Singoalla original	1	4.50	5.5	1151	490	2023	3	11
Kardemumbulle	1	3.00	5.5	1159	c-Kardemumbulle	2023	3	11
O.P. Anderson	1	35.00	20	1165	625	2023	3	11
Skagenröra	1	5.95	5.5	869	491	2023	3	2
Assiette nordique	1	8.00	5.5	876	M_35	2023	3	2
Alimentation	1	1.00	5.5	880	nb-5	2023	3	2
Kanelbulle	2	6.00	5.5	885	c-Kanelbulle	2023	3	2
Bullar x4	1	10.00	5.5	891	c-Bullar x4	2023	3	2
Kanelbulle	1	3.00	5.5	898	c-Kanelbulle	2023	3	3
Entrée Veg	1	8.00	5.5	908	M_37	2023	3	3
Emser	1	2.25	20	913	106	2023	3	3
Knäcke trekant brungräddat	1	3.50	5.5	918	253	2023	3	3
Anthon berg Marzipan bar	1	2.50	5.5	922	853	2023	3	3
Semla	2	8.00	5.5	930	c-Semla	2023	3	3
Marabou Schweizer nöt	1	3.10	5.5	938	346	2023	3	4
Kanelbulle	2	6.00	5.5	941	c-Kanelbulle	2023	3	4
Bullar x4	1	10.00	5.5	945	c-Bullar x4	2023	3	4
Poëlée Pytt i Panna	1	16.00	5.5	954	M_3	2023	3	4
Poëlée Pytt i Panna	1	16.00	5.5	960	M_3	2023	3	4
Daim Chokladkaka	2	6.20	5.5	966	77	2023	3	4
Mariestads Öl 3.5% 50cL	1	3.50	5.5	971	349	2023	3	4
Café/Thé	1	2.00	5.5	975	c-Café/Thé	2023	3	4
Loka Naturell Brk	1	2.00	5.5	979	314	2023	3	4
O.P. Anderson	1	35.00	20	984	625	2023	3	4
Bullar x4	1	10.00	5.5	992	c-Bullar x4	2023	3	5
Boulettes de viande	1	16.00	5.5	999	M_1	2023	3	5
Läkerol Eucalyptus	1	2.10	5.5	1004	276	2023	3	5
Oboy 700g	1	8.50	5.5	1008	828	2023	3	5
Loka Päron	1	2.00	5.5	1019	316	2023	3	5
Knäckebröd Frukost	1	5.50	5.5	1029	255	2023	3	8
Cheez doodles 160g	1	4.20	5.5	1036	63	2023	3	8
Knäcke Fäbod original	2	17.89	5.5	1042	249	2023	3	8
Vetekaka	1	8.95	5.5	1047	555	2023	3	8
Micropopcorn Salt 3 pack	1	5.55	5.5	1054	358	2023	3	8
Loka Naturell Brk	1	2.00	5.5	1062	314	2023	3	9
Falu Chia & Havssalt rågrut	1	5.95	5.5	1069	757	2023	3	9
Magazine	1	5.95	5.5	1071	nb-10	2023	3	9
Löksill	1	4.95	5.5	1071	320	2023	3	9
Kardemumbulle	1	3.00	5.5	1080	c-Kardemumbulle	2023	3	9
Korvbröd 10-pack Tina och servera	1	4.50	5.5	1089	257	2023	3	10
Läkerol Raspberry Licorice	4	8.40	5.5	1094	279	2023	3	10
Kalles kaviar randiga	1	5.95	5.5	1099	774	2023	3	10
Noblesse Original Crisp	1	6.95	5.5	1102	372	2023	3	10
Noblesse Apelsin Crisp	2	13.90	5.5	1106	369	2023	3	10
Löksill	1	4.95	5.5	1109	320	2023	3	10
Cheez doodles 160g	4	16.80	5.5	1116	63	2023	3	11
Slotts senap original tub	1	7.95	5.5	1123	483	2023	3	11
Kladdkaka	1	0.00	5.5	1132	M_2	2023	3	11
Loka Päron	1	2.00	5.5	1134	316	2023	3	11
Läkerol Original	1	2.10	5.5	1134	278	2023	3	11
Kanelbulle	1	3.00	5.5	1138	c-Kanelbulle	2023	3	11
Café/Thé	2	4.00	5.5	1145	c-Café/Thé	2023	3	11
Décoration/Alcool	1	6.20	5.5	1151	nb-4	2023	3	11
Alimentation	1	5.00	5.5	1159	nb-2	2023	3	11
Rödbetssallad	1	4.95	5.5	869	461	2023	3	2
Pavé de saumon	1	18.00	5.5	876	M_21	2023	3	2
Dipmix Sourcream onion	1	1.95	5.5	881	94	2023	3	2
Café/Thé	2	4.00	5.5	886	c-Café/Thé	2023	3	2
Café/Thé	1	2.00	5.5	891	c-Café/Thé	2023	3	2
Serviette	1	4.50	20	898	664	2023	3	3
Gravad Lax 150g Korshags	1	13.95	5.5	909	167	2023	3	3
Haribo nappar cola-sur	1	1.50	5.5	913	802	2023	3	3
Frödinge Kladdkaka	1	9.95	5.5	918	143	2023	3	3
Décoration/Alcool	2	2.00	20	918	nb-16	2023	3	3
Fazer Oat choco	1	2.00	5.5	922	739	2023	3	3
Alimentation	1	2.00	5.5	930	nb-2	2023	3	3
Marabou schweizer nöt 200g	2	11.90	5.5	938	799	2023	3	4
Husman	1	3.95	5.5	942	201	2023	3	4
Bullar x4	1	10.00	5.5	946	c-Bullar x4	2023	3	4
Bullar x4	1	10.00	5.5	954	c-Bullar x4	2023	3	4
Boulettes de viande	1	16.00	5.5	960	M_1	2023	3	4
Décoration/Alcool	1	10.00	5.5	966	nb-2	2023	3	4
Punschrulle singel	1	1.50	5.5	971	430	2023	3	4
Pavé de saumon	1	18.00	5.5	976	M_21	2023	3	4
Bullar x4	1	10.00	5.5	979	c-Bullar x4	2023	3	4
Bullar x4	1	10.00	5.5	984	c-Bullar x4	2023	3	4
Klassiska Köttbullar	1	12.95	5.5	993	247	2023	3	5
Boulettes de viande	1	16.00	5.5	999	M_1	2023	3	5
Anthon berg Marzipan bar	2	5.00	5.5	1004	853	2023	3	5
Kanelbulle	1	3.00	5.5	1009	c-Kanelbulle	2023	3	5
Gott & blandat bär & frukt	2	5.90	5.5	1019	800	2023	3	5
Guld Marie	1	2.50	5.5	1029	181	2023	3	8
Rekorderlig Päron Cider	1	3.50	5.5	1036	449	2023	3	8
Guld Marie	1	2.50	5.5	1042	181	2023	3	8
Klassiska Köttbullar	2	25.90	5.5	1048	247	2023	3	8
Köttsoppa m grönsaker	1	5.95	5.5	1054	258	2023	3	8
Finn Crisp Original	2	9.90	5.5	1062	128	2023	3	9
Vaniljsocker	1	3.95	5.5	1069	768	2023	3	9
Poëlée Pytt i Panna	1	16.00	5.5	1071	M_3	2023	3	9
Läkerol Original	1	2.10	5.5	1071	278	2023	3	9
Läkerol Cassis	1	2.10	5.5	1080	275	2023	3	9
Bullens Pilsnerkorv	1	6.95	5.5	1089	55	2023	3	10
Läkerol Cactus	2	4.20	5.5	1094	274	2023	3	10
Senapssill	1	4.10	5.5	1099	485	2023	3	10
Soupe aux pois cassé/lardons	1	8.00	5.5	1103	M_19	2023	3	10
Haribo nappar cola-sur	1	1.50	5.5	1106	802	2023	3	10
Ramslök & Citron Sill	1	4.95	5.5	1109	445	2023	3	10
Ahlgrens bilar	2	5.90	5.5	1116	8	2023	3	11
Grebbestads® Ansjovisfilé Original	1	6.95	5.5	1123	171	2023	3	11
Entrée - Plat - Dessert	1	28.00	5.5	1132	M_10	2023	3	11
Boulettes de viande	1	0.00	5.5	1132	M_1	2023	3	11
Chips Sourcream & onion	1	1.20	5.5	1134	67	2023	3	11
Läkerol Raspberry Licorice	1	2.10	5.5	1134	279	2023	3	11
Kanelbulle	2	6.00	5.5	1139	c-Kanelbulle	2023	3	11
Décoration/Alcool	1	2.00	5.5	1145	nb-2	2023	3	11
Marsan vaniljsås färdig	1	4.95	5.5	1152	350	2023	3	11
Alimentation	3	6.00	5.5	1160	nb-1	2023	3	11
Kalles kaviar original	1	5.50	5.5	869	773	2023	3	2
Boulettes de viande	1	16.00	5.5	876	M_1	2023	3	2
Semlor x4	1	15.00	5.5	881	c-Semlor x4	2023	3	2
Alimentation	1	35.00	5.5	886	nb-2	2023	3	2
Filmjölk 3%	2	9.90	5.5	892	122	2023	3	2
Bullar x4	1	10.00	5.5	899	c-Bullar x4	2023	3	3
Gott & blandat bär & frukt	1	2.95	5.5	909	800	2023	3	3
Tyrkisk Peber Original	1	3.50	5.5	913	545	2023	3	3
Frödinge Princesstårta	2	30.00	5.5	918	144	2023	3	3
Kanelbulle	1	3.00	5.5	918	c-Kanelbulle	2023	3	3
Zoo Tablettask	1	1.50	20	922	567	2023	3	3
Salta Katten	1	1.50	20	930	470	2023	3	3
Kex Chocklad	2	4.00	5.5	938	239	2023	3	4
Ahlgrens bilar Sursockrade	2	5.90	5.5	942	11	2023	3	4
Café/Thé	2	4.00	5.5	946	c-Café/Thé	2023	3	4
Café/Thé	2	4.00	5.5	954	c-Café/Thé	2023	3	4
Café/Thé	2	4.00	5.5	960	c-Café/Thé	2023	3	4
Décoration/Alcool	1	16.00	5.5	966	nb-3	2023	3	4
Daim singel	1	1.00	5.5	971	79	2023	3	4
Semla	1	4.00	5.5	976	c-Semla	2023	3	4
Café/Thé	2	4.00	5.5	980	c-Café/Thé	2023	3	4
Semla	2	8.00	5.5	984	c-Semla	2023	3	4
Ramslök & Citron Sill	1	4.10	5.5	993	445	2023	3	5
Filmjölk 3%	1	4.95	5.5	999	122	2023	3	5
Pepparkakor Annas	1	5.95	5.5	1004	396	2023	3	5
Blabärsbulle	1	3.00	5.5	1010	c-Blabärsbulle	2023	3	5
Marabou Black Saltlakrits	1	3.10	5.5	1019	334	2023	3	5
Ballerina Original	2	9.00	5.5	1029	30	2023	3	8
Alimentation	2	7.00	5.5	1036	nb-4	2023	3	8
Soldatens ärtsoppa extra fläsk	1	9.95	5.5	1042	514	2023	3	8
Estrella dillchips	1	4.20	5.5	1048	84	2023	3	8
Kanelbulle	2	6.00	5.5	1054	c-Kanelbulle	2023	3	8
Frödinge Princesstårta	1	15.00	5.5	1062	144	2023	3	9
Plopp dubbel stycksak	2	3.40	5.5	1069	405	2023	3	9
Alimentation	1	3.70	5.5	1069	nb-12	2023	3	9
Poëlée Pytt i Panna	1	16.00	5.5	1071	M_3	2023	3	9
Läkerol Bon Bons	1	2.10	5.5	1071	273	2023	3	9
Filmjölk 3%	2	9.90	5.5	1081	122	2023	3	9
Bullar x4	1	10.00	5.5	1089	c-Bullar x4	2023	3	10
Läkerol Original	2	4.20	5.5	1094	278	2023	3	10
Slotts senap original tub	1	5.95	5.5	1099	481	2023	3	10
Décoration/Alcool	2	8.00	20	1103	nb-3	2023	3	10
Décoration/Alcool	1	2.95	20	1106	nb-10	2023	3	10
Bullar x4	1	10.00	5.5	1109	c-Bullar x4	2023	3	10
Knäcke rund normalgräddat	1	7.95	5.5	1116	251	2023	3	11
Kanelbulle	1	3.00	5.5	1124	c-Kanelbulle	2023	3	11
Kladdkaka	1	0.00	5.5	1132	M_2	2023	3	11
Soupe aux pois cassé/lardons	1	0.00	5.5	1132	M_19	2023	3	11
Salade de fruits	1	0.00	5.5	1135	M_23	2023	3	11
Bullar x4	1	10.00	5.5	1140	c-Bullar x4	2023	3	11
Kanelbulle	2	6.00	5.5	1145	c-Kanelbulle	2023	3	11
Kalles kaviar randiga	1	5.95	5.5	1152	774	2023	3	11
Cheez doodles 160g	2	8.40	5.5	1160	63	2023	3	11
Herrljunga cider 1L	1	3.95	5.5	869	796	2023	3	2
Ättikssprit 12%	1	4.50	5.5	876	26	2023	3	2
Rödbetor aptit skivad	1	3.95	5.5	881	459	2023	3	2
Zoo Tablettask	14	21.00	20	886	567	2023	3	2
Kalles kaviar original	5	27.50	5.5	893	773	2023	3	2
Kanelbulle	1	3.00	5.5	900	c-Kanelbulle	2023	3	3
Rödbetssallad	1	4.95	5.5	909	461	2023	3	3
Bullar x4	1	10.00	5.5	914	c-Bullar x4	2023	3	3
Pepparkakor Annas	1	5.95	5.5	918	396	2023	3	3
Bullar x4	2	20.00	5.5	918	c-Bullar x4	2023	3	3
Kardemumbulle	1	3.00	5.5	922	c-Kardemumbulle	2023	3	3
Djungelvrål	1	1.95	5.5	930	101	2023	3	3
Ahlgrens bilar lakrits däck	3	8.85	5.5	938	10	2023	3	4
Ahlgrens bilar	1	2.95	5.5	942	8	2023	3	4
Blabärsbulle	1	3.00	5.5	947	c-Blabärsbulle	2023	3	4
Rårörda lingon	1	8.95	5.5	954	447	2023	3	4
Bullar x4	1	10.00	5.5	961	c-Bullar x4	2023	3	4
Kanelbulle	2	6.00	5.5	967	c-Kanelbulle	2023	3	4
Chips Sourcream & onion	1	1.20	5.5	971	67	2023	3	4
Café/Thé	1	2.00	5.5	976	c-Café/Thé	2023	3	4
Semla	1	4.00	5.5	980	c-Semla	2023	3	4
Chips Sourcream & onion	1	1.20	5.5	985	67	2023	3	4
Skärgårdssill	1	4.95	5.5	993	492	2023	3	5
Bullar x4	1	10.00	5.5	999	c-Bullar x4	2023	3	5
Små delikatess köttbullar	3	29.85	5.5	1004	501	2023	3	5
Kardemumbulle	2	6.00	5.5	1010	c-Kardemumbulle	2023	3	5
Ahlgrens bilar	1	2.95	5.5	1019	8	2023	3	5
Marsan vaniljsås	3	10.50	5.5	1029	767	2023	3	8
Blabärsbulle	1	3.00	5.5	1036	c-Blabärsbulle	2023	3	8
Felix Krögarpytt Klassisk	1	10.95	5.5	1042	117	2023	3	8
Gräddsås 3-pack	1	4.65	5.5	1048	164	2023	3	8
Alimentation	2	4.00	5.5	1054	nb-6	2023	3	8
Finn Crisp Original	1	4.95	5.5	1064	128	2023	3	9
Ahlgrens bilar lakrits däck	1	2.95	5.5	1069	10	2023	3	9
Alimentation	2	11.90	5.5	1069	nb-11	2023	3	9
Loka Naturell Brk	2	4.00	5.5	1071	314	2023	3	9
Kex Chocklad	1	2.00	5.5	1071	239	2023	3	9
Loka Päron	1	2.00	5.5	1081	316	2023	3	9
Alimentation	1	5.10	5.5	1089	nb-8	2023	3	10
Läkerol Cassis	2	4.20	5.5	1094	275	2023	3	10
Skinkost 175g	1	7.95	5.5	1099	496	2023	3	10
Café/Thé	2	4.00	5.5	1103	c-Café/Thé	2023	3	10
Ahlgrens bilar lakrits däck	1	2.95	5.5	1106	10	2023	3	10
Kanelbulle	1	3.00	5.5	1110	c-Kanelbulle	2023	3	10
Magazine	1	6.00	2.1	1116	nb-4	2023	3	11
Bullar x4	1	10.00	5.5	1125	c-Bullar x4	2023	3	11
Soupe aux pois cassé/lardons	1	0.00	5.5	1132	M_19	2023	3	11
Soupe aux pois cassé/lardons	1	0.00	5.5	1132	M_19	2023	3	11
Boulettes de viande	1	0.00	5.5	1135	M_1	2023	3	11
Bullar x4	1	10.00	5.5	1141	c-Bullar x4	2023	3	11
Décoration/Alcool	1	3.50	5.5	1146	nb-1	2023	3	11
Haribo nappar frukt	1	1.50	5.5	1152	752	2023	3	11
Kex Chocklad	2	4.00	5.5	1160	239	2023	3	11
Bullar x4	1	10.00	5.5	870	c-Bullar x4	2023	3	2
Bullar x4	1	10.00	5.5	876	c-Bullar x4	2023	3	2
Falukorv ring Sverige	1	10.95	5.5	881	112	2023	3	2
Alimentation	1	2.00	5.5	887	nb-1	2023	3	2
Skärgårdssill	1	4.95	5.5	893	492	2023	3	2
Formule sand	1	10.00	5.5	901	c-Formule sand	2023	3	3
Gott & Blandat Original	1	2.95	5.5	909	160	2023	3	3
Kung Oscar pepparkakor	1	5.95	5.5	914	746	2023	3	3
Finn Crisp Original	1	4.95	5.5	918	128	2023	3	3
Blabärsbulle	1	3.00	5.5	922	c-Blabärsbulle	2023	3	3
Alimentation	1	2.60	5.5	930	nb-5	2023	3	3
Plopp dubbel stycksak	3	5.09	5.5	938	405	2023	3	4
Knäcke Fäbod original	1	8.95	5.5	943	249	2023	3	4
Magazine	1	9.90	2.1	943	nb-13	2023	3	4
Magazine	1	5.80	2.1	947	nb-2	2023	3	4
Hovmästarsås glasburk	1	4.50	5.5	954	200	2023	3	4
Tändstickor	1	3.95	20	961	689	2023	3	4
Décoration/Alcool	1	12.95	20	967	nb-2	2023	3	4
Cheez doodles 35g	1	1.50	20	971	62	2023	3	4
Loka Naturell Brk	1	2.00	5.5	976	314	2023	3	4
Felix Krögarpytt Klassisk	2	21.90	5.5	981	117	2023	3	4
Dipmix Sourcream onion	1	1.95	5.5	981	94	2023	3	4
Riskakor Gräddfil Lök glutenfria	2	9.50	5.5	985	457	2023	3	4
Semla	3	12.00	5.5	994	c-Semla	2023	3	5
Semla	1	4.00	5.5	999	c-Semla	2023	3	5
Felix Krögarpytt Klassisk	2	21.90	5.5	1004	117	2023	3	5
Haribo nappar sur	1	1.50	5.5	1011	753	2023	3	5
Viol Tablettask	5	6.50	5.5	1019	558	2023	3	5
Filmjölk 3%	1	4.95	5.5	1030	122	2023	3	8
Kanelbulle	2	6.00	5.5	1037	c-Kanelbulle	2023	3	8
Sac	2	0.20	5.5	1042	c-Sac	2023	3	8
Bullar x4	1	10.00	5.5	1042	c-Bullar x4	2023	3	8
Kanelbulle	2	6.00	5.5	1048	c-Kanelbulle	2023	3	8
Kardemumbulle	1	3.00	5.5	1055	c-Kardemumbulle	2023	3	8
Kardemumbulle	1	3.00	5.5	1065	c-Kardemumbulle	2023	3	9
Diskborste classic mix	1	1.95	20	1069	592	2023	3	9
Semla	2	8.00	5.5	1071	c-Semla	2023	3	9
Daim dubbel	5	10.00	5.5	1071	78	2023	3	9
Havre Fras	1	8.95	5.5	1081	185	2023	3	9
Chips Sourcream & onion	2	2.40	5.5	1089	67	2023	3	10
Tutti frutti tablettask	4	6.00	5.5	1094	742	2023	3	10
Räksallad	1	5.95	5.5	1099	441	2023	3	10
Kanelbulle	2	6.00	5.5	1103	c-Kanelbulle	2023	3	10
Lakrisal	1	1.20	5.5	1106	283	2023	3	10
Café/Thé	1	2.00	5.5	1110	c-Café/Thé	2023	3	10
Décoration/Alcool	1	5.95	20	1116	nb-5	2023	3	11
Alimentation	1	5.00	5.5	1125	nb-2	2023	3	11
Boulettes de viande	1	0.00	5.5	1132	M_1	2023	3	11
Entrée - Plat - Dessert	1	28.00	5.5	1132	M_10	2023	3	11
Assiette de hareng	1	0.00	5.5	1135	M_4	2023	3	11
Kanelbulle	1	3.00	5.5	1141	c-Kanelbulle	2023	3	11
Décoration/Alcool	1	12.00	20	1147	nb-1	2023	3	11
Chips Sourcream & onion	2	2.40	5.5	1153	67	2023	3	11
Guld Marie	1	2.50	5.5	1160	181	2023	3	11
Löksill	2	9.90	5.5	870	320	2023	3	2
Kanelbulle	2	6.00	5.5	876	c-Kanelbulle	2023	3	2
Tacosås Medium	1	4.50	5.5	881	530	2023	3	2
Kanelbulle	1	3.00	5.5	881	c-Kanelbulle	2023	3	2
Marabou Black Saltlakrits	1	3.10	5.5	887	334	2023	3	2
Löksill	1	4.95	5.5	893	320	2023	3	2
Alimentation	1	4.00	5.5	901	nb-2	2023	3	3
Décoration/Alcool	1	4.95	20	909	nb-5	2023	3	3
Hovmästarsås glasburk	1	4.50	5.5	914	200	2023	3	3
Kalles kaviar original	1	5.50	5.5	918	773	2023	3	3
Décoration/Alcool	1	4.50	20	918	nb-15	2023	3	3
Små delikatess köttbullar	1	9.95	5.5	923	501	2023	3	3
Estrella chips grill	1	4.20	5.5	931	172	2023	3	3
Tyrkisk Peber Original	2	7.00	5.5	938	545	2023	3	4
Knäcke rund brungräddat	1	7.95	5.5	943	250	2023	3	4
Delicatoboll singel	1	1.50	5.5	943	80	2023	3	4
Magazine	1	1.20	5.5	947	nb-3	2023	3	4
Décoration/Alcool	1	80.00	5.5	955	nb-1	2023	3	4
Senapssill  Stor	1	8.95	5.5	961	487	2023	3	4
Assiette de hareng	1	0.00	5.5	968	M_4	2023	3	4
Lapin Kulta 3.5% BRK	1	3.50	5.5	971	295	2023	3	4
Kalles kaviar randiga	2	9.00	5.5	976	774	2023	3	4
Klassiska Köttbullar	2	25.90	5.5	981	247	2023	3	4
Cheez doodles 35g	1	1.50	20	985	62	2023	3	4
Dippmix Ranch	1	1.95	5.5	994	97	2023	3	5
Poëlée Pytt i Panna	1	16.00	5.5	1000	M_3	2023	3	5
Décoration/Alcool	1	3.95	20	1004	nb-9	2023	3	5
Kardemumbulle	2	6.00	5.5	1011	c-Kardemumbulle	2023	3	5
Semla	2	8.00	5.5	1019	c-Semla	2023	3	5
Blåbärssoppa original	1	5.95	5.5	1030	36	2023	3	8
Kanelbulle	1	3.00	5.5	1038	c-Kanelbulle	2023	3	8
Alimentation	1	23.00	5.5	1042	nb-8	2023	3	8
Sac	1	0.10	5.5	1048	c-Sac	2023	3	8
Kanelbulle	1	3.00	5.5	1056	c-Kanelbulle	2023	3	8
Assiette nordique - Saumon	1	18.00	5.5	1066	M_33	2023	3	9
Assiette saumon	1	0.00	5.5	1070	M_5	2023	3	9
Läkerol Bon Bons	1	2.10	5.5	1070	273	2023	3	9
Magazine	3	14.85	5.5	1072	nb-1	2023	3	9
Sac	1	0.10	5.5	1081	c-Sac	2023	3	9
​ ​Rödbetor skivade 710g	1	7.50	5.5	1089	460	2023	3	10
Décoration/Alcool	1	1.00	20	1094	nb-8	2023	3	10
Kladdkaka	1	0.00	5.5	1100	M_2	2023	3	10
Skagenröra	1	5.95	5.5	1104	491	2023	3	10
Bullar x4	2	20.00	5.5	1107	c-Bullar x4	2023	3	10
Décoration/Alcool	1	8.00	5.5	1110	nb-3	2023	3	10
Kex Chocklad	6	12.00	5.5	1116	239	2023	3	11
Bullar x4	1	10.00	5.5	1126	c-Bullar x4	2023	3	11
Entrée - Plat - Dessert	1	28.00	5.5	1132	M_10	2023	3	11
Festis Päron EKO BRIK	2	4.00	5.5	1132	120	2023	3	11
Entrée - Plat - Dessert	1	28.00	5.5	1135	M_10	2023	3	11
Kanelbulle	2	6.00	5.5	1142	c-Kanelbulle	2023	3	11
Finn Crisp Original	1	4.95	5.5	1142	128	2023	3	11
Décoration/Alcool	1	39.90	20	1147	nb-2	2023	3	11
Décoration/Alcool	3	4.50	20	1153	nb-2	2023	3	11
Blåbärssoppa original	1	5.95	5.5	1161	36	2023	3	11
Kardemummaskorpor finax	1	5.95	5.5	870	763	2023	3	2
Soupe aux pois cassé/lardons	1	8.00	5.5	877	M_19	2023	3	2
Taco spice mix	1	2.50	20	881	527	2023	3	2
Smash	1	4.95	5.5	887	502	2023	3	2
Senapssill	1	4.10	5.5	893	485	2023	3	2
Alimentation	1	2.00	5.5	901	nb-3	2023	3	3
Décoration/Alcool	1	69.00	20	909	nb-6	2023	3	3
Ramslök & Citron Sill	1	4.10	5.5	914	445	2023	3	3
Löksill	1	4.95	5.5	918	320	2023	3	3
​ Smörgåsgurka 370g	1	5.50	5.5	918	507	2023	3	3
Alimentation	1	5.00	5.5	923	nb-2	2023	3	3
Cheez doodles 160g	1	4.20	5.5	931	63	2023	3	3
Ahlgrens bilar	2	5.90	5.5	938	8	2023	3	4
Kaffe mellanrost brygg	1	12.95	5.5	943	220	2023	3	4
Punschrulle singel	1	1.50	5.5	943	430	2023	3	4
Magazine	1	1.00	5.5	948	nb-1	2023	3	4
Blabärsbulle	1	3.00	5.5	956	c-Blabärsbulle	2023	3	4
Senapssill	1	4.10	5.5	961	485	2023	3	4
Boulettes de viande	1	0.00	5.5	968	M_1	2023	3	4
Lingonsylt	1	8.95	5.5	972	300	2023	3	4
Läkerol Salvi	1	2.10	5.5	976	282	2023	3	4
​ ​Rödbetor skivade 710g	1	7.50	5.5	981	460	2023	3	4
Estrella chips grill	1	4.20	5.5	981	172	2023	3	4
Sandwich Chives	1	2.00	5.5	985	474	2023	3	4
Smash	1	4.95	5.5	994	502	2023	3	5
Poëlée Pytt i Panna	1	16.00	5.5	1000	M_3	2023	3	5
Décoration/Alcool	1	8.00	5.5	1004	nb-10	2023	3	5
Oboy 700g	2	17.00	5.5	1012	828	2023	3	5
Décoration/Alcool	1	50.00	5.5	1019	nb-8	2023	3	5
Alimentation	1	5.50	5.5	1030	nb-3	2023	3	8
Café/Thé	1	2.00	5.5	1039	c-Café/Thé	2023	3	8
Kanelbulle	1	3.00	5.5	1043	c-Kanelbulle	2023	3	8
Kanel x4	1	10.00	5.5	1049	c-Kanel x4	2023	3	8
Alimentation	1	20.40	5.5	1057	nb-1	2023	3	8
Semla	1	4.00	5.5	1066	c-Semla	2023	3	9
Assiette saumon	1	8.00	5.5	1070	M_5	2023	3	9
Magazine	1	5.95	5.5	1073	nb-1	2023	3	9
Bullar x4	1	10.00	5.5	1082	c-Bullar x4	2023	3	9
Loka mango lime	1	2.00	5.5	1089	734	2023	3	10
Café/Thé	1	2.00	5.5	1094	c-Café/Thé	2023	3	10
Plat - Dessert	1	20.00	5.5	1100	M_16	2023	3	10
Gott & blandat Salt	4	11.80	5.5	1104	161	2023	3	10
Knäcke Fäbod original	1	8.95	5.5	1107	249	2023	3	10
Gula ärtor kapsel	1	3.95	5.5	1110	179	2023	3	10
Décoration/Alcool	1	50.00	5.5	1117	nb-1	2023	3	11
Café/Thé	2	4.00	5.5	1126	c-Café/Thé	2023	3	11
Glace vanille coulis baie polaire	1	0.00	5.5	1132	M_24	2023	3	11
Assiette saumon	1	0.00	5.5	1135	M_5	2023	3	11
Bullar x4	1	10.00	5.5	1135	c-Bullar x4	2023	3	11
Trocadero 50cL	1	2.50	5.5	1142	538	2023	3	11
Café/Thé	1	2.00	5.5	1142	c-Café/Thé	2023	3	11
Gräddsås 3-pack	1	4.65	5.5	1142	164	2023	3	11
Alimentation	1	2.90	5.5	1142	nb-17	2023	3	11
Décoration/Alcool	2	20.00	20	1147	nb-3	2023	3	11
Bullar x4	1	10.00	5.5	1154	c-Bullar x4	2023	3	11
Taco sauce hot	1	4.50	5.5	1162	529	2023	3	11
Tutti frutti tablettask	2	3.00	5.5	871	742	2023	3	2
Soupe aux pois cassé/lardons	1	8.00	5.5	877	M_19	2023	3	2
Taco shells	1	7.95	5.5	881	532	2023	3	2
Bullar x4	1	10.00	5.5	888	c-Bullar x4	2023	3	2
Ramslök & Citron Sill	1	4.10	5.5	893	445	2023	3	2
Plat végétarien	1	0.00	5.5	902	M_36	2023	3	3
Décoration/Alcool	1	12.95	20	909	nb-7	2023	3	3
Runda Kanel	1	5.95	5.5	914	464	2023	3	3
Rårörda lingon	1	8.95	5.5	918	447	2023	3	3
​ Smörgåsgurka 370g	1	5.50	5.5	924	507	2023	3	3
Daim dubbel	1	2.00	5.5	931	78	2023	3	3
Marabou Japp	3	3.00	5.5	938	340	2023	3	4
Små delikatess köttbullar	3	29.85	5.5	943	501	2023	3	4
Bullar x4	1	10.00	5.5	943	c-Bullar x4	2023	3	4
Ljus Sirap	1	4.50	5.5	948	302	2023	3	4
Kanelbulle	1	3.00	5.5	956	c-Kanelbulle	2023	3	4
Skärgårdssill	1	4.95	5.5	961	492	2023	3	4
Entrée - Plat	1	22.00	5.5	968	M_8	2023	3	4
Café/Thé	1	2.00	5.5	973	c-Café/Thé	2023	3	4
Viol Tablettask	1	1.30	5.5	976	558	2023	3	4
Gräddsås 3-pack	1	4.65	5.5	981	164	2023	3	4
Gott & blandat Salt	3	8.85	5.5	981	161	2023	3	4
Alimentation	1	2.80	5.5	985	nb-5	2023	3	4
Rårörda lingon	1	8.95	5.5	994	447	2023	3	5
Café/Thé	2	4.00	5.5	1000	c-Café/Thé	2023	3	5
Kanel x4	1	10.00	5.5	1005	c-Kanel x4	2023	3	5
Cheez doodles 160g	1	4.20	5.5	1013	63	2023	3	5
Loka mango lime	1	2.00	5.5	1021	734	2023	3	5
Alimentation	1	5.00	5.5	1030	nb-4	2023	3	8
Kanelbulle	1	3.00	5.5	1039	c-Kanelbulle	2023	3	8
Kardemumbulle	1	3.00	5.5	1043	c-Kardemumbulle	2023	3	8
Ballerina kladdkaka	1	4.50	5.5	1050	29	2023	3	8
Kanelbulle	1	3.00	5.5	1058	c-Kanelbulle	2023	3	9
Loka Naturell Brk	1	2.00	5.5	1066	314	2023	3	9
Entrée - Plat	1	22.00	5.5	1070	M_8	2023	3	9
Anthon berg Marzipan bar	2	5.00	5.5	1070	853	2023	3	9
Magazine	1	15.00	5.5	1074	nb-1	2023	3	9
Ramslök & Citron Sill	1	4.10	5.5	1083	445	2023	3	9
Västerbottensost 35% normalbit	1	21.95	5.5	1089	554	2023	3	10
Klassiska Köttbullar	1	12.95	5.5	1095	247	2023	3	10
Boulettes de viande	1	0.00	5.5	1100	M_1	2023	3	10
Citronpeppar glasburk	1	3.95	5.5	1104	70	2023	3	10
Senapssill	1	4.10	5.5	1107	485	2023	3	10
Finn Crisp caraway	1	4.95	5.5	1110	127	2023	3	10
Skärgårdssill	2	9.90	5.5	1117	492	2023	3	11
Kaffe mellanrost brygg	1	12.95	5.5	1127	220	2023	3	11
Poëlée Pytt i Panna	1	0.00	5.5	1132	M_3	2023	3	11
Boulettes de viande	1	0.00	5.5	1135	M_1	2023	3	11
Små delikatess köttbullar	2	19.90	5.5	1142	501	2023	3	11
Anthon berg Marzipan bar	3	7.50	5.5	1142	853	2023	3	11
Décoration/Alcool	3	23.85	20	1147	nb-4	2023	3	11
Dumle sachet 120g	1	4.50	5.5	1155	827	2023	3	11
Taco spice mix	2	5.00	20	1162	527	2023	3	11
Salta Katten	2	3.00	20	871	470	2023	3	2
Soupe aux pois cassé/lardons	1	8.00	5.5	877	M_19	2023	3	2
Estrella dillchips	1	4.20	5.5	881	84	2023	3	2
Klassiska Köttbullar	1	12.95	5.5	888	247	2023	3	2
Grebbestads® Ansjovisfilé Original	1	6.95	5.5	893	171	2023	3	2
Soupe aux légumes de saison	1	0.00	5.5	902	M_20	2023	3	3
Décoration/Alcool	1	19.90	20	909	nb-8	2023	3	3
Havre Fras	1	8.95	5.5	915	185	2023	3	3
Alimentation	1	6.95	5.5	918	nb-11	2023	3	3
Alimentation	1	10.00	5.5	925	nb-1	2023	3	3
Alimentation	1	2.10	5.5	931	nb-4	2023	3	3
Gott & Blandat Original	3	8.85	5.5	938	160	2023	3	4
Filmjölk 3%	2	9.90	5.5	943	122	2023	3	4
Semla	2	8.00	5.5	943	c-Semla	2023	3	4
Kardemumbulle	2	6.00	5.5	949	c-Kardemumbulle	2023	3	4
Décoration/Alcool	1	14.00	5.5	957	nb-1	2023	3	4
Polarbröd Rågkaka	1	8.95	5.5	961	407	2023	3	4
Boulettes de viande	1	0.00	5.5	968	M_1	2023	3	4
Bullar x4	1	10.00	5.5	973	c-Bullar x4	2023	3	4
Gott & Blandat Original	1	2.95	5.5	976	160	2023	3	4
Gott & blandat fizzy pop	3	8.85	5.5	981	801	2023	3	4
Alimentation	1	5.80	5.5	981	nb-17	2023	3	4
Zoo Tablettask	1	1.50	20	986	567	2023	3	4
Gröt Äpple & Blåbär	1	3.95	5.5	994	177	2023	3	5
Boulettes de viande	1	16.00	5.5	1000	M_1	2023	3	5
Kanel x4	1	10.00	5.5	1006	c-Kanel x4	2023	3	5
Filmjölk 3%	1	4.95	5.5	1013	122	2023	3	5
Rekorderlig Päron Cider	1	3.50	5.5	1021	449	2023	3	5
Mörk Sirap	1	4.50	5.5	1031	363	2023	3	8
Boulettes de viande	1	16.00	5.5	1039	M_1	2023	3	8
Semla	2	8.00	5.5	1044	c-Semla	2023	3	8
Läkerol Salmiak	1	2.10	5.5	1050	281	2023	3	8
Kardemumbulle	1	3.00	5.5	1058	c-Kardemumbulle	2023	3	9
Café/Thé	1	2.00	5.5	1066	c-Café/Thé	2023	3	9
Boulettes de viande	1	0.00	5.5	1070	M_1	2023	3	9
Cloetta guld	2	4.00	5.5	1075	740	2023	3	9
Löksill	1	4.95	5.5	1083	320	2023	3	9
Mjölkchoklad Kaka	1	3.10	5.5	1090	362	2023	3	10
Bullar x4	1	10.00	5.5	1096	c-Bullar x4	2023	3	10
Kladdkaka	1	0.00	5.5	1100	M_2	2023	3	10
Alimentation	1	9.30	5.5	1104	nb-4	2023	3	10
Skärgårdssill	1	4.95	5.5	1107	492	2023	3	10
Knäcke rund brungräddat	1	7.95	5.5	1110	250	2023	3	10
Inlagd Sill	1	8.95	5.5	1118	207	2023	3	11
Runda Kanel	1	5.95	5.5	1127	464	2023	3	11
Bullar x4	1	10.00	5.5	1132	c-Bullar x4	2023	3	11
Entrée - Plat	1	22.00	5.5	1135	M_8	2023	3	11
Ballerina kladdkaka	1	4.50	5.5	1142	29	2023	3	11
Slotts senap original tub	1	5.95	5.5	1142	481	2023	3	11
Décoration/Alcool	1	18.50	20	1147	nb-5	2023	3	11
Bullar x4	3	30.00	5.5	1156	c-Bullar x4	2023	3	11
Fullkornsvälling 1 år	4	59.80	5.5	1163	155	2023	3	11
Läkerol Cassis	1	2.10	5.5	871	275	2023	3	2
Kanelbulle	2	6.00	5.5	877	c-Kanelbulle	2023	3	2
Estrella chips grill	1	4.20	5.5	881	172	2023	3	2
Amerikansk Dressing Original	1	5.40	5.5	889	13	2023	3	2
Kanelbulle	1	3.00	5.5	894	c-Kanelbulle	2023	3	2
Entrée - Plat	1	22.00	5.5	902	M_8	2023	3	3
Décoration/Alcool	1	18.00	5.5	910	nb-1	2023	3	3
BBQ oil original	1	6.50	5.5	915	744	2023	3	3
Frödinge Princesstårta	1	15.00	5.5	919	144	2023	3	3
Décoration/Alcool	1	12.95	20	925	nb-2	2023	3	3
Gott & Blandat Original	1	2.95	5.5	932	160	2023	3	3
Bullar x4	1	10.00	5.5	939	c-Bullar x4	2023	3	4
Knäcke trekant brungräddat	2	7.00	5.5	943	253	2023	3	4
Bullar x4	1	10.00	5.5	950	c-Bullar x4	2023	3	4
Café/Thé	2	4.00	5.5	957	c-Café/Thé	2023	3	4
Décoration/Alcool	1	295.00	20	961	nb-7	2023	3	4
Soupe aux pois cassé/lardons	1	0.00	5.5	968	M_19	2023	3	4
Semla	2	8.00	5.5	973	c-Semla	2023	3	4
Marabou schweizer nöt 200g	1	5.95	5.5	976	799	2023	3	4
Skinkost 175g	1	7.95	5.5	981	496	2023	3	4
Bullar x4	3	30.00	5.5	987	c-Bullar x4	2023	3	5
Skagenröra	1	5.95	5.5	994	491	2023	3	5
Gott & blandat Salt	1	2.95	5.5	1000	161	2023	3	5
Läkerol Original	1	2.10	5.5	1006	278	2023	3	5
Kex Chocklad	2	4.00	5.5	1013	239	2023	3	5
Décoration/Alcool	1	5.00	5.5	1021	nb-3	2023	3	5
Sandwich EMP	1	6.00	5.5	1032	c-Sandwich EMP	2023	3	8
Loka Päron	1	2.00	5.5	1039	316	2023	3	8
Bullar x4	1	10.00	5.5	1044	c-Bullar x4	2023	3	8
Haribo nappar cola	1	1.50	5.5	1050	751	2023	3	8
Festis Hallon EKO BRIK	1	2.00	5.5	1059	119	2023	3	9
Boulettes de viande	1	16.00	5.5	1067	M_1	2023	3	9
Bullar x4	1	10.00	5.5	1070	c-Bullar x4	2023	3	9
Magazine	1	6.50	5.5	1075	nb-2	2023	3	9
Mandel biskvier	1	3.50	5.5	1083	325	2023	3	9
Haribo nappar cola-sur	1	1.50	5.5	1090	802	2023	3	10
Décoration/Alcool	1	2.00	5.5	1096	nb-2	2023	3	10
Plat - Dessert	1	20.00	5.5	1100	M_16	2023	3	10
Alimentation	1	8.00	5.5	1104	nb-5	2023	3	10
Ramslök & Citron Sill	1	4.95	5.5	1107	445	2023	3	10
Sandwich franska örter	1	2.10	5.5	1107	475	2023	3	10
Kanelbulle	1	3.00	5.5	1111	c-Kanelbulle	2023	3	10
Bullar x4	1	10.00	5.5	1119	c-Bullar x4	2023	3	11
Runda Kanel	1	5.95	5.5	1128	464	2023	3	11
Décoration/Alcool	1	32.95	20	1132	nb-15	2023	3	11
Magazine	2	8.00	5.5	1135	nb-8	2023	3	11
Finn Crisp Original	1	4.95	5.5	1135	128	2023	3	11
Alimentation	1	24.95	5.5	1142	nb-6	2023	3	11
Kronjäst matbröd färsk	2	4.00	5.5	1142	262	2023	3	11
Décoration/Alcool	1	32.00	20	1147	nb-6	2023	3	11
Kanelbulle	2	6.00	5.5	1156	c-Kanelbulle	2023	3	11
Estrella dillchips	1	4.20	5.5	1163	84	2023	3	11
Kardemum x4	1	10.00	5.5	872	c-Kardemum x4	2023	3	2
Café/Thé	1	2.00	5.5	877	c-Café/Thé	2023	3	2
Slotts sena original	3	20.85	5.5	882	759	2023	3	2
Skärgårdssill	1	4.95	5.5	889	492	2023	3	2
Bullar x4	1	10.00	5.5	895	c-Bullar x4	2023	3	2
Kaffe mellanrost brygg	2	25.90	5.5	902	220	2023	3	3
Blabärsbulle	1	3.00	5.5	911	c-Blabärsbulle	2023	3	3
Kalles kaviar original	1	5.50	5.5	915	773	2023	3	3
Kanelbulle	1	3.00	5.5	919	c-Kanelbulle	2023	3	3
Décoration/Alcool	1	10.00	20	925	nb-3	2023	3	3
Mariestads Öl 3.5% 50cL	1	3.50	5.5	933	349	2023	3	3
Pärlsocker	1	3.50	5.5	940	389	2023	3	4
Kung Oscar pepparkakor	1	5.95	5.5	940	746	2023	3	4
Ahlgrens bilar Sursockrade	2	5.90	5.5	943	11	2023	3	4
Décoration/Alcool	1	12.00	20	943	nb-15	2023	3	4
Fiskbullar i dillsås	2	13.90	5.5	950	132	2023	3	4
Blabärsbulle	1	3.00	5.5	957	c-Blabärsbulle	2023	3	4
Mästar matjessill	3	17.85	5.5	962	771	2023	3	4
Entrée - Plat	1	22.00	5.5	968	M_8	2023	3	4
Oboy 700g	1	8.50	5.5	974	828	2023	3	4
Ramslök & Citron Sill	1	4.10	5.5	977	445	2023	3	4
Tomatketchup Original	1	5.00	5.5	981	535	2023	3	4
Marabou schweizer nöt 200g	2	11.90	5.5	981	799	2023	3	4
Semla	1	4.00	5.5	987	c-Semla	2023	3	5
Kex Chocklad	1	2.00	5.5	994	239	2023	3	5
Delicatoboll singel	2	3.00	5.5	1000	80	2023	3	5
Värmeljus vegetabiliskt fett ø39mm 6h	1	12.95	5.5	1006	695	2023	3	5
Alimentation	1	2.50	5.5	1014	nb-1	2023	3	5
Décoration/Alcool	1	2.50	5.5	1021	nb-4	2023	3	5
Finn Crisp Original	2	9.90	5.5	1032	128	2023	3	8
Alimentation	1	1.50	5.5	1040	nb-1	2023	3	8
Kardemumbulle	1	3.00	5.5	1044	c-Kardemumbulle	2023	3	8
Bullar x4	1	10.00	5.5	1050	c-Bullar x4	2023	3	8
Sandwich EMP	1	6.00	5.5	1059	c-Sandwich EMP	2023	3	9
Poëlée Pytt i Panna	1	16.00	5.5	1067	M_3	2023	3	9
Café/Thé	2	4.00	5.5	1070	c-Café/Thé	2023	3	9
Magazine	1	14.00	5.5	1076	nb-1	2023	3	9
Nyponsoppa original	1	5.95	5.5	1084	377	2023	3	9
Kardemumbulle	1	3.00	5.5	1090	c-Kardemumbulle	2023	3	10
Felix Krögarpytt Klassisk	1	10.95	5.5	1097	117	2023	3	10
Boulettes de viande	1	0.00	5.5	1100	M_1	2023	3	10
Tvålull 100g Bra miljöval	1	4.95	20	1105	692	2023	3	10
Löksill	1	4.95	5.5	1107	320	2023	3	10
Bullar x4	1	10.00	5.5	1112	c-Bullar x4	2023	3	10
Formule sand	1	10.00	5.5	1120	c-Formule sand	2023	3	11
Boulettes de viande	1	16.00	5.5	1129	M_1	2023	3	11
Assiette saumon	1	8.00	5.5	1133	M_5	2023	3	11
Café/Thé	2	4.00	5.5	1135	c-Café/Thé	2023	3	11
Frasvaflor 210g	1	2.95	5.5	1142	829	2023	3	11
Räkost	1	8.95	5.5	1142	438	2023	3	11
Décoration/Alcool	1	3.50	5.5	1147	nb-7	2023	3	11
Pepparkakor Annas	1	5.95	5.5	1156	396	2023	3	11
Décoration/Alcool	1	12.95	20	1164	nb-2	2023	3	11
Felix Krögarpytt Klassisk	1	10.95	5.5	866	117	2023	3	1
\.


--
-- Data for Name: table_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.table_products (table_id, table_person, dish_id, dish_name, dish_quantity, dish_price, dish_taxe, table_year, table_month, table_day, dish_category, dish_status, table_status, table_number) FROM stdin;
T_25	1	M_1	Boulettes de viande	1	16	5.5	2023	2	12	main	paid	paid	2
T_2	0	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	2	8	starter	paid	paid	1
T_27	2	M_16	Plat - Dessert	1	20	5.5	2023	2	12	formula	paid	paid	4
T_4	0	M_1	Boulettes de viande	1	16	5.5	2023	2	8	main	paid	paid	2
T_4	1	M_21	Pavé de saumon	1	18	5.5	2023	2	8	main	paid	paid	2
T_3	0	M_21	Pavé de saumon	1	18	5.5	2023	2	8	main	paid	paid	1
T_16	0	M_2	Kladdkaka	1	0	5.5	2023	2	10	desert	waiting	paid	4
T_16	0	M_1	Boulettes de viande	1	0	5.5	2023	2	10	main	todo	paid	4
T_5	0	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	2	8	starter	paid	paid	3
T_5	0	M_33	Assiette nordique - Saumon	1	0	5.5	2023	2	8	main	paid	paid	3
T_5	0	M_30	Entrée - Plat Saumon	1	24	5.5	2023	2	8	formula	paid	paid	3
T_7	0	M_1	Boulettes de viande	1	16	5.5	2023	2	9	main	paid	paid	1
T_16	1	M_2	Kladdkaka	1	0	5.5	2023	2	10	desert	paid	paid	4
T_16	0	M_35	Assiette nordique	1	0	5.5	2023	2	10	starter	paid	paid	4
T_8	0	M_1	Boulettes de viande	1	16	5.5	2023	2	9	main	paid	paid	1
T_9	0	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	2	9	main	paid	paid	1
T_27	2	M_1	Boulettes de viande	1	0	5.5	2023	2	12	main	paid	paid	4
T_75	0	M_1	Boulettes de viande	1	0	5.5	2023	2	26	main	paid	paid	1
T_75	0	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	2	26	starter	paid	paid	1
T_16	1	M_1	Boulettes de viande	1	0	5.5	2023	2	10	main	paid	paid	4
T_16	1	M_16	Plat - Dessert	1	20	5.5	2023	2	10	formula	paid	paid	4
T_17	0	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	2	10	starter	paid	paid	5
T_17	0	M_1	Boulettes de viande	1	0	5.5	2023	2	10	main	paid	paid	5
T_14	1	M_34	Verre de vin	1	4	5.5	2023	2	10	drink	paid	paid	2
T_14	1	M_21	Pavé de saumon	1	0	5.5	2023	2	10	main	paid	paid	2
T_14	1	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	2	10	starter	paid	paid	2
T_17	0	M_8	Entrée - Plat	1	22	5.5	2023	2	10	formula	paid	paid	5
T_16	0	M_10	Entrée - Plat - Dessert	1	28	5.5	2023	2	10	formula	paid	paid	4
T_14	1	M_30	Entrée - Plat Saumon	1	24	5.5	2023	2	10	formula	paid	paid	2
T_17	1	M_36	Plat végétarien	1	16	5.5	2023	2	10	main	paid	paid	5
T_19	0	M_8	Entrée - Plat	1	22	5.5	2023	2	11	formula	paid	paid	1
T_14	0	M_36	Plat végétarien	1	16	5.5	2023	2	10	main	paid	paid	2
T_14	0	M_34	Verre de vin	1	4	5.5	2023	2	10	drink	paid	paid	2
T_13	0	M_8	Entrée - Plat	1	22	5.5	2023	2	10	formula	paid	paid	1
T_13	0	M_4	Assiette de hareng	1	0	5.5	2023	2	10	starter	paid	paid	1
T_13	0	M_3	Poëlée Pytt i Panna	1	0	5.5	2023	2	10	main	paid	paid	1
T_13	1	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	2	10	starter	paid	paid	1
T_18	0	M_5	Assiette saumon	1	8	5.5	2023	2	10	starter	paid	paid	4
T_15	0	M_8	Entrée - Plat	1	22	5.5	2023	2	10	formula	\N	paid	3
T_15	1	M_1	Boulettes de viande	1	0	5.5	2023	2	10	main	todo	paid	3
T_15	0	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	2	10	starter	paid	paid	3
T_15	1	M_8	Entrée - Plat	1	22	5.5	2023	2	10	formula	paid	paid	3
T_15	0	M_1	Boulettes de viande	1	0	5.5	2023	2	10	main	paid	paid	3
T_15	1	M_5	Assiette saumon	1	0	5.5	2023	2	10	starter	paid	paid	3
T_15	0	M_4	Assiette de hareng	1	0	5.5	2023	2	10	starter	paid	paid	3
T_21	0	M_8	Entrée - Plat	1	22	5.5	2023	2	11	formula	paid	paid	3
T_19	0	M_1	Boulettes de viande	1	0	5.5	2023	2	11	main	paid	paid	1
T_19	0	M_4	Assiette de hareng	1	0	5.5	2023	2	11	starter	paid	paid	1
T_20	0	M_16	Plat - Dessert	1	20	5.5	2023	2	11	formula	paid	paid	2
T_21	1	M_1	Boulettes de viande	1	16	5.5	2023	2	11	main	waiting	paid	3
T_21	0	M_4	Assiette de hareng	1	0	5.5	2023	2	11	starter	paid	paid	3
T_21	0	M_1	Boulettes de viande	1	0	5.5	2023	2	11	main	paid	paid	3
T_20	1	M_36	Plat végétarien	1	0	5.5	2023	2	11	main	paid	paid	2
T_22	3	M_1	Boulettes de viande	1	16	5.5	2023	2	11	main	waiting	paid	4
T_23	0	M_36	Plat végétarien	1	16	5.5	2023	2	11	main	paid	paid	4
T_23	1	M_36	Plat végétarien	1	16	5.5	2023	2	11	main	paid	paid	4
T_20	0	M_24	Glace vanille coulis baie polaire	1	0	5.5	2023	2	11	desert	paid	paid	2
T_20	0	M_1	Boulettes de viande	1	0	5.5	2023	2	11	main	paid	paid	2
T_22	2	M_1	Boulettes de viande	1	16	5.5	2023	2	11	main	paid	paid	4
T_20	1	M_2	Kladdkaka	1	0	5.5	2023	2	11	desert	paid	paid	2
T_20	1	M_16	Plat - Dessert	1	20	5.5	2023	2	11	formula	paid	paid	2
T_22	1	M_1	Boulettes de viande	1	0	5.5	2023	2	11	main	waiting	paid	4
T_22	1	M_4	Assiette de hareng	1	0	5.5	2023	2	11	starter	waiting	paid	4
T_22	0	M_21	Pavé de saumon	1	0	5.5	2023	2	11	main	paid	paid	4
T_22	0	M_4	Assiette de hareng	1	0	5.5	2023	2	11	starter	paid	paid	4
T_22	0	M_30	Entrée - Plat Saumon	1	24	5.5	2023	2	11	formula	paid	paid	4
T_22	1	M_8	Entrée - Plat	1	22	5.5	2023	2	11	formula	paid	paid	4
T_24	0	M_1	Boulettes de viande	1	0	5.5	2023	2	12	main	paid	paid	1
T_24	0	M_5	Assiette saumon	1	0	5.5	2023	2	12	starter	paid	paid	1
T_24	0	M_8	Entrée - Plat	1	22	5.5	2023	2	12	formula	paid	paid	1
T_29	1	M_8	Entrée - Plat	1	22	5.5	2023	2	14	formula	paid	paid	2
T_29	1	M_3	Poëlée Pytt i Panna	1	0	5.5	2023	2	14	main	paid	paid	2
T_25	0	M_35	Assiette nordique	1	0	5.5	2023	2	12	starter	paid	paid	2
T_25	0	M_8	Entrée - Plat	1	22	5.5	2023	2	12	formula	paid	paid	2
T_25	0	M_1	Boulettes de viande	1	0	5.5	2023	2	12	main	paid	paid	2
T_26	0	M_5	Assiette saumon	1	8	5.5	2023	2	12	starter	paid	paid	3
T_26	1	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	2	12	main	paid	paid	3
T_29	0	M_4	Assiette de hareng	1	0	5.5	2023	2	14	starter	paid	paid	2
T_29	0	M_1	Boulettes de viande	1	0	5.5	2023	2	14	main	paid	paid	2
T_27	1	M_1	Boulettes de viande	1	16	5.5	2023	2	12	main	paid	paid	4
T_27	0	M_33	Assiette nordique - Saumon	1	18	5.5	2023	2	12	main	paid	paid	4
T_27	2	M_2	Kladdkaka	1	0	5.5	2023	2	12	desert	paid	paid	4
T_75	0	M_8	Entrée - Plat	1	22	5.5	2023	2	26	formula	paid	paid	1
T_75	1	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	2	26	starter	paid	paid	1
T_75	1	M_3	Poëlée Pytt i Panna	1	0	5.5	2023	2	26	main	paid	paid	1
T_29	0	M_8	Entrée - Plat	1	22	5.5	2023	2	14	formula	paid	paid	2
T_29	1	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	2	14	starter	paid	paid	2
T_28	0	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	2	14	starter	paid	paid	1
T_28	1	M_33	Assiette nordique - Saumon	1	0	5.5	2023	2	14	main	paid	paid	1
T_28	0	M_36	Plat végétarien	1	0	5.5	2023	2	14	main	paid	paid	1
T_28	0	M_8	Entrée - Plat	1	22	5.5	2023	2	14	formula	paid	paid	1
T_28	1	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	2	14	starter	paid	paid	1
T_28	1	M_30	Entrée - Plat Saumon	1	24	5.5	2023	2	14	formula	paid	paid	1
T_46	2	M_1	Boulettes de viande	1	16	5.5	2023	2	19	main	waiting	paid	3
T_46	2	M_1	Boulettes de viande	1	16	5.5	2023	2	19	main	waiting	paid	3
T_46	3	M_1	Boulettes de viande	1	16	5.5	2023	2	19	main	waiting	paid	3
T_32	0	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	2	15	main	paid	paid	2
T_32	1	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	2	15	main	paid	paid	2
T_30	0	M_8	Entrée - Plat	1	22	5.5	2023	2	14	formula	paid	paid	3
T_30	0	M_3	Poëlée Pytt i Panna	1	0	5.5	2023	2	14	main	paid	paid	3
T_30	0	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	2	14	starter	paid	paid	3
T_30	1	M_8	Entrée - Plat	1	22	5.5	2023	2	14	formula	paid	paid	3
T_30	1	M_35	Assiette nordique	1	0	5.5	2023	2	14	starter	paid	paid	3
T_30	1	M_36	Plat végétarien	1	0	5.5	2023	2	14	main	paid	paid	3
T_33	0	M_1	Boulettes de viande	1	16	5.5	2023	2	15	main	paid	paid	3
T_33	1	M_1	Boulettes de viande	1	16	5.5	2023	2	15	main	paid	paid	3
T_31	0	M_1	Boulettes de viande	1	0	5.5	2023	2	15	main	paid	paid	1
T_31	1	M_21	Pavé de saumon	1	18	5.5	2023	2	15	main	paid	paid	1
T_31	0	M_5	Assiette saumon	1	0	5.5	2023	2	15	starter	paid	paid	1
T_31	0	M_8	Entrée - Plat	1	22	5.5	2023	2	15	formula	paid	paid	1
T_35	1	M_1	Boulettes de viande	1	16	5.5	2023	2	16	main	paid	paid	1
T_35	1	M_1	Boulettes de viande	1	16	5.5	2023	2	16	main	paid	paid	1
T_35	0	M_1	Boulettes de viande	1	16	5.5	2023	2	16	main	paid	paid	1
T_34	0	M_33	Assiette nordique - Saumon	1	18	5.5	2023	2	15	main	paid	paid	1
T_34	1	M_33	Assiette nordique - Saumon	1	18	5.5	2023	2	15	main	paid	paid	1
T_77	1	M_1	Boulettes de viande	1	0	5.5	2023	2	26	main	paid	paid	3
T_37	0	M_4	Assiette de hareng	1	8	5.5	2023	2	17	starter	paid	paid	2
T_36	0	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	2	17	starter	paid	paid	1
T_37	1	M_4	Assiette de hareng	1	8	5.5	2023	2	17	starter	paid	paid	2
T_38	0	M_5	Assiette saumon	1	8	5.5	2023	2	17	starter	paid	paid	1
T_38	0	M_20	Soupe aux légumes de saison	1	8	5.5	2023	2	17	starter	paid	paid	1
T_39	0	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	2	17	main	waiting	paid	3
T_50	0	M_1	Boulettes de viande	1	16	5.5	2023	2	21	main	paid	paid	1
T_50	1	M_1	Boulettes de viande	1	0	5.5	2023	2	21	main	paid	paid	1
T_50	1	M_8	Entrée - Plat	1	22	5.5	2023	2	21	formula	paid	paid	1
T_42	0	M_1	Boulettes de viande	1	16	5.5	2023	2	18	main	paid	paid	1
T_50	0	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	2	21	starter	paid	paid	1
T_50	1	M_35	Assiette nordique	1	0	5.5	2023	2	21	starter	paid	paid	1
T_48	2	M_1	Boulettes de viande	1	16	5.5	2023	2	19	main	paid	paid	2
T_48	0	M_4	Assiette de hareng	1	8	5.5	2023	2	19	starter	paid	paid	2
T_48	1	M_1	Boulettes de viande	1	16	5.5	2023	2	19	main	paid	paid	2
T_48	0	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	2	19	starter	paid	paid	2
T_43	1	M_1	Boulettes de viande	1	0	5.5	2023	2	18	main	paid	paid	3
T_43	0	M_1	Boulettes de viande	1	0	5.5	2023	2	18	main	paid	paid	3
T_43	0	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	2	18	starter	paid	paid	3
T_43	1	M_8	Entrée - Plat	1	22	5.5	2023	2	18	formula	paid	paid	3
T_43	1	M_5	Assiette saumon	1	0	5.5	2023	2	18	starter	paid	paid	3
T_43	0	M_8	Entrée - Plat	1	22	5.5	2023	2	18	formula	paid	paid	3
T_46	3	M_1	Boulettes de viande	1	16	5.5	2023	2	19	main	waiting	paid	3
T_46	0	M_8	Entrée - Plat	1	22	5.5	2023	2	19	formula	paid	paid	3
T_44	0	M_5	Assiette saumon	1	8	5.5	2023	2	19	starter	paid	paid	1
T_51	0	M_33	Assiette nordique - Saumon	1	18	5.5	2023	2	21	main	paid	paid	1
T_55	0	M_1	Boulettes de viande	1	0	5.5	2023	2	22	main	paid	paid	1
T_55	0	M_4	Assiette de hareng	1	0	5.5	2023	2	22	starter	paid	paid	1
T_55	0	M_8	Entrée - Plat	1	22	5.5	2023	2	22	formula	paid	paid	1
T_52	1	M_1	Boulettes de viande	1	16	5.5	2023	2	21	main	waiting	paid	1
T_52	1	M_1	Boulettes de viande	1	16	5.5	2023	2	21	main	waiting	paid	1
T_52	0	M_1	Boulettes de viande	1	0	5.5	2023	2	21	main	waiting	paid	1
T_52	0	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	2	21	starter	paid	paid	1
T_52	0	M_8	Entrée - Plat	1	22	5.5	2023	2	21	formula	paid	paid	1
T_54	0	M_4	Assiette de hareng	1	0	5.5	2023	2	22	starter	paid	paid	1
T_54	0	M_1	Boulettes de viande	1	0	5.5	2023	2	22	main	paid	paid	1
T_54	0	M_8	Entrée - Plat	1	22	5.5	2023	2	22	formula	paid	paid	1
T_57	0	M_1	Boulettes de viande	1	16	5.5	2023	2	22	main	paid	paid	2
T_57	1	M_1	Boulettes de viande	1	16	5.5	2023	2	22	main	paid	paid	2
T_57	2	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	2	22	main	paid	paid	2
T_60	0	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	2	23	main	paid	paid	3
T_56	0	M_1	Boulettes de viande	1	16	5.5	2023	2	22	main	paid	paid	1
T_56	1	M_1	Boulettes de viande	1	16	5.5	2023	2	22	main	paid	paid	1
T_61	0	M_21	Pavé de saumon	1	18	5.5	2023	2	23	main	paid	paid	3
T_61	1	M_21	Pavé de saumon	1	18	5.5	2023	2	23	main	paid	paid	3
T_65	0	M_16	Plat - Dessert	1	20	5.5	2023	2	24	formula	paid	paid	1
T_58	1	M_21	Pavé de saumon	1	18	5.5	2023	2	23	main	paid	paid	1
T_58	0	M_21	Pavé de saumon	1	18	5.5	2023	2	23	main	paid	paid	1
T_62	0	M_1	Boulettes de viande	1	16	5.5	2023	2	23	main	paid	paid	1
T_62	1	M_1	Boulettes de viande	1	16	5.5	2023	2	23	main	paid	paid	1
T_63	0	M_21	Pavé de saumon	1	18	5.5	2023	2	23	main	paid	paid	2
T_63	0	M_1	Boulettes de viande	1	16	5.5	2023	2	23	main	paid	paid	2
T_63	0	M_33	Assiette nordique - Saumon	1	18	5.5	2023	2	23	main	paid	paid	2
T_63	0	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	2	23	main	paid	paid	2
T_65	0	M_24	Glace vanille coulis baie polaire	1	0	5.5	2023	2	24	desert	paid	paid	1
T_65	0	M_3	Poëlée Pytt i Panna	1	0	5.5	2023	2	24	main	paid	paid	1
T_66	0	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	2	24	main	paid	paid	2
T_66	0	M_5	Assiette saumon	1	8	5.5	2023	2	24	starter	paid	paid	2
T_66	1	M_33	Assiette nordique - Saumon	1	18	5.5	2023	2	24	main	paid	paid	2
T_66	1	M_4	Assiette de hareng	1	8	5.5	2023	2	24	starter	paid	paid	2
T_67	0	M_8	Entrée - Plat	1	22	5.5	2023	2	24	formula	paid	paid	3
T_67	0	M_35	Assiette nordique	1	0	5.5	2023	2	24	starter	paid	paid	3
T_67	1	M_35	Assiette nordique	1	8	5.5	2023	2	24	starter	paid	paid	3
T_67	0	M_1	Boulettes de viande	1	0	5.5	2023	2	24	main	paid	paid	3
T_68	1	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	2	25	starter	paid	paid	1
T_69	0	M_1	Boulettes de viande	1	16	5.5	2023	2	25	main	paid	paid	3
T_68	0	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	2	25	starter	paid	paid	1
T_69	1	M_1	Boulettes de viande	1	16	5.5	2023	2	25	main	paid	paid	3
T_75	1	M_8	Entrée - Plat	1	22	5.5	2023	2	26	formula	paid	paid	1
T_70	0	M_1	Boulettes de viande	1	0	5.5	2023	2	25	main	paid	paid	4
T_70	0	M_8	Entrée - Plat	1	22	5.5	2023	2	25	formula	paid	paid	4
T_70	1	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	2	25	main	paid	paid	4
T_70	0	M_4	Assiette de hareng	1	0	5.5	2023	2	25	starter	paid	paid	4
T_76	0	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	2	26	main	paid	paid	2
T_76	1	M_21	Pavé de saumon	1	18	5.5	2023	2	26	main	paid	paid	2
T_76	2	M_36	Plat végétarien	1	16	5.5	2023	2	26	main	paid	paid	2
T_71	0	M_35	Assiette nordique	1	8	5.5	2023	2	25	starter	paid	paid	1
T_71	1	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	2	25	starter	paid	paid	1
T_71	1	M_1	Boulettes de viande	1	16	5.5	2023	2	25	main	paid	paid	1
T_72	0	M_1	Boulettes de viande	1	16	5.5	2023	2	25	main	paid	paid	2
T_72	1	M_36	Plat végétarien	1	16	5.5	2023	2	25	main	paid	paid	2
T_73	0	M_1	Boulettes de viande	1	16	5.5	2023	2	25	main	paid	paid	4
T_73	1	M_1	Boulettes de viande	1	16	5.5	2023	2	25	main	paid	paid	4
T_73	0	M_5	Assiette saumon	1	8	5.5	2023	2	25	starter	paid	paid	4
T_77	0	M_36	Plat végétarien	1	0	5.5	2023	2	26	main	paid	paid	3
T_77	0	M_23	Salade de fruits	1	0	5.5	2023	2	26	desert	paid	paid	3
T_77	0	M_16	Plat - Dessert	1	20	5.5	2023	2	26	formula	paid	paid	3
T_77	1	M_24	Glace vanille coulis baie polaire	1	0	5.5	2023	2	26	desert	paid	paid	3
T_77	1	M_16	Plat - Dessert	1	20	5.5	2023	2	26	formula	paid	paid	3
T_83	1	M_1	Boulettes de viande	1	16	5.5	2023	3	1	main	paid	paid	5
T_83	0	M_20	Soupe aux légumes de saison	1	8	5.5	2023	3	1	starter	paid	paid	5
T_87	0	M_20	Soupe aux légumes de saison	1	8	5.5	2023	3	2	starter	paid	paid	1
T_87	0	M_2	Kladdkaka	1	6	5.5	2023	3	2	desert	paid	paid	1
T_87	1	M_21	Pavé de saumon	1	0	5.5	2023	3	2	main	paid	paid	1
T_87	1	M_23	Salade de fruits	1	0	5.5	2023	3	2	desert	paid	paid	1
T_87	1	M_31	Plat - Dessert Saumon	1	22	5.5	2023	3	2	formula	paid	paid	1
T_80	0	M_4	Assiette de hareng	1	0	5.5	2023	3	1	starter	paid	paid	2
T_80	0	M_1	Boulettes de viande	1	0	5.5	2023	3	1	main	paid	paid	2
T_80	1	M_4	Assiette de hareng	1	0	5.5	2023	3	1	starter	paid	paid	2
T_80	1	M_1	Boulettes de viande	1	0	5.5	2023	3	1	main	paid	paid	2
T_80	0	M_8	Entrée - Plat	1	22	5.5	2023	3	1	formula	paid	paid	2
T_80	1	M_8	Entrée - Plat	1	22	5.5	2023	3	1	formula	paid	paid	2
T_81	1	M_33	Assiette nordique - Saumon	1	18	5.5	2023	3	1	main	paid	paid	3
T_81	0	M_21	Pavé de saumon	1	18	5.5	2023	3	1	main	paid	paid	3
T_82	0	M_1	Boulettes de viande	1	0	5.5	2023	3	1	main	paid	paid	4
T_82	0	M_35	Assiette nordique	1	0	5.5	2023	3	1	starter	paid	paid	4
T_82	0	M_8	Entrée - Plat	1	22	5.5	2023	3	1	formula	paid	paid	4
T_84	0	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	3	2	starter	paid	paid	1
T_84	1	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	3	2	starter	paid	paid	1
T_84	1	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	3	2	starter	paid	paid	1
T_91	1	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	3	4	main	paid	paid	2
T_91	0	M_1	Boulettes de viande	1	16	5.5	2023	3	4	main	paid	paid	2
T_89	0	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	3	3	starter	paid	paid	3
T_89	0	M_35	Assiette nordique	1	8	5.5	2023	3	3	starter	paid	paid	3
T_89	1	M_35	Assiette nordique	1	8	5.5	2023	3	3	starter	paid	paid	3
T_89	1	M_37	Entrée Veg	1	8	5.5	2023	3	3	starter	paid	paid	3
T_88	0	M_8	Entrée - Plat	1	22	5.5	2023	3	3	formula	paid	paid	1
T_88	0	M_20	Soupe aux légumes de saison	1	0	5.5	2023	3	3	starter	paid	paid	1
T_88	0	M_36	Plat végétarien	1	0	5.5	2023	3	3	main	paid	paid	1
T_88	1	M_35	Assiette nordique	1	8	\N	2023	3	3	starter	waiting	paid	1
T_94	0	M_21	Pavé de saumon	1	18	5.5	2023	3	4	main	paid	paid	4
T_90	1	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	3	4	main	waiting	paid	1
T_90	0	M_1	Boulettes de viande	1	16	5.5	2023	3	4	main	waiting	paid	1
T_90	0	M_35	Assiette nordique	1	8	\N	2023	3	4	starter	paid	paid	1
T_94	1	M_21	Pavé de saumon	1	18	5.5	2023	3	4	main	paid	paid	4
T_92	0	M_1	Boulettes de viande	1	16	5.5	2023	3	4	main	paid	paid	3
T_97	2	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	3	5	main	paid	paid	2
T_97	0	M_1	Boulettes de viande	1	16	5.5	2023	3	5	main	paid	paid	2
T_93	1	M_8	Entrée - Plat	1	22	5.5	2023	3	4	formula	paid	paid	2
T_93	1	M_1	Boulettes de viande	1	0	5.5	2023	3	4	main	paid	paid	2
T_93	0	M_8	Entrée - Plat	1	22	5.5	2023	3	4	formula	paid	paid	2
T_93	1	M_4	Assiette de hareng	1	0	5.5	2023	3	4	starter	paid	paid	2
T_93	0	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	3	4	starter	paid	paid	2
T_93	0	M_1	Boulettes de viande	1	0	5.5	2023	3	4	main	paid	paid	2
T_98	0	M_1	Boulettes de viande	1	16	5.5	2023	3	8	main	paid	paid	1
T_96	0	M_1	Boulettes de viande	1	16	5.5	2023	3	5	main	paid	paid	1
T_96	1	M_1	Boulettes de viande	1	16	5.5	2023	3	5	main	paid	paid	1
T_97	1	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	3	5	main	paid	paid	2
T_101	0	M_33	Assiette nordique - Saumon	1	18	5.5	2023	3	9	main	paid	paid	3
T_102	1	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	3	9	main	paid	paid	4
T_102	0	M_1	Boulettes de viande	1	0	5.5	2023	3	9	main	paid	paid	4
T_102	0	M_35	Assiette nordique	1	0	\N	2023	3	9	starter	waiting	paid	4
T_102	0	M_8	Entrée - Plat	1	22	5.5	2023	3	9	formula	paid	paid	4
T_99	0	M_1	Boulettes de viande	1	16	5.5	2023	3	9	main	paid	paid	1
T_99	1	M_1	Boulettes de viande	1	16	5.5	2023	3	9	main	paid	paid	1
T_103	0	M_5	Assiette saumon	1	0	5.5	2023	3	9	starter	paid	paid	1
T_103	0	M_1	Boulettes de viande	1	0	5.5	2023	3	9	main	paid	paid	1
T_103	0	M_8	Entrée - Plat	1	22	5.5	2023	3	9	formula	paid	paid	1
T_103	1	M_5	Assiette saumon	1	8	5.5	2023	3	9	starter	paid	paid	1
T_106	0	M_16	Plat - Dessert	1	20	5.5	2023	3	10	formula	paid	paid	3
T_106	1	M_1	Boulettes de viande	1	0	5.5	2023	3	10	main	paid	paid	3
T_106	1	M_16	Plat - Dessert	1	20	5.5	2023	3	10	formula	paid	paid	3
T_106	1	M_2	Kladdkaka	1	0	5.5	2023	3	10	desert	paid	paid	3
T_106	0	M_1	Boulettes de viande	1	0	5.5	2023	3	10	main	paid	paid	3
T_106	0	M_2	Kladdkaka	1	0	5.5	2023	3	10	desert	paid	paid	3
T_110	0	M_5	Assiette saumon	1	8	5.5	2023	3	11	starter	paid	paid	3
T_104	0	M_24	Glace vanille coulis baie polaire	1	0	5.5	2023	3	9	desert	paid	paid	1
T_104	0	M_3	Poëlée Pytt i Panna	1	0	5.5	2023	3	9	main	paid	paid	1
T_104	0	M_16	Plat - Dessert	1	20	5.5	2023	3	9	formula	paid	paid	1
T_104	2	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	3	9	main	paid	paid	1
T_104	1	M_3	Poëlée Pytt i Panna	1	16	5.5	2023	3	9	main	paid	paid	1
T_104	1	M_34	Verre de vin	1	4	5.5	2023	3	9	drink	paid	paid	1
T_110	0	M_23	Salade de fruits	1	6	5.5	2023	3	11	desert	paid	paid	3
T_105	0	M_35	Assiette nordique	1	8	\N	2023	3	10	starter	paid	paid	1
T_105	1	M_19	Soupe aux pois cassé/lardons	1	8	5.5	2023	3	10	starter	paid	paid	1
T_108	1	M_1	Boulettes de viande	1	16	5.5	2023	3	11	main	paid	paid	3
T_108	0	M_1	Boulettes de viande	1	16	5.5	2023	3	11	main	paid	paid	3
T_107	2	M_3	Poëlée Pytt i Panna	1	0	5.5	2023	3	11	main	paid	paid	2
T_107	2	M_10	Entrée - Plat - Dessert	1	28	5.5	2023	3	11	formula	paid	paid	2
T_107	0	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	3	11	starter	paid	paid	2
T_107	0	M_1	Boulettes de viande	1	0	5.5	2023	3	11	main	paid	paid	2
T_107	0	M_2	Kladdkaka	1	0	5.5	2023	3	11	desert	paid	paid	2
T_107	0	M_10	Entrée - Plat - Dessert	1	28	5.5	2023	3	11	formula	paid	paid	2
T_107	1	M_2	Kladdkaka	1	0	5.5	2023	3	11	desert	paid	paid	2
T_107	1	M_1	Boulettes de viande	1	0	5.5	2023	3	11	main	paid	paid	2
T_107	1	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	3	11	starter	paid	paid	2
T_107	1	M_10	Entrée - Plat - Dessert	1	28	5.5	2023	3	11	formula	paid	paid	2
T_107	2	M_24	Glace vanille coulis baie polaire	1	0	5.5	2023	3	11	desert	paid	paid	2
T_107	2	M_19	Soupe aux pois cassé/lardons	1	0	5.5	2023	3	11	starter	paid	paid	2
T_109	1	M_4	Assiette de hareng	1	0	5.5	2023	3	11	starter	paid	paid	1
T_109	0	M_1	Boulettes de viande	1	0	5.5	2023	3	11	main	paid	paid	1
T_109	0	M_8	Entrée - Plat	1	22	5.5	2023	3	11	formula	paid	paid	1
T_109	1	M_23	Salade de fruits	1	0	5.5	2023	3	11	desert	paid	paid	1
T_109	1	M_1	Boulettes de viande	1	0	5.5	2023	3	11	main	paid	paid	1
T_109	1	M_10	Entrée - Plat - Dessert	1	28	5.5	2023	3	11	formula	paid	paid	1
T_109	0	M_5	Assiette saumon	1	0	5.5	2023	3	11	starter	paid	paid	1
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tables (table_id, table_year, table_month, table_day, table_status, sale_id, table_number) FROM stdin;
T_1	2023	2	7	paid	\N	1
T_27	2023	2	12	paid	238	4
T_2	2023	2	8	paid	35	1
T_4	2023	2	8	paid	38	2
T_3	2023	2	8	paid	40	1
T_5	2023	2	8	paid	42	3
T_56	2023	2	22	paid	628	1
T_7	2023	2	9	paid	79	1
T_29	2023	2	14	paid	269	2
T_8	2023	2	9	paid	83	1
T_9	2023	2	9	paid	89	1
T_30	2023	2	14	paid	272	3
T_28	2023	2	14	paid	273	1
T_13	2023	2	10	paid	126	1
T_14	2023	2	10	paid	128	2
T_31	2023	2	15	paid	316	1
T_60	2023	2	23	paid	663	3
T_18	2023	2	10	paid	131	4
T_15	2023	2	10	paid	129	3
T_17	2023	2	10	paid	133	5
T_32	2023	2	15	paid	319	2
T_16	2023	2	10	paid	139	4
T_33	2023	2	15	paid	318	3
T_19	2023	2	11	paid	173	1
T_21	2023	2	11	paid	177	3
T_34	2023	2	15	paid	329	1
T_23	2023	2	11	paid	180	4
T_22	2023	2	11	paid	181	4
T_35	2023	2	16	paid	357	1
T_20	2023	2	11	paid	188	2
T_24	2023	2	12	paid	230	1
T_25	2023	2	12	paid	231	2
T_26	2023	2	12	paid	234	3
T_58	2023	2	23	paid	666	1
T_36	2023	2	17	paid	383	1
T_61	2023	2	23	paid	672	3
T_38	2023	2	17	paid	390	1
T_37	2023	2	17	paid	388	2
T_39	2023	2	17	paid	\N	3
T_63	2023	2	23	paid	673	2
T_42	2023	2	18	paid	434	1
T_62	2023	2	23	paid	675	1
T_43	2023	2	18	paid	436	3
T_65	2023	2	24	paid	704	1
T_48	2023	2	19	paid	506	2
T_46	2023	2	19	paid	494	3
T_44	2023	2	19	paid	496	1
T_66	2023	2	24	paid	708	2
T_50	2023	2	21	paid	553	1
T_67	2023	2	24	paid	713	3
T_51	2023	2	21	paid	556	1
T_53	2023	2	21	paid	\N	2
T_52	2023	2	21	paid	613	1
T_54	2023	2	22	paid	614	1
T_55	2023	2	22	paid	615	1
T_68	2023	2	25	paid	740	1
T_57	2023	2	22	paid	622	2
T_69	2023	2	25	paid	741	3
T_70	2023	2	25	paid	743	4
T_71	2023	2	25	paid	749	1
T_72	2023	2	25	paid	751	2
T_73	2023	2	25	paid	755	4
T_75	2023	2	26	paid	794	1
T_76	2023	2	26	paid	796	2
T_77	2023	2	26	paid	818	3
T_93	2023	3	4	paid	968	2
T_79	2023	3	1	paid	\N	1
T_106	2023	3	10	paid	1100	3
T_81	2023	3	1	paid	848	3
T_82	2023	3	1	paid	852	4
T_83	2023	3	1	paid	863	5
T_80	2023	3	1	paid	874	2
T_96	2023	3	5	paid	999	1
T_84	2023	3	2	paid	877	1
T_87	2023	3	2	paid	883	1
T_97	2023	3	5	paid	1000	2
T_105	2023	3	10	paid	1103	1
T_89	2023	3	3	paid	908	3
T_88	2023	3	3	paid	902	1
T_98	2023	3	8	paid	1039	1
T_91	2023	3	4	paid	954	2
T_90	2023	3	4	paid	960	1
T_94	2023	3	4	paid	963	4
T_92	2023	3	4	paid	965	3
T_101	2023	3	9	paid	1066	3
T_108	2023	3	11	paid	1129	3
T_102	2023	3	9	paid	1068	4
T_99	2023	3	9	paid	1062	1
T_103	2023	3	9	paid	1070	1
T_104	2023	3	9	paid	1071	1
T_107	2023	3	11	paid	1132	2
T_110	2023	3	11	paid	1133	3
T_109	2023	3	11	paid	1135	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_first_name, user_last_name, user_email, user_password, user_is_admin, user_token, user_role) FROM stdin;
15	Lotta	D	lotta@yahoo.fr	$2a$10$f0q6PS9BqWtWDAENpR14muRys9HeL1EKB8nGOvXG1eQfHVDHVMxPa	false	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxNSwiZW1haWwiOiJMb3R0YUB5YWhvby5mciIsImlhdCI6MTY3ODU1NzExMCwiZXhwIjoxNjc4NTkzMTEwfQ.whyHnOd4DeYTuDb_-KJSV_lPwV1YNGZM1TX0Upi-j70	user
4	Yann	Darwish	yann.darwish@gmail.com	$2a$10$pSVPSzewLlWUYgvtNbQRL.SLLqsgrAWWhf5i4ZmqaNAy6kAbH.xBq	true	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJlbWFpbCI6Inlhbm4uZGFyd2lzaEBnbWFpbC5jb20iLCJpYXQiOjE2NzgyMjk4MDQsImV4cCI6MTY3ODI2NTgwNH0.WMnIeAZ3SAX1fyI6VaRpNMuCWmtQgUlZ3UjPNYGUq-I	user
17	Agneta	Kossowski	agkoki@yahoo.com	$2a$10$1WtDawFYofMTFj7BJjQQaeWlu4.CKpeid.gnFbHW01NOiljIrxEKu	true	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxNywiZW1haWwiOiJBZ2tva2lAeWFob28uY29tIiwiaWF0IjoxNjc3OTIyMjUzLCJleHAiOjE2Nzc5NTgyNTN9.jXKG0dvLSvARndiH1r-mcVL02kCBhLVDjKYiGOb94bI	user
13	Jaja	O	djblondeplatine@gmail.com	$2a$10$jetEIhouus/52.gM6cAXhuzHba5f0aeLReVlQre4ABbWC9QwDzf2e	false	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxMywiZW1haWwiOiJkamJsb25kZXBsYXRpbmVAZ21haWwuY29tIiwiaWF0IjoxNjc4MzY4OTIxLCJleHAiOjE2Nzg0MDQ5MjF9.QQNVihKpnT_qNp5LEIbpbSKAtAmuOiwPOHQUkUdMMj0	user
\.


--
-- Name: cards_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_card_id_seq', 1, false);


--
-- Name: dish_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dish_seq', 37, true);


--
-- Name: drawer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drawer_id_seq', 12, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 2, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 857, true);


--
-- Name: sales_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_sale_id_seq', 1165, true);


--
-- Name: table_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_seq', 110, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 17, true);


--
-- Name: drawer drawer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drawer
    ADD CONSTRAINT drawer_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_id);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: idxginp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idxginp ON public.sales USING gin (sale_payment_methods jsonb_path_ops);


--
-- Name: idxtaxes; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idxtaxes ON public.sales USING gin (sale_taxes jsonb_path_ops);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9
-- Dumped by pg_dump version 15.2

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT ON TABLES  TO backup;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

