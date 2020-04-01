--1. EMP테이블의 모든 사원에 대해 사원명과 직속상사명을 출력하시오. 
SELECT E.ENAME "사원", NVL(M.ENAME,'없음') "직속상사"
    FROM EMP E, EMP M
    WHERE E.MGR=M.EMPNO(+);
--2. 상사가 있는 직원에 대해 사원명, 급여, 직책, 직속상사명을 출력하시오.
SELECT E.ENAME "사원",E.SAL, E.JOB, M.ENAME "직속상사"
    FROM EMP E, EMP M
    WHERE E.MGR=M.EMPNO;
--3. 상사가 없는 직원과 상사가 있는 직원들 모두에 대해 사원명, 급여, 직책, 직속상사명을 출력하시오.
SELECT E.ENAME "사원", E.SAL, E.JOB, NVL(M.ENAME,'없음') "직속상사"
    FROM EMP E, EMP M
    WHERE E.MGR=M.EMPNO(+);
--4. 상사가 있는 직원에 대해 사원명, 사원명, 급여, 부서명, 직속상사명을 출력하시오.
SELECT E.ENAME "사원",E.SAL, E.JOB, M.ENAME "직속상사"
    FROM EMP E, EMP M
    WHERE E.MGR=M.EMPNO;
--5. 상사가 없는 직원과 상사가 있는 직원 모두에 대해 사명원, 급여, 부서코드, 부서명, 근무지, 직속상사명을 출력하시오. 단, 직속상사가 없을 경우 직속상사명에는 ‘없음’으로 대신 출력하시오.
SELECT E.ENAME "사원", E.SAL, E.DEPTNO, DNAME, LOC, NVL(M.ENAME,'없음') "직속상사"
    FROM EMP E, EMP M, DEPT D
    WHERE E.MGR=M.EMPNO(+) AND E.DEPTNO=D.DEPTNO;
--6. 급여가 2000이상인 사원에 대해 사원명, 급여, 급여등급, 부서명, 직속상사명을 출력하시오.
SELECT E.ENAME, E.SAL, GRADE, DNAME, NVL(M.ENAME,'없음') "직속상사"
    FROM EMP E,EMP M, SALGRADE, DEPT D
    WHERE E.SAL BETWEEN LOSAL AND HISAL AND E.MGR=M.EMPNO(+) AND E.DEPTNO=D.DEPTNO AND E.SAL>=2000;
--7. 상사가 있는 직원과 상사가 없는 직원 모두에 대해 사원명, 급여, 급여등급, 부서명, 직속상사명을 부서명 알파벳 순으로 정렬하여 출력하시오.
SELECT E.ENAME, E.SAL, GRADE, DNAME, NVL(M.ENAME,'없음') "직속상사"
    FROM EMP E,EMP M, SALGRADE, DEPT D
    WHERE E.SAL BETWEEN LOSAL AND HISAL AND E.MGR=M.EMPNO(+) AND E.DEPTNO=D.DEPTNO
    ORDER BY DNAME;
--8. 사원명, 급여, 급여등급, 부서명, 연봉, 직속상사명을 출력하시오. 단 연봉은 (SAL+COMM)*12로 계산한다.
SELECT E.ENAME, E.SAL, GRADE, DNAME, (E.SAL+NVL(E.COMM,0))*12 "연봉" ,NVL(M.ENAME,'없음') "직속상사"
    FROM EMP E,EMP M, SALGRADE, DEPT D
    WHERE E.SAL BETWEEN LOSAL AND HISAL AND E.MGR=M.EMPNO(+) AND E.DEPTNO=D.DEPTNO;
--9. 위 8번을 부서명 알파벳 순으로 정렬하고 부서명이 같으면 급여가 큰 사원에서 작은 사원 순으로 정렬하여 출력하시오.
SELECT E.ENAME, E.SAL, GRADE, DNAME, (E.SAL+NVL(E.COMM,0))*12 "연봉" ,NVL(M.ENAME,'없음') "직속상사"
    FROM EMP E,EMP M, SALGRADE, DEPT D
    WHERE E.SAL BETWEEN LOSAL AND HISAL AND E.MGR=M.EMPNO(+) AND E.DEPTNO=D.DEPTNO
    ORDER BY DNAME, E.SAL DESC;
    
--예제PART2 
--1. EMP테이블의 모든 사원에 대해 사원명, 부서번호 부서명을 출력하시오.
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
--2. EMP테이블에서 NEW YORK에서 근무하고 있는 사원에 대해 사원명, 직책, 급여, 부서명을 출력하시오.
SELECT ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK';
--3. EMP테이블에서 상여(COMM)를 받는 사원에 대해 사원명, 부서명, 위치를 출력하시오.
SELECT ENAME, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL AND COMM!=0;
--4. EMP테이블에서 사원명에 알파벳 L이 있는 사원에 대해 사원명, 직책, 부서명, 위치를 출력하시오.
SELECT ENAME, JOB, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND ENAME LIKE '%L%';
--5. EMP테이블에서 사번, 사원명, 부서번호, 부서명을 출력하되 사원명 알파벳 순으로 출력하시오.
SELECT EMPNO, ENAME, E.DEPTNO, JOB
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    ORDER BY ENAME;
--6. 급여가 2000이상인 사원에 대해 사번, 사원명, 급여, 부서명을 급여기준으로 내림차순 정렬하여 출력하시오.
SELECT EMPNO, ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    ORDER BY SAL DESC;
--7. 직책이 MANAGER이며 급여가 2500이상인 사원에 대해 사번, 사원명, 직책, 급여, 부서명을 사번 기준으로 모름차순 정렬하여 출력하시오.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB='MANAGER' AND SAL>=2500
    ORDER BY EMPNO;
--8. 사번, 사원명, 직책, 급여, 급여등급을 급여기준으로 내림차순 정렬하여 출력하시오
SELECT EMPNO, ENAME, JOB, SAL, GRADE
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
    ORDER BY SAL DESC;
--9. 상사가 없는 직원과 상사가 있는 직원 모두에 대해, 사원명, 직속상사명을 출력하시오.
SELECT E.ENAME "사원", NVL(M.ENAME,'없음') "직속상사"
    FROM EMP E, EMP M
    WHERE E.MGR = M.EMPNO(+);
--10.상사가 없는 직원과 상사가 있는 직원 모두에 대해, 사원명, 상사명, 상사의 상사명을 출력하시오.
SELECT E.ENAME "사원", NVL(M.ENAME,'없음') "직속상사",NVL(MM.ENAME,'없음') "상사의상사"
    FROM EMP E, EMP M, EMP MM
    WHERE E.MGR = M.EMPNO(+) AND M.MGR=MM.EMPNO(+);