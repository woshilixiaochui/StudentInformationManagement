<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>更新学生</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 5% auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h3 {
            color: #0034d9;
            text-align: center;
            margin-bottom: 20px; /* 调整行距 */
        }

        table {
            width: 100%;
        }

        tr {
            height: 50px;
        }

        td:first-child {
            text-align: right;
            padding-right: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="radio"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
        }

        input[type="radio"] {
            width: auto;
            margin-right: 10px;
        }

        .form-group {
            text-align: center;
            margin-top: 20px; /* 调整行距 */
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 10px 20px;
            background-color: #0034d9;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #00177f;
        }

        /* 修改的样式 */
        #backButton {
            float: right;
            background-color: #ccc;
            cursor: pointer;
        }

        #backButton:hover {
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
    <h3>学生信息</h3>
    <input type="button" name="back" value="返回" onclick="back()" style="float: right; background-color: #ccc; border: none; border-radius: 5px; padding: 10px 15px; cursor: pointer;">
    <br /><br />
    <form action="${pageContext.request.contextPath}/UpdateStudentServlet" method="post">
        <table>
            <tr>
                <td>学号</td>
                <td><input type="text" name="id" value="${student.id}" readonly /></td>
            </tr>
            <tr>
                <td>姓名</td>
                <td><input type="text" name="name" value="${student.name}" /></td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input type="text" name="age" value="${student.age}" /></td>
            </tr>
            <tr>
                <td>性别</td>
                <td>
                    <input type="radio" name="gender" value="男" ${student.gender == "男" ? "checked" : ""} />男
                    <input type="radio" name="gender" value="女" ${student.gender == "女" ? "checked" : ""} />女
                </td>
            </tr>
            <tr>
                <td>爱好</td>
                <td><input type="text" name="hobby" value="${student.hobby}" /></td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input type="text" name="email" value="${student.email}" /></td>
            </tr>
        </table>
        <div class="form-group">
            <input type="submit" value="修改">
            <input type="reset" value="重置">
        </div>
    </form>
</div>
</body>
</html>
