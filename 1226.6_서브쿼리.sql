--6.SUB QUERY
--SCOTT�� �ٹ��ϴ� �μ��̸�
SELECT DNAME FROM DEPT D, EMP E WHERE E.DEPTNO=D.DEPTNO AND ENAME='SCOTT';
(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'); -- SUB QUERY
SELECT DNAME FROM DEPT WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT');   --MAIN QUERY
--SUB QUERY �� ����
--JOB�� MANAGER�� ����� �μ��̸�.
SELECT ENAME FROM EMP WHERE JOB='MANAGER';
SELECT DNAME FROM DEPT WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'); --���ǿ� �´� ���� ������-> ������ SUB QUERY
SELECT DNAME FROM DEPT WHERE DEPTNO IN(10,20,30); -- ���� ���

--������ ��������
SELECT MAX(SAL) FROM EMP; -- �ְ�ݾ� SAL
--�޴»��, �ְ�ݾ�SAL
SELECT ENAME, SAL FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP); --�׻� F9�� SUBQUERY ���������� ���డ������ TEST�ؾ� ��.
--SCOTT�� ���� �μ��� �ٹ��ϴ� ����� �̸�
SELECT ENAME FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT')
    AND ENAME<>'SCOTT';
--SCOTT�� ���� �ٹ����� �ٹ��ϴ� ����� �̸�
INSERT INTO DEPT VALUES (50,'IT','DALLAS');
INSERT INTO EMP VALUES(9999,'ȫ�浿',NULL,NULL,NULL,9000,NULL,50);
ROLLBACK;
SELECT LOC FROM DEPT D, EMP E WHERE D.DEPTNO=E.DEPTNO AND ENAME='SCOTT';
SELECT ENAME FROM EMP E, DEPT D WHERE D.DEPTNO=E.DEPTNO 
    AND LOC=(SELECT LOC FROM DEPT D, EMP E WHERE D.DEPTNO=E.DEPTNO AND ENAME='SCOTT')
    AND ENAME<>'SCOTT';
--'SCOTT'�� ���� JOB�� ���� ������� ��� ���� ���
SELECT * FROM EMP WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME='SCOTT');
--'SCOTT'�� �޿��� �����ϰų� �� ���� �޴� ��� �̸��� �޿����
SELECT ENAME, SAL FROM EMP WHERE SAL>=(SELECT SAL FROM EMP WHERE ENAME='SCOTT');
--���ӻ���� KING�� ����� �̸��� �޿�
SELECT ENAME, SAL FROM EMP WHERE MGR=(SELECT EMPNO FROM EMP WHERE ENAME='KING');
--��ձ޿� ���ϸ� �޴� ������ ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL<=(SELECT AVG(SAL) FROM EMP);
--�μ���ȣ, �μ��� �ִ�޿�, �� �ִ�޿��� �޴� ����� �̸�, �� ����� �޿�
SELECT DEPTNO, SAL, ENAME FROM EMP WHERE (DEPTNO, SAL) IN(SELECT DEPTNO, MAX(SAL)FROM EMP GROUP BY DEPTNO);
--����������༭������ : SCOTT�� JOB�� ���� �μ���ȣ�� ���� ����� ��� �ʵ带 ���
SELECT * FROM EMP WHERE (JOB, DEPTNO)=(SELECT JOB,DEPTNO FROM EMP WHERE ENAME='SCOTT');

--��������
-- 1. ������̺��� ���� ���� �Ի��� ����� �̸�, �޿�, �Ի���
SELECT ENAME, SAL, HIREDATE FROM EMP WHERE HIREDATE=(SELECT MIN(HIREDATE) FROM EMP);
-- 2. ȸ�翡�� ���� �޿��� ���� ����� �̸�, �޿�
SELECT ENAME, SAL FROM EMP WHERE SAL=(SELECT MIN(SAL) FROM EMP);
-- 3. ȸ�� ��պ��� �޿��� ���� �޴� ����� �̸�, �޿�, �μ��ڵ�
SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL>=(SELECT AVG(SAL) FROM EMP);
-- 4. ȸ�� ��� ������ �޿��� �޴� ����� �̸�, �޿�, �μ���
SELECT ENAME, SAL, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND SAL<=(SELECT AVG(SAL) FROM EMP);
-- 5. SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���
SELECT ENAME, SAL, HIREDATE, GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL 
                                            AND HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT');
-- 6. 5���� �μ��� �߰��ϰ� �޿��� ū �� ����
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME FROM EMP E, DEPT D, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL 
                                            AND HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT')
                                            AND E.DEPTNO=D.DEPTNO
                                            ORDER BY SAL DESC;
