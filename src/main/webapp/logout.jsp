<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.invalidate();
out.write("Sessão encerrada. Aguarde...");
out.write("<script>setTimeout(() => {document.location.href = 'index.jsp'}, 2000)</script>");
%>