<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="br.com.leiturasdamia.entidades.Postagem" %>
<%@ page import="br.com.leiturasdamia.dao.PostagemDAO" %>
<%@ page import="java.util.List" %>
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
        }

        #titulo {
            padding: 15px 0;
            display: flex;
            justify-content: space-between;
        }

        .autor {
            font-style: italic
        }

        i {
            margin: auto 0;
            font-size:xx-large;
        }

        .card {
            width: 80%;
            margin: 10px auto;

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
%>
<!-- O código a segui verifica quais postagens estão salvas -->
<%
List<Postagem> listaDePostagens = PostagemDAO.consultar();
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

        <div class="container" id="titulo">
            <%
            if(usuarioLogado) {
                out.write("<h2>Olá, " + username + "</h2>");
            } else {
                out.write("<h2>Artigos</h2>");
            }
            %>
            <!-- Aqui verificamos se o usuário é autor, se sim, é mostrado o ícone para inserção de nova postagem -->
            <%
            if (autor) {
                out.write("<a href='novo-artigo.jsp'><i class='bi bi-file-earmark-plus'></i></a>");
            }
            %>
        </div>
        
        <%
        for(Postagem p : listaDePostagens){
            out.write("<div class='card text-center'>");
                out.write("<div class='card-body'>");
                    out.write("<h5 class='card-title'>" + p.getTitulo() + "</h5>");
                    out.write("<h6 class='card-subtitle mb-2 text-muted'>Escrito por ");
                    out.write("<span class='autor'>" + p.getNomeDoAutor() + "</span></h6>");
                    out.write("<a href='artigo.jsp?id="+p.getId()+"' class='btn btn-primary'>Leia agora</a>");
                out.write("</div>");
            out.write("</div>");
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