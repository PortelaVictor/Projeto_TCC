/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatpoint.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author porte
 */
public class Venda {
     private int id, cliente;
     private String dvenda,numero,contato;
    private List<ItemVenda> items;
    
    public Venda() {
        this.id = 0;
        this.cliente = 0;
        this.dvenda = "";
        this.contato = "";
        this.numero = "";
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
    public String getDvenda(){
        return dvenda;
    }
    public void setDvenda(String dvenda) throws ParseException{
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        this.dvenda = dvenda;
        java.sql.Date data = new java.sql.Date(format.parse(dvenda).getTime());
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
