<%-- 
    Document   : deletecliente
    Created on : 24/09/2017, 18:20:25
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.FornecedorDao"%>
<jsp:useBean id="fj" class="com.javatpoint.bean.Fornecedorjuridico"></jsp:useBean>
<jsp:setProperty property="*" name="fj"/>
<%
    FornecedorDao.delete(fj);
    response.sendRedirect("index.jsp");
%>
