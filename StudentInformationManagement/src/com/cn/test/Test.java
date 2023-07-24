package com.cn.test;

import com.cn.util.C3P0Utils;
import java.sql.Connection;

public class Test {
    public static void main(String[] args) {
        Connection connection = C3P0Utils.getConnection();
        System.out.println("connection="+connection);
    }
}
