package br.com.leiturasdamia.entidades;

public class Postagem {
    private int id;
    private String titulo;
    private String texto;
    private Autor autor;
    private String nomeDoAutor;
    private int idAutor;

    public Postagem() {

    }

    public Postagem(String titulo, String texto, Autor autor) {
        this.titulo = titulo;
        this.texto = texto;
        this.autor = autor;
        this.idAutor = autor.getId();
        this.nomeDoAutor = autor.getUsername();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Autor getAutor() {
        return autor;
    }

    public void setAutor(Autor autor) {
        this.autor = autor;
    }

    public int getIdAutor() {
        return idAutor;
    }

    public void setIdAutor(int idAutor) {
        this.idAutor = idAutor;
    }

    public String getNomeDoAutor() {
        return nomeDoAutor;
    }

    public void setNomeDoAutor(String nomeDoAutor) {
        this.nomeDoAutor = nomeDoAutor;
    }
}
