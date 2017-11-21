
package com.javatpoint.bean;

//import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author porte
 */
public class Produto extends Categoria {
    private int id, categoria;
    private String nome, descricao, dvencimento, unidade;
    //private Date dnascimento;
    
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
    public String getDescricao(){
        return descricao;
    }
    public void setDescricao(String descricao){
        this.descricao = descricao;
    }
    public String getDvencimento(){
        return dvencimento;
    }
    public void setDvencimento(String dvencimento) throws ParseException{
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        this.dvencimento = dvencimento;
        java.sql.Date data = new java.sql.Date(format.parse(dvencimento).getTime());
    }
    public int getCategoria(){
        return categoria;
    }
    public void setCategoria(int categoria){
        this.categoria = categoria;
    }
    public String getUnidade(){
        return unidade;
    }
    public void setUnidade(String unidade){
        this.unidade = unidade;
    }

    
}
