package br.com.leiturasdamia.dao;

import br.com.leiturasdamia.entidades.Autor;
import br.com.leiturasdamia.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AutorDAO {
    public static List<Autor> autores = new ArrayList<Autor>();

    public  static List<Autor> consultar(){
        List<Autor> listaDeAutores = new ArrayList<Autor>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement("select * from autor");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Autor a = new Autor();
                    a.setId(rs.getInt("id"));
                    a.setUsername(rs.getString("username"));
                    a.setSenha(rs.getString("senha"));
                    a.setTipoDeUsuario(rs.getString("tipoDeUsuario"));
                    listaDeAutores.add(a);
                }
            } catch (SQLException e) {
                return listaDeAutores;
            }
        }
        return listaDeAutores;
    }
}
