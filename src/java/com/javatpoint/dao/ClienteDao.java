
package com.javatpoint.dao;

/**
 *
 * @author porte
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Calendar;
import java.sql.Date;
import com.javatpoint.bean.Cliente;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ClienteDao {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/producao","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
    /*public static Date formataData(String dnascimento) throws Exception{
        if(dnascimento == null || dnascimento.equals(""))
            return null;
        Date date = null;
        try{
            DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            date = (Date)(java.util.Date)formatter.parse(dnascimento);
        }catch (ParseException e){
            throw e;
        }
        return date;
    }*/
    public static int save(Cliente c){
        int status=0;
        try{
            
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement(
            "insert into cliente(nome, cpfcnpj, dnascimento, contato, email, cep, endereco, numero, complemento, estado, cidade) values (?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,c.getNome());
            ps.setString(2,c.getCpfcnpj());
            ps.setString(3,c.getDnascimento());
            ps.setString(4,c.getContato());
            ps.setString(5,c.getEmail());
            ps.setInt(6,c.getCep());
            ps.setString(7,c.getEndereco());
            ps.setInt(8,c.getNumero());
            ps.setString(9,c.getComplemento());
            ps.setString(10,c.getEstado());
            ps.setString(11,c.getCidade());
            status=ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int update(Cliente c){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement(
            "update cliente set nome=?, cpfcnpj=?, dnascimento=?, contato=?, email=?, cep=?, endereco=?, numero=?, complemento=?, estado=?, cidade=? where id=?");
            ps.setString(1,c.getNome());
            ps.setString(2,c.getCpfcnpj());
            ps.setString(3,c.getDnascimento());
            ps.setString(4,c.getContato());
            ps.setString(5,c.getEmail());
            ps.setInt(6,c.getCep());
            ps.setString(7,c.getEndereco());
            ps.setInt(8,c.getNumero());
            ps.setString(9,c.getComplemento());
            ps.setString(10,c.getEstado());
            ps.setString(11,c.getCidade());
            ps.setInt(12,c.getId());
            status=ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int delete(Cliente c){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("delete from cliente where id=?");
            ps.setInt(1,c.getId());
            status=ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static List<Cliente> getAllRecords(){
        List<Cliente> list=new ArrayList<Cliente>();
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from cliente");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Cliente c=new Cliente();
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setCpfcnpj(rs.getString("cpfcnpj"));
                c.setDnascimento(rs.getString("dnascimento"));
                c.setContato(rs.getString("contato"));
                c.setEmail(rs.getString("email"));
                c.setCep(rs.getInt("cep"));
                c.setEndereco(rs.getString("endereco"));
                c.setNumero(rs.getInt("numero"));
                c.setComplemento(rs.getString("complemento"));
                c.setEstado(rs.getString("estado"));
                c.setCidade(rs.getString("cidade"));
                list.add(c);
            }
        }catch(Exception e){System.out.println(e);}
        return list;
     }
    public static Cliente getRecordById(int id){
        Cliente c=null;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from cliente where id=?");
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                c=new Cliente();
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setCpfcnpj(rs.getString("cpfcnpj"));
                c.setDnascimento(rs.getString("dnascimento"));
                c.setContato(rs.getString("contato"));
                c.setEmail(rs.getString("email"));
                c.setCep(rs.getInt("cep"));
                c.setEndereco(rs.getString("endereco"));
                c.setNumero(rs.getInt("numero"));
                c.setComplemento(rs.getString("complemento"));
                c.setEstado(rs.getString("estado"));
                c.setCidade(rs.getString("cidade"));
            }
        }catch(Exception e){System.out.println(e);}
        return c;
    }
}
