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
public class Venda {
     private int id, cliente;
    private List<ItemVenda> items;
    
    public Venda() {
        this.id = 0;
        this.cliente = 0;
        this.items = new ArrayList<>();
      
    }
    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id = id;
    }
    public int getCliente(){
        return cliente;
    }
    public void setCliente(int cliente){
        this.cliente = cliente;
    }
    
    public List<ItemVenda> getItens() {
        return items;
    }

    public void addItem(ItemVenda itemVenda) {
        items.add(itemVenda);
    }

    public int quantidadeItens() {
        return items.size();
    }  
}
