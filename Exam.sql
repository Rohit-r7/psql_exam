------------------------------SQL-1-------------------------------
---Q1---
exam=# create table tbl_stock(pk_int_stock_id serial primary key,vchr_name varchar(200),int_quantity int,int_price int );
CREATE TABLE
exam=# \dt
           List of relations
 Schema |   Name    | Type  |  Owner
--------+-----------+-------+----------
 public | tbl_stock | table | postgres
(1 row)


exam=# select*from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price
-----------------+-----------+--------------+-----------
(0 rows)

---Q2---
exam=# alter table tbl_stock alter column int_price type float ;
ALTER TABLE
exam=# select*from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price
-----------------+-----------+--------------+-----------
(0 rows)


---Q3---
exam=# create table tbl_supplier(pk_int_supplier_id serial primary key,vchr_supplier_name varchar(200));
CREATE TABLE
exam=# \dt
            List of relations
 Schema |     Name     | Type  |  Owner
--------+--------------+-------+----------
 public | tbl_stock    | table | postgres
 public | tbl_supplier | table | postgres


---Q4---
 exam=# alter table tbL_stock add fk_int_supplier int ;
ALTER TABLE
exam=# select*from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
(0 rows)


---Q5---
exam=# alter table tbl_stock add foreign key (fk_int_supplier) references tbl_supplier(pk_int_supplier_id);
ALTER TABLE
exam=# select*from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
(0 rows)


exam=# \d tbl_stock;
                                               Table "public.tbl_stock"
     Column      |          Type          | Collation | Nullable |                      Default
-----------------+------------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer                |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(200) |           |          |
 int_quantity    | integer                |           |          |
 int_price       | double precision       |           |          |
 fk_int_supplier | integer                |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)
Foreign-key constraints:
    "tbl_stock_fk_int_supplier_fkey" FOREIGN KEY (fk_int_supplier) REFERENCES tbl_supplier(pk_int_supplier_id)



---Q6---
exam=# create table tbl_dept(pk_int_dept_id serial primary key,vchr_dept_name varchar(200));
CREATE TABLE
exam=# select * from tbl_dept;
 pk_int_dept_id | vchr_dept_name
----------------+----------------
(0 rows)


---Q7---
exam=# create table tbl_classes(pk_int_class_id serial primary key,vchr_class_name varchar(200), fk_int_dept_id int, foreign key(fk_int_dept_id) references tbl_dept(pk_int_dept_id));
CREATE TABLE
exam=# select * from tbl_classes;
 pk_int_class_id | vchr_class_name | fk_int_dept_id
-----------------+-----------------+----------------
(0 rows)


---Q8---
exam=# create table tbl_enrollment(pk_int_enrollment_id serial primary key,int_count int,fk_int_class_id int, foreign key(fk_int_class_id) references tbl_classes(pk_int_class_id));
CREATE TABLE
exam=# select * from tbl_enrollment;
 pk_int_enrollment_id | int_count | fk_int_class_id
----------------------+-----------+-----------------
(0 rows)


---Q9---
exam=# alter table tbl_classes add unique(vchr_class_name);
ALTER TABLE
exam=# \d tbl_classes;
                                               Table "public.tbl_classes"
     Column      |          Type          | Collation | Nullable |                       Default
-----------------+------------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer                |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(200) |           |          |
 fk_int_dept_id  | integer                |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
    "tbl_classes_vchr_class_name_key" UNIQUE CONSTRAINT, btree (vchr_class_name)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(pk_int_dept_id)
Referenced by:
    TABLE "tbl_enrollment" CONSTRAINT "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id)



---Q10---
exam=# alter table tbl_dept add vchr_dept_description varchar(300);
ALTER TABLE
exam=# select * from tbl_dept;
 pk_int_dept_id | vchr_dept_name | vchr_dept_description
----------------+----------------+-----------------------
(0 rows)


---Q11---
exam=# insert into tbl_supplier(vchr_supplier_name)values('Logitech');
INSERT 0 1
exam=# select * from tbl_supplier;
 pk_int_supplier_id | vchr_supplier_name
--------------------+--------------------
                  1 | Logitech
                  2 | Samsung
                  3 | Iball
                  4 | LG
                  5 | Creative


------------------------------SQL-2-------------------------------

---Q1---
exam=# insert into tbl_stock(vchr_name,int_quantity,int_price,fk_int_supplier)values('Mouse',10,500,1);
INSERT 0 1
exam=# select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |       500 |               1
               2 | Keyboard  |            5 |       450 |               3
               3 | Modem     |           10 |      1200 |               2
               4 | Memory    |          100 |      1500 |               5
               5 | Headphone |           50 |       750 |               4
               6 | Memory    |            2 |      3500 |               4
(6 rows)


---Q2---
exam=# update tbl_stock set int_price = (int_price+1.5) where pk_int_stock_id = 1;
UPDATE 1
exam=# select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               2 | Keyboard  |            5 |     451.5 |               3
               3 | Modem     |           10 |    1201.5 |               2
               4 | Memory    |          100 |    1501.5 |               5
               5 | Headphone |           50 |     751.5 |               4
               6 | Memory    |            2 |    3501.5 |               4
(6 rows)


---Q3---
exam=# select * from tbl_stock where int_price>1000;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               3 | Modem     |           10 |    1201.5 |               2
               4 | Memory    |          100 |    1501.5 |               5
               6 | Memory    |            2 |    3501.5 |               4

---Q4---
exam=# select * from tbl_stock order by vchr_name ;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | Headphone |           50 |     751.5 |               4
               2 | Keyboard  |            5 |     451.5 |               3
               4 | Memory    |          100 |    1501.5 |               5
               6 | Memory    |            2 |    3501.5 |               4
               3 | Modem     |           10 |    1201.5 |               2
               1 | Mouse     |           10 |     501.5 |               1
