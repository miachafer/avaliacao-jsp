<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Leituras da Mia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
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

        h1 {
            font-family: 'Pacifico', cursive;
        }

        .btn {
            display: block;
            width: 150px;
            margin: 5px auto;
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
<body>
    <div class="container">
        <div class="position-relative">
            <div class="position-absolute top-50 start-50 translate-middle">
                <div class="titulo">
                    <h1>Leituras da Mia</h1>
                    <a type="button" class="btn btn-primary" href="artigos.jsp">Ler artigos</a>
                    <!-- O Código a seguir verifica se há usuário logado
                        1. Se sim, o link para logout fica visível
                        2. Se não, ficam visíveis os links para login e cadastro
                    -->
                    <%
                    if(usuarioLogado) {
                        out.write("<a type='button' class='btn btn-danger' href='logout.jsp'>Sair</a>");
                    } else {
                        out.write("<a type='button' class='btn btn-primary' href='login.jsp'>Login</a><a type='button' class='btn btn-primary' href='cadastro.jsp'>Cadastre-se</a>");
                    }
                    %>

                </div>
            </div>
        </div>
    </div>
</body>

</html>