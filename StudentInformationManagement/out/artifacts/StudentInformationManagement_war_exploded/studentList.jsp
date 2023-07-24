<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生列表</title>
    <style type="text/css">
        /* 整体页面样式 */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #EAEAEF;
            margin: 0;
            padding: 0;
        }

        /* 页面头部样式 */
        header {
            background-color: #e8e8ee;
            padding: 20px;
            color: #0034d9;
            text-align: center;
            font-size: 30px;
        }

        /* 操作按钮样式 */
        .action-btn {
            padding: 8px 16px;
            background-color: #0034d9;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 14px;
            border-radius: 20px;
            margin-right: 6px;
            transition: background-color 0.3s;
        }

        .action-btn:hover {
            background-color: #001e80;
        }

        /* 学生列表样式 */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 20px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #0034d9;
            color: #fff;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        /* 搜索框和操作按钮容器 */
        .actions-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .search-form {
            display: flex;
            align-items: center;
            margin-right: 10px;
        }

        .search-form input[type="text"] {
            padding: 8px;
            border: 1px solid #0034d9;
            border-radius: 20px;
            margin-right: 5px;
            outline: none;
        }

        .search-btn {
            padding: 8px 16px;
            background-color: #0034d9;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 14px;
            border-radius: 20px;
            transition: background-color 0.3s;
        }

        .search-btn:hover {
            background-color: #001e80;
        }
    </style>

    <script type="text/javascript">
        function logout() {
            window.location.href = "${pageContext.request.contextPath}/LogoutServlet";
        }

        function showStudent() {
            window.location.href = "${pageContext.request.contextPath}/ShowStudentServlet";
        }

        function addStudent() {
            window.location.href = "${pageContext.request.contextPath}/studentAdd.jsp";
        }

        function updateStudent(id) {
            window.location.href = "${pageContext.request.contextPath}/QueryStudentServlet?id=" + id;
        }

        function deleteStudent(id) {
            let flag = window.confirm("您确定要删除吗？");
            if (flag) {
                window.location.href = "${pageContext.request.contextPath}/DeleteStudentServlet?id=" + id;
            }
        }
    </script>
</head>
<body>
<header>
    学生列表
</header>
<div class="actions-container">
    <form class="search-form" action="${pageContext.request.contextPath}/SearchStudentServlet" method="post">
        <input type="text" name="content" placeholder="请输入姓名或学号">
        <button type="submit" class="search-btn">搜索</button>
    </form>
    <button type="button" class="action-btn" onclick="addStudent()">新增学生</button>
    <button type="button" class="action-btn" onclick="showStudent()">刷新列表</button>
    <button type="button" class="action-btn" onclick="logout()">退出登录</button>
</div>
<table>
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>年龄</th>
        <th>性别</th>
        <th>爱好</th>
        <th>邮箱</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="student" items="${students}">
        <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.age}</td>
            <td>${student.gender}</td>
            <td>${student.hobby}</td>
            <td>${student.email}</td>
            <td><button class="action-btn" onclick="updateStudent(${student.id})">修改</button></td>
            <td><button class="action-btn" onclick="deleteStudent(${student.id})">删除</button></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
