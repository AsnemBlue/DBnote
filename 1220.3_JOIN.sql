--2019.12.20 3��. JOIN
SELECT * FROM EMP;
SELECT * FROM DEPT;

--(1)CROSS JOIN
SELECT * 
    FROM EMP, DEPT 
    WHERE ENAME='SMITH';   

--(2)EQUI JOIN : 2���� ���̺� ������ �ʵ尡 �ִ� ���(DEPT, EMP���̺� DEPTNOO)
SELECT * 
    FROM EMP, DEPT
    WHERE ENAME='SMITH' AND EMP.DEPTNO=DEPT.DEPTNO;
SELECT * 
    FROM EMP, DEPT
    WHERE EMP.DEPTNO=DEPT.DEPTNO;
SELECT E.*, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
--���, �̸�, �μ���ȣ, �μ��̸�, �ٹ���
SELECT EMPNO, ENAME, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
-- ���, �̸�, �޿�, �μ���ȣ(�μ��ڵ�), �μ���
SELECT EMPNO, ENAME, EMP.SAL, DEPT.DEPTNO, DNAME
    FROM EMP, DEPT  
    WHERE EMP.DEPTNO=DEPT.DEPTNO;
--�̸�, ����, �޿�, �μ���, �ٹ���, �޿��� 2000�̻�
SELECT ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL>=2000;
--�̸�, ����, �޿�, �μ���, �ٹ���, �ٹ����� CHICAGO
SELECT ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC='CHICAGO';
--�̸�, ����, �ٹ���. DEPTYNO�� 10�Ǵ� 20�ΰ��, �޿��� ����
SELECT ENAME, JOB, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND D.DEPTNO IN(10,20)
    ORDER BY SAL;
--�̸�, �޿�, COMM, "����", �μ���, �ٹ���.����=(SAL+COMM)12 
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM, 0))*12 "����",DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
--������ JOB�� SALESMAN�̰ų� MANAGER�� ������� ������ ū ������� ���
SELECT ENAME, SAL,NVL(COMM, 0) "COMM", (SAL+NVL(COMM, 0))*12 "����",DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB IN('SALESMAN','MANAGER')
    ORDER BY "����" DESC;
--�̸�, �޿�, �Ի���, �μ��ڵ�(��ȣ), �μ���. COMM�� NULL�̰� �޿��� 1200�̻��� ���.
--�μ���� ����.�μ����� ������ �޿�ū ��
SELECT ENAME, SAL, HIREDATE, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM IS NULL AND SAL>=1200
    ORDER BY DNAME, SAL DESC;
    
--��	���忡�� �ٹ��ϴ� ����� �̸��� �޿��� ����Ͻÿ�
SELECT ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK';
--��	ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի����� ����Ͻÿ�
SELECT ENAME, HIREDATE
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND DNAME='ACCOUNTING';
--��	������ MANAGER�� ����� �̸�, �μ����� ����Ͻÿ�
SELECT ENAME, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB='MANAGER';
--��	Comm�� null�� �ƴ� ����� �̸�, �޿�, �μ��ڵ�, �ٹ����� ����Ͻÿ�
SELECT ENAME, SAL, D.DEPTNO, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL;
    
--(3)NON-EQUI JOIN (������ �ʵ尡 ���� 2���� ���̺��� JOIN)
SELECT *
    FROM SALGRADE;
SELECT ENAME, SAL, GRADE||'���' GRADE
    FROM EMP,SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;
    
--��	Comm�� null�� �ƴ� ����� �̸�, �޿�, ���, �μ���ȣ, �μ��̸�, �ٹ����� ����Ͻÿ�.
SELECT ENAME, SAL, GRADE, D.DEPTNO, DNAME, LOC
    FROM DEPT D, EMP E, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO;
---	�̸�, �޿�, �Ի���, �޿����. �޿���� ū ������� ����
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL
    ORDER BY GRADE DESC;
---	�̸�, �޿�, �Ի���, �޿����, �μ���, �ٹ���
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME, LOC
    FROM DEPT D, EMP E, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO;
---	�̸�, �޿�, ���, �μ��ڵ�, �ٹ���. �� comm �� null�ƴ� ���
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME, LOC
    FROM DEPT D, EMP E, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL;
