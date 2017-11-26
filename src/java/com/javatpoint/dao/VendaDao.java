/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatpoint.dao;

import com.javatpoint.bean.Venda;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author porte
 */
public class VendaDao {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/producao","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    } 
    public static int save(Venda v,String[] items){
        int status=0;
        //int idVenda = 0;
        String[] teste = items;
        try{
            Connection con=getConnection();
            //idVenda = Integer.valueOf("Id");
            // verificação se tem item no estoque 
            for (int i = 0; i < items.length; i=i+4) {
                //String sql = "INSERT INTO TBITEMCOMPRA (CODIGOPRODUTO, CODIGOCOMPRA, QUANTIDADE, VALORUNITARIO) VALUES (?, ?, ?, ?)";
                PreparedStatement slct=con.prepareStatement("select * from produto where id=?");
                //slct.setInt(1, idVenda);
                slct.setInt(1, Integer.parseInt(items[i+0])); // Produto
                
                ResultSet rs = slct.executeQuery(); 
                rs.next();
                int saldo = rs.getInt("quantidade"); 
                //setEstado(rs.getString("estado"));
                if(saldo < Integer.parseInt(items[i+1])){
                    //Exception('Nao há estoque disponivel.');
                    System.out.println("Nao há estoque disponivel.");
                    status = 2; // Sem estoque
                    return status;
                }
                
            }
            
           
            PreparedStatement ps=con.prepareStatement(
            "insert into venda(cliente,dvenda,contato,numero,totalvenda,status) values (?,?,?,?,?,1)", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1,v.getCliente());
            ps.setString(2,v.getDvenda());
            ps.setString(3,v.getContato());
            ps.setString(4,v.getNumero());
            ps.setInt(5,v.getTotal());
            status=ps.executeUpdate();
            

            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int idVenda = rs.getInt(1);

             
            for (int i = 0; i < items.length; i=i+4) {
                ps=con.prepareStatement("insert into itemvenda(idvenda,idproduto,quantidade,valorunitario,valortotal) values (?,?,?,?,?)");
                ps.setInt(1, idVenda);
                ps.setString(2, items[i+0]);
                ps.setString(3, items[i+1]);
                ps.setString(4, items[i+2]);
                ps.setString(5, items[i+3]);
                ps.execute();
                
                ps=con.prepareStatement("update produto set quantidade=quantidade-? where id=?") ;
                ps.setString(1, items[i+1]);
                ps.setString(2, items[i+0]);
                ps.execute(); 
            }            
            
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int cancelar(Venda v){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement(
            "update venda set cliente=?,dvenda=?,contato=?,numero=?,totalvenda=?,status=0 where id=?");
            ps.setInt(1,v.getCliente());
            ps.setString(2,v.getDvenda());
            ps.setString(3,v.getContato());
            ps.setString(4,v.getNumero());
            ps.setInt(5,v.getTotal());
            ps.setInt(6,v.getId());
            status=ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int delete(Venda v){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("delete from venda where id=?");
            ps.setInt(1,v.getId());
            status=ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static List<Venda> getAllRecords(){
        List<Venda> list=new ArrayList<Venda>();
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from venda");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Venda v=new Venda();
                v.setId(rs.getInt("id"));
                v.setCliente(rs.getInt("cliente"));
                v.setCliente(rs.getInt("cliente"));
                v.setDvenda(rs.getString("dvenda"));
                v.setContato(rs.getString("contato"));
                v.setNumero(rs.getString("numero"));
                v.setTotal(rs.getInt("total"));
                v.setStatus(rs.getInt("status"));
                list.add(v);
            }
        }catch(Exception e){System.out.println(e);}
        return list;
     }
    public static Venda getRecordById(int id){
        Venda v=null;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from venda where id=?");
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                v=new Venda();
                v.setId(rs.getInt("id"));
                v.setCliente(rs.getInt("cliente"));
                v.setDvenda(rs.getString("dvenda"));
                v.setContato(rs.getString("contato"));
                v.setNumero(rs.getString("numero"));
                v.setTotal(rs.getInt("totalvenda"));
                v.setStatus(rs.getInt("status"));
                
            }
        }catch(Exception e){System.out.println(e);}
        return v;
    }
}
