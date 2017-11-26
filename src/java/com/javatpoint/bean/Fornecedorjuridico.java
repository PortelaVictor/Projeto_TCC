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
public class Fornecedorjuridico extends Fornecedor {
    private int idfornecedor;
    private String cnpj,insce;
    
        
    
    public Fornecedorjuridico() {
        
    }
    public Fornecedorjuridico(int idfornecedor,String cnpj, String insce) {
        this.idfornecedor = idfornecedor;
        this.cnpj = cnpj;
        this.insce = insce;
    }
    public Fornecedorjuridico(String cnpj, String insce,int idfornecedor, int id, int numero, String nome, String cpfcnpj, String contato, String email, String endereco, String complemento, String estado, String cidade, String dnascimento, String cep) {
        super(id,numero,nome,cpfcnpj,contato,email,endereco,complemento,estado,cidade, dnascimento,cep);
        this.idfornecedor = idfornecedor;
        this.cnpj = cnpj;
        this.insce = insce;
    }
        public int getIdfornecedor() {
            return idfornecedor;
        }

        public void setIdfornecedor(int idfornecedor) {
            this.idfornecedor = idfornecedor;
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