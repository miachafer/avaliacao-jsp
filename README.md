# Avaliação sobre Java Server Pages (JSP)

Entrega: 03/11/2022

- Faça download ou fork do repositório.
- Rode o script SQL que está na raiz do repositório no MySQL Workbench.
- Levante o servidor Jetty na porta 8080.
- Comece pela página `index.html`.
- Veja que é possível ler os artigos sem estar logado (visite `artigos.jsp`). Não é possível fazer comentários sem estar logado como um usuário comum (autores e moderadores também não podem comentar).
- Faça login como autor (usuário: Mia, senha: 121212) e veja que é possível, na página de cada artigo (`artigo.jsp?id=id`), editá-lo ou exclui-lo, já que todos foram escritos por esse autor específico. Também é possível criar um novo artigo. 
- Faça o logout na página inicial ou na navegação lateral à direita.
- Faça login como usuário comum (usuário: Ana, senha: ana123).
- Veja que é possível comentar em um artigo específico (`artigo.jsp?id=id`).
- Faça o logout.
- É possível realizar via interface, isto é, na página `index.html`, o cadastro de um novo usuário comum. 
- É possível, estando logado ou não, acessar a página `usuarios-e-sessoes.jsp` e ver todos os usuários cadastrados, assim como as sessões ativas.

**ATENÇÃO: A parte de moderação não ficou pronta à tempo.**
- O moderador (usuário: Moderador, senha: moderador), se logado, tem acesso à página `moderar.jsp` onde é possível ver cada comentário sem moderação. 
- Cada comentário direciona para a página `moderar-comentario.jsp?id=id` onde é possível aceitar ou excluir (`excluir-comentario.jsp?id=id`) o comentário. 
- **ATENÇÃO:** Essa parte do sistema ainda está sendo testada, portanto, não deve ser utilizada.

Professor: [Vilson Moro](https://github.com/instrutorvilson)
