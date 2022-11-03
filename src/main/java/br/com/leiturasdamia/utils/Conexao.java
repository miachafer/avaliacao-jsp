package br.com.leiturasdamia.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

    public static Connection conectar(){
        Connection conexao = null;
        String url = "jdbc:mysql://localhost:3306/leiturasdamia";
        String user = "root";
        String password = "root";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            conexao = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            return  conexao;
        }
        return conexao;
    }
}
