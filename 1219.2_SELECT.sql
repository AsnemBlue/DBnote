-- SELECT 문 
SELECT * FROM TAB; --scott(계정은 대소문자 구분)이 가지고 있는 모든 테이블
SELECT * FROM EMP; -- emp테이블의 모든 필드(열), 모든 데이터(행)
SELECT * FROM DEPT;
--DEPT 테이블의 구조(필드별 타입)
DESC DEPT; 
SELECT EMPNO, ENAME, SAL JOB FROM EMP; -- 특정 필드만 출력
SELECT EMPNO AS "사번", ENAME AS "이름", SAL AS "급여", JOB AS "작업" FROM EMP;
SELECT EMPNO "사번", ENAME "이름", SAL "급여", JOB "작업" FROM EMP;
SELECT EMPNO "NO", ENAME "NAME", SAL "SALARY", JOB "J" FROM EMP;
SELECT EMPNO AS "NO", ENAME AS ENAME, SAL AS SALARY, JOB AS J FROM EMP;
SELECT EMPNO NUM, ENAME NAME, SAL SALARY, JOB J FROM EMP;     --★제일 많이 쓰는 방식
SELECT EMPNO 사번, ENAME 이름, SAL 급여, JOB 작업 FROM EMP;     --한글은 이렇게 잘 안씀.한글로 잘 쓰지도 않음.
SELECT EMPNO, ENAME, DEPTNO FROM EMP;-- EMPNO, ENAME, DEPNO 필드의 모든 데이터

--WHERE절에서 비교연산자 사용
 --SAL이 3000인 직원의 사번, 이름, 급여를 LIST(TITLE : 사번, 이름, 급여)
SELECT EMPNO "사번", ENAME "이름", SAL "급여" FROM EMP WHERE SAL=3000;  
-- SAL이 3000이 아닌 직원의 EMPNO, ENAME, SAL, COMM필드 LIST
SELECT EMPNO, ENAME, COMM FROM EMP WHERE SAL != 3000;
SELECT EMPNO, ENAME, COMM FROM EMP WHERE SAL <> 3000;
SELECT EMPNO, ENAME, COMM FROM EMP WHERE SAL ^= 3000;
--부서번호(DEPTNO)가 10번인 직원의 모든 필드를 LIST
SELECT * FROM EMP WHERE DEPNO = 10;
--이릉이 FOED인 직원의 몯든 필필드
SELECT * FROM EMP WHERE ENAME = 'FORD'; --문자는 '로, 필드의 별명을 줄때만"
SELECT * FROM EMP WHERE ENAME = 'ford';
--SAL이 2000이상 3000미만인 직원의 모든 필드
SELECT * FROM EMP WHERE 2000<=SAL AND SAL<3000;
SELECT * FROM EMP WHERE ENAME<'E';
SELECT * FROM EMP WHERE ENAME<'EA';
SELECT * FROM EMP WHERE HIREDATE<'82/01/01';
SELECT * FROM EMP WHERE HIREDATE>='82/01/01' AND HIREDATE<'83/01/01';
--10번부서이거나 JOB이 'MANAGER'인 직원의 이름, 급여를 LIST
SELECT * FROM EMP WHERE job='MANAGER' OR DEPTNO=10;
--10번 부서가 아닌 모든 직원의 모든 필드 LIST
SELECT * FROM EMP WHERE DEPTNO!=10;
SELECT * FROM EMP WHERE DEPTNO<>10;
SELECT * FROM EMP WHERE DEPTNO^=10;
--SAL(월급)이 2000이상인 직원의 이름, 연봉을 LIST(COMM은 제외하고 생각)
SELECT ENAME, SAL*12 "연봉" FROM EMP WHERE SAL>2000;
--모든직원의 사원명, 원래월급, 올릴월급을(*1.1) LIST
SELECT ENAME, SAL, SAL*1.1 UPGRADE FROM EMP;
--SAL(월급), 연봉(SAL*12+COMM)이름,월급,상여,연봉 필드 출력
--산술연산 NULL     NVL(NULL가능성필드,0) :첫번째, 두번째 매게변수 타입이 일치해야 함.
SELECT ENAME "이름", SAL "월급", NVL(COMM,0) "상여", SAL*12+NVL(COMM,0) "연봉" FROM EMP;
DESC EMP;
SELECT ENAME, NVL(HIREDATE,'81/01/01') FROM EMP;
SELECT ENAME, NVL(MGR,'최고경영자') FROM EMP;
DESC EMP;
SELECT ENAME, NVL(MGR, 9999) FROM EMP;
-- 논리연산자: AND OR
-- ||연결연산자 :열이나 문자를 연결
SELECT ENAME||' '||JOB FROM EMP;
--"SMITH IS CLERK"(ENAME IS JOB) 출력되고 TITLE은 EMPLOYEES라고 모든 직원 LIST
SELECT ENAME || ' IS '||JOB AS "EMPLOYEES" FROM EMP;
--SMITH의 연봉은 XX다(연봉:SAL*12+COMM) TETLE:SALARY
SELECT ENAME || '의 연봉은 ' || (SAL*12+NVL(COMM,0)) "SALARY" FROM EMP;
--EMP TABLE의 JOB (중복제거)
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;
SELECT DISTINCT JOB, DEPTNO FROM EMP;

