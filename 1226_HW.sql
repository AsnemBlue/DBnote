-- 1. 사원테이블에서 가장 먼저 입사한 사람의 이름, 급여, 입사일
SELECT ENAME, SAL, HIREDATE FROM EMP WHERE HIREDATE=(SELECT MIN(HIREDATE) FROM EMP);
-- 2. 회사에서 가장 급여가 적은 사람의 이름, 급여
SELECT ENAME, SAL FROM EMP WHERE SAL=(SELECT MIN(SAL) FROM EMP);
-- 3. 회사 평균보다 급여를 많이 받는 사람의 이름, 급여, 부서코드
SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL>=(SELECT AVG(SAL) FROM EMP);
-- 4. 회사 평균 이하의 급여를 받는 사람의 이름, 급여, 부서명
SELECT ENAME, SAL, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND SAL<=(SELECT AVG(SAL) FROM EMP);
-- 5. SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급
SELECT ENAME, SAL, HIREDATE, GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL 
                                            AND HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT');
-- 6. 5번에 부서명 추가하고 급여가 큰 순 정렬
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME FROM EMP E, DEPT D, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL 
                                            AND HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT')
                                            AND E.DEPTNO=D.DEPTNO
                                            ORDER BY SAL DESC;
-- 7. 사원테이블에서 BLAKE 보다 급여가 많은 사원들의 사번, 이름, 급여를 검색
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='BLAKE');
-- 8. 사원테이블에서 MILLER보다 늦게 입사한 사원의 사번, 이름, 입사일을 검색하시오
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE HIREDATE>(SELECT HIREDATE FROM EMP WHERE ENAME='MILLER');
-- 9. 사원테이블에서 사원전체 평균 급여보다 급여가 많은 사원들의 사번, 이름, 급여를 검색
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>(SELECT AVG(SAL) FROM EMP); 
-- 10. 사원테이블에서 CLARK와 같은 부서며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원들의 사번, 이름, 급여 검색
SELECT EMPNO, ENAME, SAL FROM EMP WHERE DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME='CLARK')
        AND SAL>(SELECT SAL FROM EMP WHERE EMPNO=7698)
        AND ENAME<>'CLARK';
-- 11. 응용심화. 사원테이블에서 CLARK와 같은 부서명이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원들의 사번, 이름, 급여 검색
SELECT EMPNO, ENAME, SAL FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO 
        AND DNAME=(SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='CLARK')
        AND SAL>(SELECT SAL FROM EMP WHERE EMPNO=7698)
        AND ENAME<>'CLARK';
--12. 사원 테이블에서 BLAKE와 같은 부서에 있는 모든 사원의 이름과 입사일자를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, HIREDATE FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO 
        AND DNAME=(SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME='BLAKE');
-- 13. 사원 테이블에서 평균 급여 이상을 받는 모든 종업원에 대해서 종업원 번호와 이름을 출력하는 SELECT문을 작성하시오. (단 급여가 많은 순으로 출력하여라.)
SELECT EMPNO, ENAME FROM EMP WHERE SAL>(SELECT AVG(SAL) FROM EMP) ORDER BY SAL DESC;

-- 다중행 서브쿼리
-- 14. 사원 테이블에서 이름에 “T”가 있는 사원이 근무하는 부서에서 근무하는 모든 종업원에 대해 사원 번호,이름,급여를 출력하는 SELECT문을 작성하시오. 단 사원번호 순으로 출력하여라.
SELECT EMPNO, ENAME, SAL 
    FROM EMP 
    WHERE DEPTNO IN
        (SELECT DEPTNO 
            FROM EMP 
            WHERE ENAME 
            LIKE '%T%') 
    ORDER BY EMPNO;
-- 15. 사원 테이블에서 부서 위치가 Dallas인 모든 종업원에 대해 이름,업무,급여를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, JOB, SAL
    FROM EMP
    WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');
-- 16. EMP 테이블에서 King에게 보고하는 모든 사원의 이름과 급여를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, SAL
    FROM EMP
    WHERE MGR IN (SELECT EMPNO FROM EMP WHERE ENAME='KING');
