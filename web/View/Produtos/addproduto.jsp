<%-- 
    Document   : addcliente
    Created on : 24/09/2017, 16:13:32
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.ProdutoDao"%>  
<jsp:useBean id="p" class="com.javatpoint.bean.Produto"></jsp:useBean>  
<jsp:setProperty property="*" name="p"/>  
  
<%  
    int i=ProdutoDao.save(p);  
    if(i>0){  
        response.sendRedirect("addproduto-successo.jsp");  
    }else{  
        response.sendRedirect("addproduto-erro.jsp");  
    }  
%>