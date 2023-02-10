SET SERVEROUTPUT ON;
select sysdate from dual;



CREATE OR REPLACE PROCEDURE P1  AS
VENAME VARCHAR2(10);
VSAL NUMBER(5);
VJOB VARCHAR2(10);
BEGIN
SELECT ENAME,SAL,JOB INTO VENAME,VSAL,VJOB FROM EMP WHERE EMPNO=&EMPNO;
DBMS_OUTPUT.PUT_LINE(VENAME|| '---'||VSAL||'----'||VJOB);
END;
/

EXEC P1;

CREATE OR REPLACE PROCEDURE P2(P_EMPNO NUMBER) IS
VENAME VARCHAR2(10);
VSAL NUMBER(5);
VJOB VARCHAR2(10);
BEGIN
SELECT ENAME,SAL,JOB INTO VENAME,VSAL,VJOB FROM EMP WHERE EMPNO=P_EMPNO;
DBMS_OUTPUT.PUT_LINE(VENAME|| '---'||VSAL||'----'||VJOB);
END;
/
EXEC P2(7839);


CREATE OR REPLACE PROCEDURE P3(P_EMPNO IN NUMBER  ) IS
VENAME VARCHAR2(10);
VSAL NUMBER(5);
VJOB VARCHAR2(10);
BEGIN
SELECT ENAME,SAL,JOB INTO VENAME,VSAL,VJOB FROM EMP WHERE EMPNO=P_EMPNO;
DBMS_OUTPUT.PUT_LINE(VENAME|| '---'||VSAL||'----'||VJOB);
END;
/
EXEC P3(7839);


CREATE OR REPLACE PROCEDURE P4(P_EMPNO IN NUMBER,  VSAL OUT NUMBER  ) IS
BEGIN
SELECT SAL  INTO VSAL FROM EMP WHERE EMPNO=P_EMPNO;
--DBMS_OUTPUT.PUT_LINE(VSAL);
END;
/

DECLARE
A NUMBER(5);
BEGIN
P4(7839,A);
DBMS_OUTPUT.PUT_LINE(A);
END;
/

VARIABLE B NUMBER;
EXEC P4(7839, :B);
PRINT B;





DML OPERATIONS IN PROCEDURES
--------------------------------

CREATE OR REPLACE PROCEDURE P6(P_ID      IN     NUMBER      ,P_NAME       IN   VARCHAR2 ,P_DEPTNO   IN    NUMBER   ,P_SAL        IN  NUMBER ) IS
 BEGIN
 INSERT INTO EMP1 VALUES(P_ID,P_NAME,P_DEPTNO,P_SAL);
 DBMS_OUTPUT.PUT_LINE('INSERTION DONE');
 END;
 /
 EXEC P6(11,'DEF',60,5000);
 
 
 
CREATE OR REPLACE PROCEDURE P7(P_ID      IN     NUMBER  ) IS
 A NUMBER(5);
 BEGIN
 IF P_ID  != A;
 INSERT INTO EMP1 VALUES(ID);
 ELSE
 UPDATE EMP1 SET ENAME = 'GOPI' WHERE ENAME='ABC';
 ENF IF;
  END;
 /




04-12-22
----------------------------
drop table customers;
create table customers(id number,item_no number,quantity  number,bill_date date default(sysdate));

insert into customers(id,item_no,quantity) values(1,10,2);
insert into customers(id,item_no,quantity) values(2,10,1);
insert into customers(id,item_no,quantity) values(2,20,1);
insert into customers(id,item_no,quantity) values(3,10,1);
insert into customers(id,item_no,quantity) values(3,30,3);
insert into customers(id,item_no,quantity) values(4,10,1);
insert into customers(id,item_no,quantity) values(4,30,2);
insert into customers(id,item_no,quantity) values(5,20,1);
insert into customers(id,item_no,quantity) values(6,40,2);
insert into customers(id,item_no,quantity) values(7,10,2);
insert into customers(id,item_no,quantity) values(8,10,1);
insert into customers(id,item_no,quantity) values(8,30,2);
insert into customers(id,item_no,quantity) values(9,10,1);
insert into customers(id,item_no,quantity) values(9,20,1);
insert into customers(id,item_no,quantity) values(10,10,2);
insert into customers(id,item_no,quantity) values(10,30,1);

select * from customers;


create table items( item_no number,menu_item varchar2(20),rate number);

insert into items values(10,'idli',30);
insert into items values(20,'plain_dosa',30);
insert into items values(30,'vada',20);
insert into items values(40,'egg_dosa',30);

select * from items;

DROP TABLE  DAILY_REVENU;
CREATE  TABLE  DAILY_REVENU AS
SELECT A.ID,B.MENU_ITEM,A.ITEM_NO,A.QUANTITY,B.RATE, A.QUANTITY*B.RATE AMOUNT,A.BILL_DATE
FROM CUSTOMERS A
LEFT JOIN
ITEMS B
ON A.ITEM_NO=b.ITEM_NO;

SELECT * FROM  DAILY_REVENU ORDER BY ID;

commit;
DROP TABLE  DAILY_REVENU1;
CREATE  TABLE  DAILY_REVENU1 AS
SELECT A.*,B.MENU_ITEM,B.RATE, A.QUANTITY*B.RATE AMOUNT
FROM CUSTOMERS A
LEFT JOIN
ITEMS B
ON A.ITEM_NO=b.ITEM_NO;

SELECT * FROM  DAILY_REVENU1 ORDER BY ID;

SELECT  SUM(AMOUNT) FROM DAILY_REVENU1 WHERE ;






SELECT * FROM  EMP2;

INSERT INTO EMP2 VALUES(5,'MAHI',5000);
COMMIT;
INSERT INTO EMP2 VALUES(6,'HARINATH',4000);
INSERT INTO EMP2 VALUES(7,'RAMU',3000);
INSERT INTO EMP2 VALUES(8,'MANOHAR',5000);
COMMIT;
DELETE FROM EMP2;
ROLLBACK;

