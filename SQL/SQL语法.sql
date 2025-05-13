-- DML 添加数据 (INSERT INTO...VALUES)
USE itcast;
INSERT INTO employee(id, workno, name, gender, age, idcard, entrydate,area) VALUES(1, '1','Josh', '男', 35, '123456789012345678', '2000-01-01','北京');
INSERT INTO employee VALUES(2, '2', 'Redick', '男', 33, '123456789012345670', '2001-05-12','北京');
INSERT INTO employee(id, workno, name) VALUES(3,'3','Erin');
INSERT INTO employee VALUES(3,'3','Erin');
INSERT INTO employee VALUES(4, '4', 'Irine', '女', 23, '123456789012345600', '2021-05-12','北京'),(5, '5', 'Tony', '男', 53, '123456789012345000', '2001-05-22','上海');


-- DML 修改数据 (UPDATE...SET...)
-- 修改id为1的数据，将name修改为itheima
UPDATE employee SET name = 'itheima' WHERE id = 1;
-- 修改id为1的数据，将name修改为小昭、gender改为女
UPDATE employee SET name = '小昭', gender = '女' WHERE id = 1;
-- 将所有员工入职日期改为2024-10-01
UPDATE employee SET entrydate = '2024-10-01';


-- DML 删除数据 DELETE FROM...)
-- 删除gender为女的员工
DELETE FROM employee WHERE gender = '女';
-- 删除所有员工
DELETE FROM employee;





-- DQL 基本查询 (SELECT...FROM.../ AS/ SELECT DISTINCT...FROM...)
INSERT INTO employee VALUES (1,'1','Jeff','男',37,'172838394765290836','2003-04-21','北京'),
                            (2,'2','Ellen','女',27,'167389065266538909','2016-04-01','上海'),
                            (3,'3','Lisa','女',25,'167367878903538909','2019-06-11','北京'),
                            (4,'4', 'Irine', '女', 23, '123456789012345600', '2021-05-12','北京'),
                            (5,'5', 'Tony', '男', 53, '123456789012345000', '2001-05-22','深圳'),
                            (6,'6','Austin','男',36,'109392019752738190','2013-12-31','上海'),
                            (7,'7','Lee','女',29,'176678980352647878','2016-08-01','北京'),
                            (8,'8','Daisy','女',22,'193233567254009732','2019-08-17','深圳'),
                            (9,'9', 'Tiffy', '女', 43, '123893099872563096', '2018-05-30','上海'),
                            (10,'10', 'Brian', '男', 53, '100038946782539907', '2011-05-12','北京'),
                            (11,'11','Bowen','男',52,'177382946537872904','2002-04-17','上海'),
                            (12,'12','Elain','女',37,'162377638204638117','2013-11-25','深圳'),
                            (13,'13','Catherin','女',28,'112654780909364785','2019-06-11','北京'),
                            (14,'14', 'Elly', '女', 63, '123777789012345600', '2001-05-07','上海'),
                            (15,'15', 'Tommy', '男', 52, '120090435012345000', '2022-02-26','上海'),
                            (16,'16', 'Cody', '男', 18, null, '2022-07-23','深圳');

-- 1. 查询指定字段 name, workno, age 返回
SELECT name, workno, age FROM employee;
-- 2. 查询所有字段返回
SELECT * FROM employee;
-- 3. 查询所有员工的工作区域，起别名
SELECT area AS workingplace  FROM employee;
SELECT area workingplace  FROM employee;
-- 4. 查询公司员工的上班地址（不要重复）
SELECT DISTINCT area FROM employee;


-- DQL 条件查询 (WHERE)
-- 1. 查询年龄等于23的员工
SELECT * FROM employee WHERE age = 23;
-- 2. 查询年龄小于20的员工信息
SELECT * FROM employee WHERE age < 20;
-- 3. 查询年龄小于等于23的员工信息
SELECT * FROM employee WHERE age <= 23;
-- 4. 查询没有身份证号的员工信息
SELECT * FROM employee WHERE idcard IS NULL;
-- 5. 查询有身份证号的员工信息
SELECT * FROM employee WHERE idcard IS NOT NULL;
-- 6. 查询年龄不等于23的员工信息
SELECT * FROM employee WHERE age <> 23;
SELECT * FROM employee WHERE age != 23;
-- 7. 查询年龄在20岁（包含）到33岁（包含）之间的员工信息
SELECT * FROM employee WHERE age >= 20 AND age <= 33;
SELECT * FROM employee WHERE age BETWEEN 20 AND 33;
-- 8. 查询性别为女并且年龄小于25岁的员工信息
SELECT * FROM employee WHERE gender = '女' AND age <= 25;
-- 9. 查询年龄等于 22 23 33的员工信息
SELECT * FROM employee WHERE age = 22 OR age = 23 OR age = 33;
SELECT * FROM employee WHERE age IN (22,23,33);
-- 10. 查询姓名为两个字的员工信息
SELECT * FROM employee WHERE name LIKE '__';
-- 11. 查询身份证号最后一位是9的员工信息
SELECT * FROM employee WHERE idcard LIKE '%9';


