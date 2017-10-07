<%-- 
    Document   : deleteproduto
    Created on : 26/09/2017, 21:35:00
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.ProdutoDao"%>
<jsp:useBean id="p" class="com.javatpoint.bean.Produto"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>
<%
    ProdutoDao.delete(p);
    response.sendRedirect("index.jsp");
%>
