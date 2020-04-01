--연습문제
--현재 날짜를 출력하고 열 레이블은 Current Date로 출력하는 SELECT 문장을 기술하시오.
SELECT SYSDATE "Current Date" FROM DUAL;
--EMP 테이블에서 현재 급여에 15%가 증가된 급여를 사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장을 기술하시오.
SELECT EMPNO, ENAME, JOB, SAL, SAL*1.15 "New Salary", SAL*0.15 "Increase" FROM EMP;
--EMP 테이블에서 이름,입사일,입사일로부터 6개월 후 돌아오는 월요일 구하여 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,6),'월') FROM EMP;
--EMP 테이블에서 이름,입사일, 입사일로부터 현재까지의 월수,급여, 입사일부터 현재까지의 급여의 총계를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "현재까지 월수", TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE))*SAL "현재까지 급여총계" FROM EMP;
--EMP 테이블에서 모든 사원의 이름과 급여(15자리로 출력 좌측의 빈 곳은 “*”로 대치)를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, LPAD(SAL, 15, '*') SAL FROM EMP;
--EMP 테이블에서 모든 사원의 정보를 이름,업무,입사일,입사한 요일을 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, JOB, HIREDATE "입사일", TO_CHAR(HIREDATE,'DAY')"입사한 요일" FROM EMP;
--EMP 테이블에서 이름의 길이가 6자 이상인 사원의 정보를 이름,이름의 글자수,업무를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, LENGTH(ENAME) "이름의 글자수",JOB 
    FROM EMP
    WHERE LENGTH(ENAME)>=6;
--EMP 테이블에서 모든 사원의 정보를 이름, 업무, 급여, 보너스, 급여+보너스를 출력하는 SELECT 문장을 기술하시오
SELECT ENAME, JOB, SAL, NVL(COMM, 0) COMM, SAL+NVL(COMM, 0) SUMSAL FROM EMP;
--사원 테이블의 사원명에서 2번째 문자부터 3개의 문자를 추출하시오. 
SELECT SUBSTR(ENAME,2,3) FROM EMP;
--사원 테이블에서 입사일이 12월인 사원의 사번, 사원명, 입사일을 검색하시오
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    WHERE TO_CHAR(HIREDATE,'MM')=12;
--다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
--EMPNO		ENAME		급여
--7369		SMITH		*******800
--7499		ALLEN		******1600
--7521		WARD		******1250
--…….
SELECT EMPNO, ENAME, LPAD(SAL, 10, '*') "급여" FROM EMP;
--다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
--EMPNO	 ENAME 	입사일
--7369	  SMITH		1980-12-17
--….
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE,'YYYY-MM-DD') "입사일" FROM EMP;
--사원 테이블에서 급여에 따라 사번, 이름, 급여, 등급을 검색하는 SQL 문장을 작성 하시 오. (Hint : CASE 함수 사용) 
--급여가 0~1000 E / 1001~2000 D / 2001~3000 C / 3001~4000 B / 4001~5000 A
--   (cf) 급여가- 0~999 E / 1000~1999 D / 2000~2999 C / 3000~3999 B / 4000이상 A
SELECT EMPNO, ENAME, SAL, CASE WHEN SAL<=1000 THEN 'E'
                               WHEN SAL<=2000 THEN 'D'
                               WHEN SAL<=3000 THEN 'C'
                               WHEN SAL<=4000 THEN 'B'
                               WHEN SAL<=5000 THEN 'A' 
                                END "GRADE" FROM EMP;
--14. 사원 테이블에서 부서번호가 20인 사원의 사번, 이름, 직무, 급여를 출력하시오(급여는 앞에 $를 삽입하고 3자리마다 ,를 출력한다)
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL,'$99,999') 
    FROM EMP
    WHERE DEPTNO=20;
