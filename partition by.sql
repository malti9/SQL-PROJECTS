use db_1;
select * from new;
select new_id,new_cat, sum(new_id ) over (partition by new_cat ) as total from new;
select new_id,new_cat, count(new_id) over (partition by new_cat) as count from new;
select max(new_id) over (partition by new_cat) as max from new;
select new_id, new_Cat, min(new_id) over (partition by new_cat) as min from new;
select new_id,new_cat, sum(new_id) over (order by new_cat) as total from new;

select new_id,row_number() over (order by new_id desc) from new;
select new_id, rank() over (order by new_id) from new;



