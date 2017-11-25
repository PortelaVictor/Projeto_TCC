
package com.javatpoint.dao;

/**
 *
 * @author porte
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
//import com.javatpoint.bean.Cliente;
import com.javatpoint.bean.Clientejuridico;
public class ClienteDao {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/producao","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
    
    public static int save(Clientejuridico cj){//,String[] dados){
        int status=0;
        //String[] teste = dados;
        try{
            
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement(
            "insert into cliente(nome, cpfcnpj, dnascimento, contato, email, cep, endereco, numero, complemento, estado, cidade) values (?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1,cj.getNome());
            ps.setString(2,cj.getCpfcnpj());
            ps.setString(3,cj.getDnascimento());
            //ps.setDate(3, new Date(c.getDnascimento().getTime()));
            ps.setString(4,cj.getContato());
            ps.setString(5,cj.getEmail());
            ps.setString(6,cj.getCep());
            ps.setString(7,cj.getEndereco());
            ps.setInt(8,cj.getNumero());
            ps.setString(9,cj.getComplemento());
            ps.setString(10,cj.getEstado());
            ps.setString(11,cj.getCidade());
            status=ps.executeUpdate();   
            
            
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int idCliente = rs.getInt(1);
            //for (int i = 0; i < dados.length; i=i+2) {
                ps=con.prepareStatement("insert into clientejuridico(idcliente,cnpj,ie) values (?,?,?)");
                ps.setInt(1, idCliente);
                ps.setString(2, cj.getCnpj());//dados[i+0]);
                ps.setString(3, cj.getInsce());//dados[i+1]);
                status=ps.executeUpdate();
                
            //}*/    
            
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int update(Clientejuridico cj){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement(
            "update cliente set nome=?, cpfcnpj=?, dnascimento=?, contato=?, email=?, cep=?, endereco=?, numero=?, complemento=?, estado=?, cidade=? where id=?");
            ps.setString(1,cj.getNome());
            ps.setString(2,cj.getCpfcnpj());
            ps.setString(3,cj.getDnascimento());
            //ps.setDate(3, new Date(c.getDnascimento().getTime()));
            ps.setString(4,cj.getContato());
            ps.setString(5,cj.getEmail());
            ps.setString(6,cj.getCep());
            ps.setString(7,cj.getEndereco());
            ps.setInt(8,cj.getNumero());
            ps.setString(9,cj.getComplemento());
            ps.setString(10,cj.getEstado());
            ps.setString(11,cj.getCidade());
            ps.setInt(12,cj.getId());
            status=ps.executeUpdate();
            
            
            PreparedStatement ps1=con.prepareStatement(
            "update clientejuridico set cnpj=?, ie=? where idcliente=?");
            ps1.setString(1,cj.getCnpj());
            ps1.setString(2,cj.getInsce());
            ps1.setInt(3,cj.getId());
            status=ps1.executeUpdate();
            
            
            
            
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int delete(Clientejuridico cj){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("delete from cliente where id=?");
            PreparedStatement ps1=con.prepareStatement("delete from clientejuridico where idcliente=?");
            ps.setInt(1,cj.getId());
            ps1.setInt(1,cj.getId());
            status=ps.executeUpdate();
            status=ps1.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static List<Clientejuridico> getAllRecords(){
        List<Clientejuridico> list=new ArrayList<Clientejuridico>();
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from cliente");
            PreparedStatement ps1=con.prepareStatement("select * from clientejuridico where id=idcliente");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Clientejuridico cj =new Clientejuridico();
                cj.setId(rs.getInt("id"));
                cj.setNome(rs.getString("nome"));
                cj.setCpfcnpj(rs.getString("cpfcnpj"));
                cj.setDnascimento(rs.getString("dnascimento"));
                //c.setDnascimento(rs.getDnascimento("dnascimento"));
                cj.setContato(rs.getString("contato"));
                cj.setEmail(rs.getString("email"));
                cj.setCep(rs.getString("cep"));
                cj.setEndereco(rs.getString("endereco"));
                cj.setNumero(rs.getInt("numero"));
                cj.setComplemento(rs.getString("complemento"));
                cj.setEstado(rs.getString("estado"));
                cj.setCidade(rs.getString("cidade"));
                cj.setCnpj(rs.getString("cnpj"));
                cj.setInsce(rs.getString("ie"));
                list.add(cj);
            }
            
        }catch(Exception e){System.out.println(e);}
        return list;
     }
    public static Clientejuridico getRecordById(int id){
        Clientejuridico cj=null;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from cliente where id=?");
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                cj=new Clientejuridico();
                cj.setId(rs.getInt("id"));
                cj.setNome(rs.getString("nome"));
                cj.setCpfcnpj(rs.getString("cpfcnpj"));
                cj.setDnascimento(rs.getString("dnascimento"));
                cj.setContato(rs.getString("contato"));
                cj.setEmail(rs.getString("email"));
                cj.setCep(rs.getString("cep"));
                cj.setEndereco(rs.getString("endereco"));
                cj.setNumero(rs.getInt("numero"));
                cj.setComplemento(rs.getString("complemento"));
                cj.setEstado(rs.getString("estado"));
                cj.setCidade(rs.getString("cidade"));
                
            }
            PreparedStatement ps1=con.prepareStatement("select * from clientejuridico where idcliente=?");
            ps1.setInt(1, id);
            ResultSet rs1=ps1.executeQuery();
            while(rs1.next()){
                //cj=new Clientejuridico();
                //cj.setId(rs1.getInt("id"));
                //cj.setIdcliente(id);
                cj.setCnpj(rs1.getString("cnpj"));
                cj.setInsce(rs1.getString("ie"));
                
            }
        }catch(Exception e){System.out.println(e);}
        return cj;
    }
}
