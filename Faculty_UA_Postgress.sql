--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2023-01-09 15:08:52

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
-- TOC entry 4 (class 2615 OID 16539)
-- Name: faculty_ua; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA faculty_ua;


ALTER SCHEMA faculty_ua OWNER TO postgres;

--
-- TOC entry 2881 (class 3456 OID 16667)
-- Name: ua; Type: COLLATION; Schema: faculty_ua; Owner: postgres
--

CREATE COLLATION faculty_ua.ua (provider = icu, locale = 'uk-UA');


ALTER COLLATION faculty_ua.ua OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 225 (class 1259 OID 16565)
-- Name: chairs; Type: TABLE; Schema: faculty_ua; Owner: postgres
--

CREATE TABLE faculty_ua.chairs (
    chair_id integer NOT NULL,
    chair_number character varying(50),
    chair_head_id integer,
    deputy_dean_id integer
);


ALTER TABLE faculty_ua.chairs OWNER TO postgres;

--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE chairs; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON TABLE faculty_ua.chairs IS 'Кафедри';


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN chairs.chair_number; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.chairs.chair_number IS 'Номер кафедри';


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN chairs.chair_head_id; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.chairs.chair_head_id IS 'Посилання на завідувача (Tutors)';


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN chairs.deputy_dean_id; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.chairs.deputy_dean_id IS 'Посилання на заст. декана (Tutors)';


--
-- TOC entry 230 (class 1259 OID 16583)
-- Name: chairs_chair_id_seq; Type: SEQUENCE; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE faculty_ua.chairs ALTER COLUMN chair_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME faculty_ua.chairs_chair_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 16571)
-- Name: curriculum; Type: TABLE; Schema: faculty_ua; Owner: postgres
--

CREATE TABLE faculty_ua.curriculum (
    curriculum_id integer NOT NULL,
    subject_id integer,
    tutor_id integer,
    group_id integer
);


ALTER TABLE faculty_ua.curriculum OWNER TO postgres;

--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE curriculum; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON TABLE faculty_ua.curriculum IS 'Навчальний план';


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN curriculum.subject_id; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.curriculum.subject_id IS 'Посилання на предмет';


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN curriculum.tutor_id; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.curriculum.tutor_id IS 'Посилання на викладача';


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN curriculum.group_id; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.curriculum.group_id IS 'Посилання на групу';


--
-- TOC entry 231 (class 1259 OID 16584)
-- Name: curriculum_curriculum_id_seq; Type: SEQUENCE; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE faculty_ua.curriculum ALTER COLUMN curriculum_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME faculty_ua.curriculum_curriculum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16562)
-- Name: groups; Type: TABLE; Schema: faculty_ua; Owner: postgres
--

CREATE TABLE faculty_ua.groups (
    group_id integer NOT NULL,
    group_number character varying(6) NOT NULL,
    chair_id integer,
    curator_id integer,
    senior_student_id integer,
    study_hours integer,
    lab_studies integer,
    pract_studies integer
);


ALTER TABLE faculty_ua.groups OWNER TO postgres;

--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE groups; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON TABLE faculty_ua.groups IS 'Групи';


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN groups.group_number; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.groups.group_number IS 'Номер групи';


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN groups.chair_id; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.groups.chair_id IS 'Посилання на кафедру';


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN groups.curator_id; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.groups.curator_id IS 'Посилання на куратора (Tutors)';


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN groups.senior_student_id; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.groups.senior_student_id IS 'Посилання на старосту (Students)';


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN groups.study_hours; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.groups.study_hours IS 'Обсяг занять в академічних годинах';


--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN groups.lab_studies; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.groups.lab_studies IS 'Кількість лабораторних робіт';


--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN groups.pract_studies; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.groups.pract_studies IS 'Кількість практичних занять';


--
-- TOC entry 228 (class 1259 OID 16574)
-- Name: schedule; Type: TABLE; Schema: faculty_ua; Owner: postgres
--

CREATE TABLE faculty_ua.schedule (
    schedule_id integer NOT NULL,
    curriculum_id integer,
    lesson_date date,
    pair smallint,
    lesson_start time(6) without time zone,
    lesson_finish time(6) without time zone
);


ALTER TABLE faculty_ua.schedule OWNER TO postgres;

--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE schedule; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON TABLE faculty_ua.schedule IS 'Розклад занять';


--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN schedule.curriculum_id; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.schedule.curriculum_id IS 'Посилання на пункт навчального плану';


--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN schedule.lesson_date; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.schedule.lesson_date IS 'Дата заняття';


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN schedule.pair; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.schedule.pair IS 'Номер пари за розкладом';


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN schedule.lesson_start; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.schedule.lesson_start IS 'Час початку заняття';


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN schedule.lesson_finish; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.schedule.lesson_finish IS 'Час закінчення заняття';


--
-- TOC entry 232 (class 1259 OID 16587)
-- Name: schedule_schedule_id_seq; Type: SEQUENCE; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE faculty_ua.schedule ALTER COLUMN schedule_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME faculty_ua.schedule_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16559)
-- Name: students; Type: TABLE; Schema: faculty_ua; Owner: postgres
--

CREATE TABLE faculty_ua.students (
    student_id integer NOT NULL,
    surname character varying(50),
    name character varying(50),
    patronymic character varying(50),
    group_id integer,
    absences integer,
    unreasonable_absences integer,
    unready_labs integer
);


ALTER TABLE faculty_ua.students OWNER TO postgres;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE students; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON TABLE faculty_ua.students IS 'Студенти';


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN students.surname; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.students.surname IS 'Прізвище';


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN students.name; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.students.name IS 'Ім''я';


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN students.patronymic; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.students.patronymic IS 'Побатькові';


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN students.group_id; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.students.group_id IS 'Посилання на групу';


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN students.absences; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.students.absences IS 'Пропуски занять в академічних годинах';


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN students.unreasonable_absences; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.students.unreasonable_absences IS 'Пропуски занять без поважної причини';


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN students.unready_labs; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.students.unready_labs IS 'Кількість незданих лабораторних';


--
-- TOC entry 233 (class 1259 OID 16588)
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE faculty_ua.students ALTER COLUMN student_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME faculty_ua.students_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 16577)
-- Name: subjects; Type: TABLE; Schema: faculty_ua; Owner: postgres
--

CREATE TABLE faculty_ua.subjects (
    subject_id integer NOT NULL,
    name character varying(255),
    chair_id integer,
    chair_external character varying(3)
);


ALTER TABLE faculty_ua.subjects OWNER TO postgres;

--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE subjects; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON TABLE faculty_ua.subjects IS 'Предмети';


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN subjects.name; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.subjects.name IS 'Назва предмету';


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN subjects.chair_id; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.subjects.chair_id IS 'Посилання на кафедру (для кафедр факультету)';


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN subjects.chair_external; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.subjects.chair_external IS 'Номер кафедри (якщо предмет читає зовнішня кафедра)';


--
-- TOC entry 234 (class 1259 OID 16589)
-- Name: subjects_subject_id_seq; Type: SEQUENCE; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE faculty_ua.subjects ALTER COLUMN subject_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME faculty_ua.subjects_subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16568)
-- Name: tutors; Type: TABLE; Schema: faculty_ua; Owner: postgres
--

CREATE TABLE faculty_ua.tutors (
    tutor_id integer NOT NULL,
    name_fio character varying(50),
    faculty integer,
    chair_id integer,
    chair_external character varying(3),
    "position" character varying(100)
);


ALTER TABLE faculty_ua.tutors OWNER TO postgres;

--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE tutors; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON TABLE faculty_ua.tutors IS 'Викладачі';


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN tutors.name_fio; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.tutors.name_fio IS 'Прізвище з ініціалами';


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN tutors.faculty; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.tutors.faculty IS 'Номер факультету';


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN tutors.chair_id; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.tutors.chair_id IS 'Посилання на кафедру (для викладачів нашого факультету)';


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN tutors.chair_external; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.tutors.chair_external IS 'Номер зовнішньої кафедри (для співробітників інших факультетів)';


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN tutors."position"; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON COLUMN faculty_ua.tutors."position" IS 'Посада';


--
-- TOC entry 235 (class 1259 OID 16590)
-- Name: tutors_tutor_id_seq; Type: SEQUENCE; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE faculty_ua.tutors ALTER COLUMN tutor_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME faculty_ua.tutors_tutor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3408 (class 0 OID 16565)
-- Dependencies: 225
-- Data for Name: chairs; Type: TABLE DATA; Schema: faculty_ua; Owner: postgres
--

INSERT INTO faculty_ua.chairs OVERRIDING SYSTEM VALUE VALUES (1, '301', 1, 133);
INSERT INTO faculty_ua.chairs OVERRIDING SYSTEM VALUE VALUES (2, '302', 30, 29);
INSERT INTO faculty_ua.chairs OVERRIDING SYSTEM VALUE VALUES (3, '303', 56, 18);
INSERT INTO faculty_ua.chairs OVERRIDING SYSTEM VALUE VALUES (4, '304', 57, 118);
INSERT INTO faculty_ua.chairs OVERRIDING SYSTEM VALUE VALUES (5, '305', 58, 132);


--
-- TOC entry 3410 (class 0 OID 16571)
-- Dependencies: 227
-- Data for Name: curriculum; Type: TABLE DATA; Schema: faculty_ua; Owner: postgres
--

INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (1, 20, 3, 125);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (2, 23, 11, 125);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (3, 24, 4, 125);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (4, 25, 5, 125);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (5, 72, 126, 125);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (6, 73, 2, 125);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (7, 20, 3, 175);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (8, 23, 7, 175);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (9, 24, 4, 175);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (10, 24, 120, 175);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (11, 25, 5, 175);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (12, 72, 126, 175);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (13, 73, 2, 175);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (14, 73, 105, 175);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (15, 20, 3, 176);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (16, 23, 116, 176);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (17, 24, 4, 176);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (18, 25, 5, 176);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (19, 26, 120, 176);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (20, 73, 2, 176);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (21, 1, 35, 177);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (22, 2, 18, 177);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (23, 3, 19, 177);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (24, 4, 31, 177);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (25, 5, 32, 177);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (26, 5, 34, 177);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (27, 6, 109, 177);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (28, 39, 44, 177);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (29, 39, 104, 177);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (30, 1, 35, 178);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (31, 13, 25, 178);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (32, 13, 39, 178);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (33, 14, 40, 178);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (34, 14, 108, 178);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (35, 15, 15, 178);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (36, 85, 102, 178);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (37, 85, 117, 178);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (38, 86, 14, 178);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (39, 86, 38, 178);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (40, 88, 118, 178);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (41, 89, 119, 178);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (42, 1, 35, 179);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (43, 15, 15, 179);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (44, 17, 17, 179);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (45, 59, 91, 179);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (46, 59, 125, 179);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (47, 60, 17, 179);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (48, 88, 118, 179);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (49, 89, 119, 179);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (50, 1, 35, 180);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (51, 32, 28, 180);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (52, 33, 23, 180);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (53, 33, 121, 180);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (54, 33, 127, 180);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (55, 34, 29, 180);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (56, 35, 30, 180);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (57, 35, 77, 180);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (58, 39, 46, 180);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (59, 39, 99, 180);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (60, 40, 48, 180);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (61, 40, 96, 180);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (62, 77, 8, 180);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (63, 1, 35, 181);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (64, 2, 18, 181);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (65, 8, 19, 181);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (66, 9, 20, 181);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (67, 10, 21, 181);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (68, 39, 46, 181);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (69, 39, 85, 181);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (70, 1, 35, 182);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (71, 18, 8, 182);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (72, 42, 54, 182);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (73, 64, 124, 182);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (74, 90, 123, 182);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (75, 18, 1, 124);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (76, 19, 7, 124);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (77, 19, 75, 124);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (78, 20, 3, 124);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (79, 23, 11, 124);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (80, 24, 4, 124);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (81, 25, 5, 124);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (82, 72, 126, 124);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (83, 73, 2, 124);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (84, 78, 65, 124);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (85, 18, 8, 126);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (86, 20, 3, 126);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (87, 23, 7, 126);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (88, 24, 4, 126);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (89, 24, 120, 126);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (90, 25, 5, 126);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (91, 37, 65, 126);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (92, 72, 126, 126);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (93, 73, 2, 126);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (94, 73, 105, 126);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (95, 18, 1, 127);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (96, 19, 2, 127);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (97, 20, 3, 127);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (98, 23, 116, 127);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (99, 24, 4, 127);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (100, 25, 5, 127);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (101, 26, 120, 127);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (102, 73, 2, 127);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (103, 1, 35, 128);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (104, 2, 18, 128);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (105, 3, 19, 128);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (106, 4, 31, 128);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (107, 5, 32, 128);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (108, 5, 34, 128);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (109, 6, 109, 128);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (110, 8, 19, 128);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (111, 39, 44, 128);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (112, 39, 104, 128);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (113, 1, 35, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (114, 11, 13, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (115, 11, 37, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (116, 12, 14, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (117, 12, 38, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (118, 13, 25, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (119, 13, 39, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (120, 14, 40, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (121, 14, 108, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (122, 15, 15, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (123, 29, 16, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (124, 74, 115, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (125, 74, 116, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (126, 75, 61, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (127, 85, 102, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (128, 85, 117, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (129, 86, 14, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (130, 86, 38, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (131, 88, 118, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (132, 89, 119, 129);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (133, 1, 35, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (134, 11, 13, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (135, 11, 37, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (136, 12, 14, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (137, 12, 38, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (138, 13, 25, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (139, 13, 39, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (140, 15, 15, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (141, 16, 102, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (142, 16, 118, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (143, 17, 17, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (144, 59, 91, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (145, 59, 125, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (146, 60, 17, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (147, 75, 61, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (148, 76, 117, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (149, 88, 118, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (150, 89, 119, 130);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (151, 1, 35, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (152, 31, 27, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (153, 32, 28, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (154, 33, 23, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (155, 33, 121, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (156, 33, 127, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (157, 34, 29, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (158, 35, 30, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (159, 35, 77, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (160, 39, 46, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (161, 39, 99, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (162, 40, 48, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (163, 40, 96, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (164, 77, 8, 131);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (165, 1, 35, 132);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (166, 31, 27, 132);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (167, 32, 28, 132);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (168, 33, 23, 132);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (169, 33, 121, 132);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (170, 33, 127, 132);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (171, 34, 29, 132);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (172, 35, 30, 132);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (173, 35, 77, 132);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (174, 39, 95, 132);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (175, 40, 48, 132);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (176, 40, 96, 132);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (177, 77, 8, 132);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (178, 1, 35, 133);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (179, 2, 18, 133);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (180, 8, 19, 133);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (181, 9, 20, 133);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (182, 10, 21, 133);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (183, 39, 46, 133);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (184, 39, 85, 133);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (185, 1, 35, 134);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (186, 18, 8, 134);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (187, 27, 70, 134);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (188, 30, 78, 134);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (189, 33, 23, 134);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (190, 36, 36, 134);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (191, 42, 54, 134);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (192, 64, 124, 134);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (193, 87, 23, 134);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (194, 87, 121, 134);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (195, 90, 123, 134);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (196, 18, 1, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (197, 18, 8, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (198, 19, 2, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (199, 20, 3, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (200, 21, 9, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (201, 22, 10, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (202, 23, 11, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (203, 24, 4, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (204, 25, 5, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (205, 37, 41, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (206, 38, 42, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (207, 72, 112, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (208, 73, 2, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (209, 78, 65, 93);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (210, 18, 1, 94);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (211, 18, 8, 94);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (212, 19, 2, 94);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (213, 19, 7, 94);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (214, 19, 75, 94);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (215, 20, 3, 94);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (216, 23, 7, 94);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (217, 24, 4, 94);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (218, 25, 5, 94);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (219, 26, 6, 94);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (220, 37, 65, 94);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (221, 72, 112, 94);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (222, 73, 2, 94);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (223, 18, 1, 95);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (224, 18, 8, 95);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (225, 19, 2, 95);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (226, 19, 7, 95);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (227, 19, 75, 95);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (228, 20, 3, 95);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (229, 20, 76, 95);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (230, 23, 11, 95);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (231, 24, 4, 95);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (232, 25, 5, 95);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (233, 37, 65, 95);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (234, 73, 2, 95);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (235, 73, 114, 95);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (236, 1, 12, 99);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (237, 2, 18, 99);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (238, 3, 19, 99);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (239, 4, 31, 99);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (240, 5, 32, 99);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (241, 6, 33, 99);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (242, 8, 19, 99);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (243, 39, 43, 99);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (244, 39, 44, 99);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (245, 1, 12, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (246, 11, 13, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (247, 11, 37, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (248, 12, 14, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (249, 12, 38, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (250, 13, 25, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (251, 13, 39, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (252, 14, 26, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (253, 14, 40, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (254, 15, 15, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (255, 29, 16, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (256, 74, 115, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (257, 74, 116, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (258, 75, 61, 96);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (259, 1, 12, 135);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (260, 11, 13, 135);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (261, 12, 14, 135);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (262, 13, 25, 135);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (263, 13, 39, 135);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (264, 15, 15, 135);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (265, 16, 16, 135);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (266, 17, 17, 135);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (267, 41, 17, 135);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (268, 75, 61, 135);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (269, 76, 117, 135);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (270, 1, 12, 97);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (271, 18, 47, 97);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (272, 31, 27, 97);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (273, 32, 28, 97);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (274, 33, 23, 97);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (275, 34, 29, 97);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (276, 35, 30, 97);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (277, 35, 77, 97);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (278, 39, 45, 97);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (279, 39, 46, 97);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (280, 40, 48, 97);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (281, 77, 8, 97);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (282, 1, 12, 100);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (283, 2, 18, 100);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (284, 8, 19, 100);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (285, 9, 20, 100);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (286, 10, 21, 100);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (287, 39, 46, 100);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (288, 39, 85, 100);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (289, 1, 35, 101);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (290, 18, 8, 101);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (291, 27, 70, 101);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (292, 28, 8, 101);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (293, 29, 23, 101);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (294, 30, 24, 101);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (295, 33, 23, 101);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (296, 36, 36, 101);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (297, 42, 54, 101);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (298, 43, 55, 101);
INSERT INTO faculty_ua.curriculum OVERRIDING SYSTEM VALUE VALUES (299, 44, 36, 101);


--
-- TOC entry 3407 (class 0 OID 16562)
-- Dependencies: 224
-- Data for Name: groups; Type: TABLE DATA; Schema: faculty_ua; Owner: postgres
--

INSERT INTO faculty_ua.groups VALUES (93, '350', 1, 2, 1596, 166, 17, 23);
INSERT INTO faculty_ua.groups VALUES (94, '351', 1, 115, 1606, 192, 16, 23);
INSERT INTO faculty_ua.groups VALUES (95, '352', 1, 8, 3299, 160, 10, 74);
INSERT INTO faculty_ua.groups VALUES (96, '355', 4, 61, 1649, 168, 26, 10);
INSERT INTO faculty_ua.groups VALUES (97, '356', 2, 51, 1674, 164, 19, 26);
INSERT INTO faculty_ua.groups VALUES (99, '353', 3, 60, 1714, 150, 10, 18);
INSERT INTO faculty_ua.groups VALUES (100, '358', 3, 21, 1740, 176, 7, 5);
INSERT INTO faculty_ua.groups VALUES (101, '359', 5, 132, 1780, 168, 21, 6);
INSERT INTO faculty_ua.groups VALUES (115, '354', 3, 60, 1719, 150, 7, 7);
INSERT INTO faculty_ua.groups VALUES (124, '340', 1, 11, 2203, 224, 12, 20);
INSERT INTO faculty_ua.groups VALUES (125, '330', 1, 106, 2513, 140, 11, 32);
INSERT INTO faculty_ua.groups VALUES (126, '341', 1, 75, 2227, 256, 12, 28);
INSERT INTO faculty_ua.groups VALUES (127, '342', 1, 76, 2257, 112, 10, 22);
INSERT INTO faculty_ua.groups VALUES (128, '343', 3, 31, 2285, 194, 6, 64);
INSERT INTO faculty_ua.groups VALUES (129, '345', 4, 80, 2298, 210, 20, 35);
INSERT INTO faculty_ua.groups VALUES (130, '345а', 4, 15, 2328, 212, 15, 39);
INSERT INTO faculty_ua.groups VALUES (131, '346', 2, 79, 2336, 228, 19, 6);
INSERT INTO faculty_ua.groups VALUES (132, '347', 2, 33, 2365, 222, 13, 8);
INSERT INTO faculty_ua.groups VALUES (133, '348', 3, 20, 2384, 204, 3, 21);
INSERT INTO faculty_ua.groups VALUES (134, '349', 5, 78, 2398, 224, 16, 17);
INSERT INTO faculty_ua.groups VALUES (135, '355А', 4, 14, 1654, 170, 27, 7);
INSERT INTO faculty_ua.groups VALUES (175, '331', 1, 9, 2539, 142, 13, 33);
INSERT INTO faculty_ua.groups VALUES (176, '332', 1, 3, 2561, 146, 13, 32);
INSERT INTO faculty_ua.groups VALUES (177, '333', 3, 19, 2578, 158, 0, 20);
INSERT INTO faculty_ua.groups VALUES (178, '335', 4, 102, 2591, 150, 12, 33);
INSERT INTO faculty_ua.groups VALUES (179, '335а', 4, 103, 2607, 152, 10, 35);
INSERT INTO faculty_ua.groups VALUES (180, '336', 2, 101, 2623, 152, 13, 8);
INSERT INTO faculty_ua.groups VALUES (181, '338', 3, 87, 2654, 162, 0, 26);
INSERT INTO faculty_ua.groups VALUES (182, '339', 5, 83, 2675, 160, 6, 8);
INSERT INTO faculty_ua.groups VALUES (183, '358А', 3, 114, 3306, 174, 4, 33);
INSERT INTO faculty_ua.groups VALUES (189, '320', 1, 171, 2767, 170, 6, 29);
INSERT INTO faculty_ua.groups VALUES (190, '321', 1, 66, 2795, 172, 8, 34);
INSERT INTO faculty_ua.groups VALUES (191, '322', 1, 133, 2812, 160, 4, 29);
INSERT INTO faculty_ua.groups VALUES (192, '323', 3, 71, 2822, 148, 5, 19);
INSERT INTO faculty_ua.groups VALUES (193, '325', 4, 130, 2839, 168, 7, 23);
INSERT INTO faculty_ua.groups VALUES (194, '325А', 4, 17, 2862, 158, 12, 20);
INSERT INTO faculty_ua.groups VALUES (195, '326', 2, 98, 2880, 150, 20, 24);
INSERT INTO faculty_ua.groups VALUES (196, '327С', 2, 29, 2897, 156, 13, 10);
INSERT INTO faculty_ua.groups VALUES (197, '328', 3, 74, 2924, 170, 5, 18);
INSERT INTO faculty_ua.groups VALUES (198, '329', 5, 131, 2940, 172, 10, 23);
INSERT INTO faculty_ua.groups VALUES (209, '355Б', 4, 14, 2989, 168, 21, 7);
INSERT INTO faculty_ua.groups VALUES (216, '310', 1, 169, 3014, 174, 5, 22);
INSERT INTO faculty_ua.groups VALUES (217, '311', 1, 65, 3032, 152, 5, 15);
INSERT INTO faculty_ua.groups VALUES (218, '312', 1, 120, 3043, 180, 4, 20);
INSERT INTO faculty_ua.groups VALUES (219, '313', 3, 67, 3061, 188, 6, 33);
INSERT INTO faculty_ua.groups VALUES (220, '315', 4, 118, 3077, 170, 2, 49);
INSERT INTO faculty_ua.groups VALUES (221, '316', 2, 48, 3091, 190, 10, 10);
INSERT INTO faculty_ua.groups VALUES (222, '317', 2, 62, 3109, 176, 4, 19);
INSERT INTO faculty_ua.groups VALUES (223, '318', 3, 109, 3136, 180, 12, 37);
INSERT INTO faculty_ua.groups VALUES (224, '319', 5, 170, 3151, 174, 3, 20);
INSERT INTO faculty_ua.groups VALUES (225, '312A', 1, 154, 3164, 184, 5, 29);
INSERT INTO faculty_ua.groups VALUES (226, '313ст', 3, 71, 3182, 146, 4, 26);
INSERT INTO faculty_ua.groups VALUES (227, '315А', 4, 16, 3200, 104, 7, 25);
INSERT INTO faculty_ua.groups VALUES (228, '317ст', 2, 69, 3235, 170, 14, 10);
INSERT INTO faculty_ua.groups VALUES (229, '350м', 1, 2, 1594, 142, 13, 17);
INSERT INTO faculty_ua.groups VALUES (230, '351м', 1, 115, 1615, 168, 13, 15);
INSERT INTO faculty_ua.groups VALUES (231, '352м', 1, 8, 1635, 168, 10, 32);
INSERT INTO faculty_ua.groups VALUES (232, '353м', 3, 60, 1726, 136, 9, 27);
INSERT INTO faculty_ua.groups VALUES (233, '354м', 3, 60, 1745, 180, 7, 7);
INSERT INTO faculty_ua.groups VALUES (234, '355ам', 4, 14, 1658, 146, 25, 4);
INSERT INTO faculty_ua.groups VALUES (235, '355бм', 4, 14, 1638, 148, 23, 4);
INSERT INTO faculty_ua.groups VALUES (236, '355м', 4, 14, NULL, 0, 0, 0);
INSERT INTO faculty_ua.groups VALUES (237, '356м', 2, 94, 1665, 144, 21, 7);
INSERT INTO faculty_ua.groups VALUES (238, '358ам', 3, 114, NULL, 0, 0, 0);
INSERT INTO faculty_ua.groups VALUES (239, '358м', 3, 21, 1746, 142, 7, 10);
INSERT INTO faculty_ua.groups VALUES (240, '359м', 5, 132, 1791, 138, 17, 7);


--
-- TOC entry 3411 (class 0 OID 16574)
-- Dependencies: 228
-- Data for Name: schedule; Type: TABLE DATA; Schema: faculty_ua; Owner: postgres
--

INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (211, 136, '2022-02-01', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (212, 115, '2022-02-01', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (213, 14, '2022-02-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (214, 187, '2022-02-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (215, 169, '2022-02-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (216, 73, '2022-02-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (217, 62, '2022-02-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (218, 212, '2022-02-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (219, 123, '2022-02-01', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (220, 76, '2022-02-01', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (221, 114, '2022-02-02', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (222, 209, '2022-02-02', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (223, 219, '2022-02-02', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (224, 111, '2022-02-02', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (225, 46, '2022-02-02', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (226, 283, '2022-02-02', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (227, 125, '2022-02-02', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (228, 59, '2022-02-02', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (229, 187, '2022-02-02', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (230, 250, '2022-02-02', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (231, 134, '2022-02-02', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (232, 238, '2022-02-02', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (233, 128, '2022-02-03', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (234, 154, '2022-02-03', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (235, 106, '2022-02-04', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (236, 110, '2022-02-04', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (237, 157, '2022-02-04', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (238, 260, '2022-02-04', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (239, 223, '2022-02-04', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (240, 159, '2022-02-04', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (241, 233, '2022-02-07', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (242, 295, '2022-02-07', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (243, 285, '2022-02-07', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (244, 173, '2022-02-07', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (245, 271, '2022-02-07', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (246, 26, '2022-02-07', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (247, 222, '2022-02-08', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (248, 297, '2022-02-08', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (249, 95, '2022-02-08', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (250, 130, '2022-02-08', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (251, 30, '2022-02-08', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (252, 10, '2022-02-08', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (253, 105, '2022-02-08', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (254, 227, '2022-02-08', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (255, 115, '2022-02-09', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (256, 79, '2022-02-09', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (257, 64, '2022-02-09', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (258, 261, '2022-02-09', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (259, 275, '2022-02-09', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (260, 210, '2022-02-10', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (261, 279, '2022-02-10', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (262, 205, '2022-02-10', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (263, 262, '2022-02-10', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (264, 206, '2022-02-10', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (265, 186, '2022-02-10', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (266, 200, '2022-02-10', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (267, 193, '2022-02-10', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (268, 171, '2022-02-10', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (269, 287, '2022-02-10', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (270, 184, '2022-02-11', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (271, 268, '2022-02-11', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (272, 298, '2022-02-11', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (273, 142, '2022-02-11', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (274, 213, '2022-02-11', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (275, 276, '2022-02-11', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (276, 168, '2022-02-11', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (277, 13, '2022-02-14', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (278, 11, '2022-02-14', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (279, 34, '2022-02-14', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (280, 203, '2022-02-14', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (281, 289, '2022-02-14', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (282, 191, '2022-02-15', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (283, 144, '2022-02-15', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (284, 253, '2022-02-15', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (285, 292, '2022-02-15', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (286, 10, '2022-02-15', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (287, 266, '2022-02-15', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (288, 26, '2022-02-15', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (289, 169, '2022-02-16', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (290, 25, '2022-02-16', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (291, 88, '2022-02-16', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (292, 142, '2022-02-16', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (293, 214, '2022-02-16', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (294, 218, '2022-02-17', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (295, 143, '2022-02-17', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (296, 220, '2022-02-17', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (297, 221, '2022-02-17', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (298, 125, '2022-02-17', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (299, 157, '2022-02-17', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (300, 285, '2022-02-18', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (301, 105, '2022-02-18', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (302, 125, '2022-02-18', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (303, 95, '2022-02-18', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (304, 165, '2022-02-18', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (305, 257, '2022-02-18', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (306, 191, '2022-02-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (307, 82, '2022-02-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (308, 183, '2022-02-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (309, 274, '2022-02-18', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (310, 24, '2022-02-21', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (311, 269, '2022-02-21', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (312, 29, '2022-02-21', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (313, 113, '2022-02-21', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (314, 94, '2022-02-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (315, 281, '2022-02-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (316, 133, '2022-02-22', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (317, 56, '2022-02-22', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (318, 78, '2022-02-22', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (319, 281, '2022-02-22', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (320, 54, '2022-02-23', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (321, 25, '2022-02-23', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (322, 126, '2022-02-23', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (323, 252, '2022-02-23', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (324, 139, '2022-03-28', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (325, 88, '2022-03-28', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (326, 191, '2022-03-29', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (327, 2, '2022-03-29', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (328, 138, '2022-03-29', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (329, 175, '2022-03-29', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (330, 216, '2022-03-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (331, 164, '2022-03-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (332, 262, '2022-03-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (333, 13, '2022-03-30', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (334, 105, '2022-03-30', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (335, 70, '2022-03-30', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (336, 244, '2022-03-30', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (337, 189, '2022-03-30', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (338, 248, '2022-03-30', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (339, 2, '2022-03-30', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (340, 234, '2022-03-31', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (341, 257, '2022-03-31', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (342, 248, '2022-03-31', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (343, 183, '2022-03-31', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (344, 173, '2022-03-31', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (345, 68, '2022-03-31', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (346, 270, '2022-03-31', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (347, 153, '2022-03-31', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (348, 250, '2022-03-31', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (349, 58, '2022-03-31', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (350, 188, '2022-03-31', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (351, 255, '2022-03-31', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (352, 198, '2022-04-01', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (353, 214, '2022-04-01', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (354, 188, '2022-04-01', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (355, 100, '2022-04-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (356, 136, '2022-04-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (357, 254, '2022-04-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (358, 183, '2022-04-01', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (359, 141, '2022-04-01', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (360, 40, '2022-04-01', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (361, 280, '2022-04-01', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (362, 200, '2022-04-01', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (363, 91, '2022-04-04', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (364, 179, '2022-04-04', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (365, 219, '2022-04-04', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (366, 54, '2022-04-04', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (367, 3, '2022-04-04', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (368, 239, '2022-04-05', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (369, 224, '2022-04-05', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (370, 154, '2022-04-05', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (371, 117, '2022-04-05', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (372, 219, '2022-04-05', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (373, 165, '2022-04-05', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (374, 180, '2022-04-06', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (375, 71, '2022-04-06', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (376, 238, '2022-04-06', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (377, 41, '2022-04-06', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (378, 246, '2022-04-06', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (379, 145, '2022-04-06', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (380, 154, '2022-04-06', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (381, 210, '2022-04-06', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (382, 31, '2022-04-06', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (383, 11, '2022-04-06', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (384, 20, '2022-04-06', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (385, 92, '2022-04-06', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (386, 230, '2022-04-07', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (387, 112, '2022-04-07', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (388, 206, '2022-04-07', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (389, 293, '2022-04-07', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (390, 274, '2022-04-07', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (391, 292, '2022-04-08', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (392, 267, '2022-04-08', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (393, 33, '2022-04-08', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (394, 161, '2022-04-08', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (395, 118, '2022-04-08', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (396, 15, '2022-04-08', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (397, 285, '2022-04-08', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (398, 292, '2022-04-08', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (399, 91, '2022-04-11', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (400, 136, '2022-04-11', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (401, 276, '2022-04-11', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (402, 56, '2022-04-11', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (403, 211, '2022-04-11', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (404, 40, '2022-04-11', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (405, 138, '2022-04-11', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (406, 130, '2022-04-11', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (407, 43, '2022-04-11', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (408, 191, '2022-04-12', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (409, 286, '2022-04-12', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (410, 130, '2022-04-12', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (411, 25, '2022-04-12', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (412, 247, '2022-04-12', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (413, 191, '2022-04-12', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (414, 80, '2022-04-13', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (415, 230, '2022-04-13', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (416, 127, '2022-04-13', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (417, 161, '2022-04-13', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (418, 295, '2022-04-13', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (419, 37, '2022-04-13', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (420, 274, '2022-04-14', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (421, 216, '2022-04-14', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (422, 239, '2022-04-14', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (423, 159, '2022-04-14', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (424, 62, '2022-04-15', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (425, 42, '2022-04-15', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (426, 203, '2022-04-15', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (427, 19, '2022-04-15', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (428, 127, '2022-04-15', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (429, 259, '2022-04-15', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (430, 221, '2022-04-15', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (431, 235, '2022-04-18', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (432, 172, '2022-04-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (433, 257, '2022-04-18', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (434, 153, '2022-04-19', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (435, 191, '2022-04-19', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (436, 6, '2022-04-19', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (437, 126, '2022-04-19', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (438, 241, '2022-04-19', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (439, 158, '2022-04-19', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (440, 4, '2022-04-19', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (441, 189, '2022-04-20', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (442, 218, '2022-04-20', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (443, 132, '2022-04-20', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (444, 68, '2022-04-20', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (445, 63, '2022-04-20', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (446, 118, '2022-04-21', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (447, 207, '2022-04-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (448, 151, '2022-04-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (449, 145, '2022-04-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (450, 203, '2022-04-22', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (451, 167, '2022-04-22', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (452, 297, '2022-04-22', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (453, 86, '2022-04-22', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (454, 142, '2022-04-22', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (455, 222, '2022-04-22', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (456, 6, '2022-04-22', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (457, 37, '2022-04-22', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (458, 231, '2022-04-22', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (459, 35, '2022-04-25', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (460, 52, '2022-04-25', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (461, 102, '2022-04-25', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (462, 279, '2022-04-25', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (463, 257, '2022-04-25', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (464, 7, '2022-04-25', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (465, 138, '2022-04-25', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (466, 161, '2022-04-26', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (467, 128, '2022-04-26', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (468, 256, '2022-04-26', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (469, 48, '2022-04-26', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (470, 15, '2022-04-26', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (471, 92, '2022-04-27', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (472, 282, '2022-04-27', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (473, 298, '2022-04-27', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (474, 297, '2022-04-27', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (475, 8, '2022-04-27', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (476, 76, '2022-04-27', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (477, 113, '2022-04-27', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (478, 74, '2022-04-27', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (479, 109, '2022-04-27', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (480, 115, '2022-04-28', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (481, 164, '2022-04-28', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (482, 61, '2022-04-28', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (483, 93, '2022-04-28', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (484, 260, '2022-04-28', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (485, 126, '2022-04-29', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (486, 22, '2022-04-29', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (487, 120, '2022-04-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (488, 282, '2022-04-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (489, 12, '2022-04-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (490, 88, '2022-04-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (491, 31, '2022-04-29', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (492, 83, '2022-05-02', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (493, 273, '2022-05-02', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (494, 159, '2022-05-02', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (495, 115, '2022-05-02', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (496, 218, '2022-05-02', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (497, 122, '2022-05-02', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (498, 207, '2022-05-02', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (499, 91, '2022-05-02', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (500, 222, '2022-05-02', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (501, 177, '2022-05-03', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (502, 52, '2022-05-03', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (503, 129, '2022-05-03', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (504, 222, '2022-05-03', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (505, 246, '2022-05-03', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (506, 268, '2022-05-03', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (507, 154, '2022-05-03', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (508, 212, '2022-05-03', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (509, 208, '2022-05-04', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (510, 280, '2022-05-04', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (511, 76, '2022-05-04', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (512, 255, '2022-05-04', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (513, 59, '2022-05-04', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (514, 62, '2022-05-05', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (515, 11, '2022-05-05', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (516, 199, '2022-05-05', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (517, 254, '2022-05-05', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (518, 95, '2022-05-05', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (519, 65, '2022-05-05', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (520, 85, '2022-05-06', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (521, 189, '2022-05-06', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (522, 261, '2022-05-06', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (523, 183, '2022-05-06', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (524, 176, '2022-05-06', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (525, 273, '2022-05-06', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (526, 141, '2022-05-06', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (527, 33, '2022-05-09', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (528, 78, '2022-05-09', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (529, 43, '2022-05-09', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (530, 280, '2022-05-09', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (531, 123, '2022-05-09', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (532, 47, '2022-05-09', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (533, 147, '2022-05-09', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (534, 28, '2022-05-10', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (535, 129, '2022-05-10', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (536, 19, '2022-05-10', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (537, 57, '2022-05-10', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (538, 295, '2022-05-10', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (539, 9, '2022-05-10', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (540, 203, '2022-05-11', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (541, 286, '2022-05-11', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (542, 262, '2022-05-11', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (543, 13, '2022-05-11', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (544, 259, '2022-05-11', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (545, 193, '2022-05-11', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (546, 57, '2022-05-11', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (547, 118, '2022-05-11', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (548, 18, '2022-05-12', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (549, 26, '2022-05-12', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (550, 279, '2022-05-12', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (551, 1, '2022-05-12', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (552, 245, '2022-05-12', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (553, 38, '2022-05-12', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (554, 202, '2022-05-12', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (555, 53, '2022-05-12', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (556, 267, '2022-05-12', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (557, 286, '2022-05-12', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (558, 262, '2022-05-13', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (559, 286, '2022-05-13', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (560, 225, '2022-05-13', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (561, 137, '2022-05-13', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (562, 138, '2022-05-16', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (563, 209, '2022-05-16', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (564, 278, '2022-05-16', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (565, 221, '2022-05-17', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (566, 64, '2022-05-17', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (567, 103, '2022-05-17', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (568, 147, '2022-05-17', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (569, 251, '2022-05-17', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (570, 150, '2022-05-17', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (571, 237, '2022-05-17', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (572, 58, '2022-05-18', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (573, 5, '2022-05-18', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (574, 87, '2022-05-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (575, 56, '2022-05-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (576, 265, '2022-05-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (577, 13, '2022-05-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (578, 190, '2022-05-18', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (579, 88, '2022-05-19', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (580, 207, '2022-05-19', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (581, 222, '2022-05-19', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (582, 99, '2022-05-19', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (583, 62, '2022-05-19', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (584, 100, '2022-05-20', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (585, 245, '2022-05-20', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (586, 291, '2022-05-20', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (587, 285, '2022-05-20', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (588, 210, '2022-05-20', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (589, 182, '2022-05-20', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (590, 265, '2022-05-20', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (591, 26, '2022-05-23', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (592, 195, '2022-05-23', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (593, 268, '2022-05-23', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (594, 171, '2022-05-23', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (595, 225, '2022-05-23', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (596, 139, '2022-05-23', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (597, 172, '2022-05-24', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (598, 65, '2022-05-24', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (599, 149, '2022-05-24', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (600, 295, '2022-05-24', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (601, 134, '2022-05-24', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (602, 299, '2022-05-24', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (603, 36, '2022-05-24', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (604, 293, '2022-05-24', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (605, 294, '2022-05-25', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (606, 66, '2022-05-25', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (607, 139, '2022-05-25', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (608, 171, '2022-05-25', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (609, 41, '2022-05-25', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (610, 110, '2022-05-25', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (611, 154, '2022-05-25', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (612, 62, '2022-05-25', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (613, 243, '2022-05-25', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (614, 231, '2022-05-25', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (615, 57, '2022-05-26', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (616, 268, '2022-05-26', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (617, 191, '2022-05-26', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (618, 110, '2022-05-26', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (619, 242, '2022-05-26', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (620, 259, '2022-05-26', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (621, 286, '2022-05-27', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (622, 101, '2022-05-27', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (623, 120, '2022-05-27', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (624, 201, '2022-05-27', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (625, 141, '2022-05-30', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (626, 244, '2022-05-30', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (627, 207, '2022-05-30', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (628, 103, '2022-05-30', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (629, 277, '2022-05-30', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (630, 299, '2022-05-30', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (631, 270, '2022-05-30', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (632, 174, '2022-05-31', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (633, 219, '2022-05-31', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (634, 127, '2022-05-31', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (635, 283, '2022-05-31', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (636, 96, '2022-05-31', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (637, 75, '2022-05-31', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (638, 155, '2022-05-31', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (639, 127, '2022-05-31', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (640, 146, '2022-09-01', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (641, 265, '2022-09-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (642, 220, '2022-09-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (643, 36, '2022-09-01', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (644, 50, '2022-09-02', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (645, 38, '2022-09-02', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (646, 204, '2022-09-02', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (647, 244, '2022-09-02', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (648, 249, '2022-09-02', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (649, 265, '2022-09-02', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (650, 182, '2022-09-05', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (651, 106, '2022-09-05', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (652, 165, '2022-09-05', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (653, 24, '2022-09-05', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (654, 280, '2022-09-05', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (655, 39, '2022-09-06', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (656, 63, '2022-09-06', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (657, 85, '2022-09-06', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (658, 237, '2022-09-06', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (659, 149, '2022-09-06', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (660, 216, '2022-09-07', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (661, 102, '2022-09-07', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (662, 72, '2022-09-07', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (663, 213, '2022-09-07', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (664, 245, '2022-09-07', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (665, 195, '2022-09-08', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (666, 232, '2022-09-08', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (667, 32, '2022-09-08', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (668, 96, '2022-09-08', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (669, 7, '2022-09-08', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (670, 286, '2022-09-08', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (671, 154, '2022-09-08', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (672, 157, '2022-09-09', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (673, 192, '2022-09-09', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (674, 294, '2022-09-09', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (675, 220, '2022-09-09', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (676, 89, '2022-09-09', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (677, 288, '2022-09-09', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (678, 22, '2022-09-09', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (679, 105, '2022-09-09', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (680, 128, '2022-09-09', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (681, 38, '2022-09-12', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (682, 278, '2022-09-12', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (683, 257, '2022-09-12', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (684, 230, '2022-09-12', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (685, 123, '2022-09-12', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (686, 268, '2022-09-12', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (687, 233, '2022-09-12', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (688, 104, '2022-09-12', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (689, 275, '2022-09-12', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (690, 109, '2022-09-13', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (691, 62, '2022-09-13', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (692, 11, '2022-09-13', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (693, 292, '2022-09-13', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (694, 9, '2022-09-14', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (695, 195, '2022-09-14', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (696, 120, '2022-09-14', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (697, 114, '2022-09-14', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (698, 204, '2022-09-15', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (699, 77, '2022-09-15', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (700, 69, '2022-09-16', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (701, 84, '2022-09-16', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (702, 101, '2022-09-16', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (703, 181, '2022-09-16', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (704, 38, '2022-09-16', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (705, 4, '2022-09-16', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (706, 258, '2022-09-16', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (707, 174, '2022-09-16', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (708, 166, '2022-09-19', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (709, 94, '2022-09-19', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (710, 103, '2022-09-19', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (711, 254, '2022-09-19', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (712, 102, '2022-09-19', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (713, 165, '2022-09-20', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (714, 200, '2022-09-20', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (715, 81, '2022-09-20', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (716, 259, '2022-09-20', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (717, 141, '2022-09-20', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (718, 83, '2022-09-20', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (719, 128, '2022-09-20', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (720, 290, '2022-09-21', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (721, 13, '2022-09-21', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (722, 55, '2022-09-21', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (723, 82, '2022-09-21', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (724, 283, '2022-09-21', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (725, 285, '2022-09-21', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (726, 217, '2022-09-21', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (727, 63, '2022-09-21', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (728, 104, '2022-09-21', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (729, 290, '2022-09-22', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (730, 79, '2022-09-22', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (731, 85, '2022-09-22', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (732, 267, '2022-09-22', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (733, 272, '2022-09-23', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (734, 202, '2022-09-23', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (735, 128, '2022-09-23', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (736, 257, '2022-09-23', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (737, 85, '2022-09-23', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (738, 211, '2022-09-23', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (739, 3, '2022-09-23', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (740, 263, '2022-09-26', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (741, 75, '2022-09-26', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (742, 125, '2022-09-26', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (743, 281, '2022-09-26', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (744, 293, '2022-09-26', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (745, 39, '2022-09-26', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (746, 267, '2022-09-27', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (747, 6, '2022-09-27', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (748, 109, '2022-09-27', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (749, 15, '2022-09-27', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (750, 51, '2022-09-27', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (751, 19, '2022-09-27', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (752, 82, '2022-09-28', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (753, 264, '2022-09-28', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (754, 215, '2022-09-28', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (755, 109, '2022-09-28', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (756, 224, '2022-09-28', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (757, 117, '2022-09-28', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (758, 215, '2022-09-28', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (759, 1, '2022-09-29', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (760, 4, '2022-09-29', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (761, 85, '2022-09-29', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (762, 132, '2022-09-29', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (763, 131, '2022-09-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (764, 260, '2022-09-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (765, 247, '2022-09-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (766, 231, '2022-09-30', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (767, 144, '2022-09-30', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (768, 23, '2022-09-30', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (769, 89, '2022-09-30', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (770, 14, '2022-09-30', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (771, 222, '2022-09-30', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (772, 159, '2022-09-30', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (773, 137, '2022-09-30', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (774, 6, '2022-10-03', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (775, 57, '2022-10-03', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (776, 244, '2022-10-03', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (777, 103, '2022-10-03', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (778, 27, '2022-10-03', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (779, 120, '2022-10-03', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (780, 32, '2022-10-03', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (781, 130, '2022-10-04', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (782, 65, '2022-10-04', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (783, 173, '2022-10-04', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (784, 226, '2022-10-04', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (785, 271, '2022-10-04', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (786, 29, '2022-10-04', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (787, 243, '2022-10-04', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (788, 267, '2022-10-04', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (789, 155, '2022-10-05', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (790, 288, '2022-10-05', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (791, 87, '2022-10-05', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (792, 198, '2022-10-05', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (793, 270, '2022-10-05', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (794, 28, '2022-10-05', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (795, 179, '2022-10-05', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (796, 121, '2022-10-05', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (797, 29, '2022-10-05', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (798, 167, '2022-10-05', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (799, 68, '2022-10-05', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (800, 147, '2022-10-05', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (801, 234, '2022-10-06', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (802, 2, '2022-10-06', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (803, 100, '2022-10-06', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (804, 125, '2022-10-06', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (805, 63, '2022-10-06', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (806, 290, '2022-10-06', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (807, 260, '2022-10-06', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (808, 184, '2022-10-06', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (809, 156, '2022-10-06', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (810, 86, '2022-10-06', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (811, 118, '2022-10-07', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (812, 288, '2022-10-07', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (813, 206, '2022-10-07', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (814, 22, '2022-10-07', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (815, 147, '2022-10-07', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (816, 69, '2022-10-07', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (817, 6, '2022-10-07', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (818, 98, '2022-10-07', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (819, 212, '2022-10-07', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (820, 142, '2022-10-07', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (821, 292, '2022-10-07', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (822, 18, '2022-10-07', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (823, 281, '2022-10-07', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (824, 89, '2022-10-10', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (825, 112, '2022-10-10', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (826, 67, '2022-10-10', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (827, 158, '2022-10-10', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (828, 125, '2022-10-10', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (829, 108, '2022-10-10', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (830, 166, '2022-10-11', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (831, 120, '2022-10-11', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (832, 8, '2022-10-11', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (833, 298, '2022-10-11', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (834, 78, '2022-10-11', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (835, 27, '2022-10-12', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (836, 39, '2022-10-12', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (837, 214, '2022-10-12', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (838, 10, '2022-10-12', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (839, 71, '2022-10-12', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (840, 288, '2022-10-12', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (841, 274, '2022-10-12', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (842, 113, '2022-10-12', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (843, 288, '2022-10-13', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (844, 130, '2022-10-13', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (845, 257, '2022-10-13', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (846, 201, '2022-10-13', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (847, 210, '2022-10-13', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (848, 168, '2022-10-13', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (849, 278, '2022-10-13', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (850, 172, '2022-10-13', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (851, 98, '2022-10-13', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (852, 190, '2022-10-14', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (853, 220, '2022-10-14', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (854, 9, '2022-10-14', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (855, 109, '2022-10-14', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (856, 282, '2022-10-14', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (857, 55, '2022-10-14', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (858, 250, '2022-10-17', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (859, 97, '2022-10-17', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (860, 266, '2022-10-17', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (861, 174, '2022-10-17', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (862, 6, '2022-10-17', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (863, 3, '2022-10-17', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (864, 232, '2022-10-18', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (865, 119, '2022-10-18', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (866, 221, '2022-10-18', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (867, 282, '2022-10-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (868, 261, '2022-10-18', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (869, 71, '2022-10-19', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (870, 69, '2022-10-19', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (871, 236, '2022-10-19', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (872, 32, '2022-10-19', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (873, 197, '2022-10-19', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (874, 258, '2022-10-19', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (875, 68, '2022-10-20', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (876, 285, '2022-10-20', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (877, 203, '2022-10-20', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (878, 82, '2022-10-20', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (879, 160, '2022-10-20', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (880, 135, '2022-10-21', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (881, 208, '2022-10-21', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (882, 186, '2022-10-21', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (883, 294, '2022-10-21', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (884, 255, '2022-10-21', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (885, 74, '2022-10-21', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (886, 251, '2022-10-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (887, 205, '2022-10-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (888, 154, '2022-10-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (889, 71, '2022-10-24', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (890, 17, '2022-10-24', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (891, 41, '2022-10-24', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (892, 15, '2022-10-24', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (893, 56, '2022-10-24', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (894, 268, '2022-10-24', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (895, 66, '2022-10-24', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (896, 69, '2022-10-25', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (897, 289, '2022-10-25', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (898, 85, '2022-10-25', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (899, 223, '2022-10-25', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (900, 118, '2022-10-25', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (901, 161, '2022-10-25', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (902, 25, '2022-10-26', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (903, 117, '2022-10-26', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (904, 206, '2022-10-26', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (905, 265, '2022-10-26', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (906, 157, '2022-10-27', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (907, 168, '2022-10-27', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (908, 105, '2022-10-27', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (909, 102, '2022-10-27', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (910, 92, '2022-10-27', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (911, 50, '2022-10-27', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (912, 21, '2022-10-27', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (913, 129, '2022-10-28', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (914, 217, '2022-10-28', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (915, 13, '2022-10-28', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (916, 43, '2022-10-28', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (917, 22, '2022-10-28', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (918, 13, '2022-10-28', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (919, 34, '2022-10-28', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (920, 19, '2022-10-31', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (921, 55, '2022-10-31', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (922, 106, '2022-10-31', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (923, 78, '2022-10-31', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (924, 69, '2022-10-31', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (925, 180, '2022-10-31', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (926, 299, '2022-10-31', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (927, 12, '2022-10-31', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (928, 40, '2022-11-01', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (929, 211, '2022-11-01', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (930, 184, '2022-11-01', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (931, 27, '2022-11-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (932, 133, '2022-11-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (933, 108, '2022-11-01', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (934, 234, '2022-11-01', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (935, 13, '2022-11-02', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (936, 204, '2022-11-02', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (937, 59, '2022-11-02', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (938, 284, '2022-11-02', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (939, 34, '2022-11-02', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (940, 93, '2022-11-02', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (941, 297, '2022-11-03', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (942, 63, '2022-11-03', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (943, 155, '2022-11-03', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (944, 150, '2022-11-03', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (945, 206, '2022-11-03', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (946, 14, '2022-11-03', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (947, 175, '2022-11-03', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (948, 11, '2022-11-04', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (949, 270, '2022-11-04', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (950, 63, '2022-11-04', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (951, 19, '2022-11-04', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (952, 263, '2022-11-07', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (953, 116, '2022-11-07', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (954, 297, '2022-11-07', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (955, 227, '2022-11-07', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (956, 77, '2022-11-08', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (957, 41, '2022-11-08', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (958, 211, '2022-11-08', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (959, 87, '2022-11-08', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (960, 101, '2022-11-08', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (961, 48, '2022-11-08', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (962, 264, '2022-11-08', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (963, 11, '2022-11-09', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (964, 78, '2022-11-09', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (965, 251, '2022-11-09', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (966, 258, '2022-11-09', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (967, 224, '2022-11-09', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (968, 45, '2022-11-10', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (969, 189, '2022-11-10', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (970, 170, '2022-11-10', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (971, 84, '2022-11-11', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (972, 101, '2022-11-11', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (973, 182, '2022-11-11', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (974, 208, '2022-11-11', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (975, 270, '2022-11-11', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (976, 8, '2022-11-11', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (977, 201, '2022-11-11', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (978, 85, '2022-11-11', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (979, 79, '2022-11-14', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (980, 4, '2022-11-14', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (981, 57, '2022-11-14', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (982, 292, '2022-11-14', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (983, 215, '2022-11-14', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (984, 90, '2022-11-14', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (985, 234, '2022-11-14', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (986, 107, '2022-11-14', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (987, 233, '2022-11-15', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (988, 152, '2022-11-15', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (989, 6, '2022-11-15', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (990, 193, '2022-11-15', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (991, 142, '2022-11-15', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (992, 26, '2022-11-15', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (993, 271, '2022-11-15', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (994, 99, '2022-11-15', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (995, 295, '2022-11-16', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (996, 158, '2022-11-16', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (997, 176, '2022-11-16', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (998, 238, '2022-11-16', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (999, 234, '2022-11-16', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1000, 147, '2022-11-16', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1001, 283, '2022-11-16', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1002, 107, '2022-11-16', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1003, 242, '2022-11-17', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1004, 163, '2022-11-17', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1005, 264, '2022-11-17', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1006, 182, '2022-11-17', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1007, 217, '2022-11-17', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1008, 81, '2022-11-17', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1009, 112, '2022-11-17', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1010, 158, '2022-11-17', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1011, 228, '2022-11-17', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1012, 40, '2022-11-18', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1013, 201, '2022-11-18', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1014, 66, '2022-11-18', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1015, 14, '2022-11-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1016, 152, '2022-11-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1017, 137, '2022-11-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1018, 106, '2022-11-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1019, 66, '2022-11-18', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1020, 284, '2022-11-18', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1021, 161, '2022-11-21', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1022, 24, '2022-11-21', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1023, 254, '2022-11-21', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1024, 123, '2022-11-21', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1025, 269, '2022-11-21', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1026, 19, '2022-11-21', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1027, 292, '2022-11-21', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1028, 105, '2022-11-21', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1029, 282, '2022-11-21', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1030, 214, '2022-11-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1031, 281, '2022-11-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1032, 151, '2022-11-22', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1033, 33, '2022-11-22', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1034, 283, '2022-11-22', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1035, 207, '2022-11-22', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1036, 119, '2022-11-22', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1037, 120, '2022-11-22', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1038, 237, '2022-11-22', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1039, 296, '2022-11-23', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1040, 177, '2022-11-23', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1041, 17, '2022-11-23', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1042, 175, '2022-11-23', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1043, 249, '2022-11-23', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1044, 212, '2022-11-23', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1045, 91, '2022-11-23', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1046, 141, '2022-11-24', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1047, 35, '2022-11-24', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1048, 288, '2022-11-24', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1049, 33, '2022-11-24', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1050, 59, '2022-11-25', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1051, 165, '2022-11-25', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1052, 288, '2022-11-25', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1053, 236, '2022-11-25', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1054, 186, '2022-11-25', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1055, 283, '2022-11-25', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1056, 113, '2022-11-25', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1057, 252, '2022-11-25', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1058, 81, '2022-11-25', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1059, 183, '2022-11-28', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1060, 287, '2022-11-28', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1061, 102, '2022-11-28', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1062, 267, '2022-11-28', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1063, 82, '2022-11-29', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1064, 252, '2022-11-29', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1065, 55, '2022-11-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1066, 100, '2022-11-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1067, 116, '2022-11-29', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1068, 186, '2022-11-30', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1069, 37, '2022-11-30', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1070, 188, '2022-11-30', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1071, 164, '2022-11-30', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1072, 198, '2022-11-30', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1073, 192, '2022-11-30', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1074, 172, '2022-11-30', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1075, 4, '2022-11-30', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1076, 91, '2022-12-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1077, 76, '2022-12-01', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1078, 69, '2022-12-01', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1079, 172, '2022-12-01', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1080, 46, '2022-12-01', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1081, 174, '2022-12-01', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1082, 21, '2022-12-01', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1083, 240, '2022-12-02', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1084, 136, '2022-12-02', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1085, 58, '2022-12-02', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1086, 124, '2022-12-02', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1087, 263, '2022-12-02', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1088, 90, '2022-12-05', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1089, 268, '2022-12-05', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1090, 196, '2022-12-05', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1091, 201, '2022-12-06', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1092, 215, '2022-12-06', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1093, 174, '2022-12-06', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1094, 287, '2022-12-07', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1095, 163, '2022-12-07', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1096, 32, '2022-12-07', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1097, 49, '2022-12-07', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1098, 296, '2022-12-07', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1099, 96, '2022-12-07', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1100, 255, '2022-12-07', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1101, 226, '2022-12-08', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1102, 145, '2022-12-08', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1103, 162, '2022-12-08', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1104, 147, '2022-12-08', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1105, 21, '2022-12-08', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1106, 134, '2022-12-08', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1107, 223, '2022-12-09', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1108, 130, '2022-12-09', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1109, 60, '2022-12-09', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1110, 289, '2022-12-09', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1111, 93, '2022-12-09', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1112, 70, '2022-12-09', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1113, 18, '2022-12-09', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1114, 37, '2022-12-12', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1115, 172, '2022-12-12', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1116, 221, '2022-12-12', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1117, 183, '2022-12-12', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1118, 224, '2022-12-12', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1119, 38, '2022-12-12', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1120, 50, '2022-12-12', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1121, 85, '2022-12-12', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1122, 83, '2022-12-13', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1123, 252, '2022-12-13', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1124, 115, '2022-12-13', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1125, 82, '2022-12-13', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1126, 171, '2022-12-13', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1127, 94, '2022-12-13', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1128, 225, '2022-12-13', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1129, 172, '2022-12-13', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1130, 136, '2022-12-13', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1131, 299, '2022-12-14', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1132, 153, '2022-12-14', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1133, 185, '2022-12-14', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1134, 31, '2022-12-14', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1135, 184, '2022-12-14', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1136, 226, '2022-12-14', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1137, 167, '2022-12-15', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1138, 104, '2022-12-15', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1139, 241, '2022-12-15', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1140, 143, '2022-12-15', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1141, 248, '2022-12-15', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1142, 36, '2022-12-16', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1143, 17, '2022-12-16', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1144, 227, '2022-12-16', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1145, 139, '2022-12-16', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1146, 192, '2022-12-16', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1147, 9, '2022-12-16', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1148, 272, '2022-12-16', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1149, 20, '2022-12-19', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1150, 160, '2022-12-19', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1151, 84, '2022-12-19', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1152, 245, '2022-12-19', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1153, 132, '2022-12-19', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1154, 253, '2022-12-19', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1155, 200, '2022-12-19', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1156, 138, '2022-12-20', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1157, 292, '2022-12-20', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1158, 89, '2022-12-20', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1159, 251, '2022-12-20', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1160, 212, '2022-12-20', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1161, 286, '2022-12-20', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1162, 128, '2022-12-20', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1163, 281, '2022-12-20', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1164, 259, '2022-12-20', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1165, 165, '2022-12-21', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1166, 61, '2022-12-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1167, 179, '2022-12-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1168, 217, '2022-12-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1169, 100, '2022-12-21', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1170, 257, '2022-12-22', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1171, 88, '2022-12-22', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1172, 72, '2022-12-22', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1173, 288, '2022-12-22', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1174, 268, '2022-12-22', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1175, 164, '2022-12-22', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1176, 167, '2022-12-23', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1177, 237, '2022-12-23', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1178, 293, '2022-12-23', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1179, 292, '2022-12-23', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1180, 58, '2022-12-23', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1181, 25, '2022-12-23', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1182, 247, '2022-12-26', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1183, 124, '2022-12-26', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1184, 163, '2022-12-26', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1185, 3, '2022-12-26', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1186, 227, '2022-12-26', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1187, 38, '2022-12-26', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1188, 27, '2022-12-26', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1189, 128, '2022-12-27', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1190, 153, '2022-12-27', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1191, 188, '2022-12-27', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1192, 259, '2022-12-28', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1193, 31, '2022-12-28', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1194, 90, '2022-12-28', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1195, 54, '2022-12-28', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1196, 77, '2022-12-28', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1197, 205, '2022-12-28', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1198, 212, '2022-12-28', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1199, 13, '2022-12-29', 1, '08:00:00', '09:35:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1200, 287, '2022-12-29', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1201, 147, '2022-12-29', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1202, 201, '2022-12-29', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1203, 110, '2022-12-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1204, 268, '2022-12-29', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1205, 57, '2022-12-29', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1206, 136, '2022-12-30', 2, '09:50:00', '11:25:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1207, 82, '2022-12-30', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1208, 200, '2022-12-30', 3, '11:55:00', '13:30:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1209, 298, '2022-12-30', 4, '13:45:00', '15:20:00');
INSERT INTO faculty_ua.schedule OVERRIDING SYSTEM VALUE VALUES (1210, 223, '2022-12-30', 4, '13:45:00', '15:20:00');


--
-- TOC entry 3406 (class 0 OID 16559)
-- Dependencies: 223
-- Data for Name: students; Type: TABLE DATA; Schema: faculty_ua; Owner: postgres
--

INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1458, 'Михайличенко', 'Денис', 'Олегович', 135, 106, 106, 27);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1587, 'Антоненко', 'Ганна', 'Романівна', 183, 82, 82, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1589, 'Вербицький', 'Дмитро', 'Сергійович', 93, 112, 112, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1590, 'Глушковський', 'Антон', 'Леонідович', 229, 12, 12, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1591, 'Єлісєєва ', 'Марина', 'Віталіївна', 93, 10, 10, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1592, 'Закопайло', 'Олексій', 'Юрійович', 93, 90, 90, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1593, 'Киргизов ', 'Артем', 'Сергійович', 134, 78, 78, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1594, 'Локай', 'Олександр', 'Вікторович', 229, 8, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1595, 'Мороз', 'Олександр', 'Вікторович', 93, 56, 56, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1596, 'Негрій', 'Тетяна', 'Олександрівна', 93, 20, 20, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1597, 'Отенко', 'Вероніка', 'Сергіївна', 93, 4, 4, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1601, 'Стасенко', 'Ярослав', 'Вікторович', 93, 63, 63, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1606, 'Бардак', 'Катерина', 'Вікторівна', 94, 16, 0, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1608, 'Гармаш', 'Данило', 'Анатолійович', 230, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1610, 'Ігнатов', 'Антон', 'Андрійович', 94, 44, 44, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1611, 'Ігошин', 'Дмитро', 'Ігорович', 94, 64, 36, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1615, 'Охрімчук', 'Яна', 'Вікторівна', 230, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1617, 'Петреченко', 'Наталія', 'Павлівна', 94, 38, 26, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1619, 'Хлівнюк', 'Вікторія', 'Вікторівна', 230, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1620, 'Юркін', 'Сергій', 'Юрійович', 94, 66, 66, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1621, 'Богданович', 'Олексій', 'Григорович', 95, 110, 110, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1622, 'Варганич', 'Денис', 'Вячеславович', 231, 29, 29, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1623, 'Кудашкін ', 'Михайло', 'Станіславович', 95, 30, 30, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1625, 'Мироненко ', 'Дмитро', 'Ігорович', 231, 14, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1626, 'Мірко', 'Максим', 'Едуардович', 95, 40, 40, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1633, 'Ткаченко', 'Дмитро', 'Едуардович', 95, 88, 88, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1634, 'Ткачук', 'Ілля', 'Олексійович', 95, 68, 68, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1635, 'Хірний', 'Олександр', 'Сергійович', 231, 4, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1636, 'Шаталова', 'Христина', 'Романівна', 231, 2, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1637, 'Якушев', 'Валерій', 'Миколайович', 95, 44, 44, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1638, 'Агаркова ', 'Оксана', 'Олександрівна', 235, 6, 6, 17);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1643, 'Коробський ', 'Ілля', 'Андрійович', 135, 90, 90, 15);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1644, 'Кофанов ', 'Павло', 'Віталійович', 234, 28, 28, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1647, 'Маркова ', 'Ксенія', 'Ігорівна', 135, 72, 72, 15);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1649, 'Меняйлов ', 'Артем', 'Сергійович', 96, 2, 2, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1651, 'Ністратов ', 'Антон', 'Володимирович', 236, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1653, 'Фоменко ', 'Наталя', 'Володимирівна', 235, 24, 24, 13);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1654, 'Хазай ', 'Олена', 'Олександрівна', 135, 16, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1655, 'Чмихун ', 'Олександр', 'Степанович', 234, 22, 22, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1656, 'Швидка', 'Марина', 'Сергіївна', 236, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1657, 'Шемет', 'Дмитро', 'Анатолійович', 135, 58, 58, 14);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1658, 'Юркова ', 'Маргарита', 'Сергіївна', 234, 2, 2, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1661, 'Брагін', 'Євген', 'Миколайович', 97, 112, 112, 11);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1662, 'Власенко', 'Олександр', 'Геннадійович', 97, 92, 92, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1663, 'Возіян', 'Євгеній', 'Артемович', 97, 64, 64, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1664, 'Гавриленков', 'Олександр', 'Сергійович', 97, 115, 115, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1665, 'Галкіна', 'Марія', 'Сергіївна', 237, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1666, 'Гужва', 'Юлія', 'Олексіївна', 97, 36, 34, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1667, 'Доценко', 'Ганна', 'Андріївна', 97, 11, 11, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1668, 'Земляков', 'Олександр', 'Олександрович', 97, 62, 62, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1669, 'Змитрович', 'Сергій', 'Олегович', 97, 74, 74, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1671, 'Король', 'Єлізавета', 'Олександрівна', 97, 10, 10, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1672, 'Ляшенко', 'Станіслав', 'Вікторович', 97, 40, 40, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1673, 'Медведєв', 'Денис', 'Андрійович', 237, 48, 48, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1674, 'Мусійченко', 'Марія', 'Дмитрівна', 97, 6, 6, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1675, 'Найдиш', 'Юлія', 'Вікторівна', 237, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1676, 'Павлів', 'Ігор', 'Вікторович', 97, 124, 124, 15);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1679, 'Сорокін', 'Юрій', 'Ігорович', 97, 117, 117, 13);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1680, 'Черкашин', 'Дмитро', 'Миколайович', 97, 66, 66, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1683, 'Бережна', 'Вероніка', 'Сергіївна', 237, 69, 69, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1684, 'Дорошенко', 'Сергій', 'Олександрович', 237, 24, 24, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1688, 'Коломоєць', 'Вікторія', 'Олегівна', 237, 70, 70, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1690, 'Ксенжук', 'Антон', 'Юрійович', 97, 90, 90, 14);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1691, 'Литвиненко', 'Андрій', 'Петрович', 97, 72, 72, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1692, 'Михайлов', 'Віктор', 'Олександрович', 97, 74, 74, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1694, 'Рева', 'Владислав', 'Олександрович', 237, 88, 88, 16);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1695, 'Седюк', 'Катерина', 'Анатоліївна', 237, 18, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1696, 'Семененко', 'Світлана', 'Ігорівна', 97, 116, 116, 17);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1703, 'Бакутін', 'Віталій', 'Глібович', 99, 13, 13, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1704, 'Балан', 'Олег', 'Володимирович', 115, 150, 150, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1705, 'Бугай', 'Марина', 'Володимирівна', 232, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1706, 'Варламов', 'Євгеній', 'Андрійович', 183, 98, 98, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1707, 'Велентеєнко', 'Аліна', 'Миколаївна', 232, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1708, 'Гавриленко', 'Юрій', 'Сергійович', 99, 4, 4, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1709, 'Голуб', 'Данило', 'Олександрович', 115, 154, 154, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1710, 'Горбань', 'Олександр', 'Леонідович', 99, 15, 15, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1711, 'Дворнікова', 'Катерина', 'Павлівна', 232, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1713, 'Ільченко', 'Антон', 'Андрійович', 99, 8, 8, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1714, 'Кім', 'Юліана', 'Вікторівна', 99, 5, 5, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1715, 'Копєйчик', 'Антон', 'Олександрович', 232, 12, 12, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1716, 'Литвиненко', 'Ольга', 'Олегівна', 232, 1, 1, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1718, 'Молчанов', 'Артем', 'Анатолійович', 99, 12, 12, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1719, 'Опришко', 'Яна', 'Вікторівна', 115, 6, 6, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1720, 'Потапович', 'Тетяна', 'Володимирівна', 99, 7, 7, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1722, 'Свеженцев', 'Дмитро', 'Валерійович', 115, 96, 96, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1723, 'Сезько', 'Олександр', 'Олександрович', 99, 12, 12, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1724, 'Спесивцев', 'Сергій', 'Сергійович', 115, 164, 164, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1726, 'Тенетка', 'Альона', 'Михайлівна', 232, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1728, 'Шабуніна', 'Аліна', 'Миколаївна', 99, 5, 5, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1729, 'Шмигленко', 'Максим', 'Володимирович', 99, 12, 12, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1730, 'Галицька', 'Юлія', 'Анатоліївна', 239, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1731, 'Єлізова', 'Юлія', 'Олександрівна', 239, 18, 18, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1732, 'Заверуха', 'Герман', 'Васильович', 100, 36, 36, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1733, 'Карлюк', 'Ксенія', 'Олександрівна', 100, 20, 20, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1735, 'Кирилов', 'Кирило', 'Станіславович', 100, 76, 76, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1736, 'Кисорець', 'Анастасія', 'Валеріївна', 100, 16, 16, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1737, 'Колесникова', 'Оксана', 'Валеріївна', 100, 18, 18, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1738, 'Кравченко', 'Анна', 'Сергіївна', 239, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1740, 'Лугова', 'Вікторія', 'Сергіївна', 100, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1741, 'Мельничук', 'Ірина', 'Олександрівна', 233, 4, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1742, 'Мицко', 'Олександр', 'Олександрович', 100, 50, 16, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1743, 'Неко', 'Валерія', 'Іллівна', 239, 30, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1744, 'Піляєв', 'Артем', 'Олександрович', 115, 172, 172, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1745, 'Рибалко', 'Юлія', 'Сергіївна', 233, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1746, 'Розсильна', 'Світлана', 'Андріївна', 239, 4, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1747, 'Сегеда', 'Олександр', 'Миколайович', 100, 44, 44, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1748, 'Сірик', 'Богдан', 'Вадимович', 100, 16, 16, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1750, 'Цихоцька', 'Тетяна', 'Олександрівна', 100, 6, 6, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1751, 'Шуліка', 'Олена', 'Вадимівна', 100, 8, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1776, 'Гамзіна ', 'Анна', 'Юріївна', 240, 0, 0, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1778, 'Грущак ', 'Микита', 'Вікторович', 101, 68, 68, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1779, 'Ємельянов ', 'Віктор', 'Анатолійович', 240, 50, 50, 14);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1780, 'Жердєва ', 'Катерина', 'Любомирівна', 101, 1, 1, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1781, 'Іванов ', 'Микита', 'Андрійович', 101, 61, 61, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1782, 'Клочок ', 'Богдан', 'Іванович', 101, 72, 72, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1783, 'Краєвський ', 'Ігор', 'Романович', 101, 58, 58, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1784, 'Лавров ', 'Владислав', 'Іванович', 240, 36, 36, 14);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1785, 'Лизогубов ', 'Назар', 'Андрійович', 101, 84, 84, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1786, 'Макаров ', 'Роман', 'Олегович', 101, 98, 98, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1788, 'Платонов ', 'Артур', 'Станіславович', 101, 30, 30, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1789, 'Трусов ', 'Олександр', 'Дмитрович', 101, 90, 90, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1790, 'Шендрик ', 'Сергій', 'Вікторович', 101, 78, 78, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (1791, 'Урупа ', 'Ксенія', 'Юріївна', 240, 2, 2, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2203, 'Бортник', 'Оксана', 'Костянтинівна', 124, 6, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2204, 'Дегтярьова', 'Оксана', 'Дмитрівна', 124, 28, 28, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2205, 'До', 'Дик', 'Фионг', 124, 14, 14, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2206, 'Дорощук', 'Оксана', 'Ярославівна', 124, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2207, 'Дроговоз', 'Дмитро', 'Ігорович', 124, 32, 32, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2208, 'Жежера', 'Денис', 'Геннадійович', 124, 18, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2210, 'Ігнатьєва', 'Вікторія', 'Володимирівна', 124, 8, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2211, 'Карпова', 'Софія', 'Володимирівна', 124, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2213, 'Краснощок', 'Тетяна', 'Ігорівна', 124, 38, 30, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2214, 'Кунакова', 'Альбіна', 'Миколаївна', 124, 10, 10, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2215, 'Мандахнар', 'Космас', NULL, 124, 180, 144, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2217, 'Мосяков', 'Вячеслав', 'Геннадійович', 124, 16, 16, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2218, 'Нгуєн', 'Чак', 'Туан', 124, 34, 34, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2219, 'Папазян', 'Олександра', 'Юріївна', 124, 4, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2220, 'Петренко', 'Альона', 'Андріївна', 124, 14, 12, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2221, 'Присяжний', 'Олег', 'Миколайович', 126, 14, 6, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2222, 'Пуляєв', 'Олексій', 'Ігорович', 124, 22, 2, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2223, 'Сухонос', 'Даніель', 'Ігорович', 126, 156, 156, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2225, 'Андрющенко', 'Дмитро', 'Васильович', 126, 134, 134, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2226, 'Бакуменко', 'Андрій', 'Євгенович', 126, 38, 38, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2227, 'Басова', 'Жанна', 'Юріївна', 126, 12, 12, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2228, 'Березовський', 'Ніколай', 'Вадимович', 126, 94, 94, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2229, 'Буранний', 'Григорій', 'Вячеславович', 126, 72, 72, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2230, 'Глущенко', 'Олександр', 'Валентинович', 126, 80, 80, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2235, 'Куліш', 'Анастасія', 'Олегівна', 126, 34, 10, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2236, 'Купрійов', 'Сергій', 'Ігорович', 126, 182, 182, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2238, 'Нестеров', 'Павло', 'Олексійович', 126, 82, 82, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2240, 'Саратова', 'Світлана', 'Олегівна', 126, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2241, 'Сліченко', 'Михайло', 'Ігорович', 126, 216, 156, 11);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2243, 'Шинкарьов', 'Айдер', 'Андрійович', 126, 158, 158, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2244, 'Широчкіна', 'Марина', 'Володимирівна', 126, 16, 10, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2246, 'Биков', 'Олександр', 'Олександрович', 127, 130, 130, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2247, 'Бувалець', 'Віктор', 'Олександрович', 127, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2248, 'Висоцький', 'Максим', 'Юрійович', 127, 106, 106, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2249, 'Гінко', 'Марія', 'Ігорівна', 127, 10, 10, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2250, 'Гордєєв', 'Андрій', 'Михайлович', 127, 74, 74, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2252, 'Кізіль', 'Дар''я', 'Олександрівна', 127, 8, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2253, 'Ковалевська', 'Уляна', 'Сергіївна', 127, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2256, 'Круглов', 'Назар', 'Сергійович', 127, 56, 56, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2257, 'Куліков', 'Костянтин', 'Володимирович', 127, 20, 20, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2258, 'Монастирецький', 'Іван', 'Романович', 127, 40, 40, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2259, 'Музика', 'Дмитро', 'Станіславович', 127, 44, 44, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2261, 'Сафронова', 'Вікторія', 'Олександрівна', 127, 12, 12, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2262, 'Свидло', 'Алла', 'Сергіївна', 127, 18, 18, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2263, 'Сірик', 'Дмитро', 'Сергійович', 127, 12, 10, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2264, 'Смирнов', 'Віталій', 'Вікторович', 127, 98, 90, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2265, 'Солодова', 'Анастасія', 'Валеріївна', 127, 48, 48, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2267, 'Усатов', 'Олександр', 'Дмитрович', 127, 28, 28, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2268, 'Харев', 'Дмитро', 'Володимирович', 127, 74, 74, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2269, 'Ходушина', 'Євгенія', 'Сергіївна', 127, 62, 62, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2270, 'Алексашенко', 'Ольга', 'Володимирівна', 128, 30, 18, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2271, 'Білич', 'Ганна', 'Олександрівна', 128, 44, 30, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2272, 'Вілков', 'Олександр', 'Олександрович', 128, 136, 128, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2273, 'Гречко', 'Катерина', 'Вікторівна', 128, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2274, 'Грідасова', 'Наталя', 'Андріївна', 128, 94, 94, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2276, 'Жданкіна', 'Уляна', 'Олександрівна', 128, 14, 14, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2279, 'Кухарев', 'Дмитро', 'Юрійович', 128, 102, 102, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2285, 'Приходько', 'Анна', 'Романівна', 128, 10, 10, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2286, 'Суліков', 'Євгеній', 'Дмитрович', 128, 150, 150, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2287, 'Троненко', 'Аліна', 'Леонідівна', 128, 16, 16, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2288, 'Хлєбнікова', 'Олександра', 'Юріївна', 128, 16, 16, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2289, 'Чеботарьова', 'Марія', 'Сергіївна', 128, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2290, 'Чертков', 'Сергій', 'Володимирович', 128, 12, 12, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2291, 'Шевчук', 'Олена', 'Завенівна', 128, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2294, 'Акімов', 'Ескендер', 'Какабаєвич', 129, 94, 94, 18);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2295, 'Бершадська', 'Юлія', 'Андріївна', 129, 81, 36, 16);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2296, 'Бреус', 'Анна', 'Юріївна', 129, 10, 0, 15);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2298, 'Волченко', 'Наталія', 'Юріївна', 129, 6, 6, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2300, 'Дронов', 'Андрій', 'Олександрович', 129, 60, 60, 18);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2301, 'Корнілов', 'Святослав', 'Сергійович', 129, 28, 28, 11);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2302, 'Кравченко', 'Руслан', 'Миколайович', 129, 64, 64, 11);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2303, 'Нечепуренко', 'Маргарита', 'Анатоліївна', 129, 42, 42, 14);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2304, 'Селезньов', 'Вадим', 'Павлович', 129, 30, 30, 11);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2306, 'Шамушкіна', 'Наталія', 'Андріївна', 129, 6, 6, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2307, 'Шахов', 'Євгеній', 'В''ячеславович', 129, 0, 0, 13);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2310, 'Аснашев', 'Євген', 'Миколайович', 130, 45, 45, 13);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2312, 'Глущенко', 'Андрій', 'Дмитрович', 130, 40, 40, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2313, 'Дмитренко', 'Яна', 'Віталіївна', 130, 2, 2, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2315, 'Кириченко', 'Катерина', 'Сергіївна', 130, 48, 48, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2317, 'Крамаренко', 'Євгеній', 'Леонідович', 130, 30, 30, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2318, 'Лазаренко', 'Олександр', 'Миколайович', 130, 41, 41, 15);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2320, 'Макєєв', 'Артур', 'Анатолійович', 130, 16, 16, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2321, 'Нос', 'Володимир', 'Володимирович', 130, 14, 14, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2322, 'Орлова', 'Тетяна', 'Олександрівна', 130, 8, 6, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2326, 'Савеленко', 'Дар''я', 'Олександрівна', 130, 6, 4, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2328, 'Скороход', 'Катерина', 'Юріївна', 130, 4, 2, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2329, 'Сосона', 'Дар''я', 'Олександрівна', 130, 80, 80, 14);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2330, 'Удовенко', 'Юлія', 'Олександрівна', 130, 46, 46, 14);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2331, 'Хоменко', 'Олександр', 'Володимирович', 130, 88, 88, 14);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2332, 'Шлапак', 'Євгеній', 'Геннадійович', 130, 35, 35, 13);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2333, 'Вінтонович', 'Максим', 'Володимирович', 134, 10, 10, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2334, 'Дмитрієв', 'Дмитро', 'Олександрович', 131, 48, 48, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2335, 'Євсіков', 'Артем', 'Ігорович', 131, 80, 80, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2336, 'Ільяшенко', 'Вікторія', 'Едуардівна', 131, 2, 2, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2337, 'Крупейченко', 'Оксана', 'Сергіївна', 131, 2, 2, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2338, 'Ластович', 'Сергій', 'Євгенович', 131, 34, 34, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2339, 'Матюшко', 'Анастасія', 'Андріївна', 131, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2340, 'Мирошник', 'Олександр', 'Артурович', 131, 50, 50, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2341, 'Польовий', 'Дмитро', 'Миколайович', 131, 54, 54, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2344, 'Степанчук', 'Олена', 'Романівна', 131, 198, 198, 19);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2345, 'Судак', 'Костянтин', 'Валентинович', 131, 46, 46, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2346, 'Фурса', 'Андрій', 'Сергійович', 131, 142, 142, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2347, 'Цись', 'Віталій', 'Сергійович', 131, 62, 58, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2349, 'Токаренко', 'Олексій', 'Віталійович', 131, 182, 182, 19);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2351, 'Бабич', 'Артем', 'Петрович', 132, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2352, 'Біленко', 'Сергій', 'Юрійович', 132, 114, 114, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2353, 'Борисов', 'Максим', 'Миколайович', 132, 148, 148, 11);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2355, 'Коротков', 'Ігор', 'Вікторович', 132, 82, 82, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2356, 'Манченко', 'Іван', 'Сергійович', 132, 110, 110, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2357, 'Маркова', 'Інна', 'Вікторівна', 132, 10, 10, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2358, 'Меженський', 'Денис', 'Миколайович', 132, 24, 24, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2359, 'Набільський', 'Максим', 'Андрійович', 132, 98, 98, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2360, 'Обушко', 'Анастасія', 'Михайлівна', 132, 0, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2361, 'Панцир', 'Аліна', 'Олександрівна', 132, 134, 134, 11);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2362, 'Сахно', 'Ярослав', 'Сергійович', 132, 86, 86, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2363, 'Сичов', 'Владислав', 'Сергійович', 132, 10, 10, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2364, 'Таран', 'Дмитро', 'Вячеславович', 132, 48, 48, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2365, 'Швед', 'Владислав', 'Сергійович', 132, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2366, 'Щербаков', 'Дмитро', 'Олегович', 132, 194, 194, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2367, 'Яцков', 'Ярослав', 'Сергійович', 132, 36, 36, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2368, 'Арутюнян', 'Тетяна', 'Вадимівна', 133, 98, 68, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2370, 'Бондарєва', 'Олександра', 'Миколаївна', 133, 60, 60, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2371, 'Брюховецька', 'Ольга', 'Юріївна', 128, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2372, 'Головкіна', 'Оксана', 'Вікторівна', 133, 22, 22, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2373, 'Жижченко', 'Юлія', 'Володимирівна', 133, 42, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2375, 'Зозуля', 'Катерина', 'Віталіївна', 133, 50, 50, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2376, 'Кіндратенко', 'Дарія', 'Юріївна', 133, 56, 16, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2377, 'Кравцова', 'Валерія', 'Андріївна', 133, 20, 20, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2378, 'Кривенко', 'Мирослава', 'Олександрівна', 133, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2379, 'Малишевська', 'Надія', 'Ігорівна', 133, 102, 70, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2380, 'Медведєва', 'Валентина', 'Олександрівна', 133, 16, 14, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2382, 'Остріжна', 'Ганна', 'Олегівна', 133, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2383, 'Почапська', 'Анастасія', 'Юріївна', 133, 44, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2384, 'Прудка', 'Тетяна', 'Євгеніївна', 133, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2385, 'Савченко', 'Олександр', 'Дмитрович', 133, 154, 154, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2386, 'Ткаченко', 'Тетяна', 'Дмитрівна', 133, 60, 60, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2388, 'Фетіскіна', 'Ірина', 'Володимирівна', 133, 56, 56, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2389, 'Шемякіна', 'Анастасія', 'Олександрівна', 133, 36, 36, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2390, 'Єфімов', 'Олександр', 'Олександрович', 134, 32, 32, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2391, 'Єфремов', 'Михайло', 'Ашотович', 134, 26, 26, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2392, 'Зінченко', 'Сергій', 'Геннадійович', 134, 64, 64, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2393, 'Коновалов', 'Пилип', 'Едуардович', 134, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2394, 'Кузіков', 'Вадим', 'Юрійович', 134, 50, 50, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2395, 'Кухарева', 'Анна', 'Олександрівна', 134, 8, 2, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2397, 'Мусна', 'Юлія', 'Вікторівна', 134, 20, 20, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2398, 'Невмивака', 'Денис', 'Сергійович', 134, 20, 20, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2399, 'Перекрест', 'Олексій', 'Ігорович', 134, 16, 16, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2400, 'Пономарьова', 'Катерина', 'Олегівна', 134, 2, 2, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2401, 'Хмарук', 'Артем', 'Юрійович', 134, 16, 16, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2402, 'Христич', 'Олександр', 'Володимирович', 134, 32, 32, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2403, 'Шацький', 'Андрій', 'Михайлович', 134, 34, 34, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2404, 'Шкурко', 'Світлана', 'Валентинівна', 134, 12, 0, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2405, 'Шпильова', 'Олена', 'Сергіївна', 134, 24, 24, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2415, 'Ву', 'Жа', 'Ань', 229, 40, 40, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2416, 'Ніценко', 'Олександр', 'Володимирович', 94, 42, 14, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2419, 'Хуінь', 'Тхі', 'Винь', 229, 36, 36, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2423, 'Д`яченко', 'Олексій', 'Костянтинович', 115, 112, 112, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2424, 'Лук`яненко', 'Ірина', 'Михайлівна', 99, 10, 10, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2427, 'Дружченко', 'Віталій', 'Андрійович', 135, 52, 52, 11);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2428, 'Мац', 'Олександр', 'Сергійович', 135, 104, 101, 27);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2429, 'Полковник', 'Кирило', 'Олегович', 97, 110, 110, 14);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2430, 'Прокоп`єв', 'Юрій', 'Валерійович', 97, 126, 126, 17);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2431, 'Євстаф`єв', 'Вадим', 'Андрійович', 97, 50, 50, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2432, 'Усерднов', 'Микита', 'Сергійович', 97, 60, 60, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2504, 'Барашева', 'Оксана', 'Олександрівна', 125, 15, 15, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2505, 'Бєлікова', 'Крістіна', 'Олексіївна', 125, 27, 27, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2507, 'Дрига', 'Яків', 'Юрійович', 125, 37, 37, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2508, 'Івлєва', 'Людмила', 'Михайлівна', 125, 18, 18, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2509, 'Кіеу', 'Чук', 'Хієу', 125, 10, 10, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2510, 'Колодяжний', 'Валерій', 'Сергійович', 125, 48, 48, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2511, 'Куманцова', 'Світлана', 'Андріївна', 125, 40, 10, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2512, 'Куртбарієв', 'Денис', 'Петрович', 125, 14, 10, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2513, 'Лепілова', 'Юлія', 'Володимирівна', 125, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2514, 'Мараховка', 'Євген', 'Юрійович', 125, 10, 10, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2515, 'Мирошниченко', 'Юлія', 'Олексіївна', 125, 12, 12, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2517, 'Павленко', 'Інна', 'Сергіївна', 125, 4, 4, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2518, 'Пігар', 'Максим', 'Олександрович', 125, 2, 2, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2519, 'Плахотя', 'Сергій', 'Олександрович', 125, 17, 17, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2520, 'Скрипка', 'Максим', 'Андрійович', 125, 16, 16, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2521, 'Сохань', 'Максим', 'Анатолійович', 125, 2, 2, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2522, 'Трегуб', 'Олександр', 'Ігорович', 125, 26, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2523, 'Фам', 'Дик', 'Хоанг', 125, 15, 15, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2525, 'Бакуменко', 'Надія', 'Анатоліївна', 175, 29, 29, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2527, 'Білоконська', 'Яна', 'Володимирівна', 175, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2528, 'Борисенок', 'Сергій', 'Юрійович', 175, 26, 26, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2529, 'Бочкова', 'Марина', 'Олександрівна', 175, 40, 40, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2530, 'Євтухов', 'Павло', 'Валерійович', 175, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2531, 'Задорожна', 'Олександра', 'Володимирівна', 175, 28, 28, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2532, 'Колошук', 'Сергій', 'Сергійович', 175, 24, 24, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2533, 'Кондратенко', 'Михайло', 'Віталійович', 175, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2534, 'Кошелєв', 'Євген', 'Ігорович', 175, 20, 20, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2535, 'Пілясов', 'Іван', 'Олегович', 175, 54, 54, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2536, 'Пявка', 'Олександр', 'Євгенович', 175, 44, 44, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2537, 'Харченко', 'Ольга', 'Юріївна', 175, 4, 4, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2538, 'Хільченко', 'Анастасія', 'Валеріївна', 175, 44, 44, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2539, 'Шинкаренко', 'Аліна', 'Юріївна', 175, 4, 4, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2540, 'Щербина', 'Андрій', 'Сергійович', 175, 20, 20, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2541, 'Якубовський', 'Олег', 'Володимирович', 175, 44, 44, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2542, 'Ахмедзянов', 'Микита', 'Андрійович', 176, 68, 68, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2543, 'Білецький', 'Єгор', 'Олегович', 176, 60, 60, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2544, 'Бочаров', 'Сергій', 'Андрійович', 176, 4, 4, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2545, 'Бражник', 'Інна', 'Євгенівна', 176, 2, 2, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2546, 'Гарцева', 'Анна', 'Ігорівна', 176, 14, 14, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2547, 'Горлов', 'Максим', 'Сергійович', 176, 28, 28, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2548, 'Дубінін', 'Олександр', 'Володимирович', 176, 40, 40, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2549, 'Єресковський', 'Дмитро', 'Вадимович', 176, 8, 8, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2550, 'Корчагін', 'Олексій', 'Ігорович', 176, 42, 42, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2551, 'Кулік', 'Сергій', 'Вячеславович', 176, 0, 0, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2552, 'Лимар', 'Максим', 'Костянтинович', 176, 18, 18, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2553, 'Морозов', 'Сергій', 'Юрійович', 176, 4, 4, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2554, 'Нікітіна', 'Аліна', 'Олегівна', 176, 0, 0, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2555, 'Огій', 'Наталія', 'Степанівна', 176, 22, 22, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2556, 'Олифіренко', 'Євген', 'Віталійович', 176, 74, 74, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2557, 'Понікаров', 'Владислав', 'Юрійович', 176, 4, 4, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2558, 'Растєгаєв', 'Артем', 'Михайлович', 176, 18, 18, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2559, 'Сливенко', 'Павло', 'Миколайович', 176, 80, 80, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2561, 'Челядін', 'Антон', 'Костянтинович', 176, 0, 0, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2562, 'Шевченко', 'Максим', 'Владиславович', 176, 80, 80, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2564, 'Цурков', 'Олексій', 'Олександрович', 176, 16, 16, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2565, 'Артемов', 'Юрій', 'Олександрович', 177, 48, 48, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2566, 'Богдановський', 'Олександр', 'Олегович', 177, 8, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2568, 'Деренська', 'Аліна', 'Юріївна', 177, 34, 34, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2569, 'Діравка', 'Олександра', 'Юріївна', 177, 6, 6, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2570, 'Євдошенко', 'Олександр', 'Ігорович', 177, 62, 62, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2571, 'Жовтобрух', 'Олексій', 'Олександрович', 177, 14, 14, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2572, 'Корнєєва', 'Аліна', 'Юріївна', 177, 18, 18, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2573, 'Кошель', 'Маргарита', 'Сергіївна', 177, 26, 20, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2574, 'Красніков', 'Олександр', 'Андрійович', 177, 5, 5, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2575, 'Кривий', 'Сергій', 'Григорович', 177, 56, 56, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2576, 'Лаптій', 'Олег', 'Вячеславович', 177, 112, 112, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2577, 'Ларченко', 'Дмитро', 'Валерійович', 177, 24, 24, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2578, 'Малакуцька', 'Ольга', 'Андріївна', 177, 26, 6, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2579, 'Москаленко', 'Вікторія', 'Євгенівна', 177, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2581, 'Свеженцева', 'Дар''я', 'Олександрівна', 177, 42, 42, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2582, 'Старостіна', 'Катерина', 'Максимівна', 177, 46, 46, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2583, 'Фоміна', 'Інна', 'Михайлівна', 177, 50, 50, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2584, 'Харченко', 'Світлана', 'Сергіївна', 177, 4, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2585, 'Харченко', 'Катерина', 'Константинівна', 177, 36, 36, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2586, 'Худіна', 'Катерина', 'Олександрівна', 177, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2587, 'Шевченко', 'Олег', 'Сергійович', 177, 4, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2588, 'Белоусов', 'Артем', 'Вікторович', 178, 60, 60, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2589, 'Бондаренко', 'Альона', 'Анатоліївна', 178, 10, 10, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2590, 'Гончарова', 'Олена', 'Вікторівна', 178, 82, 82, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2591, 'Григор''єва', 'Вікторія', 'Ігорівна', 178, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2592, 'Ігошина', 'Анна', 'Володимирівна', 178, 15, 15, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2593, 'Каган', 'Андрій', 'Сергійович', 178, 30, 30, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2594, 'Кардаш', 'Анастасія', 'В''ячеславівна', 178, 12, 6, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2596, 'Конопля', 'Харитон', 'Сергійович', 178, 16, 6, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2597, 'Крахмальова', 'Кристина', 'Олексіївна', 178, 0, 0, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2601, 'Саніна', 'Олена', 'Олександрівна', 178, 26, 26, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2602, 'Сисоєв', 'Владислав', 'Петрович', 178, 52, 52, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2603, 'Триноженко', 'Оксана', 'Сергіївна', 178, 58, 58, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2605, 'Яценко', 'Олена', 'Володимирівна', 178, 11, 11, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2606, 'Байдужна', 'Анастасія', 'Ігорівна', 179, 5, 5, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2607, 'Воробйова', 'Ірина', 'Юріївна', 179, 11, 11, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2608, 'Груша', 'Андрій', 'Васильович', 179, 12, 12, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2609, 'Змієнко', 'Олексій', 'Олегович', 179, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2611, 'Кривоножко', 'Яна', 'Вікторівна', 179, 19, 19, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2613, 'Маржина', 'Юлія', 'Сергіївна', 179, 17, 17, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2614, 'Маяцький', 'Роман', 'Ярославович', 179, 3, 3, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2615, 'Морозов', 'Олександр', 'Вячеславович', 179, 52, 52, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2616, 'Ольховик', 'Микита', 'Сергійович', 179, 27, 27, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2617, 'Пострєшина', 'Альона', 'Олександрівна', 179, 9, 9, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2618, 'Рабодзей', 'Катерина', 'Вікторівна', 179, 2, 2, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2619, 'Самко', 'Сергій', 'Олександрович', 179, 2, 2, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2621, 'Хижняк', 'Анастасія', 'Сергіївна', 179, 16, 16, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2622, 'Циклаурі', 'Ольга', 'Олегівна', 179, 7, 7, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2623, 'Алілуєнко', 'Дар''я', 'Дмитріївна', 180, 0, 0, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2624, 'Андреєв', 'Володимир', 'Олександрович', 180, 12, 12, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2625, 'Бичков', 'Антон', 'Ігорович', 180, 24, 24, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2626, 'Вичуб', 'Олександр', 'Андрійович', 180, 4, 4, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2627, 'Григоров', 'Артур', 'Іванович', 180, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2628, 'Дурнєв', 'Олександр', 'Олександрович', 180, 2, 2, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2629, 'Канцедал', 'Володимир', 'Вікторович', 180, 0, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2630, 'Канцедал', 'Анастасія', 'Олександрівна', 180, 0, 0, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2631, 'Кириченко', 'Наталія', 'Володимирівна', 180, 0, 0, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2632, 'Ковтун', 'Кирило', 'Дмитрович', 180, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2633, 'Курінний', 'Олександр', 'Сергійович', 180, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2634, 'Кутько', 'Михайло', 'Володимирович', 180, 46, 46, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2635, 'Лящов', 'Ростислав', 'Юрійович', 180, 48, 48, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2636, 'Марченко', 'Ілля', 'Вячеславович', 180, 2, 2, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2637, 'Меховськой', 'Олексій', 'Васильович', 180, 30, 4, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2639, 'Осмокєску', 'Олександр', 'Олександрович', 180, 4, 4, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2640, 'Петренко', 'Владислав', 'Васильович', 180, 64, 64, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2641, 'Походенко', 'Ольга', 'Костянтинівна', 180, 70, 70, 13);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2642, 'Сергєєв', 'Станіслав', 'Ігорович', 180, 10, 10, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2644, 'Ткаченко', 'Роман', 'Ігорович', 180, 22, 22, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2645, 'Халимоненко', 'Дмитро', 'Костянтинович', 180, 18, 18, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2646, 'Холодняк', 'Олексій', 'Олександрович', 180, 4, 4, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2647, 'Черкашин', 'Євгеній', 'Валерійович', 180, 2, 2, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2648, 'Чуйко', 'Євген', 'Сергійович', 180, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2649, 'Швачко', 'Дмитро', 'Олегович', 180, 92, 92, 13);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2650, 'Щербак', 'Поліна', 'Володимирівна', 180, 0, 0, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2651, 'Алексеєнко', 'Катерина', 'Ігорівна', 181, 32, 32, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2652, 'Апоян', 'Віта', 'Валентинівна', 181, 18, 18, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2654, 'Башканець', 'Людмила', 'Сергіївна', 181, 16, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2655, 'Глінська', 'Яна', 'Сергіївна', 181, 12, 12, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2658, 'Кузьменко', 'Анастасія', 'Сергіївна', 181, 10, 10, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2659, 'Леонідов', 'Кирило', 'Валентинович', 181, 4, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2660, 'Лопатюк', 'Юлія', 'Юріївна', 181, 27, 21, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2661, 'Маматова', 'Марія', 'Віталіївна', 181, 15, 15, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2662, 'Рядчикова', 'Світлана', 'Олегівна', 181, 64, 64, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2663, 'Семенченко', 'Георгій', 'Олександрович', 181, 10, 10, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2664, 'Синявцева', 'Анжеліка', 'Андріївна', 181, 22, 22, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2666, 'Тарновська', 'Катерина', 'Миколаївна', 181, 20, 20, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2667, 'Тріщ', 'Іван', 'Олександрович', 181, 30, 30, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2668, 'Агаркова', 'Анастасія', 'Вікторівна', 182, 0, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2669, 'Ворончихін', 'Валерій', 'Андрійович', 182, 0, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2670, 'Єршов', 'Віталій', 'Олександрович', 182, 4, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2671, 'Жуланов', 'Олександр', 'Валерійович', 182, 4, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2672, 'Зянчурін', 'Михайло', 'Андрійович', 182, 34, 17, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2674, 'Кузьмін', 'Михайло', 'Миколайович', 182, 28, 14, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2675, 'Лапханов', 'Данило', 'Олексійович', 182, 2, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2676, 'Матвієнко', 'Антон', 'Васильович', 182, 24, 12, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2677, 'Муратов', 'Олександр', 'Миколайович', 182, 4, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2678, 'Нішта', 'Валерій', 'Юрійович', 182, 0, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2679, 'Панасенко', 'Єлізавета', 'Юріївна', 182, 4, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2681, 'Пугач', 'Антон', 'Костянтинович', 182, 18, 9, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2682, 'Рожков', 'Олександр', 'Сергійович', 182, 8, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2683, 'Савченко', 'Олександр', 'Володимирович', 182, 16, 8, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2684, 'Теплинська', 'Дар''я', 'Василівна', 182, 6, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2685, 'Циганков', 'Дмитро', 'Олександрович', 182, 94, 94, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2686, 'Четверикова', 'Діана', 'Сергіївна', 182, 0, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2705, 'Моаіду', 'Д', NULL, 175, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2707, 'Сунгу', 'Гантуяа', NULL, 175, 12, 12, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2710, 'Мухаммедов', 'Н', 'Д', 125, 20, 20, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2753, 'Ільясова', 'Б', 'І', 175, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2760, 'Бабій', 'Валентина', 'Олексіївна', 189, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2761, 'Бандалєтов', 'Андрій', 'Геннадійович', 189, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2762, 'Ворошилова', 'Анастасія', 'Дмитрівна', 189, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2763, 'Дубак', 'Олександр', 'Андрійович', 189, 45, 45, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2764, 'Журавльов', 'Ігор', 'Олександрович', 189, 134, 134, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2766, 'Какадій', 'Анастасія', 'Вікторівна', 189, 12, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2767, 'Козлов', 'Андрій', 'Юрійович', 189, 4, 4, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2768, 'Костерна', 'Дар''я', 'Ігорівна', 189, 2, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2769, 'Крамаренко', 'Павло', 'Валерійович', 189, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2770, 'Меженський', 'Олександр', 'Миколайович', 189, 95, 95, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2771, 'Мікуланінець', 'Андрій', 'Юрійович', 189, 61, 39, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2772, 'Нескуб', 'Анна', 'Олегівна', 189, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2773, 'Скринник', 'Ванда', 'Олександрівна', 189, 4, 4, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2775, 'Шевчук', 'Рушена', 'Ігорівна', 189, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2781, 'Багінський', 'Роман', 'Ігорович', 190, 1, 1, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2782, 'Бондаренко', 'Андрій', 'Сергійович', 190, 4, 4, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2783, 'Дубровкін', 'Сергій', 'Володимирович', 190, 1, 1, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2784, 'Жданов', 'Андріан', 'Сергійович', 190, 8, 8, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2785, 'Короткова', 'Антоніна', 'Євгенівна', 190, 10, 10, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2786, 'Курко', 'Дар''я', 'Вадимівна', 190, 1, 1, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2787, 'Морма', 'Геннадій', 'Віталійович', 190, 12, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2788, 'Попова', 'Олена', 'Ігорівна', 190, 20, 20, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2789, 'Ремесник', 'Олександр', 'Станіславович', 190, 4, 4, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2790, 'Скороход', 'Юлія', 'Володимирівна', 190, 0, 0, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2791, 'Ступакова', 'Софія', 'Григорівна', 190, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2792, 'Харенко', 'Юлія', 'Юріївна', 190, 22, 22, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2793, 'Чубик', 'Ксенія', 'Сергіївна', 190, 0, 0, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2794, 'Шевель', 'Катерина', 'Віталіївна', 190, 6, 1, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2795, 'Щукін', 'Ілля', 'Сергійович', 190, 2, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2801, 'Биков', 'Дмитро', 'Олегович', 191, 12, 12, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2802, 'Бондаренко', 'Михайло', 'Олегович', 191, 8, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2803, 'Гайдачук', 'Олексій', 'Юрійович', 191, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2804, 'Зінченко', 'Анастасія', 'Вадимівна', 191, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2805, 'Кутеко', 'Cергій', 'Вячеславович', 191, 52, 14, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2806, 'Ляховськой', 'Владислав', 'Іванович', 191, 6, 6, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2807, 'Машковський', 'Євгеній', 'Едуардович', 191, 14, 14, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2809, 'Петелька', 'Кирило', 'Олександрович', 191, 3, 3, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2810, 'Плахотний', 'Єгор', 'Григорович', 191, 20, 20, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2811, 'Поліщук', 'Сніжана', 'Вікторівна', 191, 12, 12, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2812, 'Проскурін', 'Михайло', 'Серверович', 191, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2813, 'Прохоренко', 'Владислав', 'Олександрович', 191, 20, 12, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2814, 'Радченко', 'Роман', 'Володимирович', 191, 4, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2815, 'Романюк', 'Олена', 'Василівна', 191, 21, 9, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2822, 'Гейко', 'Олександр', 'Олексійович', 192, 4, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2823, 'Головинська', 'Людмила', 'Володимирівна', 192, 22, 22, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2824, 'Кравцов ', 'Нікіта', 'Вячеславович', 192, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2825, 'Криворучко', 'В''ячеслав', 'Петрович', 192, 20, 20, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2827, 'Манько', 'Іван', 'Володимирович', 192, 20, 20, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2828, 'Подольська', 'Ольга', 'Юріївна', 192, 16, 16, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2829, 'Попович', 'Артур', 'Сергійович', 192, 8, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2830, 'Челак', 'Ігор', 'Миколайович', 192, 12, 12, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2831, 'Чернявський', 'Пилип', 'Анатолійович', 192, 20, 20, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2838, 'Безлюбченко', 'Сергій', 'Олександрович', 193, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2839, 'Васильєва', 'Ольга', 'Олександрівна', 193, 0, 0, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2840, 'Іслямов', 'Шаджад', 'Рушенович', 193, 24, 24, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2841, 'Левковський', 'Ігор', 'Володимирович', 193, 6, 6, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2842, 'Малишев', 'Олександр', 'Олегович', 193, 18, 18, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2843, 'Назаренко', 'Юлія', 'Сергіївна', 193, 0, 0, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2844, 'Романенко ', 'Оксана', 'Анатоліївна', 193, 18, 18, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2845, 'Сейдаметов', 'Керім', 'Ікрамжонович', 193, 36, 14, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2846, 'Скачко ', 'Вікторія', 'Романівна', 193, 28, 28, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2852, 'Заплаткіна', 'Євгенія', 'Юріївна', 194, 148, 148, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2853, 'Карабань', 'Артем', 'Костянтинович', 194, 30, 30, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2854, 'Кислягін', 'Дмитрій', 'Валерійович', 194, 18, 18, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2855, 'Кім', 'Роман', 'Валерійович', 194, 18, 18, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2856, 'Кобець', 'Віталій', 'Олександрович', 194, 18, 18, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2857, 'Колядін', 'Ярослав', 'Вячеславович', 194, 28, 28, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2858, 'Кочура', 'Катерина', 'Андріївна', 194, 2, 2, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2859, 'Межерицький', 'Ярослав', 'Володимирович', 194, 6, 6, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2860, 'Пепчук', 'Андрій', 'Олегович', 194, 22, 22, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2861, 'Петренко', 'Вікторія', 'Миколаївна', 194, 8, 8, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2862, 'Петров', 'Максим', 'Вікторович', 194, 10, 10, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2863, 'Сорокіна ', 'Оксана', 'Ігорівна', 194, 28, 28, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2864, 'Яременко', 'Владислав', 'Геннадійович', 194, 36, 36, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2870, 'Болгарин', 'Сергій', 'Юрійович', 195, 12, 12, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2871, 'Єфімов', 'Євгеній', 'Леонідович', 195, 0, 0, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2872, 'Іщук', 'Ростислав', 'Володимирович', 195, 10, 10, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2873, 'Карнаух', 'Тарас', 'Вікторович', 195, 2, 2, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2874, 'Кедрук', 'Іван', 'Сергійович', 195, 4, 4, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2875, 'Кіпкало', 'Микола', 'Сергійович', 195, 52, 12, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2876, 'Кудряшов', 'Максим', 'Юрійович', 195, 2, 2, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2877, 'Миронюк', 'Микола', 'Геннадійович', 195, 12, 12, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2878, 'Нарожна', 'Наталія', 'Валентинівна', 195, 4, 4, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2879, 'Нечаєва', 'Емма', 'В''ячеславівна', 195, 4, 4, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2880, 'Романенко', 'Юлія', 'Сергіївна', 195, 6, 4, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2881, 'Семенов', 'Денис', 'Вячеславович', 195, 2, 2, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2882, 'Сисоєв', 'Михайло', 'Олександрович', 195, 12, 12, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2883, 'Сукочев', 'Віталій', 'Віталійович', 195, 18, 18, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2885, 'Тур', 'Дмитро', 'Володимирович', 195, 11, 8, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2886, 'Яковлєв', 'Владислав', 'Сергійович', 195, 4, 4, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2892, 'Бурлака', 'Артур', 'Сергійович', 196, 8, 8, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2893, 'Гавриленко', 'Олексій', 'Сергійович', 196, 2, 2, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2894, 'Гайдаренко', 'Денис', 'Ігорович', 196, 2, 2, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2896, 'Ємець', 'Ірина', 'Костянтинівна', 196, 2, 2, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2897, 'Козаченко', 'Аліна', 'Валеріївна', 196, 0, 0, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2899, 'Кушнарьов', 'Іван', 'Миколайович', 196, 20, 20, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2900, 'Макаренко', 'Анастасія', 'Миколаївна', 196, 4, 4, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2902, 'Мосунов', 'Андрій', 'Олегович', 196, 14, 14, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2903, 'Оніщенко', 'Вероніка', 'Сергіївна', 196, 0, 0, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2904, 'Падалка', 'Богдан', 'Миколайович', 196, 0, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2905, 'Поташкін', 'Роман', 'Володимирович', 196, 20, 20, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2906, 'Рєзнікова', 'Ольга', 'Іванівна', 196, 0, 0, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2907, 'Саєнко', 'Дмитро', 'Юрійович', 196, 20, 20, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2908, 'Сидоров', 'Павло', 'Михайлович', 196, 38, 38, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2910, 'Цапко', 'Сергій', 'Олександрович', 196, 34, 2, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2911, 'Юрченко', 'Олексій', 'Костянтинович', 196, 0, 0, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2917, 'Бова', 'Олександра', 'Григорівна', 197, 6, 6, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2918, 'Горпинченко', 'Олексій', 'Олександрович', 197, 16, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2919, 'Каптан', 'Олег', 'Віталійович', 197, 10, 10, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2920, 'Кобець', 'Олександра', 'Олександрівна', 197, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2921, 'Маркіна', 'Яна', 'Генріківна', 197, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2922, 'Оліфір', 'Євгеній', 'Сергійович', 197, 16, 16, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2923, 'Подшиваліна', 'Олександра', 'Юріївна', 197, 16, 16, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2924, 'Поляченко', 'Ігор', 'Олександрович', 197, 14, 14, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2925, 'Семенок', 'Анастасія', 'Василівна', 197, 54, 54, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2926, 'Сподаренко', 'Олександра', 'Юріївна', 197, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2927, 'Шестакова', 'Дар''я', 'Ігорівна', 197, 8, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2928, 'Шитова', 'Ольга', 'Олексіївна', 197, 4, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2929, 'Юр''єв', 'Дмитро', 'Артемович', 197, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2935, 'Бархатов', 'Роман', 'Євгенович', 198, 66, 66, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2936, 'Берьозкін', 'Павло', 'Дмитрович', 198, 72, 42, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2937, 'Варинський', 'Максим', 'Володимирович', 198, 74, 74, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2938, 'Васильєв', 'Дмитро', 'Васильович', 198, 30, 30, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2939, 'Коваленко', 'Олександр', 'Олександрович', 198, 4, 4, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2940, 'Корума', 'Ганна', 'Валеріївна', 198, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2941, 'Логачов', 'Максим', 'Геннадійович', 198, 100, 100, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2942, 'Нікітіна', 'Марія', 'Олександрівна', 198, 80, 80, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2943, 'Редько', 'Ігор', 'Олександрович', 198, 6, 6, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2944, 'Хазай', 'Аліна', 'Юріївна', 198, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2945, 'Цибуля', 'Микита', 'Сергійович', 198, 34, 6, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2953, 'Попович', 'М', 'С', 179, 20, 20, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2976, 'Кушнір', 'Сергій', 'Миколайович', 93, 12, 12, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2985, 'Вдовітченко', 'Максим', 'Петрович', 96, 30, 30, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2986, 'Савостицький', 'Денис', 'Андрійович', 209, 28, 28, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2987, 'Солонецький', 'Олександр', 'Олександрович', 209, 32, 32, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2988, 'Токар', 'Євгеній', 'Вікторович', 96, 14, 14, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (2989, 'Хайленко', 'Кирило', 'Валентинович', 209, 26, 26, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3007, 'Байрамов', 'Андрій', 'Радіфович', 216, 3, 1, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3008, 'Білоус', 'Юлія', 'Олексіївна', 216, 1, 1, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3009, 'Вашкевич', 'Анна', 'Олександрівна', 216, 43, 29, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3010, 'Гловацький', 'Олексій', 'Вікторович', 216, 20, 18, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3011, 'Дьомін', 'Сергій', 'Євгенійович', 216, 3, 1, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3012, 'Золотарьов', 'Сергій', 'Олександрович', 216, 13, 9, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3013, 'Косиневський', 'Олександр', 'Олександрович', 216, 19, 3, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3014, 'Кумпан', 'Тарас', 'Олегович', 216, 16, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3015, 'Мазан', 'Дар''я', 'Геннадіївна', 216, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3016, 'Макаренко', 'Владислав', 'Олексійович', 216, 42, 12, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3017, 'Макаренко', 'Артем', 'Володимирович', 216, 15, 15, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3018, 'Савенков', 'Віктор', 'Вікторович', 216, 8, 8, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3019, 'Сачук', 'Микита', 'Сергійович', 216, 12, 10, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3020, 'Христій', 'Олеся', 'Вячеславівна', 216, 14, 14, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3021, 'Чичур', 'Сергій', 'Сергійович', 216, 9, 9, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3022, 'Шарапов', 'Олександр', 'Олегович', 216, 10, 10, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3023, 'Яцентюк', 'Ольга', 'Сергіївна', 216, 3, 1, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3024, 'Віннікова', 'Лоліта', 'Андріївна', 217, 10, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3025, 'Громенко', 'Оксана', 'Вадимівна', 217, 4, 4, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3026, 'Гуртова', 'Марія', 'Борисівна', 217, 20, 12, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3027, 'Драннікова', 'Олена', 'Вікторівна', 217, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3028, 'Дьяченко', 'Олена', 'Віталіївна', 217, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3029, 'Зінченко', 'Катерина', 'Іванівна', 217, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3030, 'Золотовський', 'Микита', 'Олександрович', 217, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3031, 'Левченко', 'Марія', 'Тамазієвна', 217, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3032, 'Лукаш', 'Анастасія', 'Михайлівна', 217, 10, 4, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3033, 'Лямцев', 'Дмитро', 'Вікторович', 217, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3034, 'Неледва', 'Марія', 'Василівна', 217, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3035, 'Нікітін', 'Євген', 'Олександрович', 217, 8, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3036, 'Петренко', 'Олексій', 'Едуардoвич', 217, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3037, 'Селезньов', 'Бенжамин', 'Ігорович', 217, 12, 10, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3038, 'Тимошенко', 'Юрій', 'Віталійович', 217, 8, 8, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3039, 'Тодорюк', 'Тетяна', 'Юріївна', 217, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3040, 'Фам', 'Тхань', 'Тхуат', 217, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3041, 'Шпак', 'Світлана', 'Олексіївна', 217, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3042, 'Берегович', 'Лада', 'Олександрівна', 218, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3043, 'Бобрякова', 'Аліна', 'Андріївна', 218, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3044, 'Гончар', 'Роман', 'Миколайович', 218, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3045, 'Золочевський', 'Михайло', 'Анатолійович', 218, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3046, 'Коваленко', 'Іван', 'Вячеславович', 218, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3047, 'Коротєєв', 'Владислав', 'Вадимович', 218, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3048, 'Кравченко', 'Станіслав', 'Ігорович', 218, 16, 16, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3049, 'Краснова', 'Ганна', 'Вікторівна', 218, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3050, 'Крятов', 'Максим', 'Сергійович', 218, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3051, 'Кудрявський', 'Роман', 'Ігорович', 218, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3052, 'Лебединець', 'Іван', 'Олександрович', 218, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3053, 'Мягкий', 'Андрій', 'Олександрович', 218, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3054, 'Раменський', 'Валентин', 'Олександрович', 218, 8, 8, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3055, 'Сінько', 'Вікторія', 'Юріївна', 218, 4, 4, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3056, 'Слюсар', 'Андрій', 'Романович', 218, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3057, 'Сокол', 'Руслан', 'Андрійович', 218, 18, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3058, 'Чернобай', 'Марія', 'Ігорівна', 218, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3059, 'Шершуков', 'Андрій', 'Вікторович', 218, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3060, 'Яцимірська', 'Катерина', 'Миколаївна', 218, 38, 38, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3061, 'Барабаш', 'Оксана', 'Арменівна', 219, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3062, 'В''юннік', 'Дмитро', 'Вікторович', 219, 4, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3063, 'Кварта', 'Кирило', 'Борисович', 219, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3064, 'Потяко', 'Георгій', 'Сергійович', 219, 85, 57, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3065, 'Стадник', 'Ольга', 'Валентинівна', 219, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3066, 'Шевченко', 'Вікторія', 'Василівна', 219, 74, 46, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3067, 'Ярмак', 'Дмитро', 'Сергійович', 219, 4, 4, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3068, 'Виставна', 'Катерина', 'Андріївна', 220, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3069, 'Гармашов', 'Артем', 'Олександрович', 220, 170, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3070, 'Дєєва', 'Яна', 'Сергіївна', 220, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3071, 'Євтушенко', 'Євген', 'Олегович', 220, 8, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3072, 'Корніло', 'Марія', 'Юріївна', 220, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3073, 'Косарєв', 'Єгор', 'Вадимович', 220, 16, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3074, 'Круглик', 'Дмитро', 'Павлович', 220, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3075, 'Марков', 'Віктор', 'Зіновійович', 220, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3076, 'Матухно', 'Олександр', 'Анатолійович', 220, 28, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3077, 'Серебренніков', 'Антон', 'Володимирович', 220, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3078, 'Солдатова', 'Вікторія', 'Володимирівна', 220, 8, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3079, 'Старцева', 'Марина', 'Вікторівна', 220, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3080, 'Тищенко', 'Євгеній', 'Володимирович', 220, 48, 10, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3081, 'Фомін', 'Денис', 'Володимирович', 220, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3082, 'Ширихалов', 'Максим', 'Михайлович', 220, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3083, 'Ярмолюк', 'Артем', 'Дмитрович', 220, 8, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3084, 'Азаркін', 'Дінар', 'Іванович', 221, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3085, 'Гайдай', 'Олексій', 'Олегович', 221, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3086, 'Гончаров', 'Олександр', 'Сергійович', 221, 8, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3087, 'Жмура', 'Олександр', 'Юрійович', 221, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3088, 'Карпенко', 'Богдан', 'Олександрович', 221, 4, 4, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3089, 'Козубов', 'Сергій', 'Вадимович', 221, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3090, 'Коломієць', 'Антон', 'Сергійович', 221, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3091, 'Кривуля', 'Олег', 'Геннадійович', 221, 2, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3092, 'Літус', 'Арсен', 'Анатолійович', 221, 6, 6, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3093, 'Мухіна', 'Валерія', 'Юріївна', 221, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3094, 'Нгуєн', 'Ван', 'Тху ха', 221, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3095, 'Огіренко', 'Михайло', 'Сергійович', 221, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3096, 'Саділо', 'Денис', 'Володимирович', 221, 4, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3097, 'Синенко', 'Богдан', 'Олексійович', 221, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3098, 'Ульянін', 'Михайло', 'Вячеславович', 221, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3099, 'Фролова', 'Олена', 'Володимирівна', 221, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3100, 'Шелехов', 'Дмитро', 'Михайлович', 221, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3101, 'Юшманов', 'Олександр', 'Серверович', 221, 76, 76, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3102, 'Ющенко', 'Андрій', 'Владиславович', 221, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3103, 'Варшавська', 'Лілія', 'Станіславівна', 222, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3104, 'Васильченко', 'Катерина', 'Олександрівна', 222, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3105, 'Гаган', 'Ігор', 'Володимирович', 222, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3106, 'Жук', 'Остап', 'Сергійович', 222, 16, 16, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3107, 'Золотар', 'Сергій', 'Валерійович', 222, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3108, 'Катющенко', 'Наталія', 'Володимирівна', 222, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3109, 'Консулова', 'Анастасія', 'Сергіївна', 222, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3110, 'Корогод', 'Євген', 'Михайлович', 222, 6, 6, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3111, 'Корольов', 'Богдан', 'Анатолійович', 222, 0, 0, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3112, 'Міхальова', 'Юлія', 'Сергіївна', 222, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3113, 'Мякота', 'Антон', 'Андрійович', 222, 8, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3114, 'Ніколенко', 'Богдан', 'Вікторович', 222, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3115, 'Онопрієнко', 'Антон', 'Сергійович', 222, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3116, 'Постушний', 'Сергій', 'Дмитрович', 222, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3117, 'Стопкевич', 'Денис', 'Юрійович', 222, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3118, 'Хан', 'Олександр', 'Борисович', 222, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3119, 'Чижова', 'Софія', 'Борисівна', 222, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3120, 'Яригін', 'Костянтин', 'Ігорович', 222, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3121, 'Гаврик', 'Ростислав', 'Олексійович', 223, 10, 10, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3122, 'Галізіна', 'Анна', 'Решатівна', 223, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3123, 'Гладєнцов', 'Роман', 'Вікторович', 223, 2, 2, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3124, 'Григорьєва', 'Анна', 'Сергіївна', 223, 6, 6, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3125, 'Кісс', 'Артем', 'Михайлович', 223, 3, 3, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3126, 'Кулініч', 'Тетяна', 'Андріївна', 223, 16, 6, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3127, 'Лисенко', 'Денис', 'Олегович', 223, 16, 2, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3128, 'Мерзляков', 'Євгеній', 'Вадимович', 223, 41, 33, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3129, 'Обідін', 'Ерік', 'Сергійович', 223, 13, 13, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3130, 'Пальоха', 'Анастасія', 'Володимирівна', 223, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3131, 'Попова', 'Ольга', 'Олександрівна', 223, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3132, 'Санін', 'Олександр', 'Володимирович', 223, 18, 18, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3133, 'Сахно', 'Дмитро', 'Іванович', 223, 0, 0, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3134, 'Середіна', 'Олена', 'Олександрівна', 223, 19, 11, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3135, 'Строяновська', 'Юлія', 'Володимирівна', 223, 2, 2, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3136, 'Удовик', 'Наталія', 'Сергіївна', 223, 2, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3137, 'Багерян', 'Анастасія', 'Сергіївна', 224, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3138, 'Бреславець', 'Анастасія', 'Сергіївна', 224, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3139, 'Бурмистров', 'Дмитро', 'Миколайович', 224, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3140, 'Григор''єва', 'Ольга', 'Іванівна', 224, 2, 2, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3141, 'Заблодський', 'Максим', 'Валерійович', 224, 12, 4, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3142, 'Зінченко', 'Ганна', 'Євгенівна', 224, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3143, 'Кравченко', 'Віктор', 'Олександрович', 224, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3144, 'Кутєпов', 'Роман', 'Андрійович', 224, 8, 8, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3145, 'Матлай', 'Максим', 'Олександрович', 224, 6, 6, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3146, 'Мордовіна', 'Анастасія', 'Володимирівна', 224, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3147, 'Морозов', 'Віктор', 'Валерійович', 224, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3148, 'Мягка', 'Юлія', 'Олексіївна', 224, 50, 4, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3149, 'Новікова', 'Дар''я', 'Анатоліївна', 224, 28, 2, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3150, 'Остапенко', 'Богдан', 'Сергійович', 224, 34, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3151, 'Паровченко', 'Євген', 'Юрійович', 224, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3152, 'Плещунов', 'Дмитро', 'Володимирович', 224, 1, 1, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3153, 'Пуляшенко', 'Сергій', 'Олександрович', 224, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3154, 'Пунтус', 'Володимир', 'Дмитрович', 224, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3155, 'Саєнко', 'Віктор', 'Андрійович', 224, 1, 1, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3156, 'Сафонов', 'Денис', 'Олегович', 224, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3157, 'Торянський', 'Артем', 'Сергійович', 224, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3158, 'Юров', 'Олександр', 'Сергійович', 224, 1, 1, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3159, 'Бурлаченко', 'Ольга', 'Вікторівна', 225, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3160, 'Ганієв', 'Сеітбекір', 'Каламович', 225, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3161, 'Гетьманський', 'Денис', 'Павлович', 225, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3162, 'Добржанська', 'Катерина', 'Миколаївна', 225, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3163, 'Єремеєв', 'Артем', 'Євгенович', 225, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3164, 'Загреба', 'Арміне', 'Вячеславівна', 225, 3, 3, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3165, 'Кресало', 'Наталія', 'Анатоліївна', 225, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3166, 'Мандрика', 'Лев', 'Олександрович', 225, 1, 1, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3167, 'Менсеітов', 'Назім', 'Равілович', 225, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3168, 'Могилевський', 'Роман', 'Олександрович', 225, 100, 40, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3169, 'Мурза', 'Максим', 'Костянтинович', 225, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3170, 'Реут', 'Руслана', 'Олексіївна', 225, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3171, 'Рудаченко', 'Станіслав', 'Андрійович', 225, 2, 2, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3172, 'Смирнов', 'Ігор', 'Сергійович', 225, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3173, 'Соловйова', 'Лілія', 'Юріївна', 225, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3174, 'Солодкий', 'Михайло', 'Володимирович', 225, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3175, 'Соломко', 'Олександр', 'Олександрович', 225, 14, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3176, 'Тітомир', 'Олександра', 'Олександрівна', 225, 13, 13, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3177, 'Торжков', 'Євгеній', 'Васильович', 225, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3178, 'Тягельський', 'Євген', 'Сергійович', 225, 8, 2, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3179, 'Бойко', 'Тетяна', 'Сергіївна', 226, 10, 6, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3180, 'Калашніков', 'Руслан', 'Володимирович', 226, 10, 10, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3181, 'Никипанчук', 'Арсеній', 'Анатолійович', 226, 4, 4, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3182, 'Підгорний', 'Роман', 'Владиславович', 226, 4, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3183, 'Сахно', 'Аліна', 'Володимирівна', 226, 71, 71, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3184, 'Слісенко', 'Оксана', 'Георгіївна', 226, 21, 21, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3185, 'Стеценко', 'Микита', 'Анатолійович', 226, 17, 3, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3186, 'Ус', 'Ілля', 'Володимирович', 226, 54, 54, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3187, 'Хабло', 'Владислав', 'Олександрович', 226, 14, 6, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3188, 'Борисенко', 'Юлдуз', 'Геннадіївна', 227, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3189, 'Григор''єв', 'Богдан', 'Анатолійович', 227, 16, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3190, 'Єрмаков', 'Дмитро', 'Олександрович', 227, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3191, 'Зик', 'Роман', 'Іванович', 227, 24, 24, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3192, 'Ковальова', 'Світлана', 'Юріївна', 227, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3193, 'Краснова', 'Ольга', 'Сергіївна', 227, 4, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3194, 'Куренна', 'Юлія', 'Борисівна', 227, 2, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3195, 'Лаухін', 'Олександр', 'Євгенович', 227, 10, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3196, 'Павлов', 'Дмитро', 'Сегрійович', 227, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3197, 'Пантєлєєва', 'Поліна', 'Володимирівна', 227, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3198, 'Радаєв', 'Ігор', 'Андрійович', 227, 2, 2, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3199, 'Савченко', 'Тетяна', 'Олегівна', 227, 16, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3200, 'Саматова', 'Яна', 'Віталіївна', 227, 4, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3201, 'Сівак', 'Дмитро', 'Ярославович', 227, 54, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3202, 'Сікаленко', 'Анастасія', 'Олександрівна', 227, 2, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3203, 'Славінська', 'Ольга', 'Олексіївна', 227, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3204, 'Степаненко', 'Крістіна', 'Володимирівна', 227, 10, 8, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3205, 'Страхов', 'Сергій', 'Миколайович', 227, 76, 6, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3206, 'Ткаченко', 'Анна', 'Олександрівна', 227, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3207, 'Фоменко', 'Анатолій', 'Юрійович', 227, 8, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3208, 'Чучупалов', 'Павло', 'Олександрович', 227, 6, 4, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3209, 'Шелковський', 'Артем', 'Сергійович', 227, 10, 10, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3210, 'Шиптенко', 'Дмитро', 'Юрійович', 227, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3211, 'Якименко', 'Данііл', 'В`ячеславович', 227, 14, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3212, 'Бібіков', 'Андрій', 'Євгенович', 228, 2, 2, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3213, 'Болтенков', 'Дмитро', 'Миколайович', 228, 15, 15, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3214, 'Віниченко', 'Антон', 'Андрійович', 228, 15, 9, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3215, 'Галагуря', 'Юлія', 'Олександрівна', 228, 18, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3216, 'Глоба', 'Вікторія', 'Іванівна', 228, 18, 8, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3217, 'Головченко', 'Олександр', 'Андрійович', 228, 4, 4, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3218, 'Громов', 'Ігор', 'Олександрович', 228, 0, 0, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3219, 'Давидовський', 'Артем', 'Юрійович', 228, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3220, 'Дейнега', 'Яків', 'Олексійович', 228, 4, 4, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3221, 'Зюзюкіна', 'Ангеліна', 'Вадимівна', 228, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3222, 'Касян', 'Ілля', 'Геннадійович', 228, 80, 80, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3223, 'Корольов', 'Олександр', 'Миколайович', 228, 4, 4, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3224, 'Кос''яненко', 'Анастасія', 'Миколаївна', 228, 2, 2, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3225, 'Лаухін', 'Ігор', 'Вікторович', 228, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3226, 'Марченко', 'Богдан', 'Віталійович', 228, 4, 4, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3227, 'Масловська', 'Наталія', 'Іванівна', 228, 14, 0, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3228, 'Мосунов', 'Артем', 'Дмитрович', 228, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3229, 'Пироженко', 'Наталія', 'Олексіївна', 228, 30, 30, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3230, 'Птіцин', 'Кирило', 'Володимирович', 228, 6, 6, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3231, 'Рижков', 'Андрій', 'Володимирович', 228, 2, 2, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3232, 'Сивоконь', 'Владислав', 'Володимирович', 228, 1, 1, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3233, 'Смолієнко', 'Ольга', 'Сергіївна', 228, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3234, 'Хоменко', 'Марина', 'Михайлівна', 228, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3235, 'Чигир', 'Даніела', 'Ігорівна', 228, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3236, 'Аблаєв', 'Віталій', 'Володимирович', 216, 5, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3237, 'Бабай', 'Артем', 'Олександрович', 217, 32, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3238, 'Белей', 'Роман', 'Ігорович', 218, 4, 4, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3239, 'Алексєєнко', 'Юрій', 'Володимирович', 219, 40, 40, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3240, 'Абкерімова', 'Дар''я', 'Ігорівна', 220, 8, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3241, 'Адилов', 'Отабек', 'Сейран', 221, 14, 14, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3242, 'Богатікова', 'Ірина', 'Сергіївна', 222, 10, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3243, 'Бутко', 'Сергій', 'Сергійович', 223, 25, 25, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3244, 'Азад', 'Сердар', 'Юнусович', 224, 0, 0, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3245, 'Біляк', 'Марина', 'Олександрівна', 225, 1, 1, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3246, 'Бельмега', 'Андрій', 'Валерійович', 226, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3247, 'Бондаренко', 'Михайло', 'Олегович', 227, 58, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3248, 'Андрашко', 'Анастасія', 'Миколаївна', 228, 0, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3249, 'Захаров', 'О', 'Б', 179, 19, 19, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3250, 'Као', 'Хоай', 'Зуй', 179, 8, 8, 7);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3251, 'Бакунова', 'В', NULL, 192, 50, 0, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3252, 'Поліщук', 'А', NULL, 192, 136, 136, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3253, 'Попков', 'О', NULL, 192, 118, 118, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3254, 'Дружбинский', NULL, NULL, 182, 110, 0, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3255, 'Ларченко', 'Д', 'С', 193, 16, 12, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3256, 'Котович', NULL, NULL, 176, 112, 112, 13);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3257, 'Солощенко', NULL, NULL, 176, 24, 24, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3258, 'Нестеренко', 'Я', 'В', 178, 72, 72, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3259, 'Санжаревський', 'М', 'Р', 178, 2, 2, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3260, 'Чалий', 'А', 'В', 178, 44, 6, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3261, 'Бурмистров', NULL, NULL, 180, 4, 4, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3262, 'Дорошенко', NULL, NULL, 180, 46, 46, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3263, 'Шеремета', NULL, NULL, 180, 10, 2, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3264, 'Чан', 'Конг', 'Дат', 180, 44, 44, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3265, 'Якуба', NULL, NULL, 180, 22, 22, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3266, 'Соловйов', 'Б', 'Ю', 194, 34, 34, 8);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3267, 'Рашмабасари', 'А', NULL, 125, 10, 10, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3268, 'Амматимин', 'Олександр', NULL, 124, 46, 46, 4);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3269, 'Ахрарі', 'Долгор', NULL, 124, 48, 42, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3270, 'Баттулга', 'Вепа', NULL, 124, 180, 144, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3271, 'Дурдивелієв', 'Сефер', NULL, 124, 118, 118, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3272, 'Мухаммедов', 'Бахнам', NULL, 124, 94, 58, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3273, 'Хидиров', 'Атамурат', 'Тальмірович', 124, 148, 148, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3274, 'Воскобойнікова', 'Анастасія', 'Олександрівна', 126, 60, 46, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3275, 'Думбадзе', 'Юлія', 'Володимирівна', 126, 4, 2, 1);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3276, 'Шубіна', 'Марія', 'Афанасіївна', 126, 80, 80, 10);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3277, 'Береговий', 'Сергій', 'Володимирович', 127, 102, 102, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3278, 'Земляной', 'Андрій', 'Володимирович', 127, 64, 64, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3279, 'Котляров', 'Андрій', 'Геннадійович', 127, 32, 32, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3280, 'Попов', 'Микола', 'Олександрович', 127, 56, 56, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3283, 'Ліхота', 'Анна', 'Вікторівна', 128, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3285, 'Білов', 'Сергій', 'Вікторович', 129, 90, 90, 18);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3286, 'Григорова', 'Альбіна', 'В''ячеславівна', 129, 52, 52, 15);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3287, 'Черниш', 'Ігор', 'Валерійович', 129, 0, 0, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3288, 'Лук`яненко', 'Владислав', 'Віталійович', 130, 22, 22, 9);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3289, 'Потолова', 'Вікторія', 'Сергіївна', 131, 130, 130, 17);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3290, 'Яременко', 'Євген', 'Ігорович', 131, 118, 118, 15);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3291, 'Євтушок', 'Сергій', 'Петрович', 132, 28, 22, 6);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3292, 'Мусна', 'Марина', 'Юріївна', 133, 50, 50, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3294, 'Езе', 'Жоел', NULL, 230, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3296, 'Хасанов', 'Рідван', 'Седарович', 229, 50, 22, 3);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3297, 'Савченко', 'Євгенія', 'Олександрівна', 94, 0, 0, 5);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3299, 'Нікіфоров', 'Вадим', 'Михайлович', 95, 54, 14, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3300, 'Петренко', 'Дмитро', 'Андрійович', 95, 112, 112, 2);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3301, 'Рєзніков', 'Олег', 'Вікторович', 95, 74, 74, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3303, 'Пилипенко', 'Максим', 'Валерійович', 231, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3304, 'Коробчинская', 'Надія', 'Бахріддінівна', 233, 4, 4, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3305, 'Коврижкін', 'Роман', 'Олегович', 97, 108, 108, 12);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3306, 'Леонова', 'Юлія', 'Валентинівна', 183, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3307, 'Мацнєва', 'Вікторія', 'Геннадіївна', 183, 8, 8, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3308, 'Соколовський', 'Максим', 'Володимирович', 183, 4, 6, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3309, 'Рожнова', 'Ксенія', 'Сергіївна', 238, 0, 0, 0);
INSERT INTO faculty_ua.students OVERRIDING SYSTEM VALUE VALUES (3310, 'Сушко', 'Олександр', 'Олексійович', 238, 0, 0, 0);


--
-- TOC entry 3412 (class 0 OID 16577)
-- Dependencies: 229
-- Data for Name: subjects; Type: TABLE DATA; Schema: faculty_ua; Owner: postgres
--

INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (1, 'Політологія і соціологія', NULL, '702');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (2, 'Електорнна і мікропроцесорна техніка', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (3, 'Основи конструювання засобів вимірювальної техніки', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (4, 'Теорія точності', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (5, 'Авіаційні вимірювально-обчислювальні комплекси', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (6, 'Методи та пристрої вимірювання параметрів', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (7, 'Комп''ютерні системи в управлінні автомобіля', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (8, 'Основи конструювання засобів вимірювальної техніки та систем автоматизованого проектування', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (9, 'Виміри фізико-хімічних величин', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (10, 'Засоби вимірювання', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (11, 'Теорія систем та математичне моделювання', NULL, '405');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (12, 'Методи оптимізації та дослідження операцій', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (13, 'Варіаційні методи', NULL, '405');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (14, 'Рівняння математичної фізики', NULL, '405');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (15, 'Сучасні засоби проектування програмного забезпечення', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (16, 'Бази даних та інформаційні системи', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (17, 'Фінансова математика', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (18, 'Теорія автоматичного управління', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (19, 'Інформаційно-вимірювальні пристрої', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (20, 'Мікропроцесорні обчислювачі', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (21, 'Основи навігації', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (22, 'Фізико-хімічні основи технологічних процесів', NULL, '204');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (23, 'Професійна іноземна мова', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (24, 'Комп''ютерні мережі та кодування інформації', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (25, 'Сервоприводи СУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (26, 'Системне програмне забезпечення СУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (27, 'Метрологія, технологічні вимірювання та прилади', 5, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (28, 'Теорія автоматичного керування', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (29, 'Бази даних', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (30, 'Пристрої та методи контролю ТП', 5, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (31, 'Системний аналіз', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (32, 'WEB-технології', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (33, 'Організація баз даних та знань', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (34, 'Технологія створення програмних продуктів', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (35, 'Моделювання систем', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (36, 'Термодинаміка і теплотехніка', NULL, '205');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (37, 'Системи управління літаками', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (38, 'Функціональні системи та вимірювальні комплекси', NULL, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (39, 'Іноземна мова', NULL, '702');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (40, 'Організація і функціонування комп''ютерних систем', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (41, 'Управління проектами', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (42, 'Основи САПР', NULL, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (43, 'Надійність АПК', NULL, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (44, 'Термодінамика', NULL, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (45, 'Електроніка та основи схемотехніки', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (46, 'Машинні моделі об''єктів АУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (47, 'Архітектура комп''ютеризованих СУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (48, 'Комп''ютерна схемотехніка та архітектура комп''ютера', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (49, 'Математичні методи дослідження операцій', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (50, 'Операційні системи', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (51, 'Теорія прийняття рішень', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (52, 'Вимірювальні перетворювачі', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (54, 'Планування експерименту', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (55, 'Вимірювання геометричних величин', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (56, 'Функціональний аналіз', NULL, '405');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (57, 'Аналіз даних', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (58, 'Випадкові процеси', NULL, '405');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (59, 'Математична економіка', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (60, 'Методи аналізу в соціології', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (61, 'Прикладна механіка та основи конструювання', NULL, '202');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (62, 'Технічні засоби автоматизації', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (63, 'Електричні машини та прилади', 5, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (64, 'Програмування мікропроцесорних пристроїв', 5, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (65, 'Вступ до теорії систем', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (66, 'Основи метрології і теорії вимірювань', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (67, 'Метрологія та ВТ', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (68, 'Об''єктно-орієнтоване програмування', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (70, 'Бази даних в системах управління', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (71, 'ІКТ проектування СУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (72, 'Основи радіолокації', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (73, 'Функціональні системи ЛА', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (74, 'Чисельні методи математичної фізики', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (75, 'Операційні системи та системне програмування', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (76, 'Теорія автоматів і формальних мов', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (77, 'Сучасна теорія управління', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (78, 'Системи керування літальними пристроями', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (79, 'Дискретна математика (КР)', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (80, 'Дослідження операцій', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (81, 'Теорія ймовірності, ймовірнісні процеси і математична статистика', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (82, 'Мікропроцесорна техніка', 5, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (83, 'Температурні вимірювання', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (84, 'Комп''ютерні мережі', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (85, 'Математичне моделювання', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (86, 'Методи оптимізації', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (87, 'Бази даних', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (88, 'Теорія ігор', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (89, 'Формальні мови та граматики', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (90, 'Термодинаміка та теплообмін', NULL, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (92, 'Об''єктно-зорієнтований аналіз та проектування', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (93, 'Методи обчислень (КР)', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (94, 'Основи метрології і теорії вимірювань (КР)', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (95, 'Приводи СУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (96, 'Інформаційні мережі', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (97, 'Філософія', NULL, '701');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (98, 'Прикладна механіка', NULL, '202');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (99, 'Електроніка та мікросхемотехніка (КП)', 5, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (100, 'Електроніка та мікросхемотехніка', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (101, 'Basic Electrical Engeneering', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (102, 'WEB-технології в інформаційно-управляючих системах', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (103, 'Проектування та програмування МП СУ (КП)', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (104, 'Системи орієнтації і стабілізації', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (105, 'Системна інтеграція', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (106, 'Системний аналіз об''єктів та процесів СУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (107, 'Спеціальні розділи сучасної ТАУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (108, 'Охорона праці в галузі', NULL, '106');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (109, 'Спеціальні розділи ТАУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (110, 'Цивільний захист', NULL, '106');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (111, 'Проектування та програмування МП СУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (112, 'Сучасні навігаційні технології в СУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (113, 'Проектування відмовостійких СУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (114, 'Відмовостійкі СУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (115, 'WEB-технології в інформаційно-управляючих системах (КР)', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (116, 'WEB-технології в системах аеронавігаційного обслуговування (КР)', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (117, 'Мікропроцесорні засоби в аеронавігаційних системах', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (118, 'Спеціальні розділи сучасної навігації', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (119, 'Відмовостійкі системи аеронавігаційного обслуговування ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (120, 'Геоінформаційні системи в аеронавігації', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (121, 'Мікропроцесорні засоби в системах аеронавігаційного обслуговування', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (122, 'Сучасні супутникові технології в аеронавігації', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (123, 'Інтегровані автоматизовані системи управління', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (124, 'Інтегровані автоматизовані системи управління (КР)', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (125, 'Інформаційні системи логістичного управління', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (126, 'Інформаційні технології корпоративного управління та стратегічного менеджменту', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (127, 'Менеджмент якості і елементи системи управління якості', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (128, 'Менеджмент якості і елементи системи управління якості (КР)', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (129, 'Стандартизація', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (130, 'Міжнародні стандарти з якості', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (131, 'Методи поліпшення якості', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (132, 'Інтелектуальні засоби вимірювальної техніки', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (133, 'Інтелектуальні засоби вимірювальної техніки (КП)', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (134, 'Випробування та контроль засобів засоби вимірювальної техніки', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (135, 'Сертифікація продукції та послуг', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (136, 'Випробування та контроль продукції', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (137, 'Метрологічне забезпечення неруйнівного контролю', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (138, 'Метрологічне забезпечення сертифікації', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (139, 'Телеметричні вимірювання', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (140, 'ІВС промислового призначення', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (141, 'Інформаційно-діагностичні системи', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (142, 'Інформаційно-діагностичні системи (КП)', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (143, 'Засоби захисту інформації', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (144, 'Проектування ІВС', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (145, 'Автоматизація технологічних процесів (КП)', 5, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (146, 'Інформаційне супроводження виробництва', 5, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (147, 'Проектування програмного забезпечення систем реального часу', NULL, '603');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (148, 'Системи штучного інтелекту', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (149, 'Спеціальні питання сучасної ТАУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (150, 'Основи проектування систем автоматизації', 5, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (151, 'Охорона праці загальна та спеціальна', NULL, '106');
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (152, 'Промислові мережі та системи передавання даних', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (153, 'Інтерфейси та засоби сполучення', 5, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (154, 'Авіоніка', 5, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (155, 'Математичні основи оптимальних систем', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (156, 'Моделюванювання і аналіз складних систем', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (157, 'Наукове стажування (КР)', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (158, 'Обчислювальний інтелект', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (159, 'Нелінійнй динамічні системи', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (160, 'Математичні моделі і методи дослідження операцій в логістиці', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (161, 'Нелінійнй динамічні соціальні системи', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (162, 'Науково-дослідна робота (КР)', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (163, 'Методи нелінійної динаміки в соціальних системах', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (164, 'Інтелектуальні інформаційні системи (КР)', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (165, 'Методи керування динамічними системами', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (166, 'Обчислювальна геометрія та комп''ютерна графіка', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (167, 'Теорія графів ', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (168, 'Інтелектуальні інформаційні системи', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (169, 'Системи та методи прийняття рішень', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (170, 'Інформаційні технології управління', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (171, 'Проектування програмного забезпечення', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (172, 'Моделювання і аналіз складних систем', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (173, 'Математичне моделювання фізичних процесів', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (174, 'Методи нелінійної динаміки', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (175, 'Методи оптимізації та дослідження операцій (КР)', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (176, 'Мікроконтроллерні обчислювачі', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (177, 'Проектування систем управління', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (178, 'Цифрові системи управління', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (179, 'Системи управління безпілотними ЛА', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (180, 'Аеродромне обладнання', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (181, 'Технологія виготовлення засобів вимірювальної техніки', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (182, 'Методи вимірювань', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (183, 'Цифрові засоби вимірювань', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (184, 'Мікропроцесори у ІВС', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (185, 'Пристрої відображення інформації', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (186, 'Комп''ютерні мережі', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (187, 'Методи та системи штучного інтелекту', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (188, 'Проектування інформаційних систем', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (189, 'Технології комп''ютерного проектування', 2, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (190, 'Психологія', NULL, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (191, 'Теорія програмування', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (192, 'Захист інформації', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (193, 'Моделювання соціально-економічних процесів', NULL, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (194, 'Гуманітарна дисципліна', NULL, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (196, 'Науково-дослідна робота', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (197, 'Науково-дослідна робота студентів', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (198, 'Організаційна культура та імідж сучасного керівника', NULL, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (199, 'Комп''ютерне конструювання СУ', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (200, 'Операційні системи', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (201, 'Економіка та менеджмент', NULL, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (202, 'Інтелектуальна власність', 1, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (203, 'Системний підхід в управлінні якістю', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (204, 'Системи обробки сигналів', 5, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (205, 'Спеціальні питання галузі', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (206, 'Науково-дослідна робота студентів', 3, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (207, 'Математичні моделі природних процесів', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (208, 'Методи оптимізації (КР)', 4, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (209, 'Матричні обчислення', NULL, NULL);
INSERT INTO faculty_ua.subjects OVERRIDING SYSTEM VALUE VALUES (210, 'Міжкультурні комунікації', NULL, NULL);


--
-- TOC entry 3409 (class 0 OID 16568)
-- Dependencies: 226
-- Data for Name: tutors; Type: TABLE DATA; Schema: faculty_ua; Owner: postgres
--

INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (1, 'Кулік Ю.М.', 3, 1, NULL, 'Декан, зав. кафедри, професор, д.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (2, 'Суббота Ю.О.', 3, 1, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (3, 'Джулгаков Е.П.', 3, 1, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (4, 'Чухрай Д.П.', 3, 1, NULL, 'Доцент, к.т.н., заст. декана');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (5, 'Фірсов В.Б.', 3, 1, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (6, 'Завгородній О.І.', 3, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (7, 'Зімовін Д.І.', 3, 1, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (8, 'Пасічник В.А.', 3, 1, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (9, 'Дергачов О.П.', 3, 1, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (10, 'Грінченко К.Ф.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (11, 'Постніков Ю.О.', 3, 1, NULL, 'Доцент');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (12, 'Селевко Т.В.', 7, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (13, 'Ніколаєв О.С.', 4, NULL, NULL, 'Декан, зав. кафедри, професор, д.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (14, 'Карташов О.Б.', 3, 4, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (15, 'Радивоненко А.Г.', 3, 4, NULL, 'Заст. декана');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (16, 'Коробчинський В.В.', 3, 4, NULL, 'заст. декана');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (17, 'Мазорчук В.Ф.', 3, 4, NULL, 'Доцент, к.т.н., заст. декана');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (18, 'Цеховський О.В.', 3, 3, NULL, 'Доцент, к.т.н., заст. декана');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (19, 'Книш О.В.', 3, 3, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (20, 'Заболотний І.В.', 3, 3, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (21, 'Почекаєв О.В.', 3, 3, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (22, 'Булищенко О.М.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (23, 'Лещенко А.Г.', 3, 2, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (24, 'Гаранжа А.Ю.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (25, 'Головченко А.Ю.', 4, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (26, 'Соловйов І.Л.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (27, 'Рева І.В.', 3, 2, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (28, 'Смидович А.В.', 3, 2, NULL, 'К.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (29, 'Момот В.Н.', 3, 2, NULL, 'Доцент, к.т.н., заст. декана');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (30, 'Федорович А.І.', 3, 2, NULL, 'Зав. кафедри, професор, д.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (31, 'Шевченко В.В.', 3, 3, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (32, 'Гордієнко В.В.', 3, 3, NULL, 'Професор, к.т.н., заст. декана');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (33, 'Попов К.П.', 3, 2, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (34, 'Кулик А.А.', 3, 3, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (35, 'Несвітенко А.А.', 7, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (36, 'Єпіфанов Т.М.', 2, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (37, 'Яресько К.С.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (38, 'Бабкіна В.А.', 3, 4, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (39, 'Курпа А.С.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (40, 'Барахов О.Г.', 4, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (41, 'Зенович А.Є.', 3, 1, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (42, 'Жеребетьєв І.М.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (43, 'Томаз І.Г.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (44, 'Шульга В.З.', 7, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (45, 'Чекалова В.М.', 7, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (46, 'Маслова С.М.', 7, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (47, 'Дибська Л.С.', 3, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (48, 'Міланов А.Є.', 3, 2, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (49, 'Шульга О.Ю.', 7, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (50, 'Опаріна В.П.', 7, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (51, 'Головань А.М.', 3, 2, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (52, 'Назаренко І.М.', 3, 3, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (53, 'Григоренко С.А.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (54, 'Борисевич М.В.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (55, 'Бабій Є.С.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (56, 'Кошовий О.П.', 3, 3, NULL, 'Зав. кафедри, професор, д.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (57, 'Соколов А.М.', 3, 4, NULL, 'Зав. кафедри, професор, д.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (58, 'Внуков К.', 3, 5, NULL, 'Зав. кафедри, професор, д.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (60, 'Анікін Ю.К.', 3, 3, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (61, 'Пудло В.Є.', 3, 4, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (62, 'Філатова О.С.', 3, 2, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (63, 'Гербалі В.В.', 3, 2, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (64, 'Зянчурина М.Л.', 3, 5, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (65, 'Гордін А.В.', 3, 1, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (66, 'Смірнова А.А.', 3, 1, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (67, 'Заболотний А.А.', 3, 3, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (68, 'Левін М.П.', 3, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (69, 'Малєєва Е.К.', 3, 2, NULL, 'Професор, д.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (70, 'Троненко Ю.І.', 3, 5, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (71, 'Михайлов С.І.', 3, 3, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (72, 'Світлічний Е.Е.', 3, 3, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (73, 'Шилова І.І.', 3, 4, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (74, 'Черепащук С.Л.', 3, 3, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (75, 'Таран К.П.', 3, 1, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (76, 'Руденко С.К.', 3, 1, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (77, 'Назаренко Л.І.', 3, 2, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (78, 'Благодарний О.В.', 3, 5, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (79, 'Яшина Ю.А.', 3, 2, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (80, 'Ярова Л.І.', 3, 4, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (81, 'Подоляка О.Г.', 3, 4, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (82, 'Добежа Є.Б.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (83, 'Бояркін О.М.', 3, 5, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (84, 'Сухобрус О.В.', 3, 3, NULL, 'Доцент, к.т.н., заст. декана');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (85, 'Івахненко Н.Л.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (86, 'Дергачьов Т.А.', 3, 3, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (87, 'Чебикіна В.О.', 3, 3, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (88, 'Науменко Т.Г.', 3, 3, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (89, 'Брисіна О.С.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (90, 'Томілова Д.Ю.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (91, 'Макаренко Ю.А.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (92, 'Скоб О.А.', 3, 4, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (93, 'Губка В.А.', 3, 2, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (94, 'Прохоров С.М.', 3, 2, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (95, 'Поправка Д.С.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (96, 'Момот О.В.', 3, 2, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (97, 'Глухова К.Ю.', 3, 2, NULL, 'Асистент');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (98, 'Губка О.А.', 3, 2, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (99, 'Бойко К.Б.', 3, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (100, 'Зайденварг Н.В.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (101, 'Попов М.О.', 3, 2, NULL, 'Професор, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (102, 'Трончук А.Г.', 3, 4, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (103, 'Корчак Т.П.', 3, 4, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (104, 'Галкін О.М.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (105, 'Кописов А.С.', 3, 1, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (106, 'Клочок І.Ю.', 3, 1, NULL, 'Асистент');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (107, 'Чернишов С.М.', 3, 4, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (108, 'Орлов В.М.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (109, 'Потильчак А.Г.', 3, 3, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (110, 'Желтухін С.С.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (111, 'Комков А.В.', 3, 5, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (112, 'Калашніков І.П.', 3, 3, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (114, 'Трофімов С.М.', 3, 3, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (115, 'Бандура Л.А.', 3, 1, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (116, 'Симонов О.В.', 3, 1, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (117, 'Угрюмов В.І.', 3, 4, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (118, 'Бакуменко А.А.', 3, 4, NULL, 'Доцент');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (119, 'Халтурін О.В.', NULL, 4, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (120, 'Вагін Р.С.', 3, 1, NULL, 'Асистент');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (121, 'Лещенко В.О.', 3, 2, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (123, 'Станцер Ю.І.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (124, 'Волковая М.Д.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (125, 'Ткаченко Е.А.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (126, 'Печенін А.М.', 5, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (127, 'Сергеєва Г.О.', 3, 2, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (130, 'Морозова О.В.', 3, 4, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (131, 'Фомічов С.О.', 3, 5, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (132, 'Агаркова Т.С.', 3, 5, NULL, 'Доцент, заст. декана');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (133, 'Бичкова Д.М.', 3, 1, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (134, 'Білоконь М.В.', 3, 2, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (135, 'Симович М.С.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (136, 'Прокопенко Т.В.', 3, 2, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (137, 'Макарічев О.Є.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (138, 'Некрасов О.Ю.', 3, 5, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (139, 'Ковалевська С.М.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (140, 'Галіцин К.І.', 3, 5, NULL, 'Доцент');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (141, 'Камиорицька В.А.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (142, 'Макаренко А.Л.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (143, 'Соколов М.В.', 3, 4, NULL, 'Професор, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (144, 'Слепічева О.Є.', 3, 4, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (145, 'Свящук Л.П.', NULL, NULL, '701', NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (146, 'Юркова С.', NULL, NULL, '701', NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (147, 'Кулик Є.Є.', 3, 2, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (148, 'Овчаров І.В.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (149, 'Яковенко Н.С.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (150, 'Мірошниченко В.В.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (151, 'Афанасьєвська А.Я.', 3, 4, NULL, ' ');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (152, 'Чумаченко Т.Ф.', 3, 4, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (153, 'Биков Л.О.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (154, 'Педан Р.А.', 3, 1, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (155, 'Прилуцька Г.О.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (156, 'Прилуцький В.А.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (157, 'Красніков В.М.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (158, 'Мостова А.Ю.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (159, 'Чернобай В.І.', 3, 3, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (160, 'Сіроклин М.П.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (161, 'Рудь Ю.А.', 3, 3, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (162, 'Савєльєв М.О.', 3, 3, NULL, 'Доцент, к.т.н.');
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (163, 'Сербов Г.К.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (164, 'Кислий В.А.', 3, 5, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (165, 'Цапко К.В.', 3, 3, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (166, 'Бахмет Є.М.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (167, 'Воробуєва О.В.', 6, NULL, '603', NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (168, 'Доценко В.Г.', NULL, NULL, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (169, 'Резнікова О.А.', 3, 1, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (170, 'Рижиков О.Л.', 3, 5, NULL, NULL);
INSERT INTO faculty_ua.tutors OVERRIDING SYSTEM VALUE VALUES (171, 'Піщухіна Д.І.', 3, 1, NULL, 'Доцент, к.т.н.');


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 230
-- Name: chairs_chair_id_seq; Type: SEQUENCE SET; Schema: faculty_ua; Owner: postgres
--

SELECT pg_catalog.setval('faculty_ua.chairs_chair_id_seq', 1, false);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 231
-- Name: curriculum_curriculum_id_seq; Type: SEQUENCE SET; Schema: faculty_ua; Owner: postgres
--

SELECT pg_catalog.setval('faculty_ua.curriculum_curriculum_id_seq', 1, false);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 232
-- Name: schedule_schedule_id_seq; Type: SEQUENCE SET; Schema: faculty_ua; Owner: postgres
--

SELECT pg_catalog.setval('faculty_ua.schedule_schedule_id_seq', 1, false);


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 233
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: faculty_ua; Owner: postgres
--

SELECT pg_catalog.setval('faculty_ua.students_student_id_seq', 1, false);


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 234
-- Name: subjects_subject_id_seq; Type: SEQUENCE SET; Schema: faculty_ua; Owner: postgres
--

SELECT pg_catalog.setval('faculty_ua.subjects_subject_id_seq', 1, false);


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 235
-- Name: tutors_tutor_id_seq; Type: SEQUENCE SET; Schema: faculty_ua; Owner: postgres
--

SELECT pg_catalog.setval('faculty_ua.tutors_tutor_id_seq', 1, false);


--
-- TOC entry 3244 (class 2606 OID 16582)
-- Name: chairs chairs_pkey; Type: CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.chairs
    ADD CONSTRAINT chairs_pkey PRIMARY KEY (chair_id);


--
-- TOC entry 3248 (class 2606 OID 16592)
-- Name: curriculum curriculum_pkey; Type: CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.curriculum
    ADD CONSTRAINT curriculum_pkey PRIMARY KEY (curriculum_id);


--
-- TOC entry 3240 (class 2606 OID 16586)
-- Name: groups groups_group_number_key; Type: CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.groups
    ADD CONSTRAINT groups_group_number_key UNIQUE (group_number);


--
-- TOC entry 3242 (class 2606 OID 16594)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (group_id);


--
-- TOC entry 3251 (class 2606 OID 16596)
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id);


--
-- TOC entry 3235 (class 2606 OID 16598)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- TOC entry 3253 (class 2606 OID 16600)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (subject_id);


--
-- TOC entry 3246 (class 2606 OID 16602)
-- Name: tutors tutors_pkey; Type: CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.tutors
    ADD CONSTRAINT tutors_pkey PRIMARY KEY (tutor_id);


--
-- TOC entry 3238 (class 1259 OID 16671)
-- Name: groupnumber; Type: INDEX; Schema: faculty_ua; Owner: postgres
--

CREATE INDEX groupnumber ON faculty_ua.groups USING btree (group_number);


--
-- TOC entry 3249 (class 1259 OID 16672)
-- Name: scheddate; Type: INDEX; Schema: faculty_ua; Owner: postgres
--

CREATE INDEX scheddate ON faculty_ua.schedule USING btree (lesson_date);


--
-- TOC entry 3236 (class 1259 OID 16668)
-- Name: studname; Type: INDEX; Schema: faculty_ua; Owner: postgres
--

CREATE INDEX studname ON faculty_ua.students USING btree (name COLLATE faculty_ua.ua);


--
-- TOC entry 3237 (class 1259 OID 16669)
-- Name: studsurname; Type: INDEX; Schema: faculty_ua; Owner: postgres
--

CREATE INDEX studsurname ON faculty_ua.students USING btree (surname COLLATE faculty_ua.ua);


--
-- TOC entry 3254 (class 1259 OID 16670)
-- Name: subname; Type: INDEX; Schema: faculty_ua; Owner: postgres
--

CREATE INDEX subname ON faculty_ua.subjects USING btree (name COLLATE faculty_ua.ua);


--
-- TOC entry 3259 (class 2606 OID 16603)
-- Name: chairs chairs_chair_head_id_fkey; Type: FK CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.chairs
    ADD CONSTRAINT chairs_chair_head_id_fkey FOREIGN KEY (chair_head_id) REFERENCES faculty_ua.tutors(tutor_id) NOT VALID;


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 3259
-- Name: CONSTRAINT chairs_chair_head_id_fkey ON chairs; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON CONSTRAINT chairs_chair_head_id_fkey ON faculty_ua.chairs IS 'Посилання на завідувача кафедри';


--
-- TOC entry 3260 (class 2606 OID 16608)
-- Name: chairs chairs_deputy_dean_id_fkey; Type: FK CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.chairs
    ADD CONSTRAINT chairs_deputy_dean_id_fkey FOREIGN KEY (deputy_dean_id) REFERENCES faculty_ua.tutors(tutor_id) NOT VALID;


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 3260
-- Name: CONSTRAINT chairs_deputy_dean_id_fkey ON chairs; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON CONSTRAINT chairs_deputy_dean_id_fkey ON faculty_ua.chairs IS 'Посилання на заступника декана';


--
-- TOC entry 3264 (class 2606 OID 16623)
-- Name: curriculum curriculum_group_id_fkey; Type: FK CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.curriculum
    ADD CONSTRAINT curriculum_group_id_fkey FOREIGN KEY (group_id) REFERENCES faculty_ua.groups(group_id) NOT VALID;


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 3264
-- Name: CONSTRAINT curriculum_group_id_fkey ON curriculum; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON CONSTRAINT curriculum_group_id_fkey ON faculty_ua.curriculum IS 'Посилання на групу';


--
-- TOC entry 3262 (class 2606 OID 16613)
-- Name: curriculum curriculum_subject_id_fkey; Type: FK CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.curriculum
    ADD CONSTRAINT curriculum_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES faculty_ua.subjects(subject_id) NOT VALID;


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 3262
-- Name: CONSTRAINT curriculum_subject_id_fkey ON curriculum; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON CONSTRAINT curriculum_subject_id_fkey ON faculty_ua.curriculum IS 'Посилання на предмет';


--
-- TOC entry 3263 (class 2606 OID 16618)
-- Name: curriculum curriculum_tutor_id_fkey; Type: FK CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.curriculum
    ADD CONSTRAINT curriculum_tutor_id_fkey FOREIGN KEY (tutor_id) REFERENCES faculty_ua.tutors(tutor_id) NOT VALID;


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 3263
-- Name: CONSTRAINT curriculum_tutor_id_fkey ON curriculum; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON CONSTRAINT curriculum_tutor_id_fkey ON faculty_ua.curriculum IS 'Посилання на викладача';


--
-- TOC entry 3256 (class 2606 OID 16628)
-- Name: groups groups_chair_id_fkey; Type: FK CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.groups
    ADD CONSTRAINT groups_chair_id_fkey FOREIGN KEY (chair_id) REFERENCES faculty_ua.chairs(chair_id) NOT VALID;


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 3256
-- Name: CONSTRAINT groups_chair_id_fkey ON groups; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON CONSTRAINT groups_chair_id_fkey ON faculty_ua.groups IS 'Посилання на кафедру';


--
-- TOC entry 3257 (class 2606 OID 16633)
-- Name: groups groups_curator_id_fkey; Type: FK CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.groups
    ADD CONSTRAINT groups_curator_id_fkey FOREIGN KEY (curator_id) REFERENCES faculty_ua.tutors(tutor_id) NOT VALID;


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 3257
-- Name: CONSTRAINT groups_curator_id_fkey ON groups; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON CONSTRAINT groups_curator_id_fkey ON faculty_ua.groups IS 'Посилання на куратора';


--
-- TOC entry 3258 (class 2606 OID 16638)
-- Name: groups groups_senior_student_id_fkey; Type: FK CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.groups
    ADD CONSTRAINT groups_senior_student_id_fkey FOREIGN KEY (senior_student_id) REFERENCES faculty_ua.students(student_id) NOT VALID;


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 3258
-- Name: CONSTRAINT groups_senior_student_id_fkey ON groups; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON CONSTRAINT groups_senior_student_id_fkey ON faculty_ua.groups IS 'Посилання на старосту';


--
-- TOC entry 3265 (class 2606 OID 16643)
-- Name: schedule schedule_curriculum_id_fkey; Type: FK CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.schedule
    ADD CONSTRAINT schedule_curriculum_id_fkey FOREIGN KEY (curriculum_id) REFERENCES faculty_ua.curriculum(curriculum_id) NOT VALID;


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 3265
-- Name: CONSTRAINT schedule_curriculum_id_fkey ON schedule; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON CONSTRAINT schedule_curriculum_id_fkey ON faculty_ua.schedule IS 'Посилання на пункт навчального плану';


--
-- TOC entry 3255 (class 2606 OID 16648)
-- Name: students students_group_id_fkey; Type: FK CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.students
    ADD CONSTRAINT students_group_id_fkey FOREIGN KEY (group_id) REFERENCES faculty_ua.groups(group_id) NOT VALID;


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 3255
-- Name: CONSTRAINT students_group_id_fkey ON students; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON CONSTRAINT students_group_id_fkey ON faculty_ua.students IS 'Посилання на групу';


--
-- TOC entry 3266 (class 2606 OID 16653)
-- Name: subjects subjects_chair_id_fkey; Type: FK CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.subjects
    ADD CONSTRAINT subjects_chair_id_fkey FOREIGN KEY (chair_id) REFERENCES faculty_ua.chairs(chair_id) NOT VALID;


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 3266
-- Name: CONSTRAINT subjects_chair_id_fkey ON subjects; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON CONSTRAINT subjects_chair_id_fkey ON faculty_ua.subjects IS 'Посилання на кафедру (для нашого факультету)';


--
-- TOC entry 3261 (class 2606 OID 16658)
-- Name: tutors tutors_chair_id_fkey; Type: FK CONSTRAINT; Schema: faculty_ua; Owner: postgres
--

ALTER TABLE ONLY faculty_ua.tutors
    ADD CONSTRAINT tutors_chair_id_fkey FOREIGN KEY (chair_id) REFERENCES faculty_ua.chairs(chair_id) NOT VALID;


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 3261
-- Name: CONSTRAINT tutors_chair_id_fkey ON tutors; Type: COMMENT; Schema: faculty_ua; Owner: postgres
--

COMMENT ON CONSTRAINT tutors_chair_id_fkey ON faculty_ua.tutors IS 'Посилання на кафедру (для нашого факультету)';


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA faculty_ua; Type: ACL; Schema: -; Owner: postgres
--

-- Role: student
-- DROP ROLE IF EXISTS student;

CREATE ROLE student WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  CREATEDB
  CREATEROLE
  NOREPLICATION
  PASSWORD 'student';


GRANT USAGE ON SCHEMA faculty_ua TO student;

GRANT SELECT ON ALL TABLES IN SCHEMA faculty_ua TO student;


-- Completed on 2023-01-09 15:08:52

--
-- PostgreSQL database dump complete
--