---	�̸�, �޿�, �޿����, ����, �μ���, �μ��� ���, �μ��� ������ ������. ����=(sal+comm)*12 comm�� null�̸� 0
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM, 0))*12 "����", DNAME
    FROM DEPT D, EMP E, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO
    ORDER BY DNAME, ����;
---	�̸�, ����, �޿�, ���, �μ��ڵ�, �μ��� ���. �޿��� 1000~3000����. �������� : �μ���, �μ������� ������, ���������� �޿� ū��
SELECT ENAME, JOB, SAL, GRADE, D.DEPTNO, DNAME
    FROM DEPT D, EMP E, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO AND SAL BETWEEN 1000 AND 3000
    ORDER BY DNAME, JOB, SAL DESC;
---	�̸�, �޿�, ���, �Ի���, �ٹ���. 81�⿡ �Ի��� ���. ��� ū��
SELECT ENAME, SAL, GRADE, TO_CHAR(HIREDATE,'YYYY-MM-DD DAY') HIREDATE, LOC
    FROM DEPT D, EMP E, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO AND TO_CHAR(HIREDATE,'yyyy')='1981'
    ORDER BY GRADE DESC;

--(4) SELF JOIN : �����̺��� ���� JOIN
SELECT WORKER.ENAME, MANAGER.ENAME "���" 
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.MGR = MANAGER.EMPNO;
--XX�� ���� XX��
SELECT W.ENAME||'�� ���� '|| M.ENAME "���" 
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO; 
--��	�Ŵ����� KING�� ������� �̸��� ������ ����Ͻÿ�.
SELECT W.ENAME, W.JOB ,M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO AND M.ENAME = 'KING'; 
--��	SCOTT�� ������ �μ���ȣ���� �ٹ��ϴ� ����� �̸��� ����Ͻÿ�
SELECT W1.ENAME
    FROM EMP W1, EMP W2 
    WHERE W1.DEPTNO = W2.DEPTNO AND W2.ENAME = 'SCOTT' AND W1.ENAME!='SCOTT'; 
 --��	SCOTT�� ������ �ٹ������� �ٹ��ϴ� ����� �̸��� ����Ͻÿ�   
SELECT E1.ENAME
    FROM EMP E1, EMP E2, DEPT D1, DEPT D2
    WHERE E1.DEPTNO = D1.DEPTNO AND E2.DEPTNO = D2.DEPTNO AND D1.LOC=D2.LOC AND E2.ENAME = 'SCOTT' AND E1.ENAME!='SCOTT';

SELECT * FROM DEPT;
INSERT INTO DEPT VALUES(50,'IT','DALLAS');
SELECT * FROM EMP;
INSERT INTO EMP VALUES(9999,'ȫ�浿','MANAGER',7902,'19/12/20',1000,NULL,50);
ROLLBACK;       --INSERT ���

--(5) OUTER JOIN : ���� ���ǿ� �������� �ʴ� ���� ��Ÿ�����ϴ� ����
SELECT W.ENAME "����",W.MGR,M.EMPNO, M.ENAME "���ӻ��"
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);
--XX�� �Ŵ����� ����(��)�Դϴ�.
SELECT W.ENAME ||'�� �Ŵ����� '|| NVL(M.ENAME,'��') ||'�Դϴ�.'
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+); 
SELECT W.ENAME, M.ENAME
    FROM EMP W,EMP M
    WHERE W.MGR(+)=M.EMPNO;
--���ܻ����
SELECT M.ENAME
    FROM EMP W,EMP M
    WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL;
    
--EQUI JOIN���� �սǵ� ������
SELECT * FROM EMP; --14��(10,20,30)
SELECT * FROM DEPT; --4���μ�(10,20,30,40)
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO(+)=DEPT.DEPTNO;
--�̸�, ����(JOB), �μ���(DNAME), �޿�(SAL) ���(��, ������ ���� �μ��� �Բ� ���)�μ���, �޿�ū�� ���� 
SELECT NVL(ENAME,'-') ENAME, NVL(JOB,'-') JOB, DNAME, NVL(TO_CHAR(SAL,'9,999'),'-') SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO(+)=D.DEPTNO
    ORDER BY DNAME, SAL DESC;
    
    
    
    
    
    
    
    
    
    
    
    

