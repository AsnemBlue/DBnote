--4�� ������ �Լ�
SELECT ENAME, TO_CHAR(HIREDATE, 'RR-MM-DD DAY AM HH:MI:SS') FROM EMP;
SELECT SUM(SAL) FROM EMP;   --EMP���̺��� SAL���� ��-�׷��Լ�(�������Լ�)
SELECT DEPTNO, SUM(SAL)
    FROM EMP
    GROUP BY DEPTNO;    --�׷��� �Լ�

--������ �Լ��� ���� : ���ڰ����Լ�, ����ó���Լ�, ��¥�����Լ�, ����ȯ�Լ�, NULL, DECODE, ETC.
--(1)���� ���� �Լ�
SELECT ABS(-9)FROM EMP;
--�ƹ� �ǹ� ���� 1��¥�� ���̺�:U
SELECT * FROM DUAL;

--����
SELECT FLOOR(34.5678)FROM DUAL;--�Ҽ��� ���ϸ� ����
SELECT FLOOR(34.5678*10)/10 FROM DUAL;
SELECT TRUNC(34.5678,2) FROM DUAL; --�Ҽ��� ������� ����
SELECT TRUNC(156.54,-1) FROM DUAL;
--�̸�, SAL(�����ڸ� �������� ���)
SELECT ENAME, TRUNC(SAL,-3) FROM EMP;

--�ݿø�
SELECT ROUND(34.5678) FROM DUAL; --�Ҽ������� �ݿø�
SELECT ROUND(34.5678,3) FROM DUAL;
SELECT ROUND(34.5678,-1) FROM DUAL;
--�̸�, SAL(�����ڸ� �ݿø� ���)
SELECT ENAME, ROUND(SAL,-3) FROM EMP;

--�ø�
SELECT CEIL(34.5678) FROM DUAL;

SELECT FLOOR(10/4) FROM DUAL; --LIKE JAVA
SELECT POWER(3,2) FROM DUAL; --3^2=9
SELECT MOD(9,2) FROM DUAL;
--Ȧ���޿� �Ի��� �������� ��� �ʵ� ���
SELECT * 
    FROM EMP
    WHERE MOD(TO_CHAR(HIREDATE,'MM'),2)=1;


--(2)���� �����Լ�
SELECT UPPER('ABCabc') FROM DUAL;--�빮�ڷ�
SELECT LOWER('ABCabc') FROM DUAL;--�ҹ��ڷ�
SELECT INITCAP('abcABC') FROM DUAL;--ù���ڸ� �빮�ڷ�.
--JOB=MANAGER�� ������ ��� �ʵ�
SELECT *
    FROM EMP
    WHERE UPPER(JOB)='MANAGER';
SELECT EMPNO, INITCAP(ENAME), INITCAP(JOB)
    FROM EMP;
--CONCAT(A,B)
SELECT CONCAT(CONCAT('ABC','DEF'),'GHI') FROM DUAL;
--???�� JOB�̴�.
SELECT CONCAT(CONCAT(ENAME,'�� '),CONCAT(JOB,'�̴�')) TITLE --TITLE�� �־�� �ڹٿ��� ����(Ư������,���ڽ��� �Ұ���)
    FROM EMP;
--SUBSTR(STR, ��������ġ, �����Ұ���) ù��° ��ġ�� 1.
--SUBSTRB(STR, ��������ġ, �����Ұ���) ù��° ��ġ�� 1.
SELECT SUBSTR('welcom to Oracle',3,2) FROM DUAL; ---'lc'
SELECT SUBSTR('welcom to Oracle',-3,3) FROM DUAL; --'cle'
--SUBSTR�̿�, ¦�����ڿ� �Ի��� ������ ��� �ʵ�(��¥ ǥ�� ����)
SELECT *
    FROM EMP
    WHERE MOD(SUBSTR(HIREDATE,-1,1),2)=0;
SELECT SUBSTR('�����ͺ��̽�',2,2) FROM DUAL; --����
SELECT SUBSTRB('�����ͺ��̽�',4,6) FROM DUAL; --BYTE
--9���� �Ի��� ����� ��� �ʵ带 ���
SELECT *
    FROM EMP
    WHERE HIREDATE LIKE '%/09/%';
--SUBSTR()�Լ�
SELECT *
    FROM EMP
    WHERE SUBSTR(HIREDATE,4,2)='09';
