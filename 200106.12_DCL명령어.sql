-- DCL (CREATE USER ~, ALTER USER~, GRANT, REVOKE, DROP USER) - DBA������ ���� �� ��� ����.
CREATE USER gong IDENTIFIED BY gong;    --����� ����.�α��� ���� �Ұ���
ALTER USER gong IDENTIfIED BY tiger;    --��й�ȣ ����.�α��� �Ұ�
SELECT * FROM EMPV1;
GRANT CREATE SESSION TO gong;   --�α��� �Ҽ��ִ� ����. ������ GRANT(���Ѻο�) �����ʰ� ���Ѱ�ü�� ���� �ѹ��� ������ �ִ°� 
CREATE ROLE ROLLEX1; --ROLLEX1 ���Ѱ�ü ����
--ROLLEX1�� �α���, ���̺����, ������Ҽ��ִ� ���� ��ü
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO ROLLEX1;
GRANT ROLLEX1 TO gong;
GRANT SELECT ON EMPv1 TO gong;
SHOW USER;
GRANT ALL ON EMPv1 TO gong;
SELECT * FROM EMPv1;
SELECT * FROM EMP;  --EMP���� �����Ͱ� �� �ִ�.