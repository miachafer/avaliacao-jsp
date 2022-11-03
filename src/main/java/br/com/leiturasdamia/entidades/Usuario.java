package br.com.leiturasdamia.entidades;

public class Usuario {

    private int id;
    private String username;
    private String senha;
    private String tipoDeUsuario;

    public Usuario() {

    }

    public Usuario(String username, String senha, String tipoDeUsuario) {

        this.username = username;
        this.senha = senha;
        this.tipoDeUsuario = tipoDeUsuario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getTipoDeUsuario() {
        return tipoDeUsuario;
    }

    public void setTipoDeUsuario(String tipoDeUsuario) {
        this.tipoDeUsuario = tipoDeUsuario;
    }
}