SELECT ENAME, SAL FROM EMP W
    WHERE EXISTS (SELECT * FROM EMP WHERE EMPNO=W.MGR AND ENAME ='KING');
-- 17. 사원 테이블에서 SALES부서 사원의 이름,업무를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, JOB
    FROM EMP
    WHERE DEPTNO IN(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');
-- 18. 사원 테이블에서 월급이 부서 30의 최저 월급보다 높은 사원을 출력하는 SELECT문을 작성하시오.
SELECT ENAME
    FROM EMP
    WHERE SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);
-- 19. 사원 테이블에서 부서 10에서 부서 30의 사원과 같은 업무를 맡고 있는 사원의 이름과 업무를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, JOB
    FROM EMP
    WHERE DEPTNO = 10 AND JOB IN
        (SELECT JOB FROM EMP WHERE DEPTNO=30);
-- 20. 사원 테이블에서 FORD와 업무도 월급도 같은 사원의 모든 정보를 출력하는 SELECT문을 작성하시오.
SELECT *
    FROM EMP
    WHERE (JOB, SAL) IN (SELECT JOB, SAL FROM EMP WHERE ENAME='FORD')
        AND ENAME!='FORD';
-- 21. 사원 테이블에서 이름이 JONES인 직원의 JOB과 같거나 월급이 FORD이상인 사원의 정보를 이름,업무,부서번호,급여를 출력하는 SELECT문을 작성. 
--     단, 업무별 알파벳 순, 월급이 많은 순으로 출력하여라.
SELECT ENAME, JOB, DEPTNO, SAL
    FROM EMP
    WHERE JOB IN (SELECT JOB FROM EMP WHERE ENAME='JONES') 
        OR SAL >= (SELECT SAL FROM EMP WHERE ENAME='FORD')
        AND ENAME NOT IN('JAMES', 'FORD') 
    ORDER BY JOB, SAL DESC;
-- 22. 사원 테이블에서 SCOTT 또는 WARD와 월급이 같은 사원의 정보를 이름,업무,급여를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, JOB, SAL
    FROM EMP   
    WHERE SAL IN (SELECT SAL FROM EMP WHERE ENAME IN('SCOTT', 'WARD'))
        AND ENAME NOT IN('SCOTT', 'WARD');
-- 23. 사원 테이블에서 CHICAGO에서 근무하는 사원과 같은 업무를 하는 사원들의 이름,업무를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, JOB
    FROM EMP
    WHERE JOB IN (SELECT JOB FROM EMP 
        WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC='CHICAGO'));
-- 24. 사원 테이블에서 부서별로 월급이 평균 부서별 월급보다 높은 사원을 사원번호,이름,급여를 출력하는 SELECT문을 작성하시오.
SELECT EMPNO, ENAME, SAL
    FROM EMP E
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);
-- 25. 사원 테이블에서 업무별로 월급이 평균 월급보다 낮은 사원을 부서번호,이름,급여를 출력하는 SELECT문을 작성하시오.
SELECT DEPTNO, ENAME, SAL
    FROM EMP E
    WHERE SAL < (SELECT AVG(SAL) FROM EMP WHERE JOB=E.JOB);
-- 26 사원 테이블에서 적어도 한명 이상으로부터 보고를 받을 수 있는 사원을 업무,이름,사원번호,부서번호를 출력(단, 부서번호 순으로 오름차순 정렬)
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP MANAGER
    WHERE EXISTS(SELECT * FROM EMP WHERE MGR=MANAGER.EMPNO)
    ORDER BY DEPTNO;
-- 27. 사원 테이블에서 말단 사원의 사원번호,이름,업무,부서번호를 출력하는 SELECT문을 작성하시오.
SELECT EMPNO, ENAME, JOB, DEPTNO
    FROM EMP MANAGER
    WHERE NOT EXISTS (SELECT * FROM EMP WHERE MGR=MANAGER.EMPNO);
    

