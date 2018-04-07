create table USERS
(
   ID number(20) NOT NULL PRIMARY KEY,
   USERNAME            varchar2(30) default ' ' NOT NULL,
   PASSWORD            varchar2(30) default ' ' NOT NULL,
   TYPE                 number(6) default '0' NOT NULL
);

 
create table BOOK
(
   ID number(2) NOT NULL PRIMARY KEY,
   CODE            varchar2(255) default ' ' NOT NULL,
   NAME            varchar2(255) default ' ' NOT NULL,
   TYPE             varchar2(255) default ' ' NOT NULL,
   AUTHOR           varchar2(255) default ' ' NOT NULL,
   PRESS             varchar2(255) default ' ' NOT NULL,
   PRICE            varchar2(255) default ' ' NOT NULL,
   PAGE              varchar2(255) default ' ' NOT NULL
);

create sequence USERS_SEQUENCE
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

create sequence BOOK_SEQUENCE
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;



 
INSERT INTO USERS VALUES(USERS_SEQUENCE.nextval,'admin','admin','0');  


INSERT INTO BOOK VALUES (BOOK_SEQUENCE.nextval, '1000' '西游记', '文学类', '东方出版社', '吴承恩', '1', '1');
INSERT INTO BOOK VALUES (BOOK_SEQUENCE.nextval, '1001' '水浒传', '文学类', '东方出版社', '施耐庵', '1', '1');
INSERT INTO BOOK VALUES (BOOK_SEQUENCE.nextval, '1002' '三国演义', '文学类', '东方出版社', '罗贯中', '1', '1');
INSERT INTO BOOK VALUES (BOOK_SEQUENCE.nextval, '1003' '红楼梦', '文学类', '东方出版社', '曹雪芹', '1', '1');


 
