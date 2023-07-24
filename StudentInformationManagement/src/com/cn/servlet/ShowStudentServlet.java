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

@WebServlet(name = "ShowStudentServlet", urlPatterns = "/ShowStudentServlet")
public class ShowStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Student> studentArrayList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = C3P0Utils.getConnection();
            String sql = "SELECT * FROM student";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int age = resultSet.getInt("age");
                String gender = resultSet.getString("gender");
                String hobby = resultSet.getString("hobby");
                String email = resultSet.getString("email"); // 获取电子邮件字段的值
                Student student = new Student(id, name, age, gender, hobby,email);
                student.setEmail(email);
                studentArrayList.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3P0Utils.release(connection, preparedStatement, resultSet);
        }

        request.setAttribute("students", studentArrayList);
        //String contextPath = request.getContextPath();
        //System.out.println("---> contextPath="+contextPath);
        //System.   out.println("---> contextPath.length()="+contextPath.length());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/studentList.jsp");
        requestDispatcher.forward(request, response);
    }
}