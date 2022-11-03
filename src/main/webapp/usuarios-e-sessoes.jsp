<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="br.com.leiturasdamia.entidades.Autor" %>
<%@ page import="br.com.leiturasdamia.dao.AutorDAO" %>
<%@ page import="br.com.leiturasdamia.entidades.Moderador" %>
<%@ page import="br.com.leiturasdamia.dao.ModeradorDAO" %>
<%@ page import="br.com.leiturasdamia.entidades.Usuario" %>
<%@ page import="br.com.leiturasdamia.dao.UsuarioDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Enumeration" %>

<%
    List<Autor> listaDeAutores = AutorDAO.consultar();
    out.write("<h4>Autores</h4>");
    for(Autor a : listaDeAutores){
        out.write("Autor: " + a.getUsername() + "<br>");
    }
    List<Moderador> listaDeModeradores = ModeradorDAO.consultar();
    out.write("<h4>Moderadores</h4>");
    for(Moderador m : listaDeModeradores){
        out.write("Moderador: " + m.getUsername() + "<br>");
    }
    List<Usuario> listaDeUsuarios = UsuarioDAO.consultar();
    out.write("<h4>Usuários</h4>");
    for(Usuario u : listaDeUsuarios){
        out.write("Usuário: " + u.getUsername() + "<br>");
    }
    out.write("<br>");
    out.write("<h4>Mostrando as sessões ativas:</h4> <br>");
    Enumeration e = session.getAttributeNames();
    while (e.hasMoreElements()) {
        String name = (String)e.nextElement();
        String value = session.getAttribute(name).toString();
        out.write("name is: " + name + ", value is: " + value + "<br>");
    }
%>