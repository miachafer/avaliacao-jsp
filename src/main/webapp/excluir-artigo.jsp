<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="br.com.leiturasdamia.dao.ArtigoDAO" %>

<%
   String idPostagem =  request.getParameter("id");
   ArtigoDAO.excluir(Integer.parseInt(idPostagem));
   response.sendRedirect("artigos.jsp");
%>