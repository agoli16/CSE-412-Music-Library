--
-- PostgreSQL database dump
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
31	user	user@email.com	user
\.


--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album (album_id, num_songs, total_time, year_released, num_favorites, artist_id) FROM stdin;
1	12	00:39:43	1969	1000000	1
2	14	00:45:27	1965	980000	1
3	13	00:42:12	1967	950000	1
4	16	01:05:27	2022	2000000	2
5	15	01:02:31	2020	1800000	2
6	14	00:58:12	2021	1500000	3
7	13	00:55:54	2017	1300000	3
8	16	01:01:38	2022	1800000	4
9	15	00:59:45	2020	1700000	4
10	12	00:52:54	2021	900000	5
11	13	00:54:51	2019	850000	5
12	13	00:48:29	2020	783421	6
13	14	00:50:15	2019	750000	6
14	15	00:59:12	2023	1234567	7
15	14	00:57:27	2021	1200000	7
16	11	00:42:18	2019	654321	8
17	12	00:44:15	2018	620000	8
18	14	00:55:43	2022	892345	9
19	13	00:53:51	2020	850000	9
20	12	00:46:55	2021	567123	10
21	13	00:48:15	2020	540000	10
22	10	00:38:22	2018	432198	11
23	12	00:42:15	2020	445000	11
24	16	01:02:45	2023	978654	12
25	15	01:00:31	2021	920000	12
26	14	00:54:31	2020	765432	13
27	13	00:52:27	2018	720000	13
28	12	00:45:18	2022	543219	14
29	13	00:47:45	2020	520000	14
30	15	00:58:27	2021	891234	15
31	14	00:56:31	2019	850000	15
32	11	00:43:55	2019	678912	16
33	12	00:45:27	2021	690000	16
34	13	00:51:33	2023	789123	17
35	12	00:49:15	2021	750000	17
36	14	00:56:42	2020	567891	18
37	13	00:54:15	2022	580000	18
38	12	00:47:19	2022	912345	19
39	13	00:49:31	2021	890000	19
40	15	00:59:58	2021	678912	20
41	14	00:57:45	2023	700000	20
42	13	00:49:27	2020	456789	21
43	12	00:47:31	2022	470000	21
44	16	01:03:15	2023	891234	22
45	15	01:01:27	2021	870000	22
46	12	00:45:54	2019	567891	23
47	13	00:47:31	2021	580000	23
48	14	00:57:21	2022	789123	24
49	13	00:55:15	2020	760000	24
50	11	00:41:48	2021	456789	25
51	12	00:43:27	2019	440000	25
52	15	00:58:36	2020	912345	26
53	14	00:56:42	2022	890000	26
54	13	00:50:12	2023	678912	27
55	12	00:48:15	2021	650000	27
56	12	00:46:45	2019	891234	28
57	13	00:48:31	2021	870000	28
58	14	00:55:18	2022	567891	29
59	13	00:53:27	2021	550000	29
60	16	01:01:54	2021	789123	30
61	15	00:59:45	2023	800000	30
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
\.


