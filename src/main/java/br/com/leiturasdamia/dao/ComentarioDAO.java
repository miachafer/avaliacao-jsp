package br.com.leiturasdamia.dao;

import br.com.leiturasdamia.entidades.Comentario;
import br.com.leiturasdamia.entidades.Postagem;
import br.com.leiturasdamia.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComentarioDAO {
    public static List<Comentario> comentarios = new ArrayList<Comentario>();

    public static String salvar(Comentario c){
        Connection conexao = Conexao.conectar();
        if(conexao != null){
            String sql = "insert into comentario(texto,id_postagem,nome_autor,id_autor, moderado)" +
                    "values(?,?,?,?,?)";
            try {
                PreparedStatement stm = conexao.prepareStatement(sql);
                stm.setString(1,c.getTexto());
                stm.setInt(2,c.getIdPostagem());
                stm.setString(3,c.getNomeDoAutor());
                stm.setInt(4,c.getIdAutor());
                stm.setBoolean(5,c.isModerado());

                stm.execute();

            } catch (SQLException e) {
                return  "Erro: " + e.getMessage();
            }
            return "Registro inserido com sucesso.";
        }
        return "Erro de conexão.";
    }

    public  static List<Comentario> consultar(){
        List<Comentario> listaDeComentarios = new ArrayList<Comentario>();
        Connection conexao = Conexao.conectar();
        if(conexao != null) {
            try {
                PreparedStatement stm =
                        conexao.prepareStatement(
                                "select * from comentario");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Comentario c = new Comentario();
                    c.setId(rs.getInt("id"));
                    c.setTexto(rs.getString("texto"));
                    c.setIdPostagem(rs.getInt("id_postagem"));
                    c.setNomeDoAutor(rs.getString("nome_autor"));
                    c.setIdAutor(rs.getInt("id_autor"));

                    listaDeComentarios.add(c);
                }
            } catch (SQLException e) {
                return listaDeComentarios;
            }
        }
        return listaDeComentarios;
    }

    public static Comentario consultar(int idComentario){
        Connection conexao = Conexao.conectar();
        Comentario c = new Comentario();
        if(conexao != null){
            try {
                PreparedStatement stm = conexao.prepareStatement("select * from comentario where id = ?");
                stm.setInt(1,idComentario);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                    c.setId(rs.getInt("id"));
                    c.setTexto(rs.getString("texto"));
                    c.setIdPostagem(rs.getInt("id_postagem"));
                    c.setNomeDoAutor(rs.getString("nome_autor"));
                    c.setIdAutor(rs.getInt("id_autor"));
                }
            } catch (SQLException e) {
                return c;
            }
        }
        return c;
    }

    public static String alterar(Comentario c){
        Connection conexao = Conexao.conectar();
        if(conexao != null){
            String sql = "update comentario set moderado = ? where id = ?;";
            try {
                PreparedStatement stm = conexao.prepareStatement(sql);
                stm.setBoolean(1, c.setModerado());
                stm.setInt(2, c.getId());
                stm.execute();
                return "Comentário moderado.";
            } catch (SQLException e) {
                return "Não foi possível moderar comentário.";
            }
        }
        return "Erro de conexão.";
    }

    public static void excluir(int id){
        Connection con = Conexao.conectar();
        if(con != null){
            String sql = "delete from comentario where id = ?";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1,id);
                stm.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }


}
