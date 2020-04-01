--1. EMP���̺��� ��� ����� ���� ������ ���ӻ����� ����Ͻÿ�. 
SELECT E.ENAME "���", NVL(M.ENAME,'����') "���ӻ��"
    FROM EMP E, EMP M
    WHERE E.MGR=M.EMPNO(+);
--2. ��簡 �ִ� ������ ���� �����, �޿�, ��å, ���ӻ����� ����Ͻÿ�.
SELECT E.ENAME "���",E.SAL, E.JOB, M.ENAME "���ӻ��"
    FROM EMP E, EMP M
    WHERE E.MGR=M.EMPNO;
--3. ��簡 ���� ������ ��簡 �ִ� ������ ��ο� ���� �����, �޿�, ��å, ���ӻ����� ����Ͻÿ�.
SELECT E.ENAME "���", E.SAL, E.JOB, NVL(M.ENAME,'����') "���ӻ��"
    FROM EMP E, EMP M
    WHERE E.MGR=M.EMPNO(+);
--4. ��簡 �ִ� ������ ���� �����, �����, �޿�, �μ���, ���ӻ����� ����Ͻÿ�.
SELECT E.ENAME "���",E.SAL, E.JOB, M.ENAME "���ӻ��"
    FROM EMP E, EMP M
    WHERE E.MGR=M.EMPNO;
--5. ��簡 ���� ������ ��簡 �ִ� ���� ��ο� ���� ����, �޿�, �μ��ڵ�, �μ���, �ٹ���, ���ӻ����� ����Ͻÿ�. ��, ���ӻ�簡 ���� ��� ���ӻ����� ������������ ��� ����Ͻÿ�.
SELECT E.ENAME "���", E.SAL, E.DEPTNO, DNAME, LOC, NVL(M.ENAME,'����') "���ӻ��"
    FROM EMP E, EMP M, DEPT D
    WHERE E.MGR=M.EMPNO(+) AND E.DEPTNO=D.DEPTNO;
--6. �޿��� 2000�̻��� ����� ���� �����, �޿�, �޿����, �μ���, ���ӻ����� ����Ͻÿ�.
SELECT E.ENAME, E.SAL, GRADE, DNAME, NVL(M.ENAME,'����') "���ӻ��"
    FROM EMP E,EMP M, SALGRADE, DEPT D
    WHERE E.SAL BETWEEN LOSAL AND HISAL AND E.MGR=M.EMPNO(+) AND E.DEPTNO=D.DEPTNO AND E.SAL>=2000;
--7. ��簡 �ִ� ������ ��簡 ���� ���� ��ο� ���� �����, �޿�, �޿����, �μ���, ���ӻ����� �μ��� ���ĺ� ������ �����Ͽ� ����Ͻÿ�.
SELECT E.ENAME, E.SAL, GRADE, DNAME, NVL(M.ENAME,'����') "���ӻ��"
    FROM EMP E,EMP M, SALGRADE, DEPT D
    WHERE E.SAL BETWEEN LOSAL AND HISAL AND E.MGR=M.EMPNO(+) AND E.DEPTNO=D.DEPTNO
    ORDER BY DNAME;
--8. �����, �޿�, �޿����, �μ���, ����, ���ӻ����� ����Ͻÿ�. �� ������ (SAL+COMM)*12�� ����Ѵ�.
SELECT E.ENAME, E.SAL, GRADE, DNAME, (E.SAL+NVL(E.COMM,0))*12 "����" ,NVL(M.ENAME,'����') "���ӻ��"
    FROM EMP E,EMP M, SALGRADE, DEPT D
    WHERE E.SAL BETWEEN LOSAL AND HISAL AND E.MGR=M.EMPNO(+) AND E.DEPTNO=D.DEPTNO;
--9. �� 8���� �μ��� ���ĺ� ������ �����ϰ� �μ����� ������ �޿��� ū ������� ���� ��� ������ �����Ͽ� ����Ͻÿ�.
SELECT E.ENAME, E.SAL, GRADE, DNAME, (E.SAL+NVL(E.COMM,0))*12 "����" ,NVL(M.ENAME,'����') "���ӻ��"
    FROM EMP E,EMP M, SALGRADE, DEPT D
    WHERE E.SAL BETWEEN LOSAL AND HISAL AND E.MGR=M.EMPNO(+) AND E.DEPTNO=D.DEPTNO
    ORDER BY DNAME, E.SAL DESC;
    
--����PART2 
--1. EMP���̺��� ��� ����� ���� �����, �μ���ȣ �μ����� ����Ͻÿ�.
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
--2. EMP���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���� �����, ��å, �޿�, �μ����� ����Ͻÿ�.
SELECT ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK';
--3. EMP���̺��� ��(COMM)�� �޴� ����� ���� �����, �μ���, ��ġ�� ����Ͻÿ�.
SELECT ENAME, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL AND COMM!=0;
--4. EMP���̺��� ����� ���ĺ� L�� �ִ� ����� ���� �����, ��å, �μ���, ��ġ�� ����Ͻÿ�.
SELECT ENAME, JOB, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND ENAME LIKE '%L%';
--5. EMP���̺��� ���, �����, �μ���ȣ, �μ����� ����ϵ� ����� ���ĺ� ������ ����Ͻÿ�.
SELECT EMPNO, ENAME, E.DEPTNO, JOB
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    ORDER BY ENAME;
--6. �޿��� 2000�̻��� ����� ���� ���, �����, �޿�, �μ����� �޿��������� �������� �����Ͽ� ����Ͻÿ�.
SELECT EMPNO, ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    ORDER BY SAL DESC;
--7. ��å�� MANAGER�̸� �޿��� 2500�̻��� ����� ���� ���, �����, ��å, �޿�, �μ����� ��� �������� ������ �����Ͽ� ����Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB='MANAGER' AND SAL>=2500
    ORDER BY EMPNO;
--8. ���, �����, ��å, �޿�, �޿������ �޿��������� �������� �����Ͽ� ����Ͻÿ�
SELECT EMPNO, ENAME, JOB, SAL, GRADE
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
    ORDER BY SAL DESC;
--9. ��簡 ���� ������ ��簡 �ִ� ���� ��ο� ����, �����, ���ӻ����� ����Ͻÿ�.
SELECT E.ENAME "���", NVL(M.ENAME,'����') "���ӻ��"
    FROM EMP E, EMP M
    WHERE E.MGR = M.EMPNO(+);
--10.��簡 ���� ������ ��簡 �ִ� ���� ��ο� ����, �����, ����, ����� ������ ����Ͻÿ�.
SELECT E.ENAME "���", NVL(M.ENAME,'����') "���ӻ��",NVL(MM.ENAME,'����') "����ǻ��"
    FROM EMP E, EMP M, EMP MM
    WHERE E.MGR = M.EMPNO(+) AND M.MGR=MM.EMPNO(+);