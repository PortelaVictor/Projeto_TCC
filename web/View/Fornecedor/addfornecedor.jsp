<%-- 
    Document   : addcliente
    Created on : 24/09/2017, 16:13:32
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.FornecedorDao"%>  
<jsp:useBean id="fj" class="com.javatpoint.bean.Fornecedorjuridico"></jsp:useBean>  
<jsp:setProperty property="*" name="fj"/>  

<%  
    int i=FornecedorDao.save(fj);  
    if(i>0){  
        response.sendRedirect("addfornecedor-sucesso.jsp");  
    }else{  
        response.sendRedirect("addfornecedor-erro.jsp");  
    }  
%>