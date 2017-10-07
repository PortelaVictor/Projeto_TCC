<%-- 
    Document   : addproduto
    Created on : 26/09/2017, 21:34:27
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.ProdutoDao"%>  
<jsp:useBean id="p" class="com.javatpoint.bean.Produto"></jsp:useBean>  
<jsp:setProperty property="*" name="p"/>  
  
<%  
    int i=ProdutoDao.save(p);  
    if(i>0){  
        response.sendRedirect("addproduto-sucesso.jsp");  
    }else{  
        response.sendRedirect("addproduto-erro.jsp");  
    }  
%>