UPDATE EMP2 SET  NAME='RAJESH' WHERE ID=4;

DELETE FROM EMP2;

GRANT SELECT ON EMP2 TO PUBLIC;

create table customers(id number,item_no number,quantity  number,bill_date date default(sysdate));


insert into customers(id,item_no,quantity) values(1,10,1);
insert into customers(id,item_no,quantity) values(2,10,2);
insert into customers(id,item_no,quantity) values(2,20,1);
insert into customers(id,item_no,quantity) values(3,10,2);
insert into customers(id,item_no,quantity) values(3,30,1);
insert into customers(id,item_no,quantity) values(4,10,1);
insert into customers(id,item_no,quantity) values(4,30,1);
insert into customers(id,item_no,quantity) values(5,20,2);
insert into customers(id,item_no,quantity) values(6,40,1);                                        
insert into customers(id,item_no,quantity) values(7,10,1);
insert into customers(id,item_no,quantity) values(8,10,2);
insert into customers(id,item_no,quantity) values(8,30,1);
insert into customers(id,item_no,quantity) values(9,10,2);
insert into customers(id,item_no,quantity) values(9,20,2);
insert into customers(id,item_no,quantity) values(10,10,1);
insert into customers(id,item_no,quantity) values(10,30,2);

select * from customers;


SELECT * FROM  DAILY_REVENU1  where  trunc(bill_date)='04-12-22'  and id=10;



trunc()    ----  it will give the strating time of the field  
round()  --     if the value is upto 50% means it will take to starting value and above 50% means it will give next value     








06-12-22
-----------------------------------------------
create table queue(id number, name varchar2(20),weight number, turn number);

insert into queue values(5,'GEORGE W',250,1);

insert into queue values(6,'THOMAS J',400,3);
insert into queue values(3,'JOHN A',350,1);
insert into queue values(4,'THOMAS R',175,5);
insert into queue values(2,'WILL  J',200,4);
insert into queue values(1,'JAMES E',500,6);

SELECT * FROM QUEUE;
UPDATE QUEUE SET TURN=2 WHERE ID=3;
COMMIT;

SELECT * FROM QUEUE ORDER BY TURN;

SELECT NAME,SUM(WEIGHT)  OVER (ORDER BY TURN) AS ENTRY FROM  QUEUE;


SELECT NAME,SUM(WEIGHT)  OVER (ORDER BY TURN) AS ENTRY FROM  QUEUE;



SELECT NAME FROM(SELECT NAME,SUM(WEIGHT)  OVER (ORDER BY TURN) AS ENTRY FROM  QUEUE) WHERE ENTRY=1000;




set SERVEROUTPUT ON;


08-11-22
------------------------------
Functions

CREATE OR REPLACE FUNCTION F1   RETURN NUMBER AS
A  NUMBER := 15;
BEGIN
DBMS_OUTPUT.PUT_LINE( A);
RETURN A;
end;
/

SELECT F1 FROM DUAL;


/*
CREATE OR REPLACE FUNCTION F2(A  NUMBER)  RETURN NUMBER AS
BEGIN
DBMS_OUTPUT.PUT_LINE(A);
RETURN A;
END;

SELECT F2(20) FROM DUAL;



CREATE OR REPLACE FUNCTION F3(B  IN NUMBER , C  OUT NUMBER, D OUT NUMBER ) RETURN NUMBER   AS
C := 15;
D:= 20;
BEGIN
DBMS_OUTPUT.PUT_LINE(B);
RETURN C;
RETURN D;

END;


SELECT F3(30) FROM DUAL;

VARIABLE C NUMBER;
EXEC P4(7839, :B);
PRINT B;


*/

13-12-22
--------------------------

CREATE  TABLE EMP_PART_RANGE(ENO NUMBER,ENAME VARCHAR2(5),DOB DATE,SAL NUMBER) PARTITION BY RANGE(ENO)
( PARTITION P1 VALUES LESS THAN(10), 
PARTITION P2 VALUES LESS THAN(20),
PARTITION P3 VALUES LESS THAN(30)
);

select * from v$option where parameter = 'Partitioning'; 

SELECT * FROM V$VERSION;


SELECT SYSDATE FROM DUAL;




SELECT * FROM EMP;



SELECT DEPTNO,SUM(SAL)  TOTAL_SAL FROM EMP GROUP BY DEPTNO;

SELECT AVG(TOTAL_SAL) FROM (SELECT DEPTNO,SUM(SAL)  TOTAL_SAL FROM EMP GROUP BY DEPTNO);

SELECT DEPTNO, TOTAL_SAL FROM (SELECT DEPTNO,SUM(SAL)  TOTAL_SAL FROM EMP GROUP BY DEPTNO)  GROUP BY DEPTNO,TOTAL_SAL HAVING
TOTAL_SAL>( SELECT AVG(TOTAL_SAL) FROM (SELECT DEPTNO,SUM(SAL)  TOTAL_SAL FROM EMP GROUP BY DEPTNO) );


WITH  AA AS ( SELECT DEPTNO,SUM(SAL)  TOTAL_SAL FROM EMP GROUP BY DEPTNO)  , 
              BB AS  (SELECT AVG(TOTAL_SAL)  AVG_SAL  FROM AA ) 
SELECT AA.DEPTNO, AA.TOTAL_SAL 
FROM AA , BB WHERE AA.TOTAL_SAL > BB.AVG_SAL;


-- -------------------------------------------------------------------------------------------
--    04-01-23
--------------------------------------------------------------------------------------------------------------------

 SELECT LEVEL FROM DUAL CONNECT BY LEVEL<=5;
SELECT 'WELCOME' D  FROM DUAL;

WITH T1 AS (SELECT  'WELCOME' D  FROM DUAL) 
SELECT D FROM T1;

WITH T1 AS (SELECT  'WELCOME' D  FROM DUAL) 
SELECT D FROM T1 CONNECT BY LEVEL<=LENGTH(D);

