--5. �׷��Լ�
SELECT SUM(SAL) FROM EMP;
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO;
SELECT DEPTNO, SUM(SAL) 
    FROM EMP 
    WHERE ENAME!='SMITH'
    GROUP BY DEPTNO
    HAVING SUM(SAL)>9000
    ORDER BY DEPTNO;

--EMP���̺��� ��� SAL
SELECT ROUND(AVG(SAL),2) FROM EMP;
SELECT COUNT(*) FROM EMP;
SELECT SUM(SAL)/COUNT(SAL), AVG(SAL) FROM EMP;
SELECT SUM(COMM)/COUNT(COMM), AVG(COMM) FROM EMP; -- �׷��Լ��� ��� NULL�� ����.
SELECT COUNT(*) FROM EMP WHERE COMM IS NOT NULL;
--ǥ������
SELECT VARIANCE(SAL), STDDEV(SAL)*STDDEV(SAL) FROM EMP;
SELECT DEPTNO, AVG(SAL), STDDEV(SAL) FROM EMP GROUP BY DEPTNO ORDER BY AVG(SAL);

SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;
SELECT COUNT(JOB) FROM EMP; --14�� ���͹���
SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB;
SELECT COUNT(DISTINCT JOB) FROM EMP; --������ ���� ����
--���� �ֱٿ� �Ի��� ������ �Ի��ϰ� ���� ���ʿ� �Ի��� ������ �Ի��� ���
SELECT MIN(HIREDATE), MAX(HIREDATE) FROM EMP;
SELECT MIN(ENAME), MAX(ENAME) FROM EMP;
--�ֱٿ� �Ի��� ������ �Ի���, �ٹ���, �Ի����� ���� ������ ������ �Ի���, �ٹ���
SELECT MAX(HIREDATE), TRUNC(SYSDATE-MAX(HIREDATE)), MIN(HIREDATE), TRUNC(SYSDATE-MIN(HIREDATE)) FROM EMP;
--10�� �μ� �Ҽ��� ����� ��� �޿�
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=10;
SELECT COUNT(COMM) FROM EMP WHERE DEPTNO=30;
--�׷��Լ��� ������ WHERE �Ұ�
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL)>2000;
--�μ��� ��� �޿��� ���(�μ��� ABC��)
SELECT DNAME, ROUND(AVG(SAL)) "��� �޿�" FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO GROUP BY DNAME ORDER BY DNAME;
--�μ���ȣ��������� �󿩱��� �޴� �����
SELECT DEPTNO, COUNT(*), COUNT(COMM) FROM EMP GROUP BY DEPTNO;
--�μ��̸��� ������� �󿩱� �޴� �����
SELECT DNAME "�μ�", COUNT(*), COUNT(COMM) 
    FROM EMP, DEPT 
    WHERE EMP.DEPTNO = DEPT.DEPTNO 
    GROUP BY DNAME     --�׷쿣 ALIAS �Ұ���.
    ORDER BY �μ�;
   
-- �� ��������
-- 1. ��� ���̺��� �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ����Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT COUNT(*) "�ο���", MAX(SAL) "�ִ� �޿�", MIN(SAL) "�ּ� �޿�", SUM(SAL) "�޿��� ��" FROM EMP;
-- 2. ������̺��� ������ �ο����� ���Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT JOB, COUNT(*) "�ο���" FROM EMP GROUP BY JOB;
--- 3. ������̺��� �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ����ϴ� SELECT������ �ۼ��Ͽ���.
SELECT MAX(SAL)-MIN(SAL) FROM EMP;
-- 4. �� �μ����� �ο���, �޿� ���, ���� �޿�, �ְ� �޿�, �޿��� ���� ����ϵ� �޿��� ���� ���� ������ ����϶�.
SELECT DNAME, COUNT(*) "�ο���", ROUND(AVG(SAL)) "�޿� ���", MIN(SAL) "���� �޿�", MAX(SAL) "�ְ� �޿�", SUM(SAL) "�޿��� ��"
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    GROUP BY DNAME
    ORDER BY "�޿��� ��" DESC;
