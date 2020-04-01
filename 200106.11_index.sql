--조회속도를 높이기 위한 인덱스
drop table EMP01;
CREATE TABLE EMP01
    AS
    SELECT * FROM EMP;
INSERT INTO EMP01 SELECT * FROM EMP01;
SELECT COUNT(*) FROM EMP01;
INSERT INTO EMP01 SELECT * FROM EMP01;
INSERT INTO EMP01 SELECT * FROM EMP01;
SELECT COUNT(*) FROM EMP01; --2번실행하여 100개 가량.
DESC EMP01;
INSERT INTO EMP01 (EMPNO, ENAME) VALUES (1111,'HONG');  --데이터의 1&가 HONG
INSERT INTO EMP01 SELECT * FROM EMP01;
SELECT TO_CHAR(COUNT(*),'9,999,999') FROM EMP01;
SELECT * FROM USER_INDEXES; --EMP01과 관련된 인덱스는 없음 확인
SELECT * FROM EMP01 WHERE ENAME='HONG' ; --0.007초
CREATE INDEX IDX_EMP01_ENAME ON EMP01(ENAME);
SELECT * FROM EMP01 WHERE ENAME='HONG'; -- 0.005초
DROP INDEX IDX_EMP01_ENAME;