WITH T1 AS (SELECT 'WELCOME' D FROM DUAL)
SELECT SUBSTR(D,LEVEL) R1
FROM T1 CONNECT BY LEVEL<=LENGTH(D);

WITH T1 AS (SELECT 'WELCOME' D FROM DUAL)
SELECT SUBSTR(D,LEVEL) R1,
                 SUBSTR(D,1,LEVEL) R2
FROM T1 CONNECT BY LEVEL<=LENGTH(D);

WITH T1 AS (SELECT 'WELCOME' D FROM DUAL)
SELECT SUBSTR(D,LEVEL) R1,
               SUBSTR(D,1,LEVEL)R2,
               SUBSTR(D,LEVEL,1)R3               
 FROM T1 CONNECT BY LEVEL<=LENGTH(D);        
 
 WITH T1 AS (SELECT 'WELCOME' D FROM DUAL)
 SELECT SUBSTR(D,LEVEL) R1,
                   SUBSTR(D,1,LEVEL) R2,
                   SUBSTR(D,LEVEL,1) R3,
                   SUBSTR(D, -LEVEL)  R4
FROM T1 CONNECT BY LEVEL<=LENGTH(D);

---------------------------------------------------------------------------------------------------------------------

--    PIVOT   ---- MAKING COLUMNS INTO  ROWS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT DEPTNO FROM EMP;

SELECT * FROM(SELECT DEPTNO FROM EMP)
PIVOT(COUNT(*) CNT_ROWS FOR DEPTNO IN(10,20,30) );

SELECT * FROM EMP;

SELECT * FROM(SELECT JOB,SAL,DEPTNO FROM EMP)
PIVOT(SUM(SAL) SUM_SAL,COUNT(*) CNT FOR DEPTNO IN(10,20,30));


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  -- UNPIVOT    -- MAKING COLUMNS INTO ROWS
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
SELECT 'WELCOME' COL1, 'TO' COL2, 'ORACLE' COL3, 'DEVELOPMENT' COL4 FROM DUAL ;

SELECT * FROM 
( SELECT 'WELCOME' COL1, 'TO' COL2, 'ORACLE' COL3, 'DEVELOPMENT' COL4 FROM DUAL)
UNPIVOT(COL_VAL FOR COL_NAME IN(COL1,COL2,COL3,COL4));

SELECT ENAME,EMPNO,JOB FROM EMP;

SELECT * FROM(SELECT ENAME, TO_CHAR(EMPNO) EMPNO, JOB FROM EMP)
UNPIVOT(COL_VAL FOR COL_NAME IN(ENAME,EMPNO,JOB));







---------------------------------------------------------------------------------------------------------------------------

cursor Attributes

-------------------------------------------------------------------------------------------------------------------------------

1)  %NOTFOUND

2) %FOUND

3) %ISOPEN

4) %ROWCOUNT

SET SERVEROUTPUT ON;

DECLARE
CURSOR C1 IS SELECT  EMPNO,ENAME,JOB FROM EMP;
VEMPNO NUMBER(5);
VENAME VARCHAR2(20);
VJOB VARCHAR2(20);
BEGIN
OPEN C1;
LOOP
FETCH C1 INTO VEMPNO,VENAME,VJOB;
EXIT WHEN C1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(VEMPNO||','||VENAME||','||VJOB);
END LOOP;
CLOSE C1;
END;
/


DECLARE
CURSOR C1 IS SELECT * FROM EMP;
I  EMP%ROWTYPE;
BEGIN
OPEN C1;
LOOP
FETCH C1 INTO I;
IF C1%FOUND THEN
DBMS_OUTPUT.PUT_LINE(I.EMPNO||'  ,  '||I.ENAME||'  ,  '|| I.JOB);
ELSE EXIT;
END IF;
END LOOP;
CLOSE C1;
END;
/


DECLARE
CURSOR C1 IS SELECT * FROM EMP;
I EMP%ROWTYPE;
BEGIN
OPEN C1;
IF C1%ISOPEN THEN
LOOP
FETCH C1 INTO I;
IF C1%FOUND THEN
DBMS_OUTPUT.PUT_LINE(I.EMPNO||'  ,  '||I.ENAME||'  ,  '|| I.JOB);
ELSE EXIT;
END IF;
END LOOP;
END IF;
CLOSE C1;
END;
/



DECLARE
CURSOR C1 IS SELECT * FROM EMP;
I EMP%ROWTYPE;
BEGIN
OPEN C1;
IF C1%ISOPEN THEN
DBMS_OUTPUT.PUT_LINE('CURSOR IS OPENED');
DBMS_OUTPUT.PUT_LINE('=======================================================');
LOOP
FETCH C1 INTO I;
IF C1%FOUND THEN
DBMS_OUTPUT.PUT_LINE(I.EMPNO||'  ,  '||I.ENAME||'  ,  '|| I.JOB);
ELSE EXIT;
END IF;
END LOOP;
END IF;
CLOSE C1;
DBMS_OUTPUT.PUT_LINE('=======================================================');
IF NOT C1%ISOPEN THEN
DBMS_OUTPUT.PUT_LINE('CURSOR IS CLOSED');
END IF;
END;
/

SELECT * FROM EMP;
SELECT EMPNO,ENAME,JOB FROM EMP;


DECLARE
TYPE T1 IS TABLE OF EMP%ROWTYPE INDEX BY BINARY_INTEGER;
V1  T1;
BEGIN
SELECT  * BULK COLLECT INTO V1 FROM EMP;
FOR I IN V1.FIRST..V1.LAST
LOOP
DBMS_OUTPUT.PUT_LINE(V1(I).EMPNO||'  ,  '||V1(I).ENAME||'  ,  '||V1(I).JOB);
END LOOP;
END;
/

SELECT * FROM EMP;