-- 7. ������̺��� BLAKE ���� �޿��� ���� ������� ���, �̸�, �޿��� �˻�
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='BLAKE');
-- 8. ������̺��� MILLER���� �ʰ� �Ի��� ����� ���, �̸�, �Ի����� �˻��Ͻÿ�
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE HIREDATE>(SELECT HIREDATE FROM EMP WHERE ENAME='MILLER');
-- 9. ������̺��� �����ü ��� �޿����� �޿��� ���� ������� ���, �̸�, �޿��� �˻�
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>(SELECT AVG(SAL) FROM EMP); 
-- 10. ������̺��� CLARK�� ���� �μ���, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ������� ���, �̸�, �޿� �˻�
SELECT EMPNO, ENAME, SAL FROM EMP WHERE DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME='CLARK')
        AND SAL>(SELECT SAL FROM EMP WHERE EMPNO=7698)
        AND ENAME<>'CLARK';
-- 11. �����ȭ. ������̺��� CLARK�� ���� �μ����̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ������� ���, �̸�, �޿� �˻�
SELECT EMPNO, ENAME, SAL FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO 
        AND DNAME=(SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='CLARK')
        AND SAL>(SELECT SAL FROM EMP WHERE EMPNO=7698)
        AND ENAME<>'CLARK';
--12. ��� ���̺��� BLAKE�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի����ڸ� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT ENAME, HIREDATE FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO 
        AND DNAME=(SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='BLAKE');

-- 13. ��� ���̺��� ��� �޿� �̻��� �޴� ��� �������� ���ؼ� ������ ��ȣ�� �̸��� ����ϴ� SELECT���� �ۼ��Ͻÿ�. (�� �޿��� ���� ������ ����Ͽ���.)
SELECT EMPNO, ENAME FROM EMP WHERE SAL>(SELECT AVG(SAL) FROM EMP) ORDER BY SAL DESC;

--������ �������� : SUBQUERY�� �������� ������ IN,ALL,SOME=ANY,EXISTS
--DEPTNO���� �ִ�޿�, �ִ�޿� �޴� ��� �̸�.
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;--SUBQUERY
SELECT DEPTNO, SAL, ENAME FROM EMP
    WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO); --SUBQUERY->�ش�Ǵ� ���IN ����-> MAIN
--�Ի�⺰ �ּұ޿�, �޴� ���.
SELECT TO_CHAR(HIREDATE,'RR') "�Ի��", SAL "�ּұ޿�", ENAME FROM EMP
    WHERE (TO_CHAR(HIREDATE,'RR'), SAL) IN 
        (SELECT TO_CHAR(HIREDATE,'RR'), MIN(SAL) FROM EMP 
        GROUP BY TO_CHAR(HIREDATE,'RR'))
    ORDER BY �Ի��;
--�޿��� 3000�̻�޴»���� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ������� ��� �ʵ�.
SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL>=3000);
--�μ����� �Ի����� ���� ���� ����� �μ���ȣ, �̸�, �Ի����� ���
SELECT DEPTNO, ENAME, HIREDATE FROM EMP 
    WHERE (DEPTNO, HIREDATE) 
        IN (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO);
--JOB�� ���� ���� ������ �޴� ����� �̸�, JOB,����.
SELECT ENAME, JOB, SAL*12+NVL(COMM,0) FROM EMP
    WHERE (JOB, SAL*12+NVL(COMM,0)) 
        IN (SELECT JOB, MIN(SAL*12+NVL(COMM,0)) FROM EMP GROUP BY JOB);
--30�� �μ� ����� �޿��� ���� ���� ������� �� ���� �޿��� �޴� ����� �̸�, �޿�
SELECT ENAME, SAL FROM EMP
    WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);
SELECT ENAME, SAL FROM EMP
    WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);
--30�� �μ� ��� �޿� �� ���� ������(950)���� ���� �޿��� ���� ����� �̸�, �޿�
SELECT ENAME, SAL FROM EMP
    WHERE SAL > SOME(SELECT SAL FROM EMP WHERE DEPTNO=30);
SELECT ENAME, SAL FROM EMP
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);
--���Ӻ��ϰ� �ִ� ������ �����ȣ �̸� �޿��� ���
SELECT DISTINCT M.EMPNO, M.ENAME, M.SAL FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE EMPNO IN (SELECT MGR FROM EMP);
SELECT EMPNO, ENAME, SAL FROM EMP WHERE EMPNO = ANY (SELECT MGR FROM EMP);
SELECT EMPNO, ENAME, SAL FROM EMP MANAGER
    WHERE EXISTS (SELECT EMPNO FROM EMP WORKER WHERE WORKER.MGR = MANAGER.EMPNO);
