package br.com.leiturasdamia.dao;

import br.com.leiturasdamia.entidades.Postagem;
import br.com.leiturasdamia.entidades.Postagem;
import br.com.leiturasdamia.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostagemDAO {
    public static List<Postagem> postagens = new ArrayList<Postagem>();

    public static String salvar(Postagem p){
        Connection conexao = Conexao.conectar();
        if(conexao != null){
            String sql = "insert into postagem(titulo,texto,nome_autor,id_autor)" +
                    "values(?,?,?,?)";
            try {
                PreparedStatement stm = conexao.prepareStatement(sql);
                stm.setString(1,p.getTitulo());
                stm.setString(2,p.getTexto());
                stm.setString(3,p.getNomeDoAutor());
                stm.setInt(4,p.getIdAutor());

                stm.execute();

            } catch (SQLException e) {
                return  "Erro: " + e.getMessage();
            }
            return "Registro inserido com sucesso.";
        }
        return "Erro de conexão.";
    }

    public  static List<Postagem> consultar(){
        List<Postagem> listaDePostagens = new ArrayList<Postagem>();
        Connection conexao = Conexao.conectar();
        if(conexao != null) {
            try {
                PreparedStatement stm =
                        conexao.prepareStatement(
                                "select * from postagem");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Postagem p = new Postagem();
                    p.setId(rs.getInt("id"));
                    p.setTitulo(rs.getString("titulo"));
                    p.setTexto(rs.getString("texto"));
                    p.setNomeDoAutor(rs.getString("nome_autor"));
                    p.setIdAutor(rs.getInt("id_autor"));

                    listaDePostagens.add(p);
                }
            } catch (SQLException e) {
                return listaDePostagens;
            }
        }
        return listaDePostagens;
    }

    public static Postagem consultar(int idPostagem){
        Connection conexao = Conexao.conectar();
        Postagem p = new Postagem();
        if(conexao != null){
            try {
                PreparedStatement stm = conexao.prepareStatement("select * from postagem where id = ?");
                stm.setInt(1,idPostagem);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                    p.setId(rs.getInt("id"));
                    p.setTitulo(rs.getString("titulo"));
                    p.setTexto(rs.getString("texto"));
                    p.setNomeDoAutor(rs.getString("nome_autor"));
                    p.setIdAutor(rs.getInt("id_autor"));
                }
            } catch (SQLException e) {
                return p;
            }
        }
        return p;
    }

    public static String alterar(Postagem p){
        Connection conexao = Conexao.conectar();
        if(conexao != null){
            String sql = "update postagem set titulo = ?, texto = ? where id = ?;";
            try {
                PreparedStatement stm = conexao.prepareStatement(sql);
                stm.setString(1, p.getTitulo());
                stm.setString(2, p.getTexto());
                stm.setInt(3, p.getId());
                stm.execute();
                return "Registro alterado com sucesso.";
            } catch (SQLException e) {
                return "Não foi possível alterar registro.";
            }
        }
        return "Erro de conexão.";
    }

    public static  void excluir(int id){
        Connection con = Conexao.conectar();
        if(con != null){
            String sql = "delete from postagem where id = ?";
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