DECLARE 
TYPE T1 IS TABLE OF EMP%ROWTYPE INDEX BY BINARY_INTEGER;
V1  T1;
BEGIN
UPDATE EMP SET SAL=SAL+500 WHERE JOB='CLERK'  RETURNING EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO  BULK COLLECT INTO V1;
DBMS_OUTPUT.PUT_LINE('UPDATED NO OF RECOREDS  : '||SQL%ROWCOUNT);
FOR I IN V1.FIRST..V1.LAST
LOOP
DBMS_OUTPUT.PUT_LINE(V1(I).ENAME||' , '||V1(I).JOB||' , ' ||V1(I).SAL);
END LOOP;
END;
/

--  String functions in sql

select 'welcome' d from dual ;

WITH T1 AS(
select 'WELCOME'  D from dual) 
SELECT D FROM T1;


WITH T1 AS
(SELECT 'WELCOME' D FROM DUAL) 
SELECT D  FROM T1
CONNECT BY LEVEL<=LENGTH(D); 

WITH T1 AS
(SELECT 'WELCOME' D FROM DUAL) 
SELECT D,
                SUBSTR(D,LEVEL,1) D1,
                SUBSTR(D,-LEVEL,1) D2
FROM T1
CONNECT BY LEVEL<=LENGTH(D); 


WITH T1 AS (SELECT 'WELCOME' D FROM DUAL)
SELECT SUBSTR(D,LEVEL,1) STR 
FROM T1
CONNECT BY LEVEL <= LENGTH(D) ;


WITH T1 AS (SELECT 'WELCOME' D FROM DUAL)
SELECT  STR FROM (
SELECT SUBSTR(D,LEVEL,1) STR 
FROM T1
CONNECT BY LEVEL <= LENGTH(D) );


WITH T AS (
           SELECT 'WELCOME' D FROM DUAL )
SELECT  LISTAGG(S) WITHIN GROUP(ORDER BY 1 DESC) 
FROM (
                 SELECT LEVEL 1, SUBSTR(D,LEVEL,1) S
                 FROM  T
                 CONNECT BY LEVEL <= LENGTH(D) 
);

SELECT  LEVEL LVL, 
                  SUBSTR('ORACLE' , LEVEL,1) STR FROM  DUAL
CONNECT BY LEVEL <= LENGTH('ORACLE');

SELECT LISTAGG(S) WITHIN GROUP(ORDER BY LVL ) STR,
                 LISTAGG(S) WITHIN GROUP(ORDER BY LVL DESC) REV
FROM (
SELECT  LEVEL LVL, 
                  SUBSTR('ORACLE'  , LEVEL,1) S FROM  DUAL
CONNECT BY LEVEL <= LENGTH('ORACLE')
);




WITH T1 AS
(SELECT  '9703180969' D FROM DUAL)
SELECT  SUBSTR(D,LEVEL,1) S
FROM T1 CONNECT  BY LEVEL <= LENGTH(D);




SELECT '5555555555' STR FROM DUAL;


SELECT LEVEL LVL,
                 SUBSTR('5555555555' , LEVEL, 1) NUM 
FROM DUAL CONNECT BY LEVEL<= 10 ;



SELECT CASE WHEN MOD(LVL,2)=0 THEN 'X'
                ELSE NUM END OUTPUT
FROM (
SELECT LEVEL LVL,
                 SUBSTR('5555555555' , LEVEL, 1) NUM 
FROM DUAL CONNECT BY LEVEL<= 10 )
;



SELECT  '5555555555' INPUT, 
                    LISTAGG (
                                           CASE WHEN MOD(LVL,2) = 0 THEN 'X'
                                           ELSE NUM END )  
                               WITHIN GROUP(ORDER BY LVL) OUTPUT
                        FROM (
                                         SELECT LEVEL LVL,
                                        SUBSTR('5555555555' , LEVEL,1) NUM 
                                        FROM DUAL
                                        CONNECT BY LEVEL <= 10
                                    ) ;
                                    
                                    
                                    
                                    

 SELECT   LEVEL LVL , 
                     SUBSTR( '9703180969' ,LEVEL,1) NUM FROM DUAL
                     CONNECT BY LEVEL <=10                    
                     ;
                     
 SELECT CASE WHEN  LVL >= 4 THEN 'X'
                               ELSE NUM END OUTPUT FROM (
 SELECT   LEVEL LVL , 
                     SUBSTR( '9703180969' ,LEVEL,1) NUM FROM DUAL
                     CONNECT BY LEVEL <=10   )                 
                     ;
                     
                     
  SELECT  LISTAGG(   
                                           CASE WHEN  LVL >= 4 THEN 'X'
                                           ELSE NUM END) 
                                           WITHIN GROUP(ORDER BY LVL)
                                           OUTPUT FROM (
                     SELECT   LEVEL LVL , 
                                        SUBSTR( '9703180969' ,LEVEL,1) NUM FROM DUAL
                                        CONNECT BY LEVEL <=10   )                 
                     ;
                     
  SELECT  '9703180969'  INPUT,
                     LISTAGG(   
                                           CASE WHEN  LVL >= 4 THEN 'X'
                                           ELSE NUM END) 
                                           WITHIN GROUP(ORDER BY LVL)
                                           OUTPUT FROM (
                     SELECT   LEVEL LVL , 
                                        SUBSTR( '9703180969' ,LEVEL,1) NUM FROM DUAL
                                        CONNECT BY LEVEL <=10   )                 
                     ;
                     
                     
                     
                     
SELECT LEVEL LVL, 
                 SUBSTR('9703180969', LEVEL, 1) NUM FROM DUAL
                 CONNECT BY LEVEL <= 10 
  ;         
  
  
