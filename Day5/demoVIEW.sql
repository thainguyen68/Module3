-- cú pháp:
create view demo_view as 
select student.id,student.name from student
order by name;

-- update--
update demo_view
set id=15 
where name='Đức'
;
-- delete--
delete from demo_view;
-- thay đổi view



-- check opition:
create view demo_view as 
select student.id,student.name from student
where id<10
with check option;

insert into demo_view(id,name) value(12,'Ly');
update demo_view
set id=15 
where name='Đức';



select *from demo_view;
drop view demo_view;
