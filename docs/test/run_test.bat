@echo off
echo 开始初始化测试数据库...
mysql -u root -p db_student_score < init_db.sql
if %errorlevel% equ 0 (
    echo 表结构初始化成功！
    echo 开始插入测试数据...
    mysql -u root -p db_student_score < insert_test_data.sql
    if %errorlevel% equ 0 (
        echo 测试数据插入成功！
        echo 开始验证数据...
        mysql -u root -p db_student_score < query_test.sql
    ) else (
        echo 测试数据插入失败！
    )
) else (
    echo 表结构初始化失败！
)
pause