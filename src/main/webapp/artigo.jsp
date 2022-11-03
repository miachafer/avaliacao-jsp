<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="br.com.leiturasdamia.entidades.Postagem" %>
<%@ page import="br.com.leiturasdamia.dao.PostagemDAO" %>
<%@ page import="br.com.leiturasdamia.entidades.Usuario" %>
<%@ page import="br.com.leiturasdamia.dao.UsuarioDAO" %>
<%@ page import="br.com.leiturasdamia.entidades.Comentario" %>
<%@ page import="br.com.leiturasdamia.dao.ComentarioDAO" %>
<%@ page import="java.util.List" %>
<%
    String idPostagem = request.getParameter("id");
    Postagem p = PostagemDAO.consultar(Integer.parseInt(idPostagem));       
%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Leituras da Mia | Artigos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"
        defer></script>
    <style>
        .position-relative {
            height: 100vh;
        }

        a {
            text-decoration: none;
        }

        h1, h2 {
            font-family: 'Pacifico', cursive;
            color:#32004F;
            padding-top: 5px;
        }

        #titulo {
            padding: 15px 0;
            display: flex;
            justify-content: space-between;
        }
        
        .titulo-comentarios {
            font-family: 'Pacifico', cursive;
            padding: 10px 0 5px 0;
        }

        .comentario {
            padding: 10px 0;
            font-weight: normal;
            font-style: normal;
        }

        .autor {
            font-style: italic;
        }

        i {
            margin: auto 0;
            font-size:xx-large;
        }

        #idPostagem {
            display: none;
        }

        footer {
            padding: 10px 0;
            background-color: #F8F9FA;
        }

        #copyright {
            margin: 10px 0;
            text-align: center;
        }

    </style>
</head>
<!-- O código JSP a seguir confere se há sessão ativa: -->
<%
boolean autor = false;
boolean moderador = false;
boolean usuario = false;
boolean usuarioLogado = false;
String username = (String)session.getAttribute("username");
String tipoDeUsuario = (String)session.getAttribute("usuario");
if(session.getAttribute("username") !=null && session.getAttribute("usuario") !=null) {
    usuarioLogado = true;
    if(tipoDeUsuario.equals("autor")) {
        autor = true;
    } else if(tipoDeUsuario.equals("moderador")) {
        moderador = true;
    } else if(tipoDeUsuario.equals("usuario")) {
        usuario = true;
    }
}

Usuario usuarioAtivo = null;
boolean achouUsuario = false;
if (usuario) {
    List<Usuario> listaDeUsuarios = UsuarioDAO.consultar();
    for(Usuario u : listaDeUsuarios){
        if(username.equals(u.getUsername()) && !achouUsuario) {
            achouUsuario = true;
            usuarioAtivo = u;
        }
    }
}
%>

<body>
    <!-- NAVBAR -->
    <nav class="navbar bg-light sticky-top">
        <div class="container-fluid">
            <a href="index.jsp"><h1 class="navbar-brand">Leituras da Mia</h1></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Aqui começa a div offcanvas -->
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                aria-labelledby="offcanvasNavbarLabel">
                <!-- Aqui começam os itens dentro da div offcanvas -->
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <!-- O Código a seguir verifica se há usuário logado
                        1. Se sim, o link para logout fica visível
                        2. Se não, ficam visíveis os links para login e cadastro
                        -->
                        <%
                        if (!usuarioLogado) {
                            out.write("<li class='nav-item'><a class='nav-link' href='login.jsp'>Login</a></li><li class='nav-item'><a class='nav-link' href='cadastro.jsp'>Cadastre-se</a></li>");
                        } else {
                            out.write("<li class='nav-item'><a class='nav-link' href='logout.jsp'>Sair</a></li>");
                        }
                        %>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <!-- CONTEÚDO PRINCIPAL -->
    <div class="container">        
        <%
            out.write("<div class='container'>");
                out.write("<div class='container' id='titulo'>");
                    out.write("<h2>" + p.getTitulo() + "</h2>");
                    if(autor && username.equals(p.getNomeDoAutor())) {
                        out.write("<a href='editar-artigo.jsp?id="+p.getId()+"'><i class='bi bi-pencil-square'></i></a>");
                        out.write("<a href='excluir-artigo.jsp?id="+p.getId()+"'><i class='bi bi-trash'></i></a>");
                    } 
                out.write("</div>");
                out.write("<h6 class='card-subtitle mb-2 text-muted'>Escrito por ");
                out.write("<span class='autor'>" + p.getNomeDoAutor() + "</span></h6>");
                out.write("<p>" + p.getTexto() + "</span></h6>");
                if (!usuarioLogado) {
                    out.write("<div class='mb-3 autor'>Você precisa estar logado para comentar.</div>");
                } else if (usuario) {
                    out.write("<form action='artigo.jsp' method='POST'>");
                    out.write("<input type='text' id='idPostagem' name='id' class='form-control' value='" + idPostagem + "' readonly/>");
                    out.write("<div class='mb-3'><label for='comentario' class='form-label'>Comente</label>");
                    out.write("<textarea class='form-control' id='comentario' name='comentario' rows='2'></textarea></div>");
                    out.write("<button type='submit' class='btn btn-primary' >Comentar</button>");
                    out.write("</form>");
                }

                out.write("<h5 class='titulo-comentarios'>Comentários</h5>");

                List<Comentario> listaDeComentarios = ComentarioDAO.consultar();
                    
                    for(Comentario c : listaDeComentarios) {
                        if (c.getIdPostagem() == p.getId()) { 
                            out.write("<h6 class='autor'><span>" + c.getNomeDoAutor() + "</span> <span class='comentario'>" + c.getTexto() + "</span></h6>");
                        }
                    
                }
            out.write("</div>");
        %>
        
        <%
            String comentario = request.getParameter("comentario");
            if(comentario != null){ 
                Comentario c = new Comentario(comentario, usuarioAtivo, p);
                String retorno = ComentarioDAO.salvar(c);
                out.write(retorno);
                response.sendRedirect("artigo.jsp?id="+idPostagem+"");
            } 
        %>
    </div>

    <!-- FOOTER -->
    <footer>
        <div>
            <div id="copyright">Criado com &hearts; por Mia</div>
        </div>
        <div>
            <div id="copyright">2022</div>
        </div>
    </footer>
</body>

</html>