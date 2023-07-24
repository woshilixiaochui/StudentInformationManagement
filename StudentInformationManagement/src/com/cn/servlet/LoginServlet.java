package com.cn.servlet;

import com.cn.util.C3P0Utils;
import com.cn.bean.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "LoginServlet", urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = C3P0Utils.getConnection();
            String sql = "SELECT * FROM user where username=? and password=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();
            boolean isSuc = resultSet.next();
            if (isSuc) {
                System.out.println("success");
                User user = new User(username,password);
                HttpSession session = request.getSession();
                session.setAttribute("user",user);
                String contextPath = request.getContextPath();
                response.sendRedirect( contextPath+"/ShowStudentServlet");
            } else {
                System.out.println("error");
                String contextPath = request.getContextPath();
                response.sendRedirect(contextPath + "/index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3P0Utils.release(connection, preparedStatement, resultSet);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
