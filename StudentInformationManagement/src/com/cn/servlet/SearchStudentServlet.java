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
import java.util.ArrayList;


@WebServlet(name = "SearchStudentServlet", urlPatterns = "/SearchStudentServlet")
public class SearchStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = request.getParameter("content");
        ArrayList<Student> studentArrayList = new ArrayList<Student>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = C3P0Utils.getConnection();
            String sql = "SELECT * FROM student WHERE name like ? or id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setObject(1, "%" + content + "%");
            preparedStatement.setObject(2, content);
            preparedStatement.executeQuery();
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int age = resultSet.getInt("age");
                String gender = resultSet.getString("gender");
                String hobby = resultSet.getString("hobby");
                String email = resultSet.getString("email");
                Student student = new Student(id, name, age, gender, hobby,email);
                studentArrayList.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3P0Utils.release(connection, preparedStatement, resultSet);
        }
        request.setAttribute("students", studentArrayList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/studentList.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

