/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatpoint.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.javatpoint.bean.Produto;

/**
 *
 * @author porte
 */
public class ProdutoDao {
  public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/producao","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
    
    public static int save(Produto p){
        int status=0;
        try{
            
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement(
            "insert into produto(nome, descricao, categoria) values (?,?,?)");
            ps.setString(1,p.getNome());
            ps.setString(2,p.getDescricao());
            ps.setInt(3,p.getCategoria());
            status=ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int update(Produto p){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement(
            "update produto set nome=?, descricao=?, categoria=? where id=?");
             ps.setString(1,p.getNome());
            ps.setString(2,p.getDescricao());
            ps.setInt(3,p.getCategoria());
            ps.setInt(4,p.getId());
            status=ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int delete(Produto p){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("delete from produto where id=?");
            ps.setInt(1,p.getId());
            status=ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static List<Produto> getAllRecords(){
        List<Produto> list=new ArrayList<Produto>();
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from produto");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Produto p=new Produto();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setDescricao(rs.getString("descricao"));
                p.setCategoria(rs.getInt("categoria"));
                list.add(p);
            }
        }catch(Exception e){System.out.println(e);}
        return list;
     }
    public static Produto getRecordById(int id){
        Produto p=null;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from produto where id=?");
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                p=new Produto();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setDescricao(rs.getString("descricao"));
                p.setCategoria(rs.getInt("categoria"));
            }
        }catch(Exception e){System.out.println(e);}
        return p;
    }  
}
