-- `student-score`.teacher definition

CREATE TABLE `teacher` (
  `teacher_id` int NOT NULL COMMENT '教师ID',
  `name` varchar(30) NOT NULL COMMENT '教师姓名',
  `department` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL DEFAULT 'Comp.Sci' COMMENT '学院',
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='教师表';


-- `student-score`.`user` definition

CREATE TABLE `user` (
  `user_id` int NOT NULL COMMENT '用户ID',
  `user_name` varchar(50) NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '123456' COMMENT '密码',
  `role` varchar(20) NOT NULL COMMENT '学生/教师',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- `student-score`.course definition

CREATE TABLE `course` (
  `course_id` int NOT NULL COMMENT '课程号',
  `title` varchar(50) NOT NULL COMMENT '课程名称',
  `teacher_id` int NOT NULL COMMENT '授课老师ID',
  `credits` int NOT NULL COMMENT '学分',
  `credit hours` int NOT NULL COMMENT '学时',
  `semester` varchar(30) NOT NULL DEFAULT '‘spring’' COMMENT '学期',
  `year` int NOT NULL DEFAULT '2026' COMMENT '年份',
  PRIMARY KEY (`course_id`),
  KEY `course1_teacher_FK` (`teacher_id`),
  CONSTRAINT `course1_teacher_FK` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- `student-score`.student definition

CREATE TABLE `student` (
  `student_id` int NOT NULL COMMENT '学生ID',
  `name` varchar(30) NOT NULL COMMENT '学生姓名',
  `profession` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Comp.Sci' COMMENT '专业',
  `admission_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL DEFAULT '2026',
  `class` varchar(50) NOT NULL,
  PRIMARY KEY (`student_id`),
  CONSTRAINT `student_user_FK` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生表';


-- `student-score`.score definition

CREATE TABLE `score` (
  `score_id` int NOT NULL COMMENT '成绩记录',
  `student_id` int NOT NULL COMMENT '学生ID',
  `course_id` int NOT NULL COMMENT '课程号',
  `score` int NOT NULL COMMENT '成绩',
  `exam_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试时间',
  UNIQUE KEY `score_unique` (`course_id`,`student_id`),
  KEY `score_student_FK` (`student_id`),
  CONSTRAINT `score_course_FK` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `score_student_FK` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

