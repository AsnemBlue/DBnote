DROP TABLE CART;
DROP TABLE ORDERDETAIL;
DROP TABLE ORDERS;
DROP TABLE MEMBER;
DROP TABLE PRODUCT;

CREATE TABLE MEMBER(
    MNO VARCHAR2(10),
    MNAME VARCHAR2(50),
    MADDR VARCHAR2(255),
    MTEL VARCHAR2(30),
    MMAIL VARCHAR2(40),
    PRIMARY KEY(MNO));

CREATE TABLE PRODUCT(
    PCODE VARCHAR2(5),
    PNAME VARCHAR2(50),
    PPRICE VARCHAR2(9),
    PSTOCK VARCHAR2(3),
    PRIMARY KEY(PCODE));

CREATE TABLE ORDERS(
    ONO NUMERIC,
    MNO VARCHAR2(10),
    OADDR VARCHAR2(255),
    OTEL VARCHAR2(30),
    ODATE DATE,
    PRIMARY KEY(ONO),
    FOREIGN KEY(MNO) REFERENCES MEMBER);
DESC ORDERS;

CREATE TABLE ORDERDETAIL(
    ODNO NUMERIC(4),
    ONO NUMERIC,
    PCODE VARCHAR2(5),
    QTY NUMERIC(3),
    COST NUMERIC(9),
    PRIMARY KEY(ODNO),
    FOREIGN KEY(ONO) REFERENCES ORDERS,
    FOREIGN KEY(PCODE) REFERENCES PRODUCT);
    
CREATE TABLE CART(
    CNO NUMERIC(4),
    MNO VARCHAR2(10),
    PCODE VARCHAR2(5),
    QTY NUMERIC(3),
    COST NUMERIC(9),
    PRIMARY KEY(CNO),
    FOREIGN KEY(PCODE) REFERENCES PRODUCT,
    FOREIGN KEY(MNO) REFERENCES MEMBER);


