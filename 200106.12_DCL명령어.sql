-- DCL (CREATE USER ~, ALTER USER~, GRANT, REVOKE, DROP USER) - DBA권한이 있을 때 사용 가능.
CREATE USER gong IDENTIFIED BY gong;    --사용자 생성.로그인 아직 불가능
ALTER USER gong IDENTIfIED BY tiger;    --비밀번호 변경.로그인 불가
SELECT * FROM EMPV1;
GRANT CREATE SESSION TO gong;   --로그인 할수있는 권한. 여러번 GRANT(권한부여) 하지않고 권한객체를 만들어서 한번에 권한을 주는게 
CREATE ROLE ROLLEX1; --ROLLEX1 권한객체 생성
--ROLLEX1은 로그인, 테이블생성, 뷰생성할수있는 권한 객체
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO ROLLEX1;
GRANT ROLLEX1 TO gong;
GRANT SELECT ON EMPv1 TO gong;
SHOW USER;
GRANT ALL ON EMPv1 TO gong;
SELECT * FROM EMPv1;
SELECT * FROM EMP;  --EMP에도 데이터가 들어가 있다.