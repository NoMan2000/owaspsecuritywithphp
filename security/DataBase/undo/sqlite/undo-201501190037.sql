-- Fragment begins: 10 --
PRAGMA foreign_keys=OFF;
delete from orders;
PRAGMA foreign_keys=ON; 

--//
DELETE FROM changelog
	                         WHERE change_number = 10
	                         AND delta_set = 'Main';
-- Fragment ends: 10 --
