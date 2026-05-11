/* 学生成绩管理系统-数据验证查询脚本 */

-- 1. 查询所有专业
SELECT * FROM profession;

-- 2. 查询电子信息工程专业的所有课程
SELECT c.id, c.name, c.credits, c.profession 
FROM course c 
WHERE c.profession = '电子信息工程';

-- 3. 查询环境工程专业的学生列表
SELECT s.id, s.real_name, s.phone, s.email 
FROM student s 
WHERE s.profession = '环境工程' AND s.grade = 2401;

-- 4. 查询课程对应的上课地点
SELECT c.name, ci.room 
FROM course c 
LEFT JOIN course_info ci ON c.id = ci.course_id 
WHERE ci.room IS NOT NULL;

-- 5. 验证管理员账号
SELECT username, real_name, school FROM admin WHERE id = 1;

-- 6. 验证学生成绩是否正常
SELECT s.real_name 学生姓名, c.name 课程名, sc.score 成绩
FROM student_course sc
JOIN student s ON sc.student_id = s.id
JOIN course c ON sc.course_id = c.id;