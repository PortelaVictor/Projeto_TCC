/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatpoint.dao;

//import javax.​servlet.​ServletRequest;

/**
 *
 * @author porte
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.javatpoint.bean.Compra;
import com.javatpoint.bean.ItemCompra;

public class CompraDao {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/producao","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    } 
    public static int save(Compra c,String[] items){
        int status=0;
        String[] teste = items;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement(
            "insert into compra(fornecedor) values (?)", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1,c.getFornecedor());
            status=ps.executeUpdate();
            

            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int idCompra = rs.getInt(1);

            int lin = 0;    
            for (int i = 0; i < items.length; i=i+4) {
                //String sql = "INSERT INTO TBITEMCOMPRA (CODIGOPRODUTO, CODIGOCOMPRA, QUANTIDADE, VALORUNITARIO) VALUES (?, ?, ?, ?)";
                ps=con.prepareStatement("insert into itemcompra(idcompra,idproduto,quantidade,valorunitario,valortotal) values (?,?,?,?,?)");
                ps.setInt(1, idCompra);
                ps.setString(2, items[i+0]);
                ps.setString(3, items[i+1]);
                ps.setString(4, items[i+2]);
                ps.setString(5, items[i+3]);
                ps.execute();
                
                lin = lin + 1 ;
                  
                ps=con.prepareStatement("update produto set quantidade=quantidade+? where id=?") ;
                ps.setInt(1, Integer.parseInt(items[i+0]));
                ps.setInt(2, Integer.parseInt(items[i+1]));
                
                ps.execute();
            }            
            
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int update(Compra c){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement(
            "update compra set fornecedor=? where id=?");
            ps.setInt(1,c.getFornecedor());
            ps.setInt(2,c.getId());
            status=ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int delete(Compra c){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("delete from compra where id=?");
            ps.setInt(1,c.getId());
            status=ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static List<Compra> getAllRecords(){
        List<Compra> list=new ArrayList<Compra>();
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from compra");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Compra c=new Compra();
                c.setId(rs.getInt("id"));
                c.setFornecedor(rs.getInt("fornecedor"));
                list.add(c);
            }
        }catch(Exception e){System.out.println(e);}
        return list;
     }
    public static Compra getRecordById(int id){
        Compra c=null;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from compra where id=?");
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                c=new Compra();
                c.setId(rs.getInt("id"));
                c.setFornecedor(rs.getInt("fornecedor"));
                
            }
        }catch(Exception e){System.out.println(e);}
        return c;
    }
}
