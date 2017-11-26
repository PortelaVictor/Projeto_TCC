<%-- 
    Document   : editproduto
    Created on : 22/09/2017, 19:53:31
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.CompraDao"%>  
<jsp:useBean id="c" class="com.javatpoint.bean.Compra"></jsp:useBean>  
<jsp:setProperty property="*" name="c"/>  
<%  
    int i=CompraDao.cancelar(c);
    response.sendRedirect("index.jsp");  
%>