use foodorder;
drop procedure if exists week4;
delimiter // 
create procedure week4()
begin
insert into food values (NULL,'khakai','50');
insert into food values (NULL,'khamoo','60');

insert into orders values (NULL,'1','2023-07-18','50');
insert into orders values (NULL,'1','2023-07-18','60');

insert into orders_detail values (1,2,1,5);
insert into orders_detail values (2,4,2,6);
end//
delimiter ;
call week4();

CREATE VIEW payment AS
SELECT orders_id, orderdate,format(sum(food_price*quantity),2) as total
FROM orders 
JOIN orders_detail using(orders_id) join food using(food_id)
group by orders_id;