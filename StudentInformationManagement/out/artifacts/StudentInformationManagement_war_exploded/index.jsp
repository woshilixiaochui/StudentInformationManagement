<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录页</title>
    <style type="text/css">
        body {
            background: #EAEAEF;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #f1f1f1;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .login-form {
            margin-top: 20px;
        }

        h1 {
            color: #0034d9;
            margin-bottom: 30px;
        }

        .loginDiv {
            background: #fff;
            padding: 20px 30px;
            width: 400px;
            margin: 0 auto;
            text-align: center;
        }

        button {
            width: 180px;
            height: 40px;
            background: #0034d9;
            border: 1px solid #fff;
            color: #fff;
            font-size: 14px;
        }

        input {
            width: 260px;
            padding: 4px 2px;
            border: 1px solid #0034d9; /* 将输入框边框颜色改为浅蓝色 */
            border-radius: 5px; /* 添加圆角 */
            outline: none; /* 移除默认的聚焦边框 */
        }

        .tips {
            width: 440px;
            height: 30px;
            margin: 5px auto;
            background: #fff;
            color: #17334e;
            border: 1px solid #cccccc;
            display: none;
            line-height: 30px;
            padding-left: 20px;
            font-size: 13px;
        }
    </style>

    <script src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#username,#password").blur(function () {
                var value = $(this).val();
                if (value.trim() == '') {
                    $(".tips").css("display", "block")
                    $(".tips").html("输入内容不能为空!");
                } else {
                    $(".tips").css("display", "none")
                }
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="login-form">
        <h1>学生管理系统</h1>
        <div id="tipsDivID" class="tips"></div>
        <div class="loginDiv">
            <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
                <p>
                    <label>用户名：<input id="username" type="text" name="username"></label>
                </p>
                <p>
                    <label>密　码：<input id="password" type="password" name="password"></label>
                </p>
                <p>
                    <button type="submit" id="login">登录</button>
                </p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
