
package com.javatpoint.dao;

/**
 *
 * @author porte
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import com.javatpoint.bean.Fornecedor;

public class FornecedorDao {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/producao","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
    public static int save(Fornecedor f){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement(
            "insert into forncedor(nome, cpfcnpj, dnascimento, contato, email, cep, endereco, numero, complemento, estado, cidade) values (?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,f.getNome());
            ps.setString(2,f.getCpfcnpj());
            ps.setDate(3,f.getDnascimento());
            ps.setString(4,f.getContato());
            ps.setString(5,f.getEmail());
            ps.setInt(6,f.getCep());
            ps.setString(7,f.getEndereco());
            ps.setInt(8,f.getNumero());
            ps.setString(9,f.getComplemento());
            ps.setString(10,f.getEstado());
            ps.setString(11,f.getCidade());
            status=ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int update(Fornecedor f){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement(
            "update fornecedor set nome=?, cpfcnpj=?, dnascimento=?, contato=?, email=?, cep=?, endereco=?, numero=?, complemento=?, estado=?, cidade=? where id=?");
            ps.setString(1,f.getNome());
            ps.setString(2,f.getCpfcnpj());
            ps.setDate(3,f.getDnascimento());
            ps.setString(4,f.getContato());
            ps.setString(5,f.getEmail());
            ps.setInt(6,f.getCep());
            ps.setString(7,f.getEndereco());
            ps.setInt(8,f.getNumero());
            ps.setString(9,f.getComplemento());
            ps.setString(10,f.getEstado());
            ps.setString(11,f.getCidade());
            ps.setInt(12,f.getId());
            status=ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int delete(Fornecedor f){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("delete from fornecedor where id=?");
            ps.setInt(1,f.getId());
            status=ps.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static List<Fornecedor> getAllRecords(){
        List<Fornecedor> list=new ArrayList<Fornecedor>();
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from fornecedor");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Fornecedor f=new Fornecedor();
                f.setId(rs.getInt("id"));
                f.setNome(rs.getString("nome"));
                f.setCpfcnpj(rs.getString("cpfcnpj"));
                f.setDnascimento(rs.getDate("dnascimento"));
                f.setContato(rs.getString("contato"));
                f.setEmail(rs.getString("email"));
                f.setCep(rs.getInt("cep"));
                f.setEndereco(rs.getString("endereco"));
                f.setNumero(rs.getInt("numero"));
                f.setComplemento(rs.getString("complemento"));
                f.setEstado(rs.getString("estado"));
                f.setCidade(rs.getString("cidade"));
                list.add(f);
            }
        }catch(Exception e){System.out.println(e);}
        return list;
     }
    public static Fornecedor getRecordById(int id){
        Fornecedor f=null;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from fornecedor where id=?");
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                f=new Fornecedor();
                f.setId(rs.getInt("id"));
                f.setNome(rs.getString("nome"));
                f.setCpfcnpj(rs.getString("cpfcnpj"));
                f.setDnascimento(rs.getDate("dnascimento"));
                f.setContato(rs.getString("contato"));
                f.setEmail(rs.getString("email"));
                f.setCep(rs.getInt("cep"));
                f.setEndereco(rs.getString("endereco"));
                f.setNumero(rs.getInt("numero"));
                f.setComplemento(rs.getString("complemento"));
                f.setEstado(rs.getString("estado"));
                f.setCidade(rs.getString("cidade"));
            }
        }catch(Exception e){System.out.println(e);}
        return f;
    }
}
