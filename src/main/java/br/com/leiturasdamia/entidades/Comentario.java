package br.com.leiturasdamia.entidades;

public class Comentario {
    private int id;
    private String texto;
    private Usuario autorDoComentario;
    private int idAutor;
    private String nomeDoAutor;
    private Postagem postagem;
    private int idPostagem;
    private boolean moderado = false;

    public Comentario() {

    }

    public Comentario(String texto, Usuario autorDoComentario, Postagem postagem) {
        this.texto = texto;
        this.autorDoComentario = autorDoComentario;
        this.idAutor = autorDoComentario.getId();
        this.nomeDoAutor = autorDoComentario.getUsername();
        this.postagem = postagem;
        this.idPostagem = postagem.getId();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Usuario getAutorDoComentario() {
        return autorDoComentario;
    }

    public void setAutorDoComentario(Usuario autorDoComentario) {
        this.autorDoComentario = autorDoComentario;
    }

    public Postagem getPostagem() {
        return postagem;
    }

    public void setPostagem(Postagem postagem) {
        this.postagem = postagem;
    }

    public int getIdPostagem() {
        return idPostagem;
    }

    public void setIdPostagem(int id) {
        idPostagem = id;
    }

    public boolean isModerado() {
        return moderado;
    }

    public boolean setModerado() {
        this.moderado = true;
        return moderado;
    }

    public int getIdAutor() {
        return idAutor;
    }

    public void setIdAutor(int id) {
        idAutor = id;
    }

    public String getNomeDoAutor() {
        return nomeDoAutor;
    }

    public void setNomeDoAutor(String nomeDoAutor) {
        this.nomeDoAutor = nomeDoAutor;
    }
}
