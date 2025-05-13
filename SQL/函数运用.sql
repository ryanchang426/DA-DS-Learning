CREATE TABLE emp AS SELECT * FROM employee;
-- FUNCTION 字符串函数
-- 字符串拼接 (contact)
SELECT CONCAT('Hello',' MySQL!');
-- 小写 (LOWER)
SELECT LOWER('Hello');
-- 大写 (UPPER)
SELECT UPPER('Hello');
-- 左填充 (LPAD(字符串, 规定长度, 填充字符))
SELECT LPAD('01',5,'-');
-- 右填充 (RPAD(字符串, 规定长度, 填充字符))
SELECT RPAD('01',5,'-');
-- 去头尾空格 (TRIM)
SELECT TRIM('  Hello MySQL! ');
-- 字符串截取 (SUBSTRING(字符串, 选取开始, 选取长度))
SELECT SUBSTRING('Hello MySQL',1,5);

-- 1. 由于业务需求变更，企业员工的工号统一为5位数，目前不足5位数的全部在前面补0。比如：1号员工的工号应为00001
UPDATE emp SET workno = LPAD(workno, 5, '0');
SELECT * FROM emp;


-- FUNCTION 数值函数
-- 向上取整 (CEIL)
SELECT CEIL(1.1);
-- 向下取整 (FLOOR)
SELECT FLOOR(1.9);
-- 返回x/y的余数 (MOD(x,y))
SELECT MOD(9,4);
-- 随机数生产 (RAND)
SELECT RAND();
-- 四舍五入 (ROUND(数字, 保留几位小数))
SELECT ROUND(2.347,2);

-- 1. 通过数据库的函数，生成一个6位数的随机验证码
SELECT ROUND(RAND(),6)*1000000 #这样写有可能不是6位数
SELECT LPAD(ROUND(RAND()*100000,0),6,'0');


-- FUNCTION 日期函数
-- 当前日期/时间 (CURDATE/ CURTIME/ NOW)
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
-- 指定日期的年、月、日 (YEAR/ MONTH/ DAY)
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DAY(NOW());
-- 计算日期 (DATE_ADD(起始点, INTERVAL 间隔))
SELECT DATE_ADD(NOW(), INTERVAL 70 SECOND);
SELECT DATE_ADD(NOW(), INTERVAL 70 MINUTE);
SELECT DATE_ADD(NOW(), INTERVAL 70 HOUR);
SELECT DATE_ADD(NOW(), INTERVAL 70 DAY);
SELECT DATE_ADD(NOW(), INTERVAL 70 MONTH);
SELECT DATE_ADD(NOW(), INTERVAL 70 YEAR);
-- 计算天数 (DATEDIFF(后, 先))
SELECT DATEDIFF('2025-4-26', '2024-4-26');

-- 查询所有员工的入职天数，并根据入职天数倒序排列
SELECT * FROM emp ORDER BY DATEDIFF(NOW(), entrydate) DESC;
SELECT name, DATEDIFF(NOW(), entrydate) days FROM emp ORDER BY days DESC;


-- FUNCTION 流程函数
-- IF
SELECT IF(TRUE,'OK!','Error!');
SELECT IF(FALSE,'OK!','Error!');
-- IFNULL
SELECT IFNULL('OK!', 'Error!');
SELECT IFNULL('', 'Error!');
SELECT IFNULL(NULL, 'Error!');
-- CASE WHEN THEN ELSE END
-- 需求：查询emp表员工的姓名和工作地址（北京、上海 -----> 北上 | 深圳 -----> 其他）
SELECT
    name,
    CASE area WHEN '北京' OR '上海' THEN '北上' ELSE '其他' END AS 'part'
    FROM emp;

-- 统计各班级学生的成绩，展示规则如下
-- >= 85 显示优秀
-- >= 60 显示及格
-- 否则显示不及格
SELECT
    name,
    CASE WHEN grade >= 85 THEN '优秀' WHEN grade >= 60 AND grade < 85 THEN '及格' ELSE '不及格' END AS '成绩'
    FROM grade;
