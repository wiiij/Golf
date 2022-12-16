CREATE TABLE TBL_TEACHER_202201(
TEACHER_CODE CHAR(3) NOT NULL PRIMARY KEY,
TEACHER_NAME VARCHAR2(15),
CLASS_NAME VARCHAR2(20),
CLASS_PRICE NUMBER(8),
TEACH_RESIST_DATE DATE
);

INSERT INTO TBL_TEACHER_202201 VALUES('100', '이초급', '초급반', 100000 ,'20220101');
INSERT INTO TBL_TEACHER_202201 VALUES('200', '김중급', '중급반', 200000 ,'20220102');
INSERT INTO TBL_TEACHER_202201 VALUES('300', '박고급', '고급반', 300000 ,'20220103');
INSERT INTO TBL_TEACHER_202201 VALUES('400', '정심화', '심화반', 400000 ,'20220104');

select * from TBL_TEACHER_202201;
drop table TBL_TEACHER_202201

select TEACHER_CODE,TEACHER_NAME,CLASS_NAME,to_char(CLASS_PRICE,'FM990,999') as C,to_char(TEACH_RESIST_DATE,'yyyy\"년\"mm\"월\"dd\"일\"') as D  from TBL_TEACHAR_202201;

CREATE TABLE TBL_MEMBER_202201(
C_NO CHAR(5) NOT NULL PRIMARY KEY,
C_NAME VARCHAR2(15),
PHONE VARCHAR2(11),
ADDRESS VARCHAR2(50),
GRADE VARCHAR2(6)
);

INSERT INTO TBL_MEMBER_202201 VALUES('10001', '홍길동', '01011112222', '서울시 강남구' ,'일반');
INSERT INTO TBL_MEMBER_202201 VALUES('10002', '장발장', '01022223333', '성남시 분당구' ,'일반');
INSERT INTO TBL_MEMBER_202201 VALUES('10003', '임꺽정', '01033334444', '대전시 유성구' ,'일반');
INSERT INTO TBL_MEMBER_202201 VALUES('20001', '성춘향', '01044445555', '부산시 서구' ,'VIP');
INSERT INTO TBL_MEMBER_202201 VALUES('20002', '이몽룡', '01055556666', '대구시 북구' ,'VIP');

select * from TBL_MEMBER_202201
drop table TBL_MEMBER_202201

CREATE TABLE TBL_CLASS_202201(
RESIST_MONTH VARCHAR2(6) NOT NULL,
C_NO CHAR(5) NOT NULL,
CLASS_AREA VARCHAR2(15),
TUITION NUMBER(8),
TEACHER_CODE CHAR(3),
PRIMARY KEY(RESIST_MONTH, C_NO)
);

select substr(c.resist_month,1,4) || '년' || substr(c.resist_month,5,2) || '월' resist_month, c.c_no, m.c_name, t.class_name, c.class_area, to_char(c.tuition, 'L999,999') tuition, m.grade from tbl_class_202201 c, tbl_member_202201 m, TBL_TEACHER_202201 t where c.c_no = m.c_no and c.teacher_code = t.teacher_code

INSERT INTO TBL_CLASS_202201 VALUES('202203', '10001', '서울본원', 100000 ,'100');
INSERT INTO TBL_CLASS_202201 VALUES('202203', '10002', '성남분원', 100000 ,'100');
INSERT INTO TBL_CLASS_202201 VALUES('202203', '10003', '대전분원', 200000 ,'200');
INSERT INTO TBL_CLASS_202201 VALUES('202203', '20001', '부산분원', 150000 ,'300');
INSERT INTO TBL_CLASS_202201 VALUES('202203', '20002', '대구분원', 200000 ,'400');

select * from TBL_CLASS_202201; 
drop table TBL_CLASS_202201

select substr(c.resist_month,1,4)||'년'|| substr(c.resist_month,5,2)||'월' resist_month, m.c_no, m.c_name, t.class_name, c.class_area 
from TBL_CLASS_202201 c, TBL_MEMBER_202201 m, TBL_TEACHAR_202201 t
where c.c_no = m.c_no and c.teacher_code = t.teacher_code

select substr(c.resist_month,1,4) || '년' || substr(c.resist_month,5,2) || '월' resist_month, c.c_no, m.c_name, t.class_name, c.class_area, to_char(c.tuition, 'L999,999') tuition, m.grade 
from TBL_CLASS_202201 c, TBL_MEMBER_202201 m, TBL_TEACHER_202201 t 
where c.c_no = m.c_no and c.teacher_code = t.teacher_code

select T.TEACHER_CODE,T.CLASS_NAME,T.TEACHER_NAME, to_char(sum(C.TUITION), 'L999,999')TUITION from TBL_TEACHER_202201 T,TBL_CLASS_202201 C
where T.TEACHER_CODE=C.TEACHER_CODE
group by T.TEACHER_CODE,T.CLASS_NAME,T.TEACHER_NAME,C.TUITION
order by T.TEACHER_CODE

