/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatpoint.bean;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author porte
 */
public class Compra {
    private int id, fornecedor,total;
    private String dcompra,numero,contato;
    private List<ItemCompra> items;
    //private Double totalcompra;
    
    public Compra() {
        this.id = 0;
        this.fornecedor = 0;
        this.dcompra = "";
        this.contato = "";
        this.numero = "";
        this.items = new ArrayList<>();
        //this.totalcompra = 0;
        //totalcompra
      
    }
    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id = id;
    }
    public int getFornecedor(){
        return fornecedor;
    }
    public void setFornecedor(int fornecedor){
        this.fornecedor = fornecedor;
    }
    public String getDcompra(){
        return dcompra;
    }
    public void setDcompra(String dcompra) throws ParseException{
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        this.dcompra = dcompra;
        java.sql.Date data = new java.sql.Date(format.parse(dcompra).getTime());
    }
    public String getContato(){
        return contato;
    }
    public void setContato(String contato){
        this.contato = contato;
    }
    public String getNumero(){
        return numero;
    }
    public void setNumero(String numero){
        this.numero = numero;
    }
    public List<ItemCompra> getItens() {
        return items;
    }

    public void addItem(ItemCompra itemCompra) {
        items.add(itemCompra);
    }

    public int quantidadeItens() {
        return items.size();
    }   
    public int getTotal(){
        return total;
    }
    public void setTotal(int total){
        this.total = total;
    }
    

}