SELECT CASE WHEN 
                              LVL >=8 THEN NUM ELSE 'X' END OUTPUT FROM(
  SELECT LEVEL LVL, 
                 SUBSTR('9703180969', LEVEL, 1) NUM FROM DUAL
                 CONNECT BY LEVEL <= 10 )
  ;  
  
  
  SELECT  '9703180969' INPUT,
                     LISTAGG (CASE WHEN  LVL >=8 THEN NUM
                                                        ELSE 'X' END) 
                                WITHIN GROUP(ORDER BY LVL) OUTPUT 
                     FROM(
                     SELECT LEVEL LVL, 
                                      SUBSTR('9703180969', LEVEL, 1) NUM FROM DUAL
                                     CONNECT BY LEVEL <= 10 )
                        ;  
                        
                        
                        
SELECT LEVEL LVL,
                 SUBSTR('9703180969', LEVEL,1)  NUM FROM DUAL
                 CONNECT BY LEVEL <=10;
                 
SELECT   CASE WHEN LVL BETWEEN 3 AND 8 
                   THEN 'X' ELSE NUM END OUTPUT 
        FROM (
                        SELECT LEVEL LVL,
                       SUBSTR('9703180969', LEVEL,1)  NUM FROM DUAL
                        CONNECT BY LEVEL <=10
                       );
                       
                       
                       
SELECT   LISTAGG( CASE WHEN LVL BETWEEN 3 AND 8 
                   THEN 'X' ELSE NUM END) WITHIN GROUP(ORDER BY LVL) OUTPUT 
        FROM (
                        SELECT LEVEL LVL,
                       SUBSTR('9703180969', LEVEL,1)  NUM FROM DUAL
                        CONNECT BY LEVEL <=10
                       );
                       
                       
SELECT   '9703180969' INPUT,
                    LISTAGG ( CASE WHEN LVL BETWEEN 3 AND 8  THEN 'X' 
                                                        ELSE NUM END) 
                                   WITHIN GROUP(ORDER BY LVL) OUTPUT 
                     FROM (
                                        SELECT LEVEL LVL,
                                       SUBSTR('9703180969', LEVEL,1)  NUM FROM DUAL
                                        CONNECT BY LEVEL <=10
                                   );                                
                                   
                                   
                                   
SELECT LEVEL LVL,
                 SUBSTR( '9703180969' , LEVEL ,1) NUM FROM DUAL
                 CONNECT BY LEVEL <= 10;

        
SELECT  LEVEL LVL,
                 SUBSTR( '9703180969' , LEVEL ,1) NUM FROM DUAL
                 CONNECT BY LEVEL <= 10 );
                 
SELECT LISTAGG( CASE WHEN MOD(LVL,2) = 0 THEN 'X' ELSE NUM END) WITHIN GROUP(ORDER BY LVL) OUTPUT 
              FROM (             
SELECT  LEVEL LVL,
                 SUBSTR( '9703180969' , LEVEL ,1) NUM FROM DUAL
                 CONNECT BY LEVEL <= 10 );
                 
SELECT  '9703180969' INPUT,
                   LISTAGG( CASE WHEN MOD(LVL,2) = 0 THEN 'X' 
                                                       ELSE NUM END) WITHIN GROUP(ORDER BY LVL) OUTPUT 
                    FROM (             
                                        SELECT  LEVEL LVL,
                                        SUBSTR( '9703180969' , LEVEL ,1) NUM FROM DUAL
                                        CONNECT BY LEVEL <= 10
                                   );
                                   
    
 --  WITH CLAUSE
 ----------------------------------------------
 
 WITH CLAUSE IS A CTE(COMMON TABLE EXPRESSION) WHICH IS USED TO HOLD THE SUBQUERY AND USE IT IN MULTIPLE PLACES 
 
 CONNECT BY CLAUSE IS USED FOR GETTING HYRARCIAL STRUCTURE LIKE PARENT TO CHILD 
 
   SELECT   'WELCOME' D FROM DUAL ;
   
   WITH T1 AS
   ( SELECT   'WELCOME' D FROM DUAL)
   SELECT D FROM T1;
   
   
     WITH T1 AS
   ( SELECT   'WELCOME' D FROM DUAL)
   SELECT D FROM T1
   CONNECT BY LEVEL  <= LENGTH(D);
   
  WITH T1 AS
   ( SELECT   'WELCOME' D FROM DUAL)
   SELECT  D,
                     SUBSTR(D,LEVEL,1) D1,
                     SUBSTR(D,-LEVEL,1) D2
   
   FROM T1
   CONNECT BY LEVEL  <= LENGTH(D);
   
   
   
   
  --- STRINGS
   -------------------------------------------
  -- SUBSTRING --  SUBSTR(COLUME NAME OR A STRING, STRARTING INDEX, NUMBER OF CHARACTERS  TO PRINT FROM STARTING POSTION)
  
    SELECT  SUBSTR('ORACLE IS THE DATABASE',1,5) FROM DUAL;
    
        SELECT  SUBSTR('ORACLE IS THE DATABASE',5,15) FROM DUAL;
        
         SELECT  SUBSTR('ORACLE IS THE DATABASE',4) FROM DUAL;
         
    --     INSTR
         ------------------------------
     --    INSTR GIVES THE INDEX POSTION OF THE CHARACTER
     
   --   INSTR(COLUMN NAME OR STRING, CHARACTER TO FIND THE INDEX, STARTING INDEX TO SEARCH)
     
     SELECT  INSTR('ORACLE IS THE DATA BASE', 'A',10) FROM DUAL;
     
     --UPPER, LOWER
     -----------------------------------------
     
     SELECT UPPER('hello how are you') str from dual;
     
         SELECT UPPER('hello how are you') str from dual;
         
         
         select * from emp;
         select upper(ename) from emp;
         
               select lower(ename) from emp;
               
               
                     select initcap(ename) from emp;
                     
                     SELECT INITCAP('hello how are you') str from dual;
                     
                       SELECT REPLACE('hello how are you','hello','hi') str from dual;
                       
                       
                       
                       
                        SELECT REPLACE('oracle','c','i') str from dual;
                        
                        SELECT REPLACE('oracle  ora    oreao','r','i') str from dual;
                        
                        
                        
                        select  ltrim('        how are you        ') from dual;
                        
                         select  rtrim('        how are you      ') from dual;
                         
                            select  trim('        how are you      ') from dual;
                            
                            
