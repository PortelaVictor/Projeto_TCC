/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatpoint.bean;

/**
 *
 * @author porte
 */
public class ItemCompra {
    private int id, idcompra,idproduto,quantidade,valorunitario,valortotal;
    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id = id;
    }
    public int getIdcompra(){
        return idcompra;
    }
    public void setIdcompra(int idcompra){
        this.idcompra = idcompra;
    }
    public int getIdproduto(){
        return idproduto;
    }
    public void setIdproduto(int idproduto){
        this.idproduto = idproduto;
    }
    public int getQuantidade(){
        return quantidade;
    }
    public void setQuantidade(int quantidade){
        this.quantidade = quantidade;
    }
    public int getValorUnitario(){
        return valorunitario;
    }
    public void setValorUnitario(int valorunitario){
        this.valorunitario = valorunitario;
    }
    public int getValorTotal(){
        return valortotal;
    }
    public void setValorTotal(int valortotal){
        this.valortotal = valortotal;
    }
}
