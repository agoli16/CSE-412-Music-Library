--
-- postgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: User_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_user_id_seq" OWNER TO postgres;

--
-- Name: User_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_user_id_seq" OWNED BY public."User".user_id;


--
-- Name: album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album (
    album_id integer NOT NULL,
    num_songs integer DEFAULT 0,
    total_time interval,
    year_released integer,
    num_favorites integer DEFAULT 0,
    artist_id integer
);


ALTER TABLE public.album OWNER TO postgres;

--
-- Name: album_album_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.album_album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.album_album_id_seq OWNER TO postgres;

--
-- Name: album_album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.album_album_id_seq OWNED BY public.album.album_id;


--
-- Name: artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artist (
    artist_id integer NOT NULL,
    name character varying(255) NOT NULL,
    total_streams bigint DEFAULT 0,
    total_songs integer DEFAULT 0,
    total_albums integer DEFAULT 0,
    num_followers integer DEFAULT 0
);


ALTER TABLE public.artist OWNER TO postgres;

--
-- Name: artist_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artist_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artist_artist_id_seq OWNER TO postgres;

--
-- Name: artist_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artist_artist_id_seq OWNED BY public.artist.artist_id;


--
-- Name: song; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.song (
    song_id integer NOT NULL,
    title character varying(255) NOT NULL,
    genre character varying(100),
    year_released integer,
    streams bigint DEFAULT 0,
    num_favorites integer DEFAULT 0,
    duration interval,
    lyrics text,
    artist_id integer,
    album_id integer
);


ALTER TABLE public.song OWNER TO postgres;

--
-- Name: song_song_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.song_song_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.song_song_id_seq OWNER TO postgres;

--
-- Name: song_song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.song_song_id_seq OWNED BY public.song.song_id;


--
-- Name: user_favourites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_favourites (
    user_id integer NOT NULL,
    song_id integer NOT NULL
);


ALTER TABLE public.user_favourites OWNER TO postgres;

--
-- Name: User user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN user_id SET DEFAULT nextval('public."User_user_id_seq"'::regclass);


--
-- Name: album album_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album ALTER COLUMN album_id SET DEFAULT nextval('public.album_album_id_seq'::regclass);


--
-- Name: artist artist_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist ALTER COLUMN artist_id SET DEFAULT nextval('public.artist_artist_id_seq'::regclass);


--
-- Name: song song_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song ALTER COLUMN song_id SET DEFAULT nextval('public.song_song_id_seq'::regclass);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (user_id, username, email, password) FROM stdin;
1	musiclover1	musiclover1@email.com	hashedpassword1
2	rockfan99	rockfan99@email.com	hashedpassword2
3	popstar22	popstar22@email.com	hashedpassword3
4	jazzcat	jazzcat@email.com	hashedpassword4
5	classicalqueen	classicalqueen@email.com	hashedpassword5
6	hiphophead	hiphophead@email.com	hashedpassword6
7	metalmaster	metalmaster@email.com	hashedpassword7
8	indievibes	indievibes@email.com	hashedpassword8
9	soulful_sister	soulful_sister@email.com	hashedpassword9
10	electrobeats	electrobeats@email.com	hashedpassword10
11	bluesbrother	bluesbrother@email.com	hashedpassword11
12	country_cowboy	country_cowboy@email.com	hashedpassword12
13	reggae_ruler	reggae_ruler@email.com	hashedpassword13
14	punker123	punker123@email.com	hashedpassword14
15	folkfan	folkfan@email.com	hashedpassword15
16	opera_lover	opera_lover@email.com	hashedpassword16
17	rapstar	rapstar@email.com	hashedpassword17
18	vinyl_vintage	vinyl_vintage@email.com	hashedpassword18
19	basshead	basshead@email.com	hashedpassword19
20	rhythm_queen	rhythm_queen@email.com	hashedpassword20
21	guitarmaster	guitarmaster@email.com	hashedpassword21
22	drummerboy	drummerboy@email.com	hashedpassword22
23	synthwave	synthwave@email.com	hashedpassword23
24	lofi_life	lofi_life@email.com	hashedpassword24
25	kpop_fan	kpop_fan@email.com	hashedpassword25
26	latin_groove	latin_groove@email.com	hashedpassword26
27	techno_dj	techno_dj@email.com	hashedpassword27
28	rock_legend	rock_legend@email.com	hashedpassword28
29	blues_soul	blues_soul@email.com	hashedpassword29
30	ambient_dreams	ambient_dreams@email.com	hashedpassword30
\.


