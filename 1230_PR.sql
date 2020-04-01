DROP TABLE CUSTOMER;
DROP TABLE CUS_LEVEL;

CREATE TABLE CUS_LEVEL(
    LEVELNO NUMERIC(4),
    LEVELNAME VARCHAR2(19) NOT NULL,
    PRIMARY KEY(LEVELNO));
    
CREATE SEQUENCE CUS_SQ
    MAXVALUE 9999
    NOCYCLE
    NOCACHE;
    
CREATE TABLE CUSTOMER(
    CNO NUMERIC(4),
    CNAME VARCHAR2(30) NOT NULL,
    JOINDATE DATE DEFAULT SYSDATE,
    PHONE VARCHAR2(15),
    POINT NUMERIC,
    LEVELNO,
    PRIMARY KEY(CNO),
    FOREIGN KEY(LEVELNO) REFERENCES CUS_LEVEL,
    UNIQUE(PHONE));

INSERT INTO CUS_LEVEL VALUES(1, 'VVIP');
INSERT INTO CUS_LEVEL VALUES(2, 'VIP');
INSERT INTO CUS_LEVEL VALUES(3, 'NORMAL');
INSERT INTO CUS_LEVEL VALUES(4, 'BLACK');
SELECT * FROM CUS_LEVEL;

INSERT INTO CUSTOMER VALUES(CUS_SQ.NEXTVAL, 'ȫ�浿', 
    TO_DATE(171017,'YYMMDD'),'010-9999-9999',300,1);
INSERT INTO CUSTOMER VALUES(CUS_SQ.NEXTVAL, '��ö��', 
    TO_DATE(160906,'YYMMDD'),'010-9999-9888',NULL,2);
INSERT INTO CUSTOMER VALUES(CUS_SQ.NEXTVAL, 'ȫ���', 
    TO_DATE(160907,'YYMMDD'),'010-9999-6666',50,3);
SELECT * FROM CUSTOMER;

SELECT CNO, CNAME, TO_CHAR(JOINDATE,'YYYY-MM-DD'), PHONE, POINT, 
    (SELECT LEVELNAME FROM CUS_LEVEL WHERE LEVELNO=C.LEVELNO) LEVELNAME
    FROM CUSTOMER C;