--1. emp 테이블의 구조 출력
DESC EMP;
--2. emp 테이블의 모든 내용을 출력 
SELECT * FROM EMP;
--3. 현계정(scott)에서 사용가능한 테이블 출력
SELECT * FROM TAB;
--4. emp 테이블에서 사번, 이름, 급여, 업무, 입사일 출력
SELECT EMPNO, ENAME, SAL, JOB, HIREDATE FROM EMP;
--5. emp 테이블에서 급여가 2000미만인 사람의 사번, 이름, 급여 출력
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL<2000;
--6. 입사일이 81/02이후에 입사한 사람의 사번, 이름, 업무, 입사일 출력
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE>='81/02/01';
--7. 업무가 SALESMAN인 사람들 모든 자료 출력
SELECT * FROM EMP WHERE JOB='SALESMAN';
--8. 업무가 CLERK이 아닌 사람들 모든 자료 출력
SELECT * FROM EMP WHERE JOB!='CLERK';
--9. 급여가 1500이상이고 3000이하인 사람의 사번, 이름, 급여 출력
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>=1500 AND SAL<=3000;
--10. 부서코드가 10번이거나 30인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO=10 OR DEPTNO=30;
--11. 업무가 SALESMAN이거나 급여가 3000이상인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE JOB='SALESMAN' OR SAL>=3000;
--12. 급여가 2500이상이고 업무가 MANAGER인 사람의 사번, 이름, 업무, 급여 출력
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL>=2500 AND JOB='MANAGER';
--13.“ename은 XXX 업무이고 연봉은 XX다” 스타일로 모두 출력
SELECT ENAME||'은 '||JOB||'업무이고 연봉은 '||(NVL(COMM,0)+SAL*12)||'다' FROM EMP;

--SQL연산자
--BETWEEN A AND B :A~B (경계 포함)
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 1500 AND 3000;
--필드명 IN(LIST1,...,LISTn)
--10. 부서코드가 10번이거나 30인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO IN(10,30);
--★ 필드 LIKE 패턴 (와일드카드(%):자 이상의 문자. 와일드카드(_):1자 이상의 문자)
--이름이 M으로 시작하는 사람의 모든 필드를 출력해라.
SELECT * FROM EMP WHERE ENAME LIKE 'M%';
--이름에 N이 들어가 있는 사람의 모든 필드
SELECT * FROM EMP WHERE ENAME LIKE '%N%';
-- 82년도에 입사한 사원의 EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO 출력
SELECT EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO FROM EMP WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';
SELECT EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO FROM EMP WHERE HIREDATE LIKE '82/__/__';
SELECT EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO FROM EMP WHERE HIREDATE LIKE '82%';

--2월에 입사한 사원의 모든 필드
SELECT * FROM EMP WHERE HIREDATE LIKE '__/02/__';
--IS NULL
--COMM이 NULL인 직원을 모두
SELECT * FROM EMP WHERE COMM IS NULL;
--NOT 필드 BETWEEN A AND B
--NOT 필드 IN(LISTS)
--NOT 필드 LIKE 패턴
--IS NOT NULL
SELECT * FROM EMP WHERE COMM IS NOT NULL; 
--ORDER BY 필드 (ASC)
--ORDER BY 필드 DESC
--급여가 많은 사람부터 출력
SELECT * FROM EMP ORDER BY SAL DESC;
--급여가 낮은 사람부터
SELECT * FROM EMP ORDER BY SAL ASC;
SELECT * FROM EMP ORDER BY SAL;
--입사순서대로 출력
SELECT * FROM EMP ORDER BY HIREDATE;
--최근 입사순서
SELECT * FROM EMP ORDER BY HIREDATE DESC;
--이름 알파벳 순서
SELECT * FROM EMP ORDER BY ENAME;
--연봉이 높은 순서 이름, SAL, 연봉
SELECT ENAME, SAL,SAL*12+NVL(COMM,0) "연봉" FROM EMP ORDER BY 연봉;
--연봉이 2000 이상인 직원의 이름, 연봉을 출력(연봉순으로 정렬)
SELECT ENAME, SAL*12+NVL(COMM,0) "연봉" FROM EMP WHERE SAL*12+NVL(COMM,0)>=2000 ORDER BY 연봉;
--FROM -> WHERE -> SELECT -> ORDER BY 

--1.	EMP 테이블에서 sal이 3000이상인 사원의 empno, ename, job, sal을 출력
SELECT EMPNO, ENAME, JOB, SAL 
    FROM EMP 
    WHERE SAL>=3000;
