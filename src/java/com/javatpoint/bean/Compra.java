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
    private int id, fornecedor;
    private List<ItemCompra> items;
    
    public Compra() {
        this.id = 0;
        this.fornecedor = 0;
        this.items = new ArrayList<>();
      
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
    
    public List<ItemCompra> getItens() {
        return items;
    }

    public void addItem(ItemCompra itemCompra) {
        items.add(itemCompra);
    }

    public int quantidadeItens() {
        return items.size();
    }    


}
