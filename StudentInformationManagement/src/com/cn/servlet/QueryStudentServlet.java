package com.cn.servlet;

import com.cn.util.C3P0Utils;
import com.cn.bean.Student;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet(name = "QueryStudentServlet", urlPatterns = "/QueryStudentServlet")
public class QueryStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sid = Integer.parseInt(request.getParameter("id"));
        Student student = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = C3P0Utils.getConnection();
            String sql = "SELECT * FROM student WHERE id =?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, sid);
            preparedStatement.executeQuery();
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int age = resultSet.getInt("age");
                String gender = resultSet.getString("gender");
                String hobby = resultSet.getString("hobby");
                String email = resultSet.getString("email");
                student = new Student(id, name, age, gender, hobby,email);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3P0Utils.release(connection, preparedStatement, resultSet);
        }
        request.setAttribute("student", student);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/studentUpdate.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}