(6 rows)

---Q5---
exam=# select * from tbl_stock order by vchr_name limit 3;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | Headphone |           50 |     751.5 |               4
               2 | Keyboard  |            5 |     451.5 |               3
               4 | Memory    |          100 |    1501.5 |               5
(3 rows)

---Q6---
exam=# select * from tbl_stock order by vchr_name desc limit 3;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               3 | Modem     |           10 |    1201.5 |               2
               4 | Memory    |          100 |    1501.5 |               5
(3 rows)

---Q7---
exam=# select vchr_name,int_quantity*int_price as extended_price from tbl_stock;
 vchr_name | extended_price
-----------+----------------
 Mouse     |           5015
 Keyboard  |         2257.5
 Modem     |          12015
 Memory    |         150150
 Headphone |          37575
 Memory    |           7003
(6 rows)


---Q8---
exam=# delete from tbl_stock where fk_int_supplier = 5;
DELETE 1
exam=# select * from tbl_stock ;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               2 | Keyboard  |            5 |     451.5 |               3
               3 | Modem     |           10 |    1201.5 |               2
               5 | Headphone |           50 |     751.5 |               4
               6 | Memory    |            2 |    3501.5 |               4
(5 rows)

---Q9---
exam=# insert into tbl_dept(vchr_dept_name,vchr_dept_description)values('Computer Science','CS');
INSERT 0 1
exam=# select * from tbl_dept;
 pk_int_dept_id |  vchr_dept_name  | vchr_dept_description
----------------+------------------+-----------------------
              1 | Computer Science | CS
              2 | Electronics      | EC
              3 | Commerce         | CC
              4 | Arts             | AR
(4 rows)


------------------------------SQL-3-------------------------------

---Q1---
exam=# select sum(int_price)as total_cost from tbl_stock;
 total_cost
------------
     6407.5

---Q2---
exam=# select sum(int_quantity)as total_no_products from tbl_stock;
 total_no_products
-------------------
                77
(1 row)

---Q3---

exam=# select upper(vchr_name) from tbl_stock;
   upper
-----------
 MOUSE
 KEYBOARD
 MODEM
 HEADPHONE
 MEMORY
(5 rows)
exam=# select round(int_price) from tbl_stock;
 round
-------
   502
   452
  1202
   752
  3502
(5 rows)

---Q4---
exam=# select count(*)from tbl_stock;
 count
-------
     5
(1 row)

---Q5---
exam=# select max(int_price)as maximum_price from tbl_stock;
 maximum_price
---------------
        3501.5
(1 row)

---Q6---
exam=# insert into tbl_enrollment(int_count,fk_int_class_id)values('40',1);
INSERT 0 1
exam=# select * from tbl_enrollment;
 pk_int_enrollment_id | int_count | fk_int_class_id
----------------------+-----------+-----------------
                    2 |        40 |               1
                    3 |        15 |               2
                    4 |        10 |               3
                    5 |        12 |               4
                    6 |        60 |               2
                    7 |        14 |               6
                    8 |       200 |               7
(7 rows)

exam=# select sum(int_count)as total_enrollemnt from tbl_enrollment;
 total_enrollemnt
------------------
              351
(1 row)

---Q7---
exam=# insert into tbl_classes(vchr_class_name,fk_int_dept_id)values('CS100',1);
INSERT 0 1
exam=# select * from tbl_classes;
 pk_int_class_id | vchr_class_name | fk_int_dept_id
-----------------+-----------------+----------------
               1 | CS100           |              1
               2 | CS101           |              1
               3 | CS102           |              1
               4 | CS103           |              1
               5 | EC200           |              2
               6 | CC300           |              3
               7 | AT400           |              4

exam=# select  count(*) as total_classes from tbl_classes;
 total_classes
---------------
             7
(1 row)

---Q8---
exam=# select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               2 | Keyboard  |            5 |     451.5 |               3
               3 | Modem     |           10 |    1201.5 |               2
               5 | Headphone |           50 |     751.5 |               4
               6 | Memory    |            2 |    3501.5 |               4
(5 rows)

---Q9---
exam=# select *,concat(vchr_name,int_price)as product_price from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier | product_price
-----------------+-----------+--------------+-----------+-----------------+----------------
               1 | Mouse     |           10 |     501.5 |               1 | Mouse501.5
               2 | Keyboard  |            5 |     451.5 |               3 | Keyboard451.5
               3 | Modem     |           10 |    1201.5 |               2 | Modem1201.5
               5 | Headphone |           50 |     751.5 |               4 | Headphone751.5
               6 | Memory    |            2 |    3501.5 |               4 | Memory3501.5
(5 rows)

---Q10---
exam=# select * from tbl_student;
 enrl_no | roll_no |  name   |   city   |  mobile  |    dob
---------+---------+---------+----------+----------+------------
      11 |       2 | Akhil   | Delhi    | 98756579 | 1986-01-12
       6 |       4 | Maya    | Banglore | 98734534 | 1987-11-12
       1 |       8 | Anoop   | Banglore | 93456535 | 1990-12-22
      20 |       1 | Paul    | Cochin   | 96754555 | 1991-03-13
       3 |       5 | Sandeep | Delhi    | 84865644 | 1993-06-14
(5 rows)

exam=# select * from tbl_grade;
 roll_no | course | grade
---------+--------+-------
       2 | C      | A
       2 | Java   | B
       1 | C      | B
       1 | Java   | A
       4 | PHP    | A
       4 | Java   | A
       4 | C      | B
       8 | Java   | B
       5 | PHP    | A
       5 | Java   | D
(10 rows)





