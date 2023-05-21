create database demo;

use demo;

CREATE TABLE test (
    a INT,
    b INT
);

insert into test values (21,10);
insert into test values (26,10);
insert into test values (22,10);
insert into test values (20,27);
insert into test values (27,27);

select * from test;

select *, a + b as tong from test;
select *, a - b as hieu from test;
select *, a * b as tich from test;
select *, a / b as thuong from test;
select *, a % b as du from test;

select *, a = b from test;
select *, a > b from test;
select *, a < b from test;
select *, a <> b from test;

select * from test
where a between 22 and 26;

select * from test 
where a = 21 or b = 10;

select * from test
where not (a >= 21 && a < 25) ;

select * from test
where a < 22 ;

select * from test;

select * from test 
where a > some (select a from test);

select * from test
where exists (select * from test where a = 21);

select * from test
where a = 21;

select * from test 
where a > all (select b from test);

select * from test 
where not ( b = 10);

CREATE TABLE test1 (
    name VARCHAR(50)
);

insert into test1 values ("hieu"),("lam"),("minh");

select * from test1;

select * from test1
where name like "%e%";

select * from test1
where name in ('duong','thai','minh','lam');