--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album (album_id, num_songs, total_time, year_released, num_favorites, artist_id) FROM stdin;
1	12	00:39:43	1969	1000000	1
2	16	01:05:27	2022	2000000	2
3	14	00:58:12	2021	1500000	3
4	16	01:01:38	2022	1800000	4
5	12	00:52:54	2021	900000	5
6	13	00:48:29	2020	783421	6
7	15	00:59:12	2023	1234567	7
8	11	00:42:18	2019	654321	8
9	14	00:55:43	2022	892345	9
10	12	00:46:55	2021	567123	10
11	10	00:38:22	2018	432198	11
12	16	01:02:45	2023	978654	12
13	14	00:54:31	2020	765432	13
14	12	00:45:18	2022	543219	14
15	15	00:58:27	2021	891234	15
16	11	00:43:55	2019	678912	16
17	13	00:51:33	2023	789123	17
18	14	00:56:42	2020	567891	18
19	12	00:47:19	2022	912345	19
20	15	00:59:58	2021	678912	20
21	13	00:49:27	2020	456789	21
22	16	01:03:15	2023	891234	22
23	12	00:45:54	2019	567891	23
24	14	00:57:21	2022	789123	24
25	11	00:41:48	2021	456789	25
26	15	00:58:36	2020	912345	26
27	13	00:50:12	2023	678912	27
28	12	00:46:45	2019	891234	28
29	14	00:55:18	2022	567891	29
30	16	01:01:54	2021	789123	30
31	12	00:47:33	2020	456789	31
32	15	00:59:45	2023	912345	32
33	11	00:42:21	2019	678912	33
34	14	00:56:48	2022	891234	34
35	13	00:51:15	2021	567891	35
36	12	00:45:54	2020	789123	36
37	15	00:58:27	2023	456789	37
38	14	00:54:12	2019	912345	38
39	12	00:46:33	2022	678912	39
40	13	00:50:45	2021	891234	40
41	16	01:02:18	2020	567891	41
42	12	00:45:51	2023	789123	42
43	14	00:57:24	2019	456789	43
44	15	00:59:33	2022	912345	44
45	13	00:51:48	2021	678912	45
\.


--
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artist (artist_id, name, total_streams, total_songs, total_albums, num_followers) FROM stdin;
1	The Beatles	1000000000	213	12	5000000
2	Taylor Swift	2000000000	150	9	8000000
3	Ed Sheeran	1500000000	100	5	6000000
4	Beyoncé	1800000000	180	7	7500000
5	Coldplay	900000000	120	8	4000000
6	Drake	2345678901	198	8	9123456
7	Ariana Grande	1987654321	145	6	8234567
8	Eminem	1876543210	225	11	7345678
9	The Weeknd	1765432109	156	5	6456789
10	BTS	2109876543	167	9	15678901
11	Lady Gaga	1654321098	178	7	5789012
12	Post Malone	1543210987	89	4	4890123
13	Rihanna	1432109876	258	8	7901234
14	Justin Bieber	1321098765	187	6	6012345
15	Adele	1210987654	65	4	5123456
16	Imagine Dragons	1109876543	98	5	4234567
17	Bruno Mars	998765432	87	4	3345678
18	Kendrick Lamar	887654321	142	5	4456789
19	Doja Cat	776543210	76	3	5567890
20	Bad Bunny	2234567890	156	5	8678901
21	Harry Styles	1123456789	54	3	6789012
22	Dua Lipa	934567890	48	2	5890123
23	Billie Eilish	845678901	46	2	6901234
24	Travis Scott	756789012	123	4	4012345
25	Maroon 5	667890123	134	7	3123456
26	Arctic Monkeys	1878901234	156	5	7234567
27	SZA	589012345	67	2	4345678
28	Twenty One Pilots	498765432	89	5	3456789
29	Olivia Rodrigo	787654321	31	2	5567890
30	Kanye West	1676543210	245	10	4678901
31	Katy Perry	565432109	145	6	3789012
32	Shawn Mendes	454321098	87	4	2890123
33	Metallica	1343210987	167	10	4901234
34	Pink Floyd	1232109876	167	15	3012345
35	Queen	2121098765	189	15	6123456
36	ABBA	1010987654	145	8	2234567
37	Michael Jackson	1987654321	267	10	8345678
38	Madonna	876543210	325	14	3456789
39	Eagles	765432109	124	7	2567890
40	Aerosmith	654321098	178	15	1678901
41	Green Day	543210987	156	13	2789012
42	Foo Fighters	432109876	167	10	1890123
43	Red Hot Chili Peppers	321098765	198	12	2901234
44	Pearl Jam	210987654	178	11	1012345
45	Nirvana	987654321	89	3	3123456
\.


