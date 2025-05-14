--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-14 14:51:00

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
-- TOC entry 222 (class 1259 OID 16478)
-- Name: bobot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bobot (
    bobot_id integer NOT NULL,
    gejala_id integer,
    penyakit_id integer,
    weight double precision NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT bobot_weight_check CHECK (((weight >= (0)::double precision) AND (weight <= (1)::double precision)))
);


ALTER TABLE public.bobot OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16477)
-- Name: bobot_bobot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bobot_bobot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bobot_bobot_id_seq OWNER TO postgres;

--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 221
-- Name: bobot_bobot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bobot_bobot_id_seq OWNED BY public.bobot.bobot_id;


--
-- TOC entry 218 (class 1259 OID 16449)
-- Name: gejala; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gejala (
    gejala_id integer NOT NULL,
    kode_gejala character varying(10) NOT NULL,
    nama_gejala character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    pertanyaan text
);


ALTER TABLE public.gejala OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16448)
-- Name: gejala_gejala_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gejala_gejala_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gejala_gejala_id_seq OWNER TO postgres;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 217
-- Name: gejala_gejala_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gejala_gejala_id_seq OWNED BY public.gejala.gejala_id;


--
-- TOC entry 220 (class 1259 OID 16464)
-- Name: penyakit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.penyakit (
    penyakit_id integer NOT NULL,
    kode_penyakit character varying(10) NOT NULL,
    nama_penyakit character varying(100) NOT NULL,
    description text,
    saran_penanganan text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.penyakit OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16463)
-- Name: penyakit_penyakit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.penyakit_penyakit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.penyakit_penyakit_id_seq OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 219
-- Name: penyakit_penyakit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.penyakit_penyakit_id_seq OWNED BY public.penyakit.penyakit_id;


--
-- TOC entry 4709 (class 2604 OID 16481)
-- Name: bobot bobot_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bobot ALTER COLUMN bobot_id SET DEFAULT nextval('public.bobot_bobot_id_seq'::regclass);


--
-- TOC entry 4703 (class 2604 OID 16452)
-- Name: gejala gejala_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gejala ALTER COLUMN gejala_id SET DEFAULT nextval('public.gejala_gejala_id_seq'::regclass);


--
-- TOC entry 4706 (class 2604 OID 16467)
-- Name: penyakit penyakit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penyakit ALTER COLUMN penyakit_id SET DEFAULT nextval('public.penyakit_penyakit_id_seq'::regclass);


--
-- TOC entry 4880 (class 0 OID 16478)
-- Dependencies: 222
-- Data for Name: bobot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bobot (bobot_id, gejala_id, penyakit_id, weight, created_at, updated_at) FROM stdin;
121	1	1	0.2	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
122	1	2	0.4	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
123	1	3	0.5	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
124	1	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
125	1	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
126	2	1	0.3	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
127	2	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
128	2	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
129	2	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
130	2	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
131	3	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
132	3	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
133	3	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
134	3	4	0.2	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
135	3	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
136	4	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
137	4	2	0.2	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
138	4	3	0.2	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
139	4	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
140	4	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
141	5	1	0.6	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
142	5	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
143	5	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
144	5	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
145	5	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
146	6	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
147	6	2	0.5	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
148	6	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
149	6	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
150	6	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
151	7	1	0.2	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
152	7	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
153	7	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
154	7	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
155	7	5	0.3	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
156	8	1	0.1	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
157	8	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
158	8	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
159	8	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
160	8	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
161	9	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
162	9	2	0.2	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
163	9	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
164	9	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
165	9	5	0.6	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
166	10	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
167	10	2	0.4	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
168	10	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
169	10	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
170	10	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
171	11	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
172	11	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
173	11	3	0.6	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
174	11	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
175	11	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
176	12	1	0.8	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
177	12	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
178	12	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
179	12	4	0.1	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
180	12	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
181	13	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
182	13	2	0.4	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
183	13	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
184	13	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
185	13	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
186	14	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
187	14	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
188	14	3	0.1	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
189	14	4	0.6	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
190	14	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
191	15	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
192	15	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
193	15	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
194	15	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
195	15	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
196	16	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
197	16	2	0.2	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
198	16	3	0.4	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
199	16	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
200	16	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
201	17	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
202	17	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
203	17	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
204	17	4	0.3	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
205	17	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
206	18	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
207	18	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
208	18	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
209	18	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
210	18	5	0.1	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
211	19	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
212	19	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
213	19	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
214	19	4	0.8	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
215	19	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
216	20	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
217	20	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
218	20	3	0.6	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
219	20	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
220	20	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
221	21	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
222	21	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
223	21	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
224	21	4	0.5	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
225	21	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
226	22	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
227	22	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
228	22	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
229	22	4	0.2	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
230	22	5	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
231	23	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
232	23	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
233	23	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
234	23	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
235	23	5	0.4	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
236	24	1	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
237	24	2	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
238	24	3	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
239	24	4	0	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
240	24	5	0.2	2025-05-14 12:26:47.524816	2025-05-14 12:26:47.524816
\.


--
-- TOC entry 4876 (class 0 OID 16449)
-- Dependencies: 218
-- Data for Name: gejala; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gejala (gejala_id, kode_gejala, nama_gejala, created_at, updated_at, pertanyaan) FROM stdin;
1	G1	Kesulitan tidur	2025-05-14 11:19:16.873788	2025-05-14 12:57:05.735988	Apakah Anda kesulitan tidur?
2	G2	Mendengar suara aneh	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda sering mendengar suara aneh yang tidak diketahui sumbernya?
3	G3	Sering/mudah menangis	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda sering atau mudah menangis tanpa sebab yang jelas?
4	G4	Kehilangan minat untuk melakukan aktivitas	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda kehilangan minat untuk melakukan aktivitas yang biasa Anda nikmati?
5	G5	Emosi menjadi datar	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda merasa emosi Anda menjadi datar atau tidak merasakan apa-apa?
6	G6	Ingatan terganggu	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda merasa ingatan Anda terganggu atau sering lupa?
7	G7	Menjauh dari lingkungan sosial	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda cenderung menjauh dari lingkungan sosial atau menghindari interaksi sosial?
8	G8	Pikiran dan berbicara kacau	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah pikiran dan ucapan Anda terasa kacau atau sulit dikendalikan?
9	G9	Rasa takut dan khawatir berlebihan	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda sering merasa takut atau khawatir secara berlebihan?
10	G10	Mimpi buruk	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda sering mengalami mimpi buruk?
11	G11	Sering merasa sedih	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda sering merasa sedih tanpa alasan yang jelas?
12	G12	Mempercayai sesuatu yang tidak nyata	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda mempercayai sesuatu yang tidak nyata atau tidak masuk akal?
13	G13	Sulit mengendalikan emosi	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda merasa sulit mengendalikan emosi Anda?
14	G14	Diliputi perasaan bersalah berlebihan	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda sering diliputi perasaan bersalah yang berlebihan?
15	G15	Perasaan bermusuhan	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda merasa memiliki perasaan bermusuhan terhadap orang lain tanpa sebab jelas?
16	G16	Menghindari sebuah tempat/objek	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda menghindari tempat atau objek tertentu karena merasa takut atau cemas?
17	G17	Kehilangan motivasi	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda merasa kehilangan motivasi dalam menjalani aktivitas sehari-hari?
18	G18	Sering cemas	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda sering merasa cemas?
19	G19	Moody	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah suasana hati Anda sering berubah-ubah secara drastis?
20	G20	Perasaan putus asa	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda sering merasa putus asa?
21	G21	Kurangnya daya ingat	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda merasa daya ingat Anda semakin berkurang?
22	G22	Bicara terlalu cepat	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda sering berbicara dengan sangat cepat atau sulit dihentikan?
23	G23	Gangguan pernapasan	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah Anda mengalami gangguan pernapasan seperti sesak atau napas pendek?
24	G24	Gerakan tubuh dan pikiran yang lambat	2025-05-14 11:22:29.180219	2025-05-14 12:57:05.735988	Apakah gerakan tubuh dan pikiran Anda terasa lambat?
\.


