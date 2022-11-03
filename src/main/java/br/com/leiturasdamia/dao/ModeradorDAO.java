package br.com.leiturasdamia.dao;

import br.com.leiturasdamia.entidades.Autor;
import br.com.leiturasdamia.entidades.Moderador;
import br.com.leiturasdamia.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ModeradorDAO {
    public static List<Moderador> moderadores = new ArrayList<Moderador>();

    public  static List<Moderador> consultar(){
        List<Moderador> listaDeModeradores = new ArrayList<Moderador>();
        Connection conexao = Conexao.conectar();
        if(conexao != null) {
            try {
                PreparedStatement stm =
                        conexao.prepareStatement("select * from moderador");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Moderador m = new Moderador();
                    m.setId(rs.getInt("id"));
                    m.setUsername(rs.getString("username"));
                    m.setSenha(rs.getString("senha"));
                    m.setTipoDeUsuario(rs.getString("tipoDeUsuario"));
                    listaDeModeradores.add(m);
                }
            } catch (SQLException e) {
                return listaDeModeradores;
            }
        }
        return listaDeModeradores;
    }
}