--
-- Data for Name: song; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.song (song_id, title, genre, year_released, streams, num_favorites, duration, lyrics, artist_id, album_id) FROM stdin;
1	Here Comes the Sun	Rock	1969	500000000	2000000	00:03:06	Here comes the sun, do, do, do...	1	1
2	Anti-Hero	Pop	2022	800000000	3000000	00:03:20	It's me, hi, I'm the problem, it's me...	2	2
3	Shape of You	Pop	2017	1000000000	4000000	00:03:53	I'm in love with the shape of you...	3	3
4	Break My Soul	Dance/Electronic	2022	600000000	2500000	00:04:38	You won't break my soul...	4	4
5	Fix You	Alternative Rock	2005	700000000	3500000	00:04:54	Lights will guide you home...	5	5
6	God's Plan	Hip-Hop	2018	789123456	2876543	00:03:18	She say do you love me...	6	6
7	7 Rings	Pop	2019	678912345	1987654	00:03:45	I want it, I got it...	7	7
8	Lose Yourself	Hip-Hop	2002	987654321	3456789	00:05:26	His palms are sweaty...	8	8
9	Blinding Lights	Pop	2020	876543210	2345678	00:03:20	I've been running through the city...	9	9
10	Butter	K-Pop	2021	765432109	4567890	00:02:58	Smooth like butter...	10	10
11	Bad Romance	Pop	2009	654321098	1876543	00:04:54	Rah rah ah-ah-ah...	11	11
12	Circles	Pop	2019	543210987	2987654	00:03:35	We couldn't turn around...	12	12
13	Umbrella	Pop	2007	432109876	1765432	00:04:35	When the sun shines...	13	13
14	Stay	Pop	2021	321098765	2654321	00:02:21	I do the same thing...	14	14
15	Hello	Pop	2015	987123456	3543210	00:04:55	Hello from the other side...	15	15
16	Believer	Alternative Rock	2017	876123454	1432109	00:03:24	First things first...	16	16
17	Just The Way You Are	Pop	2010	765123453	2321098	00:03:40	Oh, her eyes, her eyes...	17	17
18	Humble	Hip-Hop	2017	654123452	3210987	00:02:57	Nobody pray for me...	18	18
19	Say So	Pop	2020	543123451	1109876	00:03:57	Day to night to morning...	19	19
20	Tití Me Preguntó	Latin	2022	432123450	2098765	00:04:03	Tití me preguntó...	20	20
21	As It Was	Pop	2022	987234567	3987654	00:02:47	Come on, Harry...	21	21
22	Levitating	Pop	2020	876234566	1876543	00:03:23	If you wanna run away...	22	22
23	Bad Guy	Pop	2019	765234565	2765432	00:03:14	White shirt now red...	23	23
24	Sicko Mode	Hip-Hop	2018	654234564	3654321	00:05:12	Sun is down...	24	24
25	Sugar	Pop	2014	543234563	1543210	00:03:55	I'm hurting baby...	25	25
26	R U Mine?	Rock	2013	432234562	2432109	00:03:43	All I wanna hear her say is...	26	26
27	Kill Bill	R&B	2022	321234561	3321098	00:02:33	I might kill my ex...	27	27
28	Stressed Out	Alternative Rock	2015	987345678	1210987	00:03:22	I wish I found some...	28	28
29	Drivers License	Pop	2021	876345677	2109876	00:04:02	I got my driver's license...	29	29
30	Stronger	Hip-Hop	2007	765345676	3098765	00:05:11	N-now th-that that...	30	30
31	Firework	Pop	2010	654345675	1987654	00:03:47	Do you ever feel...	31	31
32	In My Blood	Pop	2018	543345674	2876543	00:03:31	Help me, it's like...	32	32
33	Enter Sandman	Metal	1991	432345673	3765432	00:05:31	Say your prayers...	33	33
34	Another Brick in the Wall	Rock	1979	321345672	1654321	00:03:59	We don't need no...	34	34
35	Bohemian Rhapsody	Rock	1975	987456789	2543210	00:05:55	Is this the real life...	35	35
36	Dancing Queen	Pop	1976	876456788	3432109	00:03:51	You can dance...	36	36
37	Billie Jean	Pop	1982	765456787	1321098	00:04:54	She was more like...	37	37
38	Like a Prayer	Pop	1989	654456786	2210987	00:05:39	Life is a mystery...	38	38
39	Hotel California	Rock	1977	543456785	3109876	00:06:30	On a dark desert...	39	39
40	Dream On	Rock	1973	432456784	1098765	00:04:28	Every time when...	40	40
41	Boulevard of Broken Dreams	Rock	2004	321456783	2987654	00:04:20	I walk a lonely road...	41	41
42	Everlong	Rock	1997	987567890	3876543	00:04:10	Hello, I've waited...	42	42
43	Under the Bridge	Rock	1991	876567889	1765432	00:04:24	Sometimes I feel...	43	43
44	Black	Rock	1991	765567888	2654321	00:05:43	Hey... uh huh...	44	44
45	Smells Like Teen Spirit	Rock	1991	654567887	3543210	00:05:01	Load up on guns...	45	45
\.