--2.	EMP 테이블에서 empno가 7788인 사원의 ename과 deptno를 출력
SELECT ENAME, DEPTNO 
    FROM EMP 
    WHERE EMPNO=7788;
--3.	연봉이 24000이상인 사번, 이름, 급여 출력 (급여순정렬)
SELECT EMPNO, ENAME, SAL 
    FROM EMP 
    WHERE (SAL*12+NVL(COMM,0))>=24000 
    ORDER BY SAL;
--4.	EMP 테이블에서 hiredate가 1981년 2월 20과 1981년 5월 1일 사이에 입사한 사원의 ename,job,hiredate을 출력하는 SELECT 문장을 작성 (단 hiredate 순으로 출력)
SELECT ENAME, JOB, HIREDATE 
    FROM EMP 
    WHERE HIREDATE 
    BETWEEN TO_DATE('1981/02/20','YYYY/MM/DD') AND TO_DATE('1981/05/01' ,'YYYY/MM/DD')
    ORDER BY HIREDATE;
--5.	EMP 테이블에서 deptno가 10,20인 사원의 모든 정보를 출력 (단 ename순으로 정렬)
SELECT * 
    FROM EMP 
    WHERE DEPTNO IN(10,20) 
    ORDER BY ENAME;
--6.	EMP 테이블에서 sal이 1500이상이고 deptno가 10,30인 사원의 ename과 sal를 출력(단 HEADING을 employee과 Monthly Salary로 출력)
SELECT ENAME "employee", SAL "Monthly Salary" 
    FROM EMP 
    WHERE SAL>1500 AND DEPTNO IN(10,30);
--7.	EMP 테이블에서 hiredate가 1982년인 사원의 모든 정보를 출력
SELECT * 
    FROM EMP 
    WHERE HIREDATE 
    LIKE '82%';
SELECT * 
    FROM EMP 
    WHERE TO_CHAR(HIREDATE,'YYYY/MM/DD') 
    LIKE '1982%';
--8.	이름의 첫자가 C부터  P로 시작하는 사람의 이름, 급여 이름순 정렬
SELECT ENAME, SAL 
    FROM EMP 
    WHERE (ENAME BETWEEN 'C' AND 'Q') AND ENAME!='Q%'
    ORDER BY ENAME;
--9.	EMP 테이블에서 comm이 sal보다 10%가 많은 모든 사원에 대하여 이름, 급여, 상여금을 출력하는 SELECT 문을 작성
SELECT ENAME, SAL, COMM 
    FROM EMP 
    WHERE COMM>SAL*1.1;
--10.	EMP 테이블에서 job이 CLERK이거나 ANALYST이고 sal이 1000,3000,5000이 아닌 모든 사원의 정보를 출력
SELECT * 
    FROM EMP 
    WHERE JOB IN('CLERK', 'ANALYST') AND NOT SAL IN (1000,3000,5000);
--11.	EMP 테이블에서 ename에 L이 두 자가 있고 deptno가 30이거나 또는 mgr이 7782인 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * 
    FROM EMP 
    WHERE (ENAME LIKE '%L%L%' AND DEPTNO = 30) OR MGR = 7782 ;
--12.	사원 테이블에서 입사일이 81년도인 직원의 사번,사원명, 입사일, 업무, 급여를 출력
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL 
    FROM EMP 
    WHERE HIREDATE LIKE '81%';
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL 
    FROM EMP 
    WHERE TO_CHAR(HIREDATE,'YY')=81;
--13.	사원 테이블에서 입사일이81년이고 업무가 'SALESMAN'이 아닌 직원의 사번, 사원명, 입사일, 업무, 급여를 검색하시오.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL 
    FROM EMP 
    WHERE HIREDATE LIKE '81%' AND JOB!='SALESMAN';
--14.	사원 테이블의 사번, 사원명, 입사일, 업무, 급여를 급여가 높은 순으로 정렬하고, 급여가 같으면 입사일이 빠른 사원으로 정렬하시오.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL 
    FROM EMP 
    ORDER BY SAL DESC, HIREDATE;
--15.	사원 테이블에서 사원명의 세 번째 알파벳이 'N'인 사원의 사번, 사원명을 검색하시오
SELECT EMPNO, ENAME 
    FROM EMP 
    WHERE ENAME LIKE '__N%';
--16.	사원 테이블에서연봉(SAL*12)이 35000 이상인 사번, 사원명, 연봉을 검색 하시오.
SELECT EMPNO, ENAME, SAL*12 "연봉" 
    FROM EMP 
    WHERE SAL*12 >=35000;

ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD'; --DATE형포멧팅
SELECT HIREDATE FROM EMP;

--TO_CHAR(날짜형 필드,'YYYY/MM/DD')->YYYY/MM/DD스타일의 문자형으로 전환
--TO_DATE('1981/01/01','YYYY/MM/DD')->날자형으로 전환.

SELECT * FROM EMP WHERE ENAME='SMITH';


























