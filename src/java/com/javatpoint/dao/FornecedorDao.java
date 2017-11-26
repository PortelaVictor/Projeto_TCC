
package com.javatpoint.dao;
/**
 *
 * @author porte
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.javatpoint.bean.Fornecedorjuridico;

public class FornecedorDao {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/producao","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
    
    public static int save(Fornecedorjuridico fj){
        int status=0;
        try{
            
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement(
           "insert into fornecedor(nome, cpfcnpj, dnascimento, contato, email, cep, endereco, numero, complemento, estado, cidade) values (?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1,fj.getNome());
            ps.setString(2,fj.getCpfcnpj());
            ps.setString(3,fj.getDnascimento());
            //ps.setDate(3, new Date(c.getDnascimento().getTime()));
            ps.setString(4,fj.getContato());
            ps.setString(5,fj.getEmail());
            ps.setString(6,fj.getCep());
            ps.setString(7,fj.getEndereco());
            ps.setInt(8,fj.getNumero());
            ps.setString(9,fj.getComplemento());
            ps.setString(10,fj.getEstado());
            ps.setString(11,fj.getCidade());
            status=ps.executeUpdate();   
            
            
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int idFornecedor = rs.getInt(1);
            //for (int i = 0; i < dados.length; i=i+2) {
                ps=con.prepareStatement("insert into fornecedorjuridico(idcliente,cnpj,ie) values (?,?,?)");
                ps.setInt(1, idFornecedor);
                ps.setString(2, fj.getCnpj());//dados[i+0]);
                ps.setString(3, fj.getInsce());//dados[i+1]);
                status=ps.executeUpdate();
                
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int update(Fornecedorjuridico fj){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement(
            "update fornecedor set nome=?, cpfcnpj=?, dnascimento=?, contato=?, email=?, cep=?, endereco=?, numero=?, complemento=?, estado=?, cidade=? where id=?");
            ps.setString(1,fj.getNome());
            ps.setString(2,fj.getCpfcnpj());
            ps.setString(3,fj.getDnascimento());
            //ps.setDate(3, new Date(c.getDnascimento().getTime()));
            ps.setString(4,fj.getContato());
            ps.setString(5,fj.getEmail());
            ps.setString(6,fj.getCep());
            ps.setString(7,fj.getEndereco());
            ps.setInt(8,fj.getNumero());
            ps.setString(9,fj.getComplemento());
            ps.setString(10,fj.getEstado());
            ps.setString(11,fj.getCidade());
            ps.setInt(12,fj.getId());
            status=ps.executeUpdate();
            
            
            PreparedStatement ps1=con.prepareStatement(
            "update fornecedorjuridico set cnpj=?, ie=? where idfornecedor=?");
            ps1.setString(1,fj.getCnpj());
            ps1.setString(2,fj.getInsce());
            ps1.setInt(3,fj.getId());
            status=ps1.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static int delete(Fornecedorjuridico fj){
        int status=0;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("delete from fornecedor where id=?");
            PreparedStatement ps1=con.prepareStatement("delete from forncedorjuridico where idcliente=?");
            ps.setInt(1,fj.getId());
            ps1.setInt(1,fj.getId());
            status=ps.executeUpdate();
            status=ps1.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        return status;
    }
    public static List<Fornecedorjuridico> getAllRecords(){
        List<Fornecedorjuridico> list=new ArrayList<Fornecedorjuridico>();
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from cliente");
            PreparedStatement ps1=con.prepareStatement("select * from clientejuridico where id=idcliente");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Fornecedorjuridico cj =new Fornecedorjuridico();
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
    public static Fornecedorjuridico getRecordById(int id){
        Fornecedorjuridico fj=null;
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from fornecedor where id=?");
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                fj=new Fornecedorjuridico();
                fj.setId(rs.getInt("id"));
                fj.setNome(rs.getString("nome"));
                fj.setCpfcnpj(rs.getString("cpfcnpj"));
                fj.setDnascimento(rs.getString("dnascimento"));
                fj.setContato(rs.getString("contato"));
                fj.setEmail(rs.getString("email"));
                fj.setCep(rs.getString("cep"));
                fj.setEndereco(rs.getString("endereco"));
                fj.setNumero(rs.getInt("numero"));
                fj.setComplemento(rs.getString("complemento"));
                fj.setEstado(rs.getString("estado"));
                fj.setCidade(rs.getString("cidade"));
                
            }
            PreparedStatement ps1=con.prepareStatement("select * from fornecedorjuridico where idforncedor=?");
            ps1.setInt(1, id);
            ResultSet rs1=ps1.executeQuery();
            while(rs1.next()){
                //cj=new Clientejuridico();
                //cj.setId(rs1.getInt("id"));
                //cj.setIdcliente(id);
                fj.setCnpj(rs1.getString("cnpj"));
                fj.setInsce(rs1.getString("ie"));
                
            }
        }catch(Exception e){System.out.println(e);}
        return fj;
    }
}
