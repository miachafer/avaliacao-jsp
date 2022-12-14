<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="br.com.leiturasdamia.entidades.Comentario" %>
<%@ page import="br.com.leiturasdamia.dao.ComentarioDAO" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Leituras da Mia | Novo artigo</title>
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

        a {
            text-decoration: none;
        }

        h1, h2 {
            font-family: 'Pacifico', cursive;
            color:#32004F;
        }

        #titulo {
            padding: 15px 0;
            display: flex;
            justify-content: space-between;
        }

        .btn {
            display: block;
            margin: 2px 0 0 0;
        }

        .comentario {
            display: flex;
            justify-content: space-between;
            width: 70%;
            margin: 10px auto 5px auto;
            padding: 15px;
            border-radius: 20px;

        }

        #idComentario {
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
<!-- O c??digo JSP a seguir confere se h?? sess??o ativa: -->
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
        out.write("Usu??rio n??o autorizado...");
        out.write("<script>setTimeout(() => {document.location.href = 'index.jsp'}, 2000)</script>");
    } else if(tipoDeUsuario.equals("moderador")) {
        moderador = true;
    } else if(tipoDeUsuario.equals("usuario")) {
        usuario = true;
        out.write("Usu??rio n??o autorizado...");
        out.write("<script>setTimeout(() => {document.location.href = 'index.jsp'}, 2000)</script>");
    }
} else {
    out.write("Sess??o n??o autorizada...");
    out.write("<script>setTimeout(() => {document.location.href = 'index.jsp'}, 2000)</script>");
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
            <!-- Aqui come??a a div offcanvas -->
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                aria-labelledby="offcanvasNavbarLabel">
                <!-- Aqui come??am os itens dentro da div offcanvas -->
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <!-- O C??digo a seguir verifica se h?? usu??rio logado
                        1. Se sim, o link para logout fica vis??vel
                        2. Se n??o, ficam vis??veis os links para login e cadastro
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

    <!-- CONTE??DO PRINCIPAL -->
    <div class="container">
        <%
        List<Comentario> listaDeComentarios = ComentarioDAO.consultar();

        for (Comentario c : listaDeComentarios) {
            if (c.isModerado() == false) {

                out.write("<div class='container comentario bg-light'>");
                    out.write("<div>");
                        out.write("<input type='text' id='idComentario' name='id' value="+c.getId()+" readonly>");
                        out.write("<h6>Escrito por " +c.getNomeDoAutor() + "</h6>");
                        out.write("<p>" + c.getTexto() + "</p>");
                    out.write("</div>");
                    out.write("<div>");
                        out.write("<a href='moderar-comentario.jsp?id="+c.getId()+"' class='btn btn-primary'><i class='bi bi-eyeglasses'></i></a>");
                    out.write("</div>");
                out.write("</div>");
            }
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