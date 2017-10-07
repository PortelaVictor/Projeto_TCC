<%-- 
    Document   : editproduto
    Created on : 26/09/2017, 21:35:30
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.ProdutoDao"%>  
<jsp:useBean id="p" class="com.javatpoint.bean.Produto"></jsp:useBean>  
<jsp:setProperty property="*" name="p"/>  
<%  
    int i=ProdutoDao.update(p);
    response.sendRedirect("index.jsp");  
%>