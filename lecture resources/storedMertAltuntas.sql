/*Mert Altuntaş 180401005*/

create table student(
id int not null,
name varchar(45) not null,
surname varchar(45) not null,
age int,
primary key (id)
);

insert into student (id, name, surname, age) 
values (1, 'Mert', 'Altuntaş', 22), (2, 'Onur', 'Öztaş', 23), (3, 'Burak', 'Kayarlar', 22);

create procedure info
(
	@s_id int,
	@s_name varchar(45),
	@s_surname varchar(45),
	@s_age int
)
as
	begin
	insert into student values (@s_id, @s_name, @s_surname, @s_age)
	select * from student where name = 'Onur'
	update student set name = 'Burak' where id=2
	select * from student where id=2
	update student set surname = 'Öztaş' where name='Mert'
	update student set age = 33 where name = 'Burak'
	end

exec info 4, 'Berkay', 'Narin', 21
exec info 5, 'Alperen', 'Demirtürkoğlu', 21
exec info 6, 'Kaan', 'Çeliktaş', 21
