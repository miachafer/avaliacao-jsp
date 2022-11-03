package br.com.leiturasdamia.dao;

import br.com.leiturasdamia.entidades.Usuario;
import br.com.leiturasdamia.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    public static List<Usuario> usuariosExternos = new ArrayList<Usuario>();

    public static String salvar(Usuario u){
        Connection conexao = Conexao.conectar();
        if(conexao != null){
            String sql = "insert into usuario(username,senha,tipoDeUsuario)" +
                    "values(?,?,?)";
            try {
                PreparedStatement stm = conexao.prepareStatement(sql);
                stm.setString(1,u.getUsername());
                stm.setString(2,u.getSenha());
                stm.setString(3,u.getTipoDeUsuario());
                stm.execute();

            } catch (SQLException e) {
                return  "Erro: " + e.getMessage();
            }
            return "Registro inserido com sucesso.";
        }
        return "Erro de conexão.";
    }

    public  static List<Usuario> consultar(){
        List<Usuario> listaDeUsuarios = new ArrayList<Usuario>();
        Connection conexao = Conexao.conectar();
        if(conexao != null) {
            try {
                PreparedStatement stm =
                        conexao.prepareStatement(
                                "select * from usuario");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Usuario u = new Usuario();
                    u.setId(rs.getInt("id"));
                    u.setUsername(rs.getString("username"));
                    u.setSenha(rs.getString("senha"));
                    u.setTipoDeUsuario(rs.getString("tipoDeUsuario"));
                    listaDeUsuarios.add(u);
                }
            } catch (SQLException e) {
                return listaDeUsuarios;
            }
        }
        return listaDeUsuarios;
    }
}
