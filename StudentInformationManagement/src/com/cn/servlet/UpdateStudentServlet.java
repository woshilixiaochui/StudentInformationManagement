package com.cn.servlet;

import com.cn.util.C3P0Utils;
import com.cn.bean.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "UpdateStudentServlet", urlPatterns = "/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String hobby = request.getParameter("hobby");
        String email = request.getParameter("email"); // Get the updated email value
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = C3P0Utils.getConnection();
            String sql = "update student set name=?, age=?, gender=?, hobby=?, email=? where id=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, age);
            preparedStatement.setString(3, gender);
            preparedStatement.setString(4, hobby);
            preparedStatement.setString(5, email); // Set the updated email value
            preparedStatement.setInt(6, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3P0Utils.release(connection, preparedStatement, null);
        }
        String contextPath = request.getContextPath();
        response.sendRedirect(contextPath + "/ShowStudentServlet");
    }
}
