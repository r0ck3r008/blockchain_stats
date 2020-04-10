/* question 9
distinct users in database with joint+serial control */
select count(*)
from (
	select distinct userid
	from users
) a;
