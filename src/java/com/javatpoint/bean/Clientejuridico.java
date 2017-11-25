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
public class Clientejuridico extends Cliente {
    private int Idcliente;
    private String cnpj,insce;
    
        
    
    public Clientejuridico() {
        
    }
    public Clientejuridico(int idcliente,String cnpj, String insce) {
        this.Idcliente = idcliente;
        this.cnpj = cnpj;
        this.insce = insce;
    }
    public Clientejuridico(String cnpj, String insce,int idcliente, int id, int numero, String nome, String cpfcnpj, String contato, String email, String endereco, String complemento, String estado, String cidade, String dnascimento, String cep) {
        super(id,numero,nome,cpfcnpj,contato,email,endereco,complemento,estado,cidade, dnascimento,cep);
        this.Idcliente = idcliente;
        this.cnpj = cnpj;
        this.insce = insce;
    }
        public int getIdcliente() {
            return Idcliente;
        }

        public void setIdcliente(int Idcliente) {
            this.Idcliente = Idcliente;
        }
        public String getCnpj() {
            return cnpj;
        }

        public void setCnpj(String cnpj) {
            this.cnpj = cnpj;
        }

        public String getInsce() {
            return insce;
        }

        public void setInsce(String insce) {
            this.insce = insce;
        }
    }