SELECT EMPNO, ENAME, SAL FROM EMP MANAGER
    WHERE EXISTS (SELECT EMPNO FROM EMP WHERE MGR = MANAGER.EMPNO);
--���, �̸�, �μ���ȣ, SAL, �ش������μ����
SELECT EMPNO, ENAME, DEPTNO, SAL, (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO) FROM EMP E;
--���Ӻ��ϰ� ���� �������� ��� ������ ���
SELECT M.* FROM EMP W, EMP M WHERE W.MGR(+)=M.EMPNO AND W.MGR IS NULL;
SELECT * FROM EMP WHERE EMPNO NOT IN (SELECT MGR FROM EMP WHERE MGR IS NOT NULL); 
SELECT * FROM EMP WHERE EMPNO <> ALL (SELECT MGR FROM EMP WHERE MGR IS NOT NULL);
SELECT * FROM EMP MANAGER
    WHERE NOT EXISTS (SELECT * FROM EMP WHERE MGR=MANAGER.EMPNO);
    

--(4)	źź������
--?	�μ����� ���� �޿��� ���� �޴� ����� ����(��� ��ȣ, ����̸�, �޿�, �μ���ȣ)�� ���(IN ������ �̿�)
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE (DEPTNO,SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);
--?	����(JOB)�� MANAGER�� ����� ���� �μ��� �μ� ��ȣ�� �μ���� ������ ���(IN)
SELECT DISTINCT DEPTNO, DNAME, LOC FROM DEPT 
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');
--?	SAL�� 3000�̻��� ����� �� ���� ����� ����� �ش� ��޺� �ְ� ������ �޴� ������� ���, �̸�, ����, �Ի���, �޿�, �޿������ ���
SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, GRADE 
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND SAL >=3000 AND 
        (GRADE, SAL) IN 
        (SELECT GRADE, MAX(SAL) 
            FROM EMP, SALGRADE 
            WHERE SAL BETWEEN LOSAL AND HISAL 
            GROUP BY GRADE);
--?	�����ȭ : �Ի��� �б⺰�� ���� ���� ������ �޴� ������� �б�, ���, �̸�, JOB, �����, �Ի���, �޿�, �󿩸� ����ϼ���
SELECT CEIL(TO_CHAR(HIREDATE,'MM')/3) "�б�", EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM FROM EMP
    WHERE (CEIL(TO_CHAR(HIREDATE,'MM')/3), SAL*12+NVL(COMM,0)) 
        IN (SELECT CEIL(TO_CHAR(HIREDATE,'MM')/3), MAX(SAL*12+NVL(COMM,0)) FROM EMP GROUP BY CEIL(TO_CHAR(HIREDATE,'MM')/3))
    ORDER BY "�б�";
--?	SALESMAN ��� ����� ���� �޿��� ���� �޴� ������� �̸��� �޿��� ����(��� ����)�� ����ϵ� ���� ����� ������� �ʴ´�.(ALL�̿�)
SELECT ENAME, SAL, JOB FROM EMP WHERE SAL > ALL(SELECT SAL FROM EMP WHERE JOB = 'SALESMAN'); 
SELECT ENAME, SAL, JOB FROM EMP WHERE SAL >(SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN');
--?	SALESMAN �Ϻ� � �� ������� �޿��� ���� �޴� ������� �̸��� �޿��� ����(��� ����)�� ����ϵ� ���� ������� ���(ANY)
SELECT ENAME, SAL, JOB FROM EMP WHERE SAL > ANY(SELECT SAL FROM EMP WHERE JOB='SALESMAN');
SELECT ENAME, SAL, JOB FROM EMP WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN');
--?	SAL�� 3000�̸��� ��� �߿� ���� �ֱٿ� �Ի��� ����� �����ȣ�� �̸�, SAL, �Ի����� ���
SELECT EMPNO, ENAME, SAL, HIREDATE FROM EMP WHERE SAL<3000 AND HIREDATE >= ALL(SELECT HIREDATE FROM EMP);
SELECT EMPNO, ENAME, SAL, HIREDATE FROM EMP WHERE SAL<3000 AND HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
--?	������ ��SALESMAN���� ����� �޴� �޿��� �ּ� �޿����� ���� �޴� ������� �̸�, �޿�, ����, �μ���ȣ�� ����ϵ� �μ���ȣ�� 20���� ����� �����Ѵ�(ANY ������ �̿�)
SELECT ENAME, SAL, JOB, DEPTNO FROM EMP WHERE DEPTNO!=20 AND SAL > ANY(SELECT SAL FROM EMP WHERE JOB='SALESMAN');
SELECT ENAME, SAL, JOB, DEPTNO FROM EMP WHERE DEPTNO!=20 AND SAL > (SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN');


