<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="br.com.leiturasdamia.entidades.Usuario" %>
<%@ page import="br.com.leiturasdamia.dao.UsuarioDAO" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Leituras da Mia | Cadastro</title>
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
            text-align: center;
        }

        .btn {
            display: block;
            width: 150px;
            margin: 5px auto;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="position-relative">
            <div class="position-absolute top-50 start-50 translate-middle">
                <div class="titulo">
                    <h1>Cadastro</h1>
                    <form action="cadastro.jsp" method="POST">
                        <div class="mb-3">
                            <label for="username" class="form-label">Nome de usuário</label>
                            <input type="text" id="username" name="username" class="form-control" placeholder="johndoe"
                            required
                            >
                        </div>
                        <div class="mb-3">
                            <label for="senha" class="form-label">Senha</label>
                            <input type="password" id="senha" name="senha" class="form-control" placeholder="********"
                            required>
                        </div>
                        <div class="mb-3">
                            <label for="confirmacao-de-senha" class="form-label">Confirme a senha</label>
                            <input type="password" id="confirmacao-de-senha" name="confirmacao-de-senha"
                            class="form-control" placeholder="********" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Cadastre-se</button>
                    </form>
                <%
                    String username = request.getParameter("username");
                    String senha = request.getParameter("senha");
                    String confirmacaoDeSenha = request.getParameter("confirmacao-de-senha");
                    String tipoDeUsuario = "usuario";

                    if(username != null && senha != null && confirmacaoDeSenha != null){
                        if (senha.equals(confirmacaoDeSenha)) {
                            Usuario u = new Usuario(username, senha, tipoDeUsuario);
                            String retorno = UsuarioDAO.salvar(u);
                            out.write(retorno);
                        } else {
                            out.write("Confira se a senha inserida nos dois campos é igual.");
                        }
                    }
                %>
                </div>
            </div>
        </div>
    </div>

</body>

</html>