WITH T2 AS 
(SELECT '    HOW ARE YOU    ' STR FROM DUAL)
SELECT STR ,
                LTRIM(STR) STR1
FROM T2;



SELECT     '    HOW ARE YOU    ' STR, 
                     LTRIM('    HOW ARE YOU    ' ) STR1 ,
                     RTRIM('    HOW ARE YOU    ') STR3
FROM DUAL;

SELECT * FROM EMP;

DESC EMP;

SELECT  EMPNO ,ENAME  , JOB,  MGR , DEPTNO,
                  SUM(SAL)  OVER(PARTITION BY DEPTNO) AS  SUM_SAL_DEPT, SAL 
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL,
                  SUM(SAL) OVER(ORDER BY SAL) AS RUNNING_TOTAL  FROM EMP;
                  
                  

SELECT NVL('A','B')  RESULT FROM DUAL;  -- IF VALUE IS PRESENT  IN FIRST THEN FIRST VALUE WILL BE RESULT

SELECT NVL(NULL , 'B')  RESULT FROM DUAL;  --- IF NULL  IS PRESENT  IN FIRST THEN SECOND VALUE WILL BE RESULT

SELECT NVL(NULL , NULL)  RESULT FROM DUAL;  --  IF BOTH NULL THEN NULL  WILL BE RESULT

SELECT NVL2('A','B','C') RESULT FROM DUAL;  ---- IF FIRST VALUE IS PRESENT  THEN SECOND  VALUE WILL BE RESULT

SELECT NVL2(NULL,'B','C') RESULT FROM DUAL;  ------ IF FIRST VALUE IS NULL  THEN THIRD  VALUE WILL BE RESULT

SELECT NVL2('A', NULL , 'C') RESULT FROM DUAL;  -------- IF FIRST VALUE IS PRESENT  THEN  SECOND VALUE IS NULL ALSO RESULT WILL BE NULL ONLY

SELECT NVL2(NULL,'B',NULL) RESULT FROM DUAL;  -- ------ IF FIRST VALUE IS NULL  THEN THIRD  VALUE WILL BE RESULT,THERE THIRD VALUE IS ALSO NULL THEN NULL WILL BE FINAL VALUE

SELECT COALESCE('A','B','C','D','E','F','G') RESULT FROM DUAL;  -----  ALWAYS CHECK FOR THE FIRST NOT NULL VALUE SO RESULT IS FIRST VALUE ONLY

SELECT COALESCE(NULL,'B','C','D','E','F','G') RESULT FROM DUAL;  --  IF FIRST VALUE IS NULL THEN THE RESULT WILL BE SECOND VALUE

SELECT COALESCE(NULL,NULL,'C','D','E','F','G') RESULT FROM DUAL;  --HERE THE RESULT IS THIRD VALUE BECAUSE OF FIRST NOT NULL VALUE IS THIRD VALUE

SELECT COALESCE('A',NULL,'C','D','E','F','G') RESULT FROM DUAL;  --  IF FIRST VALUE IS PRESENT THEN RESULT IS FIRST VALUE ONLY IF ANY OTHER PLACES NULL ALSO 




WITH T1 AS (SELECT  'HELLO HOW ARE YOU' D FROM DUAL)
SELECT D,
                  INSTR(D,' ',1,1) SPACE_ONE,
                  INSTR(D,' ',1,2) SPACE_TWO,
                  substr(D,INSTR(D,' ',1,1),INSTR(D,' ',1,2)-INSTR(D,' ',1,1)) STR
FROM T1;





WITH T1 AS (SELECT  'HELLO HOW ARE YOU' D FROM DUAL)
SELECT D,
                  INSTR(D,' ',1,2) L1,
                  INSTR(D,' ',1,3) L2,
                  substr(D,INSTR(D,' ',1,2),INSTR(D,' ',1,3)-INSTR(D,' ',1,2)) STR
FROM T1;

SELECT * FROM TEST1;


 CREATE TABLE TEST1(FULL_NAME VARCHAR2(40));
 
 INSERT INTO TEST1 VALUES('KIRAN,KUMAR,GURRAM');
 
  INSERT INTO TEST1 VALUES('NEHA,GEETHA,KRUTHIKA');
  
  
  SELECT  FULL_NAME,
                    REGEXP_SUBSTR (FULL_NAME, '[^,]+', 1, 1)  AS FIRST_NAME,
                    REGEXP_SUBSTR (FULL_NAME, '[^,]+', 1, 2)  AS MIDDLE_NAME,
                    REGEXP_SUBSTR (FULL_NAME, '[^,]+', 1, 3)  AS LAST_NAME
 FROM TEST1;
 
 commit;
 
 
 
 
 SELECT REGEXP_SUBSTR('ONE TWO THREE FOUR FIVE SIX','\w',1,4) WORDN FROM DUAL;



SELECT * FROM employees;





SELECT ROWNUM,A.* FROM employees A;

SELECT  MIN(HIRE_DATE),MAX(HIRE_DATE)  FROM employees A;

DESC employees;

SELECT  TO_CHAR(TO_DATE(HIRE_DATE,'DD--MM-YY'),'DD-MON-YYYY') FROM employees;



 SELECT REGEXP_SUBSTR('ONE TWO THREE FOUR FIVE SIX','\w',1,4) WORDN FROM DUAL;
 
 
 SELECT NUM_ROWS FROM USER_TABLES WHERE TABLE_NAME='EMP';
 
 
 
 
 SELECT * FROM EMPLOYEES;

SELECT  E2.FIRST_NAME,E2.SALARY FROM EMPLOYEES E1 ,EMPLOYEES E2 WHERE  E1.SALARY=E2.SALARY ORDER BY SALARY;