-- DQL 聚合函数(COUNT/ MAX/ MIN/ AVG/ SUM)
-- 1. 统计该企业员工数量
SELECT COUNT(*) FROM employee;
SELECT COUNT(id) FROM employee;
-- 2. 统计该企业员工的平均年龄
SELECT AVG(age) FROM employee;
-- 3. 统计该企业员工的最大年龄
SELECT MAX(age) FROM employee;
-- 4. 统计该企业员工的最小年龄
SELECT MIN(age) FROM employee;
-- 5. 统计北京地区员工年龄之和
SELECT SUM(age) FROM employee WHERE area = '北京';


-- DQL 分组查询 (GROUP BY)
-- 1. 根据性别分组，统计男性员工和女性员工的数量
SELECT gender, COUNT(*) FROM employee GROUP BY gender;
-- 2. 根据性别分组，统计男性员工和女性员工的平均年龄
SELECT gender, AVG(age) FROM employee GROUP BY gender;
-- 3. 在年龄大于45岁的员工中，根据工作区域分组，获取员工数量大于等于3的工作地址
SELECT area, COUNT(*) AS number FROM employee WHERE age >= 45 GROUP BY area HAVING COUNT(*) >= 3;


-- DQL 排序查询 (ORDER BY/ ASC/ DESC)
-- 1. 根据年龄对公司员工进行升序排列
SELECT * FROM employee ORDER BY age ASC;
-- 2. 根据入职时间，对员工进行降序排列
SELECT * FROM employee ORDER BY entrydate DESC;
-- 3. 根据年龄对公司员工进行升序排列，若年龄相同，依入职时间进行降序排列
SELECT * FROM employee ORDER BY age ASC, entrydate DESC;


-- DQL 分页查询 (LIMIT)
-- 1. 查询第1页员工数据，每页展示10条记录
SELECT * FROM employee LIMIT 0,10;
SELECT * FROM employee LIMIT 10;
-- 2. 查询第2也员工数据，每页展示10条记录
SELECT * FROM employee LIMIT 10,10;


-- DQL Case
-- 1. 查询年龄为20,21,22,23岁的员工信息
SELECT * FROM employee WHERE age IN (20,21,22,23);
-- 2. 查询性别为男， 并且年龄在20-40岁（含）以内的姓名为三个字的员工
SELECT * FROM employee WHERE gender = '男' AND age BETWEEN 20 AND 40 AND name LIKE '___';
-- 3. 统计员工表中，年龄小于60岁的，男性员工和女性员工的人数
SELECT gender, COUNT(*) FROM employee WHERE age < 60 GROUP BY gender;
-- 4. 查询所有年龄小于等于35岁员工的姓名和年龄，并对查询结果按年龄升序排列，若同龄则按入职时间降序排列
SELECT name, age FROM employee WHERE age < 35 ORDER BY age ASC, entrydate DESC;
-- 5. 查询性别为男，且年龄在18-55岁（含）以内的前5个员工信息，对查询结果按年龄升序排列，若同龄则按入职时间升序排列
SELECT * FROM employee WHERE gender = '男' AND age BETWEEN 18 AND 55 ORDER BY age ASC, entrydate ASC LIMIT 5;


-- DCL 管理用户
-- 创建用户itcast，只能在当前主机localhost访问，密码为123456
CREATE USER 'itcast'@'localhost' IDENTIFIED BY '123456';
-- 创建用户heima，可以在任意主机访问该数据库，密码为123456
CREATE USER 'heima'@'%' IDENTIFIED BY '123456';
-- 修改用户heima的访问密码为1234
ALTER USER 'heima'@'%' IDENTIFIED WITH mysql_native_password BY '1234';
-- 删除itcast@localhost用户
DROP USER 'itcast'@'localhost';


-- DCL 权限控制
-- 查询权限 (*.*- 无任何数据库权限)
SHOW GRANTS FOR 'heima'@'%';
-- 授予权限
GRANT ALL ON itcast.* TO 'heima'@'%';
SHOW GRANTS FOR 'heima'@'%';
-- 撤销权限
REVOKE ALL ON itcast.* FROM 'heima'@'%';






















