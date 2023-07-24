<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增学生</title>
    <style type="text/css">
        body {
            background-color: #f7f7f7;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="radio"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        /* 添加CSS以水平显示单选按钮 */
        .form-group .radio-group {
            display: inline-block;
        }

        .form-group input[type="radio"] {
            width: auto;
            margin-right: 10px;
            /* 去除 'display: inline-block;' */
        }

        .form-group input[type="submit"],
        .form-group input[type="reset"] {
            padding: 10px 20px;
            background-color: #0034d9;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        .form-group input[type="submit"]:hover,
        .form-group input[type="reset"]:hover {
            background-color: #00177f;
        }
    </style>
    <script type="text/javascript">
        function back() {
            window.location.href = "${pageContext.request.contextPath}/ShowStudentServlet";
        }
    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center; color: blue;">新增学生</h3>
    <input type="button" name="back" value="返回" onclick="back()" style="float: right; background-color: #ccc; border: none; border-radius: 5px; padding: 10px 15px; cursor: pointer;">
    <br/><br/>
    <form action="${pageContext.request.contextPath}/AddStudentServlet" method="post">
        <div class="form-group">
            <label for="name">姓名</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="age">年龄</label>
            <input type="text" id="age" name="age" required>
        </div>
        <div class="form-group">
            <label>性别</label>
            <div class="radio-group">
                <input type="radio" id="male" name="gender" value="男" required>
                <label for="male">男</label>
            </div>
            <div class="radio-group">
                <input type="radio" id="female" name="gender" value="女" required>
                <label for="female">女</label>
            </div>
        </div>
        <div class="form-group">
            <label for="hobby">爱好</label>
            <input type="text" id="hobby" name="hobby" required>
        </div>
        <div class="form-group">
            <label for="email">邮箱</label>
            <input type="text" id="email" name="email" required>
        </div>
        <div class="form-group" style="text-align: center;">
            <input type="submit" value="新增">
            <input type="reset" value="重置">
        </div>
    </form>
</div>
</body>
</html>