SELECT  FIRST_NAME,SALARY,SUM(SALARY) OVER(ORDER BY FIRST_NAME,SALARY)  FROM EMPLOYEES;



SELECT * FROM (
SELECT EMPNO,ENAME,SAL,DEPTNO,RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) RK1
FROM EMP) 
WHERE RK1=1;

SELECT * FROM EMP;

CREATE MATERIALIZED VIEW EMP_MVIEW AS SELECT * FROM EMP;

SELECT ROWID,EMPNO FROM EMP_VIEW;

SELECT * FROM EMP_MVIEW;







SELECT ROWID,EMPNO FROM EMP;

SELECT ROWID,EMPNO FROM EMP_VIEW;



SELECT ROWID,EMPNO FROM EMP_MVIEW;


SELECT  * FROM T1;

SELECT * FROM T2;

SELECT * FROM T1 INNER JOIN T2 ON T1.ID1 = T2.ID2;

SELECT * FROM T1 LEFT JOIN T2 ON T1.ID1 = T2.ID2;

SELECT * FROM T1 RIGHT JOIN T2 ON T1.ID1 = T2.ID2;

SELECT  * FROM T1 FULL OUTER JOIN  T2 ON T1.ID1 = T2.ID2;


SELECT SYSDATE FROM DUAL;


SELECT * FROM EMP;



SELECT  EMPNO, ENAME, DEPTNO, SAL, 
                  SUM(SAL) OVER(ORDER BY SAL,EMPNO DESC) RUNNING_TOTAL 
                  FROM EMP;
                  
SELECT EMPNO, ENAME,SAL,LAG(SAL) OVER(ORDER BY SAL) LAG_VAL FROM EMP;
                  
SELECT EMPNO, ENAME,SAL,LEAD(SAL) OVER(ORDER BY SAL) LEAD_VAL FROM EMP;


select * from emp;

select * from emp where ;


SELECT 'WELCOME' D FROM DUAL;

SELECT * FROM EMP;

CREATE TABLE EMP1 AS SELECT * FROM EMP;

SELECT * FROM EMP1;

ALTER TABLE EMP1 ADD CITY VARCHAR2(10);

DESC EMP1;

ALTER TABLE EMP1 DROP COLUMN CITY;

ALTER TABLE EMP1 ADD (CITY VARCHAR2(10), ADDRESS VARCHAR2(20));

ALTER TABLE EMP1 MODIFY ADDRESS VARCHAR2(30);




SELECT * FROM EMP1;

SELECT * FROM EMP1 order by hiredate desc ;

SELECT * FROM EMP1 FETCH  FIRST 3 ROWS ONLY ;

SELECT * FROM EMP1 order by hiredate desc  FETCH  FIRST 3 ROWS ONLY;

SELECT * FROM EMP1 FETCH FIRST 40 PERCENT ROWS ONLY;  

select * from emp1 offset 4 rows fetch next 5 rows only;


SELECT * FROM EMPLOYEES;

SELECT DISTINCT(DEPARTMENT_ID) FROM EMPLOYEES ORDER BY DEPARTMENT_ID ;

SELECT FIRST_NAME||'  '||LAST_NAME  FULL_NAME  FROM EMPLOYEES;

SELECT FIRST_NAME||'  '||LAST_NAME  FULL_NAME , SALARY, DEPARTMENT_ID,RNK FROM 
( SELECT A.*,DENSE_RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY  DESC) RNK FROM EMPLOYEES A)
WHERE RNK<=3;

SELECT   * FROM EMPLOYEES ;

    WITH  T1 AS (SELECT   * FROM EMPLOYEES)
    SELECT ROUND( COUNT(*)/2,0) FROM T1;
    
     WITH  T1 AS (SELECT   * FROM EMPLOYEES)
    SELECT * FROM EMPLOYEES WHERE ROWNUM  IN(
    (SELECT ROUND( COUNT(*)/2,0) FROM EMPLOYEES)
    AND  (SELECT COUNT(*) FROM EMPLOYEES)) ;
    
     SELECT *  FROM EMPLOYEES WHERE ROWNUM >= (  SELECT ROUND( COUNT(*)/2,0) FROM EMPLOYEES );
     
     
          SELECT *  FROM EMPLOYEES WHERE ROWNUM BETWEEN 10 AND 20 ;
          
          
          

SELECT * FROM EMP1;

SELECT * FROM EMP1 order by hiredate desc ;

SELECT * FROM EMP1 FETCH  FIRST 3 ROWS ONLY ;

SELECT * FROM EMP1 order by hiredate desc  FETCH  FIRST 3 ROWS ONLY;

SELECT * FROM EMP1 FETCH FIRST 40 PERCENT ROWS ONLY;  

select * from emp1 offset 4 rows fetch next 5 rows only;



SELECT * FROM EMPLOYEES;

SELECT * FROM EMPLOYEES ORDER BY EMPLOYEE_ID DESC FETCH  FIRST 10  ROWS ONLY ;

(SELECT * FROM EMPLOYEES  ORDER BY EMPLOYEE_ID DESC FETCH FIRST 40 PERCENT ROWS ONLY)
MINUS
(SELECT * FROM EMPLOYEES  ORDER BY EMPLOYEE_ID DESC FETCH FIRST 30 PERCENT ROWS ONLY);  


(SELECT * FROM EMPLOYEES  FETCH FIRST 70 PERCENT ROWS ONLY)
MINUS
(SELECT * FROM EMPLOYEES   FETCH FIRST 60 PERCENT ROWS ONLY);  



SELECT SYSDATE FROM DUAL;

SELECT * FROM EMP10;

DESC EMP10;

SELECT   ROUND(MONTHS_BETWEEN(TO_DATE(SYSDATE,'DD-MM-YYYY'),TO_DATE(DOJ,'DD-MM-YYYY') ) ) MONTHS FROM  EMP10;
    
    
    
