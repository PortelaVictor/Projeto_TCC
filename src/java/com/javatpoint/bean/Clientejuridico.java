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
        //int id, idcliente;
        private String cnpj,ie;
        
    
    public Clientejuridico() {
        
    }
    public Clientejuridico(String cnpj, String ie) {
        this.cnpj = cnpj;
        this.ie = ie;
    }
    public Clientejuridico(String cnpj, String ie, int id, int numero, String nome, String cpfcnpj, String contato, String email, String endereco, String complemento, String estado, String cidade, String dnascimento, String cep) {
        super(id,numero,nome,cpfcnpj,contato,email,endereco,complemento,estado,cidade, dnascimento,cep);
        this.cnpj = cnpj;
        this.ie = ie;
    }

        public String getCnpj() {
            return cnpj;
        }

        public void setCnpj(String cnpj) {
            this.cnpj = cnpj;
        }

        public String getIE() {
            return ie;
        }

        public void setIE(String ie) {
            this.ie = ie;
        }
    }