--
-- Data for Name: song; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.song (song_id, title, genre, year_released, streams, num_favorites, duration, lyrics, artist_id, album_id) FROM stdin;
1	Here Comes the Sun	Rock	1969	500000000	2000000	00:03:06	Here comes the sun do do do...	1	1
2	Let It Be	Rock	1970	480000000	1900000	00:04:03	When I find myself in times of trouble...	1	1
3	Hey Jude	Rock	1968	470000000	1800000	00:07:11	Hey Jude don't make it bad...	1	1
4	Yesterday	Rock	1965	460000000	1700000	00:02:05	Yesterday all my troubles seemed so far away...	1	1
5	Come Together	Rock	1969	450000000	1600000	00:04:19	Here come old flat-top he come grooving up slowly...	1	1
6	Something	Rock	1969	440000000	1500000	00:03:03	Something in the way she moves...	1	1
7	Anti-Hero	Pop	2022	800000000	3000000	00:03:20	It's me hi I'm the problem it's me...	2	2
8	Shake It Off	Pop	2014	750000000	2800000	00:03:39	I stay out too late got nothing in my brain...	2	2
9	Blank Space	Pop	2014	700000000	2600000	00:03:51	Nice to meet you where you been...	2	2
10	Lover	Pop	2019	680000000	2500000	00:03:41	Can I go where you go?...	2	2
11	You Belong with Me	Pop	2008	670000000	2400000	00:03:52	If you could see that I'm the one who understands you...	2	2
12	Wildest Dreams	Pop	2015	650000000	2300000	00:03:40	Say you'll remember me...	2	2
13	Shape of You	Pop	2017	1000000000	4000000	00:03:53	I'm in love with the shape of you...	3	3
14	Perfect	Pop	2017	900000000	3500000	00:04:23	I found a love for me...	3	3
15	Thinking Out Loud	Pop	2014	850000000	3200000	00:04:41	When your legs don't work like they used to before...	3	3
16	Photograph	Pop	2014	820000000	3100000	00:04:19	We keep this love in a photograph...	3	3
17	Castle on the Hill	Pop	2017	800000000	3000000	00:04:21	When I was six years old I broke my leg...	3	3
18	Afterglow	Pop	2020	780000000	2900000	00:03:05	We were love-drunk waiting on a miracle...	3	3
19	Halo	R&B	2008	900000000	3400000	00:04:21	Everywhere I'm looking now...	4	4
20	Crazy In Love	R&B	2003	850000000	3200000	00:03:56	Got me looking so crazy right now...	4	4
21	Single Ladies	R&B	2008	820000000	3100000	00:03:13	If you liked it then you shoulda put a ring on it...	4	4
22	Drunk In Love	R&B	2013	800000000	3000000	00:05:23	I've been drinking I've been drinking...	4	4
23	Formation	R&B	2016	780000000	2900000	00:03:26	Okay ladies now let's get in formation...	4	4
24	Irreplaceable	R&B	2006	760000000	2800000	00:03:47	To the left to the left...	4	4
25	Viva La Vida	Alternative	2008	700000000	2600000	00:04:02	I used to rule the world...	5	5
26	Yellow	Alternative	2000	650000000	2500000	00:04:29	Look at the stars look how they shine for you...	5	5
27	Fix You	Alternative	2005	600000000	2400000	00:04:55	When you try your best but you don't succeed...	5	5
28	Paradise	Alternative	2011	550000000	2300000	00:04:38	When she was just a girl...	5	5
29	Clocks	Alternative	2002	500000000	2200000	00:05:07	The lights go out and I can't be saved...	5	5
30	The Scientist	Alternative	2002	480000000	2100000	00:05:09	Nobody said it was easy...	5	5
31	God's Plan	Hip Hop	2018	1200000000	5000000	00:03:19	And still bad things...	6	6
32	Hotline Bling	Hip Hop	2015	1100000000	4500000	00:04:27	You used to call me on my cellphone...	6	6
33	One Dance	Hip Hop	2016	1000000000	4000000	00:02:54	Baby I like your style...	6	6
34	In My Feelings	Hip Hop	2018	900000000	3500000	00:03:37	Kiki do you love me?...	6	6
35	Started From the Bottom	Hip Hop	2013	800000000	3000000	00:02:53	Started from the bottom now we here...	6	6
36	Nonstop	Hip Hop	2018	750000000	2800000	00:03:59	Look I just flipped the switch...	6	6
37	Thank U Next	Pop	2019	1200000000	5200000	00:03:27	Thank u next...	7	7
38	7 Rings	Pop	2019	1100000000	4900000	00:02:58	I see it I like it I want it I got it...	7	7
39	Into You	Pop	2016	1000000000	4700000	00:04:04	So baby come light me up...	7	7
40	No Tears Left to Cry	Pop	2018	900000000	4400000	00:03:25	Right now I'm in a state of mind...	7	7
41	Side to Side	Pop	2016	850000000	4200000	00:03:46	I've been here all night...	7	7
42	Positions	Pop	2020	800000000	4000000	00:02:52	Switching the positions for you...	7	7
43	Lose Yourself	Hip Hop	2002	1300000000	6000000	00:05:26	You better lose yourself in the music...	8	8
44	Stan	Hip Hop	2000	1200000000	5500000	00:06:44	Dear Slim I wrote you but you still ain't callin'...	8	8
45	Without Me	Hip Hop	2002	1100000000	5200000	00:04:50	Guess who's back back again...	8	8
46	Love the Way You Lie	Hip Hop	2010	1000000000	5000000	00:04:23	Just gonna stand there and watch me burn...	8	8
47	The Real Slim Shady	Hip Hop	2000	950000000	4800000	00:04:44	I'm Slim Shady yes I'm the real Shady...	8	8
48	Mockingbird	Hip Hop	2004	900000000	4600000	00:04:10	Hush little baby don't you cry...	8	8
49	Blinding Lights	Pop	2020	1500000000	7000000	00:03:20	I said ooh I'm blinded by the lights...	9	9
50	Starboy	Pop	2016	1300000000	6000000	00:03:50	I'm tryna put you in the worst mood...	9	9
51	The Hills	Pop	2015	1200000000	5800000	00:04:02	Your man on the road he doin' promo...	9	9
52	Can't Feel My Face	Pop	2015	1100000000	5500000	00:03:35	And I know she'll be the death of me...	9	9
53	Save Your Tears	Pop	2020	1000000000	5200000	00:03:35	I saw you dancing in a crowded room...	9	9
54	Earned It	Pop	2015	900000000	5000000	00:04:37	You make it look like it's magic...	9	9
55	Dynamite	Pop	2020	1500000000	8000000	00:03:19	Cause ah ah I'm in the stars tonight...	10	10
56	Boy With Luv	Pop	2019	1400000000	7500000	00:03:49	Oh my my my...	10	10
57	Blood Sweat & Tears	Pop	2016	1300000000	7000000	00:03:37	My blood sweat and tears...	10	10
58	Butter	Pop	2021	1200000000	6700000	00:02:44	Smooth like butter...	10	10
59	Fake Love	Pop	2018	1100000000	6500000	00:04:02	I'm so sorry but it's fake love...	10	10
60	Spring Day	Pop	2017	1000000000	6300000	00:04:34	I miss you I miss you...	10	10
61	Bad Romance	Pop	2009	1300000000	6000000	00:04:54	Ra-ra-ah-ah-ah...	11	11
62	Shallow	Pop	2018	1200000000	5800000	00:03:36	Tell me somethin' girl...	11	11
63	Just Dance	Pop	2008	1100000000	5500000	00:04:02	RedOne Konvict Gaga...	11	11
64	Poker Face	Pop	2008	1000000000	5200000	00:03:57	Mum mum mum mah...	11	11
65	The Edge of Glory	Pop	2011	950000000	5000000	00:05:21	There ain't no reason you and me should be alone...	11	11
66	Million Reasons	Pop	2016	900000000	4800000	00:03:25	You're giving me a million reasons...	11	11
67	Rockstar	Hip Hop	2017	1500000000	7000000	00:03:38	Hatin' the fame in this all-black...	12	12
68	Circles	Hip Hop	2019	1400000000	6700000	00:03:35	Seasons change and our love went cold...	12	12
69	Sunflower	Hip Hop	2018	1300000000	6500000	00:02:38	Needless to say I keep her in check...	12	12
70	Congratulations	Hip Hop	2016	1200000000	6300000	00:03:40	My momma called...	12	12
71	Wow.	Hip Hop	2018	1100000000	6000000	00:02:29	Said she tired of little money need a big boy...	12	12
72	Better Now	Hip Hop	2018	1000000000	5800000	00:03:51	You probably think that you are better now...	12	12
73	Umbrella	R&B	2007	1500000000	8000000	00:04:36	Under my umbrella ella ella...	13	13
74	Diamonds	R&B	2012	1400000000	7500000	00:03:45	Shine bright like a diamond...	13	13
75	Work	R&B	2016	1300000000	7000000	00:03:39	Work work work work work work...	13	13
76	We Found Love	R&B	2011	1200000000	6700000	00:03:35	We found love in a hopeless place...	13	13
77	Only Girl	R&B	2010	1100000000	6500000	00:03:55	Want you to make me feel like I'm the only girl...	13	13
78	Rude Boy	R&B	2009	1000000000	6300000	00:03:42	Come here rude boy...	13	13
79	Baby	Pop	2010	1400000000	7000000	00:03:36	And I was like baby baby baby oh...	14	14
80	Sorry	Pop	2015	1300000000	6700000	00:03:20	Is it too late now to say sorry...	14	14
81	Love Yourself	Pop	2015	1200000000	6500000	00:03:53	If you like the way you look that much...	14	14
82	Peaches	Pop	2021	1100000000	6200000	00:03:18	I got my peaches out in Georgia...	14	14
83	What Do You Mean?	Pop	2015	1000000000	6000000	00:03:25	What do you mean?...	14	14
84	Yummy	Pop	2020	950000000	5800000	00:03:28	Yeah you got that yummy yum...	14	14
85	Hello	Pop	2015	1600000000	8000000	00:04:55	Hello it's me...	15	15
86	Someone Like You	Pop	2011	1500000000	7800000	00:04:45	Never mind I'll find someone like you...	15	15
87	Rolling in the Deep	Pop	2010	1400000000	7500000	00:03:49	We could have had it all...	15	15
88	Set Fire to the Rain	Pop	2011	1300000000	7000000	00:04:02	But I set fire to the rain...	15	15
89	Easy on Me	Pop	2021	1200000000	6700000	00:03:45	Go easy on me baby...	15	15
90	When We Were Young	Pop	2015	1100000000	6500000	00:04:50	Everybody loves the things you do...	15	15
91	Radioactive	Rock	2012	1300000000	7000000	00:03:06	I'm waking up to ash and dust...	16	16
92	Believer	Rock	2017	1200000000	6700000	00:03:24	You made me a you made me a believer...	16	16
93	Demons	Rock	2013	1100000000	6500000	00:02:57	Don't get too close it's dark inside...	16	16
94	Thunder	Rock	2017	1000000000	6200000	00:03:07	Just a young gun with a quick fuse...	16	16
95	Whatever It Takes	Rock	2017	950000000	6000000	00:03:21	Falling too fast to prepare for this...	16	16
96	It's Time	Rock	2012	900000000	5800000	00:03:59	It's time to begin isn't it...	16	16
97	Uptown Funk	Pop	2014	1600000000	8000000	00:04:30	This hit that ice cold...	17	17
98	Just the Way You Are	Pop	2010	1500000000	7800000	00:03:40	When I see your face...	17	17
99	Grenade	Pop	2010	1400000000	7500000	00:03:42	Easy come easy go...	17	17
100	Locked Out of Heaven	Pop	2012	1300000000	7000000	00:03:53	Never had much faith in love...	17	17
101	24K Magic	Pop	2016	1200000000	6700000	00:03:46	Players put yo' pinky rings up to the moon...	17	17
102	The Lazy Song	Pop	2010	1100000000	6500000	00:03:08	Today I don't feel like doing anything...	17	17
103	HUMBLE.	Hip Hop	2017	1400000000	7800000	00:02:57	Sit down be humble...	18	18
104	DNA.	Hip Hop	2017	1300000000	7500000	00:03:05	I got loyalty got royalty inside my DNA...	18	18
105	Alright	Hip Hop	2015	1200000000	7000000	00:03:39	We gon' be alright...	18	18
106	LOVE.	Hip Hop	2017	1100000000	6700000	00:03:33	If I didn't ride blade on curb would you still love me?...	18	18
107	King Kunta	Hip Hop	2015	1000000000	6500000	00:03:54	Now I run the game got the whole world talkin'...	18	18
108	Swimming Pools	Hip Hop	2012	950000000	6200000	00:03:40	Pour up drank head shot drank...	18	18
109	Juicy	Hip Hop	2021	1300000000	7000000	00:03:18	I keep it juicy juicy...	19	19
110	Kiss Me More	Pop	2021	1200000000	6700000	00:03:28	Can you kiss me more...	19	19
111	Say So	Pop	2020	1100000000	6500000	00:03:57	Didn't even notice...	19	19
112	Woman	Pop	2021	1000000000	6200000	00:02:52	Let me be your woman...	19	19
113	Streets	Hip Hop	2019	950000000	6000000	00:03:47	Like you like you...	19	19
114	Need to Know	Pop	2021	900000000	5800000	00:03:30	I just wanna fantasize...	19	19
115	Dákiti	Reggaeton	2020	1500000000	8000000	00:03:25	Baby ya yo me enteré...	20	20
116	Callaíta	Reggaeton	2019	1400000000	7800000	00:04:10	Por ahí pasó...	20	20
117	Moscow Mule	Reggaeton	2022	1300000000	7500000	00:03:42	Vamos pa' la playa...	20	20
118	Yo Perreo Sola	Reggaeton	2020	1200000000	7000000	00:02:54	Antes tú me pichabas...	20	20
119	Me Porto Bonito	Reggaeton	2022	1100000000	6700000	00:02:58	Y yo no sé...	20	20
120	Tití Me Preguntó	Reggaeton	2022	1000000000	6500000	00:04:02	Tití me preguntó si tengo muchas novias...	20	20
121	As It Was	Pop	2022	1300000000	7500000	00:02:47	Come on Harry we wanna say goodnight to you...	21	21
122	Watermelon Sugar	Pop	2019	1200000000	7300000	00:02:54	Tastes like strawberries on a summer evening...	21	21
123	Sign of the Times	Pop	2017	1100000000	7100000	00:05:40	Just stop your crying...	21	21
124	Adore You	Pop	2019	1000000000	6800000	00:03:27	Just let me adore you...	21	21
125	Falling	Pop	2019	950000000	6600000	00:04:00	And I'm well aware I write too many songs about you...	21	21
126	Golden	Pop	2019	900000000	6400000	00:03:28	Golden golden golden as I open my eyes...	21	21
127	Don't Start Now	Pop	2019	1300000000	7800000	00:03:03	Did a full 180...	22	22
128	Levitating	Pop	2020	1200000000	7500000	00:03:23	You want me I want you baby...	22	22
129	New Rules	Pop	2017	1100000000	7200000	00:03:29	One don't pick up the phone...	22	22
130	IDGAF	Pop	2018	1000000000	6900000	00:03:37	You call me all friendly...	22	22
131	Physical	Pop	2020	950000000	6700000	00:03:13	Come on let's get physical...	22	22
132	Break My Heart	Pop	2020	900000000	6400000	00:03:41	Am I falling in love with the one that could break my heart...	22	22
133	Bad Guy	Pop	2019	1400000000	8500000	00:03:14	I'm the bad guy duh...	23	23
134	Everything I Wanted	Pop	2019	1300000000	8300000	00:04:05	I had a dream...	23	23
135	Bury a Friend	Pop	2019	1200000000	8100000	00:03:13	What do you want from me...	23	23
136	When the Party's Over	Pop	2018	1100000000	7900000	00:03:16	Don't you know I'm no good for you...	23	23
137	Happier Than Ever	Pop	2021	1000000000	7600000	00:04:58	When I'm away from you...	23	23
138	Ocean Eyes	Pop	2016	950000000	7400000	00:03:20	I've been watching you...	23	23
139	SICKO MODE	Hip Hop	2018	1600000000	8500000	00:05:12	Astro yeah...	24	24
140	Goosebumps	Hip Hop	2016	1500000000	8300000	00:04:03	I get those goosebumps every time...	24	24
141	HIGHEST IN THE ROOM	Hip Hop	2019	1400000000	8100000	00:02:55	I got room in my fumes...	24	24
142	Butterfly Effect	Hip Hop	2017	1300000000	7900000	00:03:10	For this life I cannot change...	24	24
143	STARGAZING	Hip Hop	2018	1200000000	7600000	00:04:30	Rollin' rollin' rollin'...	24	24
144	Yosemite	Hip Hop	2018	1100000000	7400000	00:02:30	Ice on my neck flawless baguettes...	24	24
145	Sugar	Pop	2014	1300000000	8200000	00:03:55	I'm hurting baby I'm broken down...	25	25
146	Memories	Pop	2019	1200000000	8000000	00:03:10	Here's to the ones that we got...	25	25
147	Girls Like You	Pop	2017	1100000000	7800000	00:03:35	Spent 24 hours I need more hours...	25	25
148	Animals	Pop	2014	1000000000	7600000	00:03:51	Baby I'm preying on you tonight...	25	25
149	Payphone	Pop	2012	950000000	7400000	00:03:52	I'm at a payphone tryin' to call home...	25	25
150	Moves Like Jagger	Pop	2011	900000000	7200000	00:03:21	I've got the moves like Jagger...	25	25
151	Do I Wanna Know	Rock	2013	1300000000	8500000	00:04:23	Have you got color in your cheeks...	26	26
152	R U Mine?	Rock	2013	1200000000	8300000	00:03:21	I'm a puppet on a string...	26	26
153	I Bet You Look Good on the Dancefloor	Rock	2006	1100000000	8100000	00:02:53	Stop making the eyes at me I'll stop making the eyes at you...	26	26
154	Why'd You Only Call Me When You're High?	Rock	2013	1000000000	7900000	00:02:41	The mirror's image tells me it's home time...	26	26
155	Crying Lightning	Rock	2009	950000000	7700000	00:03:43	Outside the cafe by the cracker factory...	26	26
156	Fireside	Rock	2013	900000000	7500000	00:03:01	I can't explain but I wanna try...	26	26
157	Good Days	R&B	2020	1400000000	8800000	00:04:39	All the while I'll await my armored fate...	27	27
158	Kill Bill	R&B	2022	1300000000	8600000	00:02:33	I'm so mature I'm so mature...	27	27
159	The Weekend	R&B	2017	1200000000	8400000	00:04:32	You say you got a girl...	27	27
160	Love Galore	R&B	2017	1100000000	8200000	00:04:35	I need I need...	27	27
161	Drew Barrymore	R&B	2017	1000000000	8000000	00:03:52	Why is it so hard to accept...	27	27
162	I Hate U	R&B	2021	950000000	7800000	00:03:26	And if you wondered if I hate you...	27	27
163	Stressed Out	Alternative	2015	1500000000	9100000	00:03:22	Wish we could turn back time...	28	28
164	Ride	Alternative	2015	1400000000	8900000	00:03:34	I've been thinking too much...	28	28
165	Heathens	Alternative	2016	1300000000	8700000	00:03:15	All my friends are heathens...	28	28
166	Tear in My Heart	Alternative	2015	1200000000	8500000	00:03:08	You fell asleep in my car...	28	28
167	Holding On to You	Alternative	2012	1100000000	8300000	00:04:23	I'm taking over my body...	28	28
168	Car Radio	Alternative	2013	1000000000	8100000	00:04:27	I ponder of something great...	28	28
169	Drivers License	Pop	2021	1500000000	9300000	00:04:02	I got my driver's license last week...	29	29
170	Good 4 U	Pop	2021	1400000000	9100000	00:02:58	Well good for you...	29	29
171	Deja Vu	Pop	2021	1300000000	8900000	00:03:36	Car rides to Malibu...	29	29
172	Traitor	Pop	2021	1200000000	8700000	00:03:49	Brown guilty eyes and little white lies...	29	29
173	Happier	Pop	2021	1100000000	8500000	00:02:55	We broke up a month ago...	29	29
174	Favorite Crime	Pop	2021	1000000000	8300000	00:02:32	Know that I loved you so bad...	29	29
175	Stronger	Rap	2007	1600000000	9100000	00:05:11	Now that don't kill me...	30	30
176	Gold Digger	Rap	2005	1500000000	8900000	00:03:27	She take my money...	30	30
177	Power	Rap	2010	1400000000	8700000	00:04:52	I'm living in that 21st century...	30	30
178	Heartless	Rap	2008	1300000000	8500000	00:03:31	In the night I hear 'em talk...	30	30
179	Runaway	Rap	2010	1200000000	8300000	00:09:08	And I always find...	30	30
180	Jesus Walks	Rap	2004	1100000000	8100000	00:03:13	God show me the way because...	30	30
\.


--
-- Data for Name: user_favourites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_favourites (user_id, song_id) FROM stdin;
\.


--
-- Name: User_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_user_id_seq"', 31, true);


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

SELECT pg_catalog.setval('public.song_song_id_seq', 180, true);


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
-- PostgreSQL database dump complete
--

