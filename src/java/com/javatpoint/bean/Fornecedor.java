
package com.javatpoint.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author porte
 */
public abstract class Fornecedor {
    private int id, numero;
    private String nome, cpfcnpj, contato, email, endereco, complemento, estado, cidade, dnascimento, cep;
    //private Date dnascimento;
    
    public Fornecedor() {
        
    }
    
    public Fornecedor(int id, int numero, String nome, String cpfcnpj, String contato, String email, String endereco, String complemento, String estado, String cidade, String dnascimento, String cep){
        
        this.id = id;
        this.numero = numero;
        this.nome = nome;
        this.cpfcnpj = cpfcnpj;
        this.contato = contato;
        this.email = email;
        this.endereco = endereco;
        this.complemento = complemento;
        this.estado = estado;
        this.cidade = cidade;
        this.dnascimento = dnascimento;
        this.cep = cep;
    }

    
    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id = id;
    }
    public String getNome(){
        return nome;
    }
    public void setNome(String nome){
        this.nome = nome;
    }
    public String getCpfcnpj(){
        return cpfcnpj;
    }
    public void setCpfcnpj(String cpfcnpj){
        this.cpfcnpj = cpfcnpj;
    }
    
    public String getDnascimento(){
        return dnascimento;
    }
    public void setDnascimento(String dnascimento) throws ParseException{
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        this.dnascimento = dnascimento;
        java.sql.Date data = new java.sql.Date(format.parse(dnascimento).getTime());
    }
    public String getContato(){
        return contato;
    }
    public void setContato(String contato){
        this.contato = contato;
    }
    public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email = email;
    }
    public String getCep(){
        return cep;
    }
    public void setCep(String cep){
        this.cep = cep;
    }
    public String getEndereco(){
        return endereco;
    }
    public void setEndereco(String endereco){
        this.endereco = endereco;
    }
    public int getNumero(){
        return numero;
    }
    public void setNumero(int numero){
        this.numero = numero;
    }
    public String getComplemento(){
        return complemento;
    }
    public void setComplemento(String complemento){
        this.complemento = complemento;
    }
    public String getEstado(){
        return estado;
    }
    public void setEstado(String estado){
        this.estado = estado;
    }
    public String getCidade(){
        return cidade;
    }
    public void setCidade(String cidade){
        this.cidade = cidade;
    }
    
}