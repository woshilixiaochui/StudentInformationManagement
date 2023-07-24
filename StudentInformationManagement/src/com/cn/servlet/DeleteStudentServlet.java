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


@WebServlet(name = "DeleteStudentServlet", urlPatterns = "/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = C3P0Utils.getConnection();
            String sql = "delete from student where id=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            int result = preparedStatement.executeUpdate();
            if (result > 0){
                System.out.println("success");
            } else{
                System.out.println("error");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3P0Utils.release(connection, preparedStatement, null);
        }
        String contextPath = request.getContextPath();
        response.sendRedirect( contextPath+"/ShowStudentServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
