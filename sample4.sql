create table xyz1(
new_id Int ,
new_cast varchar(50)
);

insert into  xyz1 values 
('100',"Agni"),
('200',"Agni"),
('500',"Dharti"),
('700',"Dharti"),
('200',"vayu"),
('300',"vayu"),
('500',"vayu");


select new_id, new_cast,
sum(new_id) Over (partition By  new_cast Order By new_id) As "Total",
Avg(new_id) Over (partition By  new_cast Order By new_id) As "Avg",
count(new_id) Over (partition By  new_cast Order By new_id) As "count",
min(new_id) Over (partition By  new_cast Order By new_id) As "min",
max(new_id) Over (partition By  new_cast Order By new_id) As "max"
from xyz1;


select new_id, new_cast,
sum(new_id) Over (order by new_id Rows Between Unbounded preceding and unbounded following) As "Total",
Avg(new_id) Over (order by new_id Rows Between Unbounded preceding and unbounded following) As "Avg",
count(new_id) Over (order by new_id Rows Between Unbounded preceding and unbounded following) As "count",
min(new_id) Over (order by new_id Rows Between Unbounded preceding and unbounded following) As "min",
max(new_id) Over (order by new_id Rows Between Unbounded preceding and unbounded following) As "max"
from xyz1