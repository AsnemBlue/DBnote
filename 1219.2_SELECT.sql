-- SELECT �� 
SELECT * FROM TAB; --scott(������ ��ҹ��� ����)�� ������ �ִ� ��� ���̺�
SELECT * FROM EMP; -- emp���̺��� ��� �ʵ�(��), ��� ������(��)
SELECT * FROM DEPT;
--DEPT ���̺��� ����(�ʵ庰 Ÿ��)
DESC DEPT; 
SELECT EMPNO, ENAME, SAL JOB FROM EMP; -- Ư�� �ʵ常 ���
SELECT EMPNO AS "���", ENAME AS "�̸�", SAL AS "�޿�", JOB AS "�۾�" FROM EMP;
SELECT EMPNO "���", ENAME "�̸�", SAL "�޿�", JOB "�۾�" FROM EMP;
SELECT EMPNO "NO", ENAME "NAME", SAL "SALARY", JOB "J" FROM EMP;
SELECT EMPNO AS "NO", ENAME AS ENAME, SAL AS SALARY, JOB AS J FROM EMP;
SELECT EMPNO NUM, ENAME NAME, SAL SALARY, JOB J FROM EMP;     --������ ���� ���� ���
SELECT EMPNO ���, ENAME �̸�, SAL �޿�, JOB �۾� FROM EMP;     --�ѱ��� �̷��� �� �Ⱦ�.�ѱ۷� �� ������ ����.
SELECT EMPNO, ENAME, DEPTNO FROM EMP;-- EMPNO, ENAME, DEPNO �ʵ��� ��� ������

--WHERE������ �񱳿����� ���
 --SAL�� 3000�� ������ ���, �̸�, �޿��� LIST(TITLE : ���, �̸�, �޿�)
SELECT EMPNO "���", ENAME "�̸�", SAL "�޿�" FROM EMP WHERE SAL=3000;  
-- SAL�� 3000�� �ƴ� ������ EMPNO, ENAME, SAL, COMM�ʵ� LIST
SELECT EMPNO, ENAME, COMM FROM EMP WHERE SAL != 3000;
SELECT EMPNO, ENAME, COMM FROM EMP WHERE SAL <> 3000;
SELECT EMPNO, ENAME, COMM FROM EMP WHERE SAL ^= 3000;
--�μ���ȣ(DEPTNO)�� 10���� ������ ��� �ʵ带 LIST
SELECT * FROM EMP WHERE DEPNO = 10;
--�̸��� FOED�� ������ ���� ���ʵ�
SELECT * FROM EMP WHERE ENAME = 'FORD'; --���ڴ� '��, �ʵ��� ������ �ٶ���"
SELECT * FROM EMP WHERE ENAME = 'ford';
--SAL�� 2000�̻� 3000�̸��� ������ ��� �ʵ�
SELECT * FROM EMP WHERE 2000<=SAL AND SAL<3000;
SELECT * FROM EMP WHERE ENAME<'E';
SELECT * FROM EMP WHERE ENAME<'EA';
SELECT * FROM EMP WHERE HIREDATE<'82/01/01';
SELECT * FROM EMP WHERE HIREDATE>='82/01/01' AND HIREDATE<'83/01/01';
--10���μ��̰ų� JOB�� 'MANAGER'�� ������ �̸�, �޿��� LIST
SELECT * FROM EMP WHERE job='MANAGER' OR DEPTNO=10;
--10�� �μ��� �ƴ� ��� ������ ��� �ʵ� LIST
SELECT * FROM EMP WHERE DEPTNO!=10;
SELECT * FROM EMP WHERE DEPTNO<>10;
SELECT * FROM EMP WHERE DEPTNO^=10;
--SAL(����)�� 2000�̻��� ������ �̸�, ������ LIST(COMM�� �����ϰ� ����)
SELECT ENAME, SAL*12 "����" FROM EMP WHERE SAL>2000;
--��������� �����, ��������, �ø�������(*1.1) LIST
SELECT ENAME, SAL, SAL*1.1 UPGRADE FROM EMP;
--SAL(����), ����(SAL*12+COMM)�̸�,����,��,���� �ʵ� ���
--������� NULL     NVL(NULL���ɼ��ʵ�,0) :ù��°, �ι�° �ŰԺ��� Ÿ���� ��ġ�ؾ� ��.
SELECT ENAME "�̸�", SAL "����", NVL(COMM,0) "��", SAL*12+NVL(COMM,0) "����" FROM EMP;
DESC EMP;
SELECT ENAME, NVL(HIREDATE,'81/01/01') FROM EMP;
SELECT ENAME, NVL(MGR,'�ְ�濵��') FROM EMP;
DESC EMP;
SELECT ENAME, NVL(MGR, 9999) FROM EMP;
-- ��������: AND OR
-- ||���Ῥ���� :���̳� ���ڸ� ����
SELECT ENAME||' '||JOB FROM EMP;
--"SMITH IS CLERK"(ENAME IS JOB) ��µǰ� TITLE�� EMPLOYEES��� ��� ���� LIST
SELECT ENAME || ' IS '||JOB AS "EMPLOYEES" FROM EMP;
--SMITH�� ������ XX��(����:SAL*12+COMM) TETLE:SALARY
SELECT ENAME || '�� ������ ' || (SAL*12+NVL(COMM,0)) "SALARY" FROM EMP;
--EMP TABLE�� JOB (�ߺ�����)
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;
SELECT DISTINCT JOB, DEPTNO FROM EMP;

