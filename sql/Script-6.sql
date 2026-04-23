use score;


drop table if exists student;
drop table if exists teacher;
drop table if exists course;
drop table if exists score;
drop table if exists  user;
  -- 用户表
CREATE TABLE user (
  user_id      INT PRIMARY KEY AUTO_INCREMENT,
  username     VARCHAR(50)  NOT NULL UNIQUE,
  password     VARCHAR(255) NOT NULL,
  role         ENUM('student','teacher') NOT NULL DEFAULT 'student',
  create_time  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
insert into user values('20170557001','zhang','123456','student','2027-08-31 15:50:22');
insert into user values('20170557002','CS-101','123456','student','2027-08-31 15:50:22');
insert into user values('20170557003','CS-347','123456','student','2027-08-31 15:50:22');
insert into user values('20170557004','Snow','123456','student','2027-08-31 15:50:22');
insert into user values('20170557005','Breey','123456','student','2027-08-31 15:50:22');
insert into user values('20170557006','Killy','123456','student','2027-08-31 15:50:22');
insert into user values('20170557007','Brown','123456','student','2027-08-31 15:50:22');
insert into user values('20170557008','Levy','123456','student','2027-08-31 15:50:22');
insert into user values('20170557009','Songs','123456','student','2027-08-31 15:50:22');
insert into user values('20170557010','Yuan-Fang','123456','student','2027-08-31 15:50:22');
insert into user values('20170557011','Fang-Zhang','123456','student','2027-08-31 15:50:22');
insert into user values('20170557012','youyou','123456','student','2027-08-31 15:50:22');
insert into user values('20170557101','light','123456','student','2027-08-31 15:50:22');


-- 学生表
CREATE TABLE student (
  student_id  INT PRIMARY KEY,
  name        VARCHAR(30) NOT NULL,
  profession  varchar(50),
  admission_time varchar(50),
  class       VARCHAR(50),
  FOREIGN KEY (student_id) REFERENCES user(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
insert into student values('20170557001','张可可','计算机科学与技术','2017','计算机科学与技术一班');
insert into student values('20170557002','张三','计算机科学与技术','2017','计算机科学与技术一班');
insert into student values('20170557003','李四','计算机科学与技术','2017','计算机科学与技术一班');
insert into student values('20170557004','王五','计算机科学与技术','2017','计算机科学与技术一班');
insert into student values('20170557005','周六','计算机科学与技术','2017','计算机科学与技术一班');
insert into student values('20170557006','吴七','计算机科学与技术','2017','计算机科学与技术一班');
insert into student values('20170557007','陈小明','计算机科学与技术','2017','计算机科学与技术一班');
insert into student values('20170557008','李笑','计算机科学与技术','2017','计算机科学与技术一班');
insert into student values('20170557009','宋嵩','计算机科学和技术','2017','计算机科学和技术一班');
insert into student values('20170557010','方圆','计算机科学与技术','2017','计算机科学与技术一班');
insert into student values('20170557011','张芳芳','计算机科学与技术','2017','计算机科学与技术一班');
insert into student values('20170557012','吴悠悠','计算机科学与技术','2017','计算机科学与技术一班');
insert into student values('20170557101','朱明','计算机科学与技术','2017','计算机科学与技术二班');
-- 教师表
CREATE TABLE teacher (
  teacher_id  INT PRIMARY KEY,
  name        VARCHAR(30) NOT NULL,
  department  VARCHAR(50),
  FOREIGN KEY (teacher_id) REFERENCES user(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 课程表
CREATE TABLE course (
  course_id   INT PRIMARY KEY AUTO_INCREMENT,
  title       VARCHAR(50) NOT NULL,
  teacher_id  INT,
  FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 成绩表
CREATE TABLE score (
  score_id    INT PRIMARY KEY AUTO_INCREMENT,
  student_id  INT NOT NULL,
  course_id   INT NOT NULL,
  score       DECIMAL(5,2) CHECK (score BETWEEN 0 AND 100),
  exam_time   DATE,
  UNIQUE (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  FOREIGN KEY (course_id) REFERENCES course(course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
