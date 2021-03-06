--5. 그룹함수
SELECT SUM(SAL) FROM EMP;
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO;
SELECT DEPTNO, SUM(SAL) 
    FROM EMP 
    WHERE ENAME!='SMITH'
    GROUP BY DEPTNO
    HAVING SUM(SAL)>9000
    ORDER BY DEPTNO;

--EMP테이블의 평균 SAL
SELECT ROUND(AVG(SAL),2) FROM EMP;
SELECT COUNT(*) FROM EMP;
SELECT SUM(SAL)/COUNT(SAL), AVG(SAL) FROM EMP;
SELECT SUM(COMM)/COUNT(COMM), AVG(COMM) FROM EMP; -- 그룹함수일 경우 NULL값 제외.
SELECT COUNT(*) FROM EMP WHERE COMM IS NOT NULL;
--표준편차
SELECT VARIANCE(SAL), STDDEV(SAL)*STDDEV(SAL) FROM EMP;
SELECT DEPTNO, AVG(SAL), STDDEV(SAL) FROM EMP GROUP BY DEPTNO ORDER BY AVG(SAL);

SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;
SELECT COUNT(JOB) FROM EMP; --14가 나와버림
SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB;
SELECT COUNT(DISTINCT JOB) FROM EMP; --직업의 종류 갯수
--가장 최근에 입사한 직원의 입사일과 가장 최초에 입사한 직원의 입사일 출력
SELECT MIN(HIREDATE), MAX(HIREDATE) FROM EMP;
SELECT MIN(ENAME), MAX(ENAME) FROM EMP;
--최근에 입사한 직원의 입사일, 근무일, 입사한지 가장 오래된 직원의 입사일, 근무일
SELECT MAX(HIREDATE), TRUNC(SYSDATE-MAX(HIREDATE)), MIN(HIREDATE), TRUNC(SYSDATE-MIN(HIREDATE)) FROM EMP;
--10번 부서 소속의 사원의 평균 급여
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=10;
SELECT COUNT(COMM) FROM EMP WHERE DEPTNO=30;
--그룹함수의 조건은 WHERE 불가
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL)>2000;
--부서명별 평균 급여를 출력(부서명 ABC순)
SELECT DNAME, ROUND(AVG(SAL)) "평균 급여" FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO GROUP BY DNAME ORDER BY DNAME;
--부서번호별사원수와 상여금을 받는 사원수
SELECT DEPTNO, COUNT(*), COUNT(COMM) FROM EMP GROUP BY DEPTNO;
--부서이름별 사원수와 상여금 받는 사원수
SELECT DNAME "부서", COUNT(*), COUNT(COMM) 
    FROM EMP, DEPT 
    WHERE EMP.DEPTNO = DEPT.DEPTNO 
    GROUP BY DNAME     --그룹엔 ALIAS 불가능.
    ORDER BY 부서;
   
-- 셤 연습문제
-- 1. 사원 테이블에서 인원수,최대 급여,최소 급여,급여의 합을 계산하여 출력하는 SELECT 문장을 작성하여라.
SELECT COUNT(*) "인원수", MAX(SAL) "최대 급여", MIN(SAL) "최소 급여", SUM(SAL) "급여의 합" FROM EMP;
-- 2. 사원테이블에서 업무별 인원수를 구하여 출력하는 SELECT 문장을 작성하여라.
SELECT JOB, COUNT(*) "인원수" FROM EMP GROUP BY JOB;
--- 3. 사원테이블에서 최고 급여와 최소 급여의 차이는 얼마인가 출력하는 SELECT문장을 작성하여라.
SELECT MAX(SAL)-MIN(SAL) FROM EMP;
-- 4. 각 부서별로 인원수, 급여 평균, 최저 급여, 최고 급여, 급여의 합을 출력하되 급여의 합이 많은 순으로 출력하라.
SELECT DNAME, COUNT(*) "인원수", ROUND(AVG(SAL)) "급여 평균", MIN(SAL) "최저 급여", MAX(SAL) "최고 급여", SUM(SAL) "급여의 합"
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    GROUP BY DNAME
    ORDER BY "급여의 합" DESC;
-- 5. 부서별, 업무별 그룹하여 결과를 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하여 출력하라(출력결과는 부서번호, 업무순으로 오름차순 정렬)
SELECT DEPTNO, JOB, COUNT(*) "인원수", ROUND(AVG(SAL)) "급여 평균", SUM(SAL) "급여의 합"
    FROM EMP
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;
-- 6. 업무별, 부서별 그룹하여 결과를 업무,부서번호 인원수, 급여의 평균, 급여의 합을 구하여 출력하라.(출력결과는 업무순, 부서번호 순 오름차순 정렬)
SELECT JOB, DEPTNO, COUNT(*) "인원수", ROUND(AVG(SAL)) "급여 평균", SUM(SAL) "급여의 합"
    FROM EMP
    GROUP BY JOB, DEPTNO
    ORDER BY JOB, DEPTNO;

-- GROUP BY 필드1, 필드2
SELECT DEPTNO, ROUND(AVG(SAL),2) FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, JOB, ROUND(AVG(SAL),2) 
    FROM EMP 
    GROUP BY DEPTNO, JOB 
    ORDER BY DEPTNO, JOB;
--GROUP BY 절에 필드가 2개 일 때 가독성을 높이기 위해 DECODE 
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
               SUM(SAL) "부서별 소계"
               FROM EMP GROUP BY ROLLUP(DEPTNO);

--좌측(JOB) 우측(DEPTNO) AVG(SAL) 소계포함
SELECT JOB, NVL(ROUND(AVG(DECODE(DEPTNO, 10, SAL))), 0) ACCOUNTING,
            NVL(ROUND(AVG(DECODE(DEPTNO, 20, SAL))), 0) RESEARCH,
            NVL(ROUND(AVG(DECODE(DEPTNO, 30, SAL))), 0) SALES,
            ROUND(AVG(SAL)) "JOB별 AVG"
            FROM EMP GROUP BY ROLLUP(JOB);
            

--부서 변호별 평균급여출력(평균급여가 2000이상인 그룹만 출력)
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL)>=2000;
--부서 번호별 최대급여 출력
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;
--부서번호별 부서번호, 최대급여, 사원이름 => SUBQUERY 
            