--TO_CHAR() �Լ�
SELECT *
    FROM EMP
    WHERE TO_CHAR(HIREDATE,'MM')='09';
SELECT *
    FROM EMP
    WHERE TO_CHAR(HIREDATE,'MM')=9;
SELECT SUBSTR('ABCD',2,3)
    FROM EMP;
--LENGTH(����), LENGTHB
SELECT LENGTH('ABCD'), LENGTHB('ABCD') FROM DUAL;
SELECT LENGTH('����Ŭ'), LENGTHB('����Ŭ') FROM DUAL;
--INSTR(STRING, ã������) : STRING���� ã�������� ��ġ
--INSTR(STRING, ã������, ������ġ) : STRING���� ã�������� ��ġ
--INSTR(STRING, ã������, ������ġ, K) : STRING���� ã�������� K��° ��ġ
SELECT INSTR('ABCABCABC','B') FROM DUAL;
SELECT INSTR('ABCABCABC','B',3) FROM DUAL;
SELECT INSTR('ABCABCABC','B',3,2) FROM DUAL;
--9���� �Ի��� ����
SELECT *
    FROM EMP
    WHERE INSTR(HIREDATE,'09') = 4;
--LPAD/RPAD(STRING, 10, '*')
SELECT LPAD('ORACLE',20,'#') FROM DUAL;
SELECT RPAD('ORACLE',20,'#') FROM DUAL;
SELECT ENAME, LPAD(SAL,6,'*') FROM EMP;
--TRIM, LTRIM, RTRIM
SELECT TRIM('       ORACLE DB      ')FROM DUAL;
SELECT LTRIM('       ORACLE DB      '),RTRIM('       ORACLE DB      ')FROM DUAL;
SELECT TRIM('a' FROM 'aaaORACLE DBaaa') FROM DUAL;
--REPLACE(����, ������, �ٲܱ���)
SELECT REPLACE('abcabc','a','999') FROM DUAL;
--83�⵵�� �Ի��� ������ �˾Ƴ��� ���� SUBSTR �Լ��� �̿��Ͽ� HIREDATE �÷����� 
--ù ���ں��� 2���� �����Ͽ� �� ���� 83������ üũ�ϴ� ������ε� ���� ������ �ϼ���. 
SELECT *
    FROM EMP
    WHERE SUBSTR(HIREDATE,1,2)=83;
--������ �̸��� E�� ������ ����� �˻��� ������ �սô�. 
--SUBSTR �Լ��� �̿��Ͽ� ENAME �÷��� ������ ���� �Ѱ��� �����ؼ� �̸��� E�� ������ ����� �˻��� ������ �Ͻÿ�. 
SELECT *
    FROM EMP
    WHERE SUBSTR(ENAME, -1,1)='E';
--�̸��� E�� ������ ����� �̸�(****E)����ϱ�
SELECT LPAD(SUBSTR(ENAME, -1,1),5,'*')
    FROM EMP
    WHERE SUBSTR(ENAME, -1,1)='E';
