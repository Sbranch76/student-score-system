/* 学生成绩管理系统-测试库初始化脚本 */
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 清空原有表（测试环境）
DROP TABLE IF EXISTS `admin`;
DROP TABLE IF EXISTS `course`;
DROP TABLE IF EXISTS `course_info`;
DROP TABLE IF EXISTS `profession`;
DROP TABLE IF EXISTS `student`;

-- 重建admin表
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `real_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `level` tinyint NOT NULL DEFAULT 0,
  `school` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `sex` tinyint NOT NULL DEFAULT 0,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- 重建course表
CREATE TABLE `course`  (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '编号',
  `name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程名',
  `credits` decimal(4, 1) NOT NULL DEFAULT 2.0 COMMENT '学分',
  `score` int NOT NULL DEFAULT 100 COMMENT '满分',
  `number` int NOT NULL DEFAULT 32 COMMENT '课时',
  `year` int NOT NULL DEFAULT 2016 COMMENT '届时',
  `term` tinyint NOT NULL DEFAULT 0 COMMENT '学期',
  `type` tinyint NOT NULL DEFAULT 1 COMMENT '类别 1必修 2选修',
  `profession` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '专业',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- 重建course_info表
CREATE TABLE `course_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `start` int NOT NULL,
  `end` int NOT NULL,
  `room` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `profession` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ci_course`(`course_id` ASC) USING BTREE,
  CONSTRAINT `ci_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- 重建profession表
CREATE TABLE `profession`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- 重建student表
CREATE TABLE `student`  (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `real_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `level` tinyint NOT NULL DEFAULT 2,
  `school` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `admission_time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `profession` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `grade` int NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `sex` tinyint NOT NULL DEFAULT 0,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- 重建 teacher 表
CREATE TABLE `teacher` (
  `id` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `real_name` varchar(50) NOT NULL DEFAULT '',
  `level` tinyint NOT NULL DEFAULT 1,
  `school` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `sex` tinyint NOT NULL DEFAULT 0,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 重建 student_course 成绩表
CREATE TABLE `student_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(50) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `score` int DEFAULT NULL,
  `point` decimal(3,1) DEFAULT NULL,
  `credits` decimal(4,1) DEFAULT NULL,
  `term` tinyint DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sc_student` (`student_id`),
  KEY `sc_course` (`course_id`),
  CONSTRAINT `sc_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sc_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 重建 teacher_course 授课表
CREATE TABLE `teacher_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `grade` int DEFAULT NULL,
  `term` tinyint DEFAULT NULL,
  `course_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tc_teacher` (`teacher_id`),
  KEY `tc_course` (`course_id`),
  CONSTRAINT `tc_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tc_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 重建 upload 上传表
CREATE TABLE `upload` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `level` tinyint NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

SET FOREIGN_KEY_CHECKS = 1;