--1. emp ���̺��� ���� ���
DESC EMP;
--2. emp ���̺��� ��� ������ ��� 
SELECT * FROM EMP;
--3. ������(scott)���� ��밡���� ���̺� ���
SELECT * FROM TAB;
--4. emp ���̺��� ���, �̸�, �޿�, ����, �Ի��� ���
SELECT EMPNO, ENAME, SAL, JOB, HIREDATE FROM EMP;
--5. emp ���̺��� �޿��� 2000�̸��� ����� ���, �̸�, �޿� ���
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL<2000;
--6. �Ի����� 81/02���Ŀ� �Ի��� ����� ���, �̸�, ����, �Ի��� ���
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE>='81/02/01';
--7. ������ SALESMAN�� ����� ��� �ڷ� ���
SELECT * FROM EMP WHERE JOB='SALESMAN';
--8. ������ CLERK�� �ƴ� ����� ��� �ڷ� ���
SELECT * FROM EMP WHERE JOB!='CLERK';
--9. �޿��� 1500�̻��̰� 3000������ ����� ���, �̸�, �޿� ���
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>=1500 AND SAL<=3000;
--10. �μ��ڵ尡 10���̰ų� 30�� ����� ���, �̸�, ����, �μ��ڵ� ���
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO=10 OR DEPTNO=30;
--11. ������ SALESMAN�̰ų� �޿��� 3000�̻��� ����� ���, �̸�, ����, �μ��ڵ� ���
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE JOB='SALESMAN' OR SAL>=3000;
--12. �޿��� 2500�̻��̰� ������ MANAGER�� ����� ���, �̸�, ����, �޿� ���
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL>=2500 AND JOB='MANAGER';
--13.��ename�� XXX �����̰� ������ XX�١� ��Ÿ�Ϸ� ��� ���
SELECT ENAME||'�� '||JOB||'�����̰� ������ '||(NVL(COMM,0)+SAL*12)||'��' FROM EMP;

--SQL������
--BETWEEN A AND B :A~B (��� ����)
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 1500 AND 3000;
--�ʵ�� IN(LIST1,...,LISTn)
--10. �μ��ڵ尡 10���̰ų� 30�� ����� ���, �̸�, ����, �μ��ڵ� ���
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO IN(10,30);
--�� �ʵ� LIKE ���� (���ϵ�ī��(%):�� �̻��� ����. ���ϵ�ī��(_):1�� �̻��� ����)
--�̸��� M���� �����ϴ� ����� ��� �ʵ带 ����ض�.
SELECT * FROM EMP WHERE ENAME LIKE 'M%';
--�̸��� N�� �� �ִ� ����� ��� �ʵ�
SELECT * FROM EMP WHERE ENAME LIKE '%N%';
-- 82�⵵�� �Ի��� ����� EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO ���
SELECT EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO FROM EMP WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';
SELECT EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO FROM EMP WHERE HIREDATE LIKE '82/__/__';
SELECT EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO FROM EMP WHERE HIREDATE LIKE '82%';

--2���� �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP WHERE HIREDATE LIKE '__/02/__';
--IS NULL
--COMM�� NULL�� ������ ���
SELECT * FROM EMP WHERE COMM IS NULL;
--NOT �ʵ� BETWEEN A AND B
--NOT �ʵ� IN(LISTS)
--NOT �ʵ� LIKE ����
--IS NOT NULL
SELECT * FROM EMP WHERE COMM IS NOT NULL; 
--ORDER BY �ʵ� (ASC)
--ORDER BY �ʵ� DESC
--�޿��� ���� ������� ���
SELECT * FROM EMP ORDER BY SAL DESC;
--�޿��� ���� �������
SELECT * FROM EMP ORDER BY SAL ASC;
SELECT * FROM EMP ORDER BY SAL;
--�Ի������� ���
SELECT * FROM EMP ORDER BY HIREDATE;
--�ֱ� �Ի����
SELECT * FROM EMP ORDER BY HIREDATE DESC;
--�̸� ���ĺ� ����
SELECT * FROM EMP ORDER BY ENAME;
--������ ���� ���� �̸�, SAL, ����
SELECT ENAME, SAL,SAL*12+NVL(COMM,0) "����" FROM EMP ORDER BY ����;
--������ 2000 �̻��� ������ �̸�, ������ ���(���������� ����)
SELECT ENAME, SAL*12+NVL(COMM,0) "����" FROM EMP WHERE SAL*12+NVL(COMM,0)>=2000 ORDER BY ����;
--FROM -> WHERE -> SELECT -> ORDER BY 

--1.	EMP ���̺��� sal�� 3000�̻��� ����� empno, ename, job, sal�� ���
SELECT EMPNO, ENAME, JOB, SAL 
    FROM EMP 
    WHERE SAL>=3000;