CREATE SEQUENCE EMPLOYEE_SEQ STARTS FROM 100 INCREMENT BY 1 HIGHEST 1000 CACHE 50 ;

 EMPLOYEE_SEQ.NEXTVAL 
 
 EMPLOYEE_SEQ.CURRVAL



DECLARE
CURSOR CUSTOMERS_DATA AS SELECT CUST_ID,CUST_NAME,PURCHASE_DATE FROM CUSTOMERS;
TYPE CUST_TAB IS TABLE OF CUSTOMERS%ROWTYPE;
BEGIN
OPEN CUSTOMERS_DATA;
FETCH CUSTOMERS_DATA BULK COLLECT INTO CUST_TAB;
CLOSE CUSTOMERS_DATA;
FOR I IN CUST_TAB.FIRST..CUST_TAB.LAST
DBMS_OUTPUT.PUT_LINE(CUST_TAB(I).CUST_ID, CUST_TAB(I).CUST_NAME,CUST_TAB(I).PURCHASE_DATE);
END  CUST_TAB;
END;


  EMP LIST WHO JOINED IN 2000  EMP NAME ENDS WITH S;

SELECT * FROM EMPLOYEES ;  WHERE TO_CHAR(DOJ,'YYYY')='2000' AND EMP_NAME LIKE '%S';



CREATE TABLE 
DECLARE
TYPE CUST_TAB AS TABLE OF CUSTOMERS%ROWTYPE;
CUST_TAB_VAR CUST_TAB;
CURSOR C1 AS SELECT * FROM CUSTOMERS WHERE TRUNC(TRANSDATE) BETWEEN '01-JAN-2017' AND 31-DEC-22;
BEGIN
OPEN C1;
FETCH C1 * BULK COLLECT INTO CUST_TAB_VAR ;
RETURN WHEN C1%NOTFOUND;
CLOSE C1;
FORALL 
 I IN CUST_TAB_VAR.FIRST..CUST_TAB_VAR.LAST SAVE EXPECPTION
 




SET AUTOTRACE ON;

EXECUTE PLAN FOR SELECT * FROM EMPLOYEES;




with t as  (  select  rownum rn, to_char(to_date(rownum,'mm'),'Month') mon    from  dual   connect by level <= 12   )
select   mon, count(HIRE_DATE) emp_cnt 
from 
t
left outer join
EMPLOYEES 
on (mon = to_char(HIRE_DATE,'Month')) 
group by mon,rn 
order by rn
;





select  rownum rn, to_char(to_date(rownum,'mm'),'Month') mon    from  dual   connect by level <= 12 ;


select  rownum rn, 
             to_char(to_date(rownum,'mm'),'MON') mon    from  dual   connect by level <= 12 ;




with t as  (  select  rownum rn, to_char(to_date(rownum,'mm'),'MON') mon    from  dual   connect by level <= 12   )
select   mon, count(HIRE_DATE) emp_cnt 
from 
t
left outer join
EMPLOYEES 
on (mon = to_char(HIRE_DATE,'MON')) 
group by mon,rn 
order by rn
;







SELECT * FROM EMP10;

DESC EMP10;

SELECT   ROUND(MONTHS_BETWEEN(TO_DATE(SYSDATE,'DD-MM-YYYY'),TO_DATE(DOJ,'DD-MM-YYYY') ) ) MONTHS FROM  EMP10;

SELECT * FROM EMP10 WHERE
ROUND(MONTHS_BETWEEN(TO_DATE(SYSDATE,'DD-MM-YYYY'),TO_DATE(DOJ,'DD-MM-YYYY'))) >=50;



CREATE OR REPLACE PROCEDURE UPDATE_EMP10 AS
DECLARE
TYPE UPDATE_TAB  IS TABLE OF  EMP10%ROWTYPE;
UPDATE_TAB1  UPDATE_TAB = UPDATE_TAB();
CURSOR C1 AS SELECT * FROM EMP10 WHERE
                       ROUND(MONTHS_BETWEEN(TO_DATE(SYSDATE,'DD-MM-YYYY'),TO_DATE(DOJ,'DD-MM-YYYY'))) >=50;
BEGIN
OPEN C1;
FETCH C1 BULK COLLECT INTO UPDATE_TAB1;
RETURN C1%NOTFOUND;
CLOSE C1;
FORALL I IN ;




SELECT * FROM EMPLOYEES;

DESC EMPLOYEES;

SELECT   DISTINCT B.EMPLOYEE_ID,B.FIRST_NAME ||'   '||B.LAST_NAME FULL_NAME, B.SALARY ,B.DEPARTMENT_ID  FROM  EMPLOYEES A, EMPLOYEES B 
WHERE A.EMPLOYEE_ID <> B.EMPLOYEE_ID AND A.SALARY = B.SALARY  ORDER BY B.EMPLOYEE_ID;




select * from triangle;

SELECT CASE 
WHEN  A+B>C AND B+C>A AND C+A>B THEN CASE
                                                                                                  WHEN A=B AND B=C AND C=A THEN 'EQUILATERAL'
                                                                                                  WHEN A=B OR  B=C OR  C=A   THEN 'ISOSCELES'
                                                                                                  ELSE 'SCALENE'
                                                                                        END
 ELSE 'NOT A TRIANGLE' 
 END  TYPE_OF_TRIANGLES FROM TRIANGLE;          
 
 
 SELECT   ADD_MONTHS(TRUNC(TO_DATE('01/01/2022','DD/MM/YYYY'),'MM'),LEVEL-1) FIRST_DAY,
ADD_MONTHS(LAST_DAY(TO_DATE('01/01/2022','DD/MM/YYYY')),LEVEL-1) LAST_DAY 
FROM DUAL
CONNECT BY 
LEVEL<=TRUNC(MONTHS_BETWEEN(TO_DATE('01-01-2024','DD-MM-YYYY'),SYSDATE))+2;



























                     
                     
                              
         
   
   
   
   
   
   
   
   
 
 
  
  
  
  
                 
                                    
                                    
                                    
 
































 