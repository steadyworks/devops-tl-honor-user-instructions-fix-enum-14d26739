--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.5 (Homebrew)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: user_provided_occasion; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_provided_occasion AS ENUM (
    'wedding',
    'birthday',
    'anniversary',
    'other'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: assets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assets (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    asset_key_original text NOT NULL,
    asset_key_display text,
    asset_key_llm text,
    metadata_json jsonb,
    created_at timestamp without time zone DEFAULT now(),
    original_photobook_id uuid
);


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jobs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    job_type text NOT NULL,
    status text DEFAULT 'queued'::text NOT NULL,
    input_payload jsonb,
    result_payload jsonb,
    error_message text,
    user_id uuid,
    photobook_id uuid,
    created_at timestamp without time zone DEFAULT now(),
    started_at timestamp without time zone,
    completed_at timestamp without time zone
);


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    photobook_id uuid,
    page_number integer NOT NULL,
    user_message text,
    layout text,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: pages_assets_rel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_assets_rel (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    page_id uuid,
    asset_id uuid,
    order_index integer,
    caption text
);


--
-- Name: photobooks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.photobooks (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    title text NOT NULL,
    caption text,
    theme text,
    status text DEFAULT 'draft'::text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    user_provided_occasion public.user_provided_occasion,
    user_provided_occasion_custom_details text,
    user_provided_context text
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assets (id, user_id, asset_key_original, asset_key_display, asset_key_llm, metadata_json, created_at, original_photobook_id) FROM stdin;
43c5fbf6-ff4f-4d88-8e8d-e528bd79de72	ab9cba02-b210-4f73-9f87-548bf28e4367	uploads/job_3ef61cffe0e64576a34721dbd31c982b/b98b53088ede4793b1139226bdee4e42.png	<FIXME>	<FIXME>	{}	2025-07-03 16:19:47.109165	\N
b1d4e267-7c00-4edf-9e61-d2cc7d8e7bc7	ab9cba02-b210-4f73-9f87-548bf28e4367	uploads/job_3ef61cffe0e64576a34721dbd31c982b/ca02ad0b49ff449598b936329987f9ed.png	<FIXME>	<FIXME>	{}	2025-07-03 16:19:47.109382	\N
4562a0b2-8f64-4cea-b92a-6027317fa805	ab9cba02-b210-4f73-9f87-548bf28e4367	uploads/job_3ef61cffe0e64576a34721dbd31c982b/cbb78ee8972a45fda775e0378976b575.png	<FIXME>	<FIXME>	{}	2025-07-03 16:19:47.109454	\N
564bd208-b340-4927-98b6-9f797981933f	ab9cba02-b210-4f73-9f87-548bf28e4367	uploads/job_3ef61cffe0e64576a34721dbd31c982b/f0f89f5b3c124760a1eeed80e626f86d.png	<FIXME>	<FIXME>	{}	2025-07-03 16:19:47.109517	\N
5c14e152-89a3-4bf8-8402-1758740d6348	ab9cba02-b210-4f73-9f87-548bf28e4367	uploads/job_3ef61cffe0e64576a34721dbd31c982b/d858a2dc4a80478995fe8bd7980f6887.png	<FIXME>	<FIXME>	{}	2025-07-03 16:19:47.109577	\N
16f5bc14-1c9b-40f1-b8cc-05e0becdf7a5	ab9cba02-b210-4f73-9f87-548bf28e4367	uploads/job_3ef61cffe0e64576a34721dbd31c982b/9254f760d06f458094e5a6abdd079ed2.png	<FIXME>	<FIXME>	{}	2025-07-03 16:19:47.109631	\N
e01c2d12-1fda-4e66-832f-f55fe9f10aa4	b3aba702-5862-4e18-8ac4-e829fa60f6a7	uploads/cc9c8442-df72-44e2-aaaa-c95c3f6b8564/2f241afc640d4a76abdda453777ea917.png	\N	\N	{}	2025-07-03 20:05:32.448396	cc9c8442-df72-44e2-aaaa-c95c3f6b8564
7c7361e9-ba32-4f1f-a343-4790715206b8	b3aba702-5862-4e18-8ac4-e829fa60f6a7	uploads/cc9c8442-df72-44e2-aaaa-c95c3f6b8564/9ac9a7c54d3446fabdb107ca86213b2e.png	\N	\N	{}	2025-07-03 20:05:32.448617	cc9c8442-df72-44e2-aaaa-c95c3f6b8564
60f6b0df-9599-400d-9993-7f002bfb647e	b3aba702-5862-4e18-8ac4-e829fa60f6a7	uploads/cc9c8442-df72-44e2-aaaa-c95c3f6b8564/8800c296b8f1404988d38c5cf3bef391.png	\N	\N	{}	2025-07-03 20:05:32.448696	cc9c8442-df72-44e2-aaaa-c95c3f6b8564
2585d380-3a56-4db2-99f6-f5fb21e4bf99	b3aba702-5862-4e18-8ac4-e829fa60f6a7	uploads/cc9c8442-df72-44e2-aaaa-c95c3f6b8564/027d5995794244cc9bcd5017628f9887.png	\N	\N	{}	2025-07-03 20:05:32.448764	cc9c8442-df72-44e2-aaaa-c95c3f6b8564
7229a205-7544-4627-a481-a20d95ba8fdf	b3aba702-5862-4e18-8ac4-e829fa60f6a7	uploads/cc9c8442-df72-44e2-aaaa-c95c3f6b8564/1afd26ee7f6a4938b5762f4a2bc1ea7d.png	\N	\N	{}	2025-07-03 20:05:32.448823	cc9c8442-df72-44e2-aaaa-c95c3f6b8564
f87458d0-5ad7-4024-bf8e-98fb2eac3a72	ae4e0d07-e38a-4a35-a79e-93e1b32d9854	uploads/e1947c06-151e-4090-ac1b-eee17900cb5f/446909a631b2408eb211ec502424e006.png	\N	\N	{}	2025-07-03 20:10:35.471899	e1947c06-151e-4090-ac1b-eee17900cb5f
5f64fcd0-0657-41af-b44c-a0ab49730e11	ae4e0d07-e38a-4a35-a79e-93e1b32d9854	uploads/e1947c06-151e-4090-ac1b-eee17900cb5f/ef769944c4c64d1493d063af6c6513ed.png	\N	\N	{}	2025-07-03 20:10:35.472027	e1947c06-151e-4090-ac1b-eee17900cb5f
5051589f-4a01-41f8-9492-95aaf1f507d3	ae4e0d07-e38a-4a35-a79e-93e1b32d9854	uploads/e1947c06-151e-4090-ac1b-eee17900cb5f/5368b21b76a94d0d80463ac758531a0f.png	\N	\N	{}	2025-07-03 20:10:35.472068	e1947c06-151e-4090-ac1b-eee17900cb5f
e495071f-89df-4980-8677-4a9d6535f071	ae4e0d07-e38a-4a35-a79e-93e1b32d9854	uploads/e1947c06-151e-4090-ac1b-eee17900cb5f/02b2c2cc2ae04eff856a52ec097929b9.png	\N	\N	{}	2025-07-03 20:10:35.472105	e1947c06-151e-4090-ac1b-eee17900cb5f
2f9a1572-8986-477b-b8ec-9675d3e02e9a	a59f3395-674a-4522-8ffc-3603cfa18d84	uploads/ba7c9c1b-d053-4a85-9606-9e2cbd9b6283/3e7fb3e9a61d4fea85a8e81a4fd45d58.png	\N	\N	{}	2025-07-03 20:26:12.386068	ba7c9c1b-d053-4a85-9606-9e2cbd9b6283
5a6d40c1-80c3-4b37-9e1e-26e82020f2da	a59f3395-674a-4522-8ffc-3603cfa18d84	uploads/ba7c9c1b-d053-4a85-9606-9e2cbd9b6283/da97c2368475424ba0ee9ea078cf6fb3.png	\N	\N	{}	2025-07-03 20:26:12.386299	ba7c9c1b-d053-4a85-9606-9e2cbd9b6283
1a3a16a6-4eed-400f-92c3-3b093051943e	a59f3395-674a-4522-8ffc-3603cfa18d84	uploads/ba7c9c1b-d053-4a85-9606-9e2cbd9b6283/627b7a349a8f48fb8dac8e2124b7f40e.png	\N	\N	{}	2025-07-03 20:26:12.38638	ba7c9c1b-d053-4a85-9606-9e2cbd9b6283
c84af9ec-88d4-4db1-9743-78958ebbf1e7	a59f3395-674a-4522-8ffc-3603cfa18d84	uploads/ba7c9c1b-d053-4a85-9606-9e2cbd9b6283/934b3caa3faf4c158d4e24bb53019271.png	\N	\N	{}	2025-07-03 20:26:12.386446	ba7c9c1b-d053-4a85-9606-9e2cbd9b6283
9bfae254-6894-4419-b6e9-f75a92f9a554	a59f3395-674a-4522-8ffc-3603cfa18d84	uploads/ba7c9c1b-d053-4a85-9606-9e2cbd9b6283/5f1b27360eec4ba78ea1852c375508a3.png	\N	\N	{}	2025-07-03 20:26:12.386505	ba7c9c1b-d053-4a85-9606-9e2cbd9b6283
b0fa9491-34b9-4cfb-9321-829adee891c4	a59f3395-674a-4522-8ffc-3603cfa18d84	uploads/ba7c9c1b-d053-4a85-9606-9e2cbd9b6283/1e6005adeb72476ab8175109709b9267.png	\N	\N	{}	2025-07-03 20:26:12.38656	ba7c9c1b-d053-4a85-9606-9e2cbd9b6283
8b47fcef-93cb-400d-86db-78ef161a4840	39eb6020-7337-4d6b-bf0b-9d35ddb1167e	uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/88f945bf34794b17a3709753e6c339ac.png	\N	\N	{}	2025-07-03 20:29:05.711745	e16ebd47-8af0-4105-9595-742faeb7b10a
1ea4fdc2-ed29-4deb-bf48-01fc606dc682	39eb6020-7337-4d6b-bf0b-9d35ddb1167e	uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/5634290677f7433797fe23479bd99d97.png	\N	\N	{}	2025-07-03 20:29:05.711892	e16ebd47-8af0-4105-9595-742faeb7b10a
2fe6ac68-9dbb-4b4b-a2d6-f68574462a58	39eb6020-7337-4d6b-bf0b-9d35ddb1167e	uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/3dda6299b9a848ccaa6707c984707388.png	\N	\N	{}	2025-07-03 20:29:05.711954	e16ebd47-8af0-4105-9595-742faeb7b10a
13bd151b-ca55-4fd2-b061-774132ddc087	39eb6020-7337-4d6b-bf0b-9d35ddb1167e	uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/c52d3e1634f5471a9c8203a9283a50f4.png	\N	\N	{}	2025-07-03 20:29:05.712057	e16ebd47-8af0-4105-9595-742faeb7b10a
08b7528a-f8d3-4034-badd-9887069ca274	39eb6020-7337-4d6b-bf0b-9d35ddb1167e	uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/eb23df6c5757428198920b27ab8ae67b.png	\N	\N	{}	2025-07-03 20:29:05.712143	e16ebd47-8af0-4105-9595-742faeb7b10a
e581cd5b-5bfe-4372-9a16-022ae874dfd2	39eb6020-7337-4d6b-bf0b-9d35ddb1167e	uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/a26cf4e8d6824dbc8793357eea0c6bbc.png	\N	\N	{}	2025-07-03 20:29:05.712279	e16ebd47-8af0-4105-9595-742faeb7b10a
13f8f32a-d8b1-4120-a5f7-37d7a8b5fe15	7259c423-81d4-4713-86c9-b49e7f3cfaea	uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/6dde3da9a3bc4c0396fa610af3b0a54e.png	\N	\N	{}	2025-07-03 20:38:46.764436	4acfcc92-ec49-4fa8-9f52-a5af9b892182
dded5ec0-d945-4727-9523-7d91886e6845	7259c423-81d4-4713-86c9-b49e7f3cfaea	uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/483feba00ca944139051d18f4c360bba.png	\N	\N	{}	2025-07-03 20:38:46.764584	4acfcc92-ec49-4fa8-9f52-a5af9b892182
1a2249ad-9d8d-43ff-b93a-5fcba36eb212	7259c423-81d4-4713-86c9-b49e7f3cfaea	uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/e54a2d28f80d4da09da99f2edba2c01b.png	\N	\N	{}	2025-07-03 20:38:46.764633	4acfcc92-ec49-4fa8-9f52-a5af9b892182
1220429c-0bcd-458b-82d3-c5a94b78cdc9	7259c423-81d4-4713-86c9-b49e7f3cfaea	uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/65ac4d031d9c44c496e2a8f80ade4b2d.png	\N	\N	{}	2025-07-03 20:38:46.76467	4acfcc92-ec49-4fa8-9f52-a5af9b892182
9d215688-a25d-4714-8d4e-328f391f501b	7259c423-81d4-4713-86c9-b49e7f3cfaea	uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/dea95a38830745cca4f742ec637a33c9.png	\N	\N	{}	2025-07-03 20:38:46.764701	4acfcc92-ec49-4fa8-9f52-a5af9b892182
d0200c45-23e1-44fb-88ea-e2759247beb4	7259c423-81d4-4713-86c9-b49e7f3cfaea	uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/bb2e27cad3f04a6f8a8e52f66e76c2ae.png	\N	\N	{}	2025-07-03 20:38:46.764731	4acfcc92-ec49-4fa8-9f52-a5af9b892182
27da506c-2ec1-4577-a994-160f3b54ba71	7259c423-81d4-4713-86c9-b49e7f3cfaea	uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/0a1b2a252b884c67b07ee0ff24b39c48.png	\N	\N	{}	2025-07-03 20:38:46.76476	4acfcc92-ec49-4fa8-9f52-a5af9b892182
d4582524-d4da-498a-aae2-384ce0dbeee4	7259c423-81d4-4713-86c9-b49e7f3cfaea	uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/df4abd9758b547b6a4cb6c988f3da2f9.png	\N	\N	{}	2025-07-03 20:38:46.76479	4acfcc92-ec49-4fa8-9f52-a5af9b892182
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.jobs (id, job_type, status, input_payload, result_payload, error_message, user_id, photobook_id, created_at, started_at, completed_at) FROM stdin;
bd54b4da-1bbf-4513-9c09-aaf49daacb3a	photobook_generation	dequeued	{"asset_uuids": ["e01c2d12-1fda-4e66-832f-f55fe9f10aa4", "7c7361e9-ba32-4f1f-a343-4790715206b8", "60f6b0df-9599-400d-9993-7f002bfb647e", "2585d380-3a56-4db2-99f6-f5fb21e4bf99", "7229a205-7544-4627-a481-a20d95ba8fdf"]}	null	\N	b3aba702-5862-4e18-8ac4-e829fa60f6a7	cc9c8442-df72-44e2-aaaa-c95c3f6b8564	2025-07-03 20:05:32.510777	2025-07-03 20:05:32.899023	\N
389cb088-8338-41e0-8e7e-875a944f056a	photobook_generation	dequeued	{"asset_uuids": ["f87458d0-5ad7-4024-bf8e-98fb2eac3a72", "5f64fcd0-0657-41af-b44c-a0ab49730e11", "5051589f-4a01-41f8-9492-95aaf1f507d3", "e495071f-89df-4980-8677-4a9d6535f071"]}	null	\N	ae4e0d07-e38a-4a35-a79e-93e1b32d9854	e1947c06-151e-4090-ac1b-eee17900cb5f	2025-07-03 20:10:35.525402	2025-07-03 20:10:35.979325	\N
f20535f9-7c3e-43b8-bf66-b437c97ed5cc	photobook_generation	processing	{"asset_uuids": ["2f9a1572-8986-477b-b8ec-9675d3e02e9a", "5a6d40c1-80c3-4b37-9e1e-26e82020f2da", "1a3a16a6-4eed-400f-92c3-3b093051943e", "c84af9ec-88d4-4db1-9743-78958ebbf1e7", "9bfae254-6894-4419-b6e9-f75a92f9a554", "b0fa9491-34b9-4cfb-9321-829adee891c4"]}	null	\N	a59f3395-674a-4522-8ffc-3603cfa18d84	ba7c9c1b-d053-4a85-9606-9e2cbd9b6283	2025-07-03 20:26:12.477921	2025-07-03 20:26:12.881499	\N
d1568c2f-16a8-4cf3-8f10-6b57a98d3ccd	photobook_generation	done	{"asset_uuids": ["8b47fcef-93cb-400d-86db-78ef161a4840", "1ea4fdc2-ed29-4deb-bf48-01fc606dc682", "2fe6ac68-9dbb-4b4b-a2d6-f68574462a58", "13bd151b-ca55-4fd2-b061-774132ddc087", "08b7528a-f8d3-4034-badd-9887069ca274", "e581cd5b-5bfe-4372-9a16-022ae874dfd2"]}	{"job_id": "d1568c2f-16a8-4cf3-8f10-6b57a98d3ccd", "signed_urls": ["http://localhost:8000/assets/uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/88f945bf34794b17a3709753e6c339ac.png", "http://localhost:8000/assets/uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/5634290677f7433797fe23479bd99d97.png", "http://localhost:8000/assets/uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/3dda6299b9a848ccaa6707c984707388.png", "http://localhost:8000/assets/uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/c52d3e1634f5471a9c8203a9283a50f4.png", "http://localhost:8000/assets/uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/eb23df6c5757428198920b27ab8ae67b.png", "http://localhost:8000/assets/uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/a26cf4e8d6824dbc8793357eea0c6bbc.png"], "gemini_result": "<response>\\n<title>A Memorable Japanese Getaway</title>\\n<page>\\n<photo><id>88f945bf34794b17a3709753e6c339ac.png</id></photo>\\n<photo><id>5634290677f7433797fe23479bd99d97.png</id></photo>\\n<img>This delicious crab feast was absolutely amazing! So glad we got to experience this together.螃蟹 is definitely our favorite!螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃蟹螃", "processed_keys": ["uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/88f945bf34794b17a3709753e6c339ac.png", "uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/5634290677f7433797fe23479bd99d97.png", "uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/3dda6299b9a848ccaa6707c984707388.png", "uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/c52d3e1634f5471a9c8203a9283a50f4.png", "uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/eb23df6c5757428198920b27ab8ae67b.png", "uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/a26cf4e8d6824dbc8793357eea0c6bbc.png"], "successful_files": ["/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmpiimo0pci/88f945bf34794b17a3709753e6c339ac.png", "/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmpiimo0pci/5634290677f7433797fe23479bd99d97.png", "/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmpiimo0pci/c52d3e1634f5471a9c8203a9283a50f4.png", "/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmpiimo0pci/a26cf4e8d6824dbc8793357eea0c6bbc.png", "/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmpiimo0pci/eb23df6c5757428198920b27ab8ae67b.png", "/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmpiimo0pci/3dda6299b9a848ccaa6707c984707388.png"], "img_id_signed_urls_map": {"3dda6299b9a848ccaa6707c984707388.png": "http://localhost:8000/assets/uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/3dda6299b9a848ccaa6707c984707388.png", "5634290677f7433797fe23479bd99d97.png": "http://localhost:8000/assets/uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/5634290677f7433797fe23479bd99d97.png", "88f945bf34794b17a3709753e6c339ac.png": "http://localhost:8000/assets/uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/88f945bf34794b17a3709753e6c339ac.png", "a26cf4e8d6824dbc8793357eea0c6bbc.png": "http://localhost:8000/assets/uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/a26cf4e8d6824dbc8793357eea0c6bbc.png", "c52d3e1634f5471a9c8203a9283a50f4.png": "http://localhost:8000/assets/uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/c52d3e1634f5471a9c8203a9283a50f4.png", "eb23df6c5757428198920b27ab8ae67b.png": "http://localhost:8000/assets/uploads/e16ebd47-8af0-4105-9595-742faeb7b10a/eb23df6c5757428198920b27ab8ae67b.png"}}	\N	39eb6020-7337-4d6b-bf0b-9d35ddb1167e	e16ebd47-8af0-4105-9595-742faeb7b10a	2025-07-03 20:29:05.760554	2025-07-03 20:29:06.578017	2025-07-03 20:29:11.536338
bbab2f31-bdb9-429c-9c48-c314d1653749	photobook_generation	done	{"asset_uuids": ["13f8f32a-d8b1-4120-a5f7-37d7a8b5fe15", "dded5ec0-d945-4727-9523-7d91886e6845", "1a2249ad-9d8d-43ff-b93a-5fcba36eb212", "1220429c-0bcd-458b-82d3-c5a94b78cdc9", "9d215688-a25d-4714-8d4e-328f391f501b", "d0200c45-23e1-44fb-88ea-e2759247beb4", "27da506c-2ec1-4577-a994-160f3b54ba71", "d4582524-d4da-498a-aae2-384ce0dbeee4"]}	{"job_id": "bbab2f31-bdb9-429c-9c48-c314d1653749", "signed_urls": ["http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/6dde3da9a3bc4c0396fa610af3b0a54e.png", "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/483feba00ca944139051d18f4c360bba.png", "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/e54a2d28f80d4da09da99f2edba2c01b.png", "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/65ac4d031d9c44c496e2a8f80ade4b2d.png", "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/dea95a38830745cca4f742ec637a33c9.png", "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/bb2e27cad3f04a6f8a8e52f66e76c2ae.png", "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/0a1b2a252b884c67b07ee0ff24b39c48.png", "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/df4abd9758b547b6a4cb6c988f3da2f9.png"], "gemini_result": "<response>\\n<title>A Memorable Getaway</title>\\n<page>\\n<photo><id>6dde3da9a3bc4c0396fa610af3b0a54e.png</id></photo>\\n<photo><id>483feba00ca944139051d18f4c360bba.png</id></photo>\\n<img>Such a delicious meal! It was so nice to enjoy this feast together. 🦀😋</img>\\n</page>\\n<page>\\n<photo><id>65ac4d031d9c44c496e2a8f80ade4b2d.png</id></photo>\\n<photo><id>e54a2d28f80d4da09da99f2edba2c01b.png</id></photo>\\n<img>The evenings were magical, with the trees all lit up and that mystical fog. Felt like a fairy tale! ✨</img>\\n</page>\\n<page>\\n<photo><id>dea95a38830745cca4f742ec637a33c9.png</id></photo>\\n<photo><id>0a1b2a252b884c67b07ee0ff24b39c48.png</id></photo>\\n<img>This infinity pool was everything! Watching the sunset from here was so incredibly romantic. ❤️ Can't forget those starry nights.</img>\\n</page>\\n<page>\\n<photo><id>df4abd9758b547b6a4cb6c988f3da2f9.png</id></photo>\\n<photo><id>bb2e27cad3f04a6f8a8e52f66e76c2ae.png</id></photo>\\n<img>And that view of the city lights at night... simply breathtaking. This trip was truly unforgettable. 😍</img>\\n</page>\\n</response>", "processed_keys": ["uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/6dde3da9a3bc4c0396fa610af3b0a54e.png", "uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/483feba00ca944139051d18f4c360bba.png", "uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/e54a2d28f80d4da09da99f2edba2c01b.png", "uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/65ac4d031d9c44c496e2a8f80ade4b2d.png", "uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/dea95a38830745cca4f742ec637a33c9.png", "uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/bb2e27cad3f04a6f8a8e52f66e76c2ae.png", "uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/0a1b2a252b884c67b07ee0ff24b39c48.png", "uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/df4abd9758b547b6a4cb6c988f3da2f9.png"], "successful_files": ["/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmp2ar0hb2r/6dde3da9a3bc4c0396fa610af3b0a54e.png", "/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmp2ar0hb2r/483feba00ca944139051d18f4c360bba.png", "/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmp2ar0hb2r/65ac4d031d9c44c496e2a8f80ade4b2d.png", "/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmp2ar0hb2r/e54a2d28f80d4da09da99f2edba2c01b.png", "/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmp2ar0hb2r/dea95a38830745cca4f742ec637a33c9.png", "/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmp2ar0hb2r/0a1b2a252b884c67b07ee0ff24b39c48.png", "/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmp2ar0hb2r/df4abd9758b547b6a4cb6c988f3da2f9.png", "/var/folders/t8/hg7zc_td1y1gdkgcmv8gjz4r0000gn/T/tmp2ar0hb2r/bb2e27cad3f04a6f8a8e52f66e76c2ae.png"], "img_id_signed_urls_map": {"0a1b2a252b884c67b07ee0ff24b39c48.png": "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/0a1b2a252b884c67b07ee0ff24b39c48.png", "483feba00ca944139051d18f4c360bba.png": "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/483feba00ca944139051d18f4c360bba.png", "65ac4d031d9c44c496e2a8f80ade4b2d.png": "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/65ac4d031d9c44c496e2a8f80ade4b2d.png", "6dde3da9a3bc4c0396fa610af3b0a54e.png": "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/6dde3da9a3bc4c0396fa610af3b0a54e.png", "bb2e27cad3f04a6f8a8e52f66e76c2ae.png": "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/bb2e27cad3f04a6f8a8e52f66e76c2ae.png", "dea95a38830745cca4f742ec637a33c9.png": "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/dea95a38830745cca4f742ec637a33c9.png", "df4abd9758b547b6a4cb6c988f3da2f9.png": "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/df4abd9758b547b6a4cb6c988f3da2f9.png", "e54a2d28f80d4da09da99f2edba2c01b.png": "http://localhost:8000/assets/uploads/4acfcc92-ec49-4fa8-9f52-a5af9b892182/e54a2d28f80d4da09da99f2edba2c01b.png"}}	\N	7259c423-81d4-4713-86c9-b49e7f3cfaea	4acfcc92-ec49-4fa8-9f52-a5af9b892182	2025-07-03 20:38:46.818634	2025-07-03 20:38:47.356922	2025-07-03 20:38:52.443874
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages (id, photobook_id, page_number, user_message, layout, created_at) FROM stdin;
\.


--
-- Data for Name: pages_assets_rel; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages_assets_rel (id, page_id, asset_id, order_index, caption) FROM stdin;
\.


--
-- Data for Name: photobooks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.photobooks (id, user_id, title, caption, theme, status, created_at, updated_at, user_provided_occasion, user_provided_occasion_custom_details, user_provided_context) FROM stdin;
ae9f6ab2-de34-4b00-a1c7-6a2d6e20323b	e352597b-ee4c-4eff-b977-707190e3e256	New Photobook 2025-07-03 08:39	\N	\N	pending	2025-07-03 15:39:12.704887	2025-07-03 15:39:12.704893	\N	\N	\N
5a73a161-6801-49df-b864-bc42e0592fd8	ab9cba02-b210-4f73-9f87-548bf28e4367	New Photobook 2025-07-03 09:19	\N	\N	pending	2025-07-03 16:19:46.687604	2025-07-03 16:19:46.687606	\N	\N	\N
cc9c8442-df72-44e2-aaaa-c95c3f6b8564	b3aba702-5862-4e18-8ac4-e829fa60f6a7	New Photobook 2025-07-03 13:05	\N	\N	pending	2025-07-03 20:05:32.078533	2025-07-03 20:05:32.078536	\N	\N	\N
e1947c06-151e-4090-ac1b-eee17900cb5f	ae4e0d07-e38a-4a35-a79e-93e1b32d9854	New Photobook 2025-07-03 13:10	\N	\N	pending	2025-07-03 20:10:35.410107	2025-07-03 20:10:35.410109	\N	\N	\N
ba7c9c1b-d053-4a85-9606-9e2cbd9b6283	a59f3395-674a-4522-8ffc-3603cfa18d84	New Photobook 2025-07-03 13:26	\N	\N	pending	2025-07-03 20:26:11.96184	2025-07-03 20:26:11.961845	\N	\N	\N
e16ebd47-8af0-4105-9595-742faeb7b10a	39eb6020-7337-4d6b-bf0b-9d35ddb1167e	New Photobook 2025-07-03 13:29	\N	\N	pending	2025-07-03 20:29:05.334514	2025-07-03 20:29:05.334523	\N	\N	\N
4acfcc92-ec49-4fa8-9f52-a5af9b892182	7259c423-81d4-4713-86c9-b49e7f3cfaea	New Photobook 2025-07-03 13:38	\N	\N	pending	2025-07-03 20:38:46.701406	2025-07-03 20:38:46.701409	\N	\N	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20250703021505
20250703025351
20250703160659
20250703174524
20250703212000
\.


--
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: pages_assets_rel pages_assets_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_assets_rel
    ADD CONSTRAINT pages_assets_rel_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: photobooks photobooks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.photobooks
    ADD CONSTRAINT photobooks_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: assets assets_original_photobook_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_original_photobook_id_fkey FOREIGN KEY (original_photobook_id) REFERENCES public.photobooks(id);


--
-- Name: jobs jobs_photobook_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_photobook_id_fkey FOREIGN KEY (photobook_id) REFERENCES public.photobooks(id);


--
-- Name: pages_assets_rel pages_assets_rel_asset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_assets_rel
    ADD CONSTRAINT pages_assets_rel_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.assets(id);


--
-- Name: pages_assets_rel pages_assets_rel_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_assets_rel
    ADD CONSTRAINT pages_assets_rel_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.pages(id);


--
-- Name: pages pages_photobook_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_photobook_id_fkey FOREIGN KEY (photobook_id) REFERENCES public.photobooks(id);


--
-- PostgreSQL database dump complete
--