--2.	EMP ���̺��� empno�� 7788�� ����� ename�� deptno�� ���
SELECT ENAME, DEPTNO 
    FROM EMP 
    WHERE EMPNO=7788;
--3.	������ 24000�̻��� ���, �̸�, �޿� ��� (�޿�������)
SELECT EMPNO, ENAME, SAL 
    FROM EMP 
    WHERE (SAL*12+NVL(COMM,0))>=24000 
    ORDER BY SAL;
--4.	EMP ���̺��� hiredate�� 1981�� 2�� 20�� 1981�� 5�� 1�� ���̿� �Ի��� ����� ename,job,hiredate�� ����ϴ� SELECT ������ �ۼ� (�� hiredate ������ ���)
SELECT ENAME, JOB, HIREDATE 
    FROM EMP 
    WHERE HIREDATE 
    BETWEEN TO_DATE('1981/02/20','YYYY/MM/DD') AND TO_DATE('1981/05/01' ,'YYYY/MM/DD')
    ORDER BY HIREDATE;
--5.	EMP ���̺��� deptno�� 10,20�� ����� ��� ������ ��� (�� ename������ ����)
SELECT * 
    FROM EMP 
    WHERE DEPTNO IN(10,20) 
    ORDER BY ENAME;
--6.	EMP ���̺��� sal�� 1500�̻��̰� deptno�� 10,30�� ����� ename�� sal�� ���(�� HEADING�� employee�� Monthly Salary�� ���)
SELECT ENAME "employee", SAL "Monthly Salary" 
    FROM EMP 
    WHERE SAL>1500 AND DEPTNO IN(10,30);
--7.	EMP ���̺��� hiredate�� 1982���� ����� ��� ������ ���
SELECT * 
    FROM EMP 
    WHERE HIREDATE 
    LIKE '82%';
SELECT * 
    FROM EMP 
    WHERE TO_CHAR(HIREDATE,'YYYY/MM/DD') 
    LIKE '1982%';
--8.	�̸��� ù�ڰ� C����  P�� �����ϴ� ����� �̸�, �޿� �̸��� ����
SELECT ENAME, SAL 
    FROM EMP 
    WHERE (ENAME BETWEEN 'C' AND 'Q') AND ENAME!='Q%'
    ORDER BY ENAME;
--9.	EMP ���̺��� comm�� sal���� 10%�� ���� ��� ����� ���Ͽ� �̸�, �޿�, �󿩱��� ����ϴ� SELECT ���� �ۼ�
SELECT ENAME, SAL, COMM 
    FROM EMP 
    WHERE COMM>SAL*1.1;
--10.	EMP ���̺��� job�� CLERK�̰ų� ANALYST�̰� sal�� 1000,3000,5000�� �ƴ� ��� ����� ������ ���
SELECT * 
    FROM EMP 
    WHERE JOB IN('CLERK', 'ANALYST') AND NOT SAL IN (1000,3000,5000);
--11.	EMP ���̺��� ename�� L�� �� �ڰ� �ְ� deptno�� 30�̰ų� �Ǵ� mgr�� 7782�� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * 
    FROM EMP 
    WHERE (ENAME LIKE '%L%L%' AND DEPTNO = 30) OR MGR = 7782 ;
--12.	��� ���̺��� �Ի����� 81�⵵�� ������ ���,�����, �Ի���, ����, �޿��� ���
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL 
    FROM EMP 
    WHERE HIREDATE LIKE '81%';
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL 
    FROM EMP 
    WHERE TO_CHAR(HIREDATE,'YY')=81;
--13.	��� ���̺��� �Ի�����81���̰� ������ 'SALESMAN'�� �ƴ� ������ ���, �����, �Ի���, ����, �޿��� �˻��Ͻÿ�.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL 
    FROM EMP 
    WHERE HIREDATE LIKE '81%' AND JOB!='SALESMAN';
--14.	��� ���̺��� ���, �����, �Ի���, ����, �޿��� �޿��� ���� ������ �����ϰ�, �޿��� ������ �Ի����� ���� ������� �����Ͻÿ�.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL 
    FROM EMP 
    ORDER BY SAL DESC, HIREDATE;
--15.	��� ���̺��� ������� �� ��° ���ĺ��� 'N'�� ����� ���, ������� �˻��Ͻÿ�
SELECT EMPNO, ENAME 
    FROM EMP 
    WHERE ENAME LIKE '__N%';
--16.	��� ���̺�������(SAL*12)�� 35000 �̻��� ���, �����, ������ �˻� �Ͻÿ�.
SELECT EMPNO, ENAME, SAL*12 "����" 
    FROM EMP 
    WHERE SAL*12 >=35000;

ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD'; --DATE��������
SELECT HIREDATE FROM EMP;

--TO_CHAR(��¥�� �ʵ�,'YYYY/MM/DD')->YYYY/MM/DD��Ÿ���� ���������� ��ȯ
--TO_DATE('1981/01/01','YYYY/MM/DD')->���������� ��ȯ.

SELECT * FROM EMP WHERE ENAME='SMITH';


























