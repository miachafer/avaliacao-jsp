<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="br.com.leiturasdamia.entidades.Comentario" %>
<%@ page import="br.com.leiturasdamia.dao.ComentarioDAO" %>
<%
    String idComentario = request.getParameter("id");
    ComentarioDAO.excluir(Integer.parseInt(idComentario));
    out.write("Comentário excluído com sucesso.");
    out.write("<script>setTimeout(() => {document.location.href = 'moderar.jsp'}, 2000)</script>");
%>