--
-- TOC entry 4878 (class 0 OID 16464)
-- Dependencies: 220
-- Data for Name: penyakit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penyakit (penyakit_id, kode_penyakit, nama_penyakit, description, saran_penanganan, created_at, updated_at) FROM stdin;
1	P1	Skizofrenia	Skizofrenia adalah gangguan mental kronis yang ditandai oleh distorsi dalam berpikir, emosi, dan perilaku, termasuk delusi dan halusinasi (Florensa et al., 2023). Menurut Kurnia et al. (2021), Teori Dopamin Hipotesis menyatakan bahwa ketidakseimbangan neurotransmitter dopamin berperan dalam perkembangan skizofrenia.	Segera cari rujukan ke psikolog terdekat untuk mendapatkan dukungan profesional yang Anda butuhkan. Tindakan cepat akan sangat membantu dalam pemulihan Anda.	2025-05-14 11:36:42.740751	2025-05-14 11:36:42.740751
2	P2	Post Traumatic Stress Disorder (PTSD)	PTSD adalah gangguan kecemasan yang terjadi akibat peristiwa traumatis seperti kecelakaan, kekerasan, dan lainnya (Yehuda et al., 2015). Gejala PTSD juga meliputi flashback, mimpi buruk, hiperwaspada, dan penghindaran terhadap pemicu trauma.	Cobalah menjalani terapi Eye Movement Desensitization and Reprocessing (EMDR) dengan mengarahkan perhatian pada suara atau gerakan benda tertentu saat mengingat peristiwa traumatis. Ini akan membantu Anda mengelola kenangan traumatis dengan lebih baik.	2025-05-14 11:36:42.740751	2025-05-14 11:36:42.740751
3	P3	Depresi	Depresi adalah gangguan mood yang ditandai oleh perasaan sedih berkepanjangan, kehilangan minat, dan gangguan fungsi sehari-hari (Endriyani et al., 2022).	Lakukan aktivitas yang Anda nikmati atau mulailah menulis buku harian untuk mencurahkan perasaan Anda. Hal-hal kecil ini akan membantu meredakan beban emosional Anda.	2025-05-14 11:36:42.740751	2025-05-14 11:36:42.740751
4	P4	Bipolar	Bipolar adalah gangguan mood yang ditandai dengan episode mania (euforia, impulsivitas) dan depresi berat (Goodwin & Jamison, 2007).	Atur pola aktivitas harian Anda dengan disiplin, termasuk waktu tidur, makan, dan beristirahat. Terapkan rutinitas yang stabil untuk menjaga keseimbangan emosional Anda.	2025-05-14 11:36:42.740751	2025-05-14 11:36:42.740751
5	P5	Paranoid	Paranoid merupakan gangguan kepribadian yang dicirikan oleh kecurigaan yang tidak beralasan terhadap orang lain (Florensia et al., 2023).	Latih diri Anda dengan terapi perilaku kognitif untuk merespons stres dengan cara yang lebih positif. Fokuslah pada aktivitas seperti membaca, berolahraga, atau meditasi untuk mengelola kecemasan.	2025-05-14 11:36:42.740751	2025-05-14 11:36:42.740751
\.


--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 221
-- Name: bobot_bobot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bobot_bobot_id_seq', 240, true);


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 217
-- Name: gejala_gejala_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gejala_gejala_id_seq', 24, true);


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 219
-- Name: penyakit_penyakit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.penyakit_penyakit_id_seq', 5, true);


--
-- TOC entry 4722 (class 2606 OID 16488)
-- Name: bobot bobot_gejala_id_penyakit_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bobot
    ADD CONSTRAINT bobot_gejala_id_penyakit_id_key UNIQUE (gejala_id, penyakit_id);


--
-- TOC entry 4724 (class 2606 OID 16486)
-- Name: bobot bobot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bobot
    ADD CONSTRAINT bobot_pkey PRIMARY KEY (bobot_id);


--
-- TOC entry 4714 (class 2606 OID 16460)
-- Name: gejala gejala_kode_gejala_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gejala
    ADD CONSTRAINT gejala_kode_gejala_key UNIQUE (kode_gejala);


--
-- TOC entry 4716 (class 2606 OID 16458)
-- Name: gejala gejala_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gejala
    ADD CONSTRAINT gejala_pkey PRIMARY KEY (gejala_id);


--
-- TOC entry 4718 (class 2606 OID 16475)
-- Name: penyakit penyakit_kode_penyakit_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penyakit
    ADD CONSTRAINT penyakit_kode_penyakit_key UNIQUE (kode_penyakit);


--
-- TOC entry 4720 (class 2606 OID 16473)
-- Name: penyakit penyakit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penyakit
    ADD CONSTRAINT penyakit_pkey PRIMARY KEY (penyakit_id);


--
-- TOC entry 4729 (class 2620 OID 16499)
-- Name: bobot update_bobot_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_bobot_timestamp BEFORE UPDATE ON public.bobot FOR EACH ROW EXECUTE FUNCTION public.update_timestamp();


--
-- TOC entry 4728 (class 2620 OID 16476)
-- Name: penyakit update_penyakit_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_penyakit_timestamp BEFORE UPDATE ON public.penyakit FOR EACH ROW EXECUTE FUNCTION public.update_timestamp();


--
-- TOC entry 4727 (class 2620 OID 16462)
-- Name: gejala update_symptoms_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_symptoms_timestamp BEFORE UPDATE ON public.gejala FOR EACH ROW EXECUTE FUNCTION public.update_timestamp();


--
-- TOC entry 4725 (class 2606 OID 16489)
-- Name: bobot bobot_gejala_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bobot
    ADD CONSTRAINT bobot_gejala_id_fkey FOREIGN KEY (gejala_id) REFERENCES public.gejala(gejala_id) ON DELETE CASCADE;


--
-- TOC entry 4726 (class 2606 OID 16494)
-- Name: bobot bobot_penyakit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bobot
    ADD CONSTRAINT bobot_penyakit_id_fkey FOREIGN KEY (penyakit_id) REFERENCES public.penyakit(penyakit_id) ON DELETE CASCADE;


-- Completed on 2025-05-14 14:51:00

--
-- PostgreSQL database dump complete
--