-- 5. �μ���, ������ �׷��Ͽ� ����� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ����϶�(��°���� �μ���ȣ, ���������� �������� ����)
SELECT DEPTNO, JOB, COUNT(*) "�ο���", ROUND(AVG(SAL)) "�޿� ���", SUM(SAL) "�޿��� ��"
    FROM EMP
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;
-- 6. ������, �μ��� �׷��Ͽ� ����� ����,�μ���ȣ �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ����϶�.(��°���� ������, �μ���ȣ �� �������� ����)
SELECT JOB, DEPTNO, COUNT(*) "�ο���", ROUND(AVG(SAL)) "�޿� ���", SUM(SAL) "�޿��� ��"
    FROM EMP
    GROUP BY JOB, DEPTNO
    ORDER BY JOB, DEPTNO;

-- GROUP BY �ʵ�1, �ʵ�2
SELECT DEPTNO, ROUND(AVG(SAL),2) FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, JOB, ROUND(AVG(SAL),2) 
    FROM EMP 
    GROUP BY DEPTNO, JOB 
    ORDER BY DEPTNO, JOB;
--GROUP BY ���� �ʵ尡 2�� �� �� �������� ���̱� ���� DECODE 
--STEP 1
SELECT DEPTNO, DECODE(JOB, 'CLERK',     SAL, 0) CLERK,
               DECODE(JOB, 'MANAGER',   SAL, 0) MANAGER,
               DECODE(JOB, 'PRESIDENT', SAL, 0) PRESIDENT,
               DECODE(JOB, 'ANALYST',   SAL, 0) ANALYST,
               DECODE(JOB, 'SALESMAN',  SAL, 0) SALESMAN FROM EMP;
--STEP 2
SELECT DEPTNO, SUM(DECODE(JOB, 'CLERK',     SAL, 0)) CLERK,
               SUM(DECODE(JOB, 'MANAGER',   SAL, 0)) MANAGER,
               SUM(DECODE(JOB, 'PRESIDENT', SAL, 0)) PRESIDENT,
               SUM(DECODE(JOB, 'ANALYST',   SAL, 0)) ANALYST,
               SUM(DECODE(JOB, 'SALESMAN',  SAL, 0)) SALESMAN FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO,JOB, SUM(SAL) FROM EMP GROUP BY DEPTNO, JOB;
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO);
SELECT JOB, DEPTNO, ROUND(AVG(SAL)) FROM EMP GROUP BY ROLLUP(JOB, DEPTNO);
--STEP 3
SELECT DEPTNO, SUM(DECODE(JOB, 'CLERK',     SAL, 0)) CLERK,
               SUM(DECODE(JOB, 'MANAGER',   SAL, 0)) MANAGER,
               SUM(DECODE(JOB, 'PRESIDENT', SAL, 0)) PRESIDENT,
               SUM(DECODE(JOB, 'ANALYST',   SAL, 0)) ANALYST,
               SUM(DECODE(JOB, 'SALESMAN',  SAL, 0)) SALESMAN, 
               SUM(SAL) "�μ��� �Ұ�"
               FROM EMP GROUP BY ROLLUP(DEPTNO);

--����(JOB) ����(DEPTNO) AVG(SAL) �Ұ�����
SELECT JOB, NVL(ROUND(AVG(DECODE(DEPTNO, 10, SAL))), 0) ACCOUNTING,
            NVL(ROUND(AVG(DECODE(DEPTNO, 20, SAL))), 0) RESEARCH,
            NVL(ROUND(AVG(DECODE(DEPTNO, 30, SAL))), 0) SALES,
            ROUND(AVG(SAL)) "JOB�� AVG"
            FROM EMP GROUP BY ROLLUP(JOB);
            

--�μ� ��ȣ�� ��ձ޿����(��ձ޿��� 2000�̻��� �׷츸 ���)
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL)>=2000;
--�μ� ��ȣ�� �ִ�޿� ���
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;
--�μ���ȣ�� �μ���ȣ, �ִ�޿�, ����̸� => SUBQUERY 
            
