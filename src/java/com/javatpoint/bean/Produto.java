/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatpoint.bean;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author porte
 */
public class Produto {
    private int id,categoria;
    private String nome,descricao;
    //private Categoria categoria;
    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id = id;
    }
    public int getCategoria(){
        return categoria;
    }
    public void setCategoria(int categoria){
        this.categoria = categoria;
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
   
}
