package com.cn.servlet;

import com.cn.util.C3P0Utils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


@WebServlet(name = "AddStudentServlet", urlPatterns = "/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String hobby = request.getParameter("hobby");
        String email = request.getParameter("email");
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = C3P0Utils.getConnection();
            String sql = "insert into student (name,age,gender,hobby,email) values (?,?,?,?,?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, age);
            preparedStatement.setString(3, gender);
            preparedStatement.setString(4, hobby);
            preparedStatement.setString(5, email); // 设置邮箱字段值
            int result = preparedStatement.executeUpdate();
            if (result > 0) {
                System.out.println("success");
            } else {
                System.out.println("error");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3P0Utils.release(connection, preparedStatement, null);
        }
        String contextPath = request.getContextPath();
        response.sendRedirect(contextPath + "/ShowStudentServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
