--��������
--���� ��¥�� ����ϰ� �� ���̺��� Current Date�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT SYSDATE "Current Date" FROM DUAL;
--EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL, SAL*1.15 "New Salary", SAL*0.15 "Increase" FROM EMP;
--EMP ���̺��� �̸�,�Ի���,�Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,6),'��') FROM EMP;
--EMP ���̺��� �̸�,�Ի���, �Ի��Ϸκ��� ��������� ����,�޿�, �Ի��Ϻ��� ��������� �޿��� �Ѱ踦 ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "������� ����", TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE))*SAL "������� �޿��Ѱ�" FROM EMP;
--EMP ���̺��� ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ �� ���� ��*���� ��ġ)�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, LPAD(SAL, 15, '*') SAL FROM EMP;
--EMP ���̺��� ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, JOB, HIREDATE "�Ի���", TO_CHAR(HIREDATE,'DAY')"�Ի��� ����" FROM EMP;
--EMP ���̺��� �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, LENGTH(ENAME) "�̸��� ���ڼ�",JOB 
    FROM EMP
    WHERE LENGTH(ENAME)>=6;
--EMP ���̺��� ��� ����� ������ �̸�, ����, �޿�, ���ʽ�, �޿�+���ʽ��� ����ϴ� SELECT ������ ����Ͻÿ�
SELECT ENAME, JOB, SAL, NVL(COMM, 0) COMM, SAL+NVL(COMM, 0) SUMSAL FROM EMP;
--��� ���̺��� ������� 2��° ���ں��� 3���� ���ڸ� �����Ͻÿ�. 
SELECT SUBSTR(ENAME,2,3) FROM EMP;
--��� ���̺��� �Ի����� 12���� ����� ���, �����, �Ի����� �˻��Ͻÿ�
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    WHERE TO_CHAR(HIREDATE,'MM')=12;
--������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
--EMPNO		ENAME		�޿�
--7369		SMITH		*******800
--7499		ALLEN		******1600
--7521		WARD		******1250
--����.
SELECT EMPNO, ENAME, LPAD(SAL, 10, '*') "�޿�" FROM EMP;
--������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
--EMPNO	 ENAME 	�Ի���
--7369	  SMITH		1980-12-17
--��.
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE,'YYYY-MM-DD') "�Ի���" FROM EMP;
--��� ���̺��� �޿��� ���� ���, �̸�, �޿�, ����� �˻��ϴ� SQL ������ �ۼ� �Ͻ� ��. (Hint : CASE �Լ� ���) 
--�޿��� 0~1000 E / 1001~2000 D / 2001~3000 C / 3001~4000 B / 4001~5000 A
--   (cf) �޿���- 0~999 E / 1000~1999 D / 2000~2999 C / 3000~3999 B / 4000�̻� A
SELECT EMPNO, ENAME, SAL, CASE WHEN SAL<=1000 THEN 'E'
                               WHEN SAL<=2000 THEN 'D'
                               WHEN SAL<=3000 THEN 'C'
                               WHEN SAL<=4000 THEN 'B'
                               WHEN SAL<=5000 THEN 'A' 
                                END "GRADE" FROM EMP;
--14. ��� ���̺��� �μ���ȣ�� 20�� ����� ���, �̸�, ����, �޿��� ����Ͻÿ�(�޿��� �տ� $�� �����ϰ� 3�ڸ����� ,�� ����Ѵ�)
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL,'$99,999') 
    FROM EMP
    WHERE DEPTNO=20;
