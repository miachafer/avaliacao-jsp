<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="br.com.leiturasdamia.entidades.Autor" %>
<%@ page import="br.com.leiturasdamia.dao.AutorDAO" %>
<%@ page import="br.com.leiturasdamia.entidades.Moderador" %>
<%@ page import="br.com.leiturasdamia.dao.ModeradorDAO" %>
<%@ page import="br.com.leiturasdamia.entidades.Usuario" %>
<%@ page import="br.com.leiturasdamia.dao.UsuarioDAO" %>
<%@ page import="java.util.List" %>
<%
    List<Autor> listaDeAutores = AutorDAO.consultar();
    List<Moderador> listaDeModeradores = ModeradorDAO.consultar();
    List<Usuario> listaDeUsuarios = UsuarioDAO.consultar();

    String inputUsername = request.getParameter("username");
    String inputSenha = request.getParameter("senha");

    Autor autor = null;
    Moderador moderador = null;
    Usuario usuario = null;

    boolean achou =  false;

    for(Autor a : listaDeAutores){
        if(inputUsername.equals(a.getUsername()) && inputSenha.equals(a.getSenha()) && !achou)  {
            autor = a;
            achou = true;
        }
    }

    for(Moderador m : listaDeModeradores){
        if(inputUsername.equals(m.getUsername()) && inputSenha.equals(m.getSenha()) && !achou)  {
            moderador = m;
            achou = true;
        }
    }

    for(Usuario u : listaDeUsuarios){
        if(inputUsername.equals(u.getUsername()) && inputSenha.equals(u.getSenha()) && !achou)  {
            usuario = u;
            achou = true;
        }
    }

    if (achou) {
        out.write("Logado com sucesso. Aguarde...");
        if (autor != null) {
            session.setAttribute("username", autor.getUsername());
            session.setAttribute("usuario", autor.getTipoDeUsuario());
        } else if (moderador != null) {
            session.setAttribute("username", moderador.getUsername());
            session.setAttribute("usuario", moderador.getTipoDeUsuario());
        } else if (usuario != null) {
            session.setAttribute("username", usuario.getUsername());
            session.setAttribute("usuario", usuario.getTipoDeUsuario());
        }
        out.write("<script>setTimeout(() => {document.location.href = 'artigos.jsp'}, 2000)</script>");
    } else {
        out.write("Login ou senha incorretos.<br>");
        out.write("<a href='javascript:back()'>Voltar</a><br>");
        out.write("<a href='cadastro.jsp'>Cadastre-se</a>");
    }
%>