create table dates
(
customerid int,
dateno varchar(20),
)

insert into dates values(1111,'202212'),(1111,'202210'),(1111,'202209'),(1111,'202301'),(2222,'202201'),(2222,'202205'),(2222,'202204'),(1111,'202301')


create table dates3
(
customerid int,
dateno date,
)

insert into dates3 values(1111,'2022-12-1'),(1111,'2022-10-1'),(1111,'2022-09-1'),(2222,'2022-01-01'),(2222,'2022-05-02'),(2222,'2022-04-01')
insert into dates3 values(1111,'2023-01-1')
select * from dates3

with cte1 (customerid,dateno,startdate) as
(
select customerid, dateno,
 min(dateno) OVER (PARTITION by customerid) as startdate
from dates3
)
select customerid,dateno,abs(Datediff(month,dateno,startdate)) as difference
from cte1



select d.customerid,d.dateno,(((round((d.dateno/100),0)-round((min(d1.dateno)/100),0))*12)+(d.dateno%100-min(d1.dateno)%100)) as difference
from dates as d
join dates as d1 on d.customerid=d1.customerid
group by d.customerid,d.dateno