--���, �̸�(S****), ��å, �Ի���(81/09/**)
SELECT EMPNO, RPAD(SUBSTR(ENAME, -1,1),5,'*'), JOB, RPAD(SUBSTR(HIREDATE, 1,6),8,'*')
    FROM EMP;
--���, �̸�, ��å�� ���(��å�� �̸��� ���ڿ� ����ŭ��ǥ��)


--(3) ��¥���� ������ �Լ�
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YY-MM-DD MON MONTH DAY HH24:MI:SS','NLS_DATE_LANGUAGE=ENGLISH')FROM DUAL;
SELECT SYSDATE-1 "����", SYSDATE+1 "����" FROM DUAL;
SELECT TO_CHAR(SYSDATE+14, 'YY-MM-DD HH24') FROM DUAL;
--�̸�,�Ի���,�ٹ�����
SELECT ENAME,HIREDATE, TRUNC(SYSDATE-HIREDATE) "�ٹ�����" FROM EMP;
SELECT ENAME, HIREDATE, TRUNC((SYSDATE-HIREDATE)/365) "�ٹ��⵵" FROM EMP;
--MONTH_BETWEEN
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "�ٹ��޼�" FROM EMP;
SELECT ENAME, TRUNC(MONTHS_BETWEEN(HIREDATE, SYSDATE)) FROM EMP;
--ADD_MONTHS(Ư����¥, N) : Ư����¥���� N���� ��
--ENAME, HIREDATE, �����Ⱓ�� ��������(6����)
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE,6) FROM EMP;
--NEXT_DAY(Ư����¥, '��') Ư����¥�� ó�� �����ϴ� ����
SELECT SYSDATE, NEXT_DAY(SYSDATE,'��')FROM DUAL;
--����̸�, �Ի���, �Ի��� �´� ù�ָ�
SELECT ENAME, HIREDATE, NEXT_DAY(SYSDATE, '��') FROM EMP;
--LAST_DAY(Ư����¥) ; Ư����¥�� ���� ����
--ENAME, �Ի���, ȸ���� ���޳�(����)
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE) FROM EMP;
--�� ���� ����
SELECT LAST_DAY(SYSDATE) FROM DUAL;
--ROUND(�ݿø�),TRUNC(����) - YEAR, MONTH, DAY, DEFAULT
SELECT ROUND(SYSDATE, 'YEAR') FROM DUAL;
SELECT TRUNC(SYSDATE, 'YEAR') FROM DUAL;
SELECT ROUND(SYSDATE, 'MONTH') FROM DUAL;
SELECT TRUNC(SYSDATE, 'MONTH') FROM DUAL;
SELECT TRUNC(SYSDATE, 'DAY') FROM DUAL;
SELECT ROUND(TO_DATE('191226','YYMMDD'),'DAY') FROM DUAL;
SELECT TRUNC(TO_DATE('191226','YYMMDD'),'DAY') FROM DUAL;
SELECT ROUND(SYSDATE) FROM DUAL; --DEFAULT �ݿø� ���:0�� 0�� 0��
SELECT TO_CHAR(ROUND(SYSDATE),'YY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(TRUNC(SYSDATE),'YY-MM-DD HH24:MI:SS') FROM DUAL;

--ENAME, �Ի���, �Ի��ϴ��� 1��
SELECT ENAME, HIREDATE, TRUNC(HIREDATE,'MONTH') FROM EMP;
--ENAME, �Ի���, ���޳�(����)
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE) PAYDAY FROM EMP;
--ENAME, �Ի���, ���޳�(25��)
SELECT ENAME, HIREDATE, ROUND(HIREDATE-9,'MONTH')+24 PAYDAY FROM EMP;
--ENAME, �Ի���, ���޳�(17��)
SELECT ENAME, HIREDATE, ROUND(HIREDATE-1,'MONTH')+16 PAYDAY FROM EMP;
--ENAME, �Ի���, SAL(����), �̶����� ���� ���� ��
SELECT ENAME, HIREDATE, SAL, TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE ))*SAL FROM EMP;
--ENAME, �Ի���, SAL, COMM, �̶����� ���� �Ѿ�
SELECT ENAME, HIREDATE, SAL, COMM, SAL*TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE))+NVL(COMM,0)*TRUNC((SYSDATE-HIREDATE)/365)
    FROM EMP;

--(4) ����ȯ�Լ�
--TO_CHAR(��¥, ����) ��¥�� ���ڷ�
--YY, MM, DD, DAY/DY, AM HH/HH24, MI, SS
--���ϳ��� ���ĺ��̳� Ư������ ��밡�ɿܷ����ϰ�� ""
SELECT ENAME, SAL, TO_CHAR(HIREDATE,'YYYY/MON/DD DAY AM HH:MI:SS') FROM EMP;
SELECT TO_CHAR(SYSDATE, 'YY"��"MM"��"DD DAY HH"��"MI"��"SS"��"') FROM DUAL; 
SELECT TO_CHAR(SYSDATE, 'MM-DD') FROM DUAL;
--TO_CHAR(����, ����) ���ڸ� ���ڷ�
--���ϳ� 0(�ڸ���, �ڸ��� ���������� 0ǥ��.)
--      9(�ڸ���, �ڸ����� ���� ������ ä���� �ʴ´�.)
--      L(���� ��ȭ���� ����)
--      $($��ȭ����)
--      ,(1000���� ǥ��)
SELECT ENAME, SAL, TO_CHAR(SAL, 'L000,000.0') FROM EMP;
SELECT ENAME, SAL, TO_CHAR(SAL, '$999,990.9') FROM EMP;
--TO_DATE(����, ����) ���ڸ� ��¥����
--DATE_FORMAT�� �� ���¿��� 81��5��1�Ϻ��� 83��5��1�� ���̿� �Ի��� �������� ��� �ʵ�
SELECT * FROM EMP 
    WHERE HIREDATE BETWEEN TO_DATE('810501','RRMMDD') AND TO_DATE('830501','RRMMDD');
--2019,8,1�� ���� ������ ����°����
SELECT CEIL(SYSDATE - TO_DATE('190801','YYMMDD')) FROM DUAL;
--TO_NUMBER(����, ����)���ڸ� ���ڷ� '9,876'->9876
SELECT TO_NUMBER('1,000','9,999')+1000 FROM DUAL;

--(5)NULL ���� �Լ�=NVL(���ϼ��� �ִ� ������, ���̸� ��� �� ��)
--����̸�, ����� �̸�(��簡 ������ 'CEO'��� ���)
SELECT W.ENAME, NVL(M.ENAME,'CEO')
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);
--����̸�, MGR(MGR�� NULL�̸� 'CEO'��� ���)
SELECT ENAME, NVL(TO_CHAR(MGR),'CEO') MGR
    FROM EMP;

--(6) DECODE(������, ��1, ���1, ��2, ���2, ��3, ���3,...��N, ���N, �׿ܰ��)
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO;
SELECT JOB, SUM(SAL) FROM EMP GROUP BY JOB;
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP E,DEPT D
    WHERE W.DEPTNO=D.DEPTNO;
SELECT ENAME, DEPTNO, DECODE(DEPTNO,10,'ACCOUNTING',20,'RESEARCH',
                                    30,'SALES',40,'OPERATIONS','ETC') AS "DNAME"
    FROM EMP;
SELECT ENAME, DEPTNO, CASE WHEN DEPTNO=10 THEN 'ACCOUNTING'
                           WHEN DEPTNO=20 THEN 'RESEARCH'
                           WHEN DEPTNO=30 THEN 'SALES'
                           WHEN DEPTNO=40 THEN 'OPERATIONS'
                           ELSE 'ETC' END AS "DNAME" FROM EMP;
SELECT ENAME, DEPTNO, CASE DEPTNO WHEN 10 THEN 'ACCOUNTING'
                                  WHEN 20 THEN 'RESEARCH'
                                  WHEN 30 THEN 'SALES'
                                  WHEN 40 THEN 'OPERATIONS'
                                  ELSE 'ETC' END AS "DNAME" FROM EMP;
--������ SAL�� �̿��ؼ� ������ SAL�� JOB�� ���� 'ANALYST' 10%�λ�, 'SALESMAN' 20%�λ�, 'MANAGER' 30%�̻�, 'CLERK' 40%�λ�
--���, �̸�, ������SAL, �λ�� SAL
SELECT EMPNO, ENAME, SAL, CASE JOB WHEN 'ANALYST' THEN SAL*1.1 
                                   WHEN 'SALESMAN' THEN SAL*1.2
                                   WHEN 'MANAGER' THEN SAL*1.3
                                   WHEN 'CLERK' THEN SAL*1.4
                                   ELSE SAL END AS "�λ��SAL" FROM EMP;
SELECT EMPNO, ENAME, SAL, DECODE(JOB, 'ANALYST', SAL*1.1, 'SALESMAN', SAL*1.2, 
                                    'MANAGER', SAL*1.3, 'CLERK', SAL*1.4, SAL) AS "�λ��SAL" FROM EMP;
--�Ի��� �⵵��
SELECT TO_CHAR(HIREDATE,'YYYY') FROM EMP;
SELECT ENAME, EXTRACT(YEAR FROM HIREDATE) FROM EMP; --�⵵�� �����ϴ� �Լ�
SELECT ENAME, EXTRACT(MONTH FROM HIREDATE) FROM EMP;

--(7)�׿�
--LEVEL, START WITH, CONNECT BY PRIOR
SELECT LEVEL,LPAD(' ',LEVEL*2)||'>'||ENAME, MGR FROM EMP
    WHERE ENAME!='SCOTT' 
    START WITH MGR IS NULL
    CONNECT BY PRIOR EMPNO = MGR; -- �������� �Ʒ������� ��������

