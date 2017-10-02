<%-- 
    Document   : addcliente
    Created on : 24/09/2017, 16:13:32
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.FornecedorDao"%>  
<jsp:useBean id="f" class="com.javatpoint.bean.Fornecedor"></jsp:useBean>  
<jsp:setProperty property="*" name="f"/>  

<%  
    int i=FornecedorDao.save(f);  
    if(i>0){  
        response.sendRedirect("addfornecedor-sucesso.jsp");  
    }else{  
        response.sendRedirect("addfornecedor-erro.jsp");  
    }  
%>