--
-- Data for Name: user_favourites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_favourites (user_id, song_id) FROM stdin;
1	1
1	3
1	4
2	1
3	2
3	4
3	7
3	9
4	3
4	8
5	5
5	12
5	15
6	7
7	8
7	15
7	20
8	9
8	18
8	22
8	25
9	10
10	11
10	24
10	28
11	13
12	14
12	30
12	33
13	16
13	33
13	35
14	17
15	19
15	39
15	41
16	20
16	42
16	45
17	22
18	23
19	26
19	28
19	30
20	29
20	31
21	32
22	35
22	37
22	40
23	38
24	41
24	43
24	44
25	44
26	1
26	5
26	15
26	45
27	2
27	6
28	11
28	21
28	31
28	41
29	25
29	35
30	18
30	28
30	38
\.


--
-- Name: User_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_user_id_seq"', 1, false);


--
-- Name: album_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.album_album_id_seq', 1, false);


--
-- Name: artist_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artist_artist_id_seq', 1, false);


--
-- Name: song_song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.song_song_id_seq', 1, false);


--
-- Name: User User_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_email_key" UNIQUE (email);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (user_id);


--
-- Name: User User_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_username_key" UNIQUE (username);


--
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (album_id);


--
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (artist_id);


--
-- Name: song song_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (song_id);


--
-- Name: user_favourites user_favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favourites
    ADD CONSTRAINT user_favourites_pkey PRIMARY KEY (user_id, song_id);


--
-- Name: album album_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artist(artist_id) ON DELETE CASCADE;


--
-- Name: song song_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album(album_id) ON DELETE CASCADE;


--
-- Name: song song_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artist(artist_id) ON DELETE CASCADE;


--
-- Name: user_favourites user_favourites_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favourites
    ADD CONSTRAINT user_favourites_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.song(song_id) ON DELETE CASCADE;


--
-- Name: user_favourites user_favourites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favourites
    ADD CONSTRAINT user_favourites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."User"(user_id) ON DELETE CASCADE;


--
-- postgreSQL database dump complete
--

