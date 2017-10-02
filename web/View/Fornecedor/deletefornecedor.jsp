<%-- 
    Document   : deletecliente
    Created on : 24/09/2017, 18:20:25
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.FornecedorDao"%>
<jsp:useBean id="f" class="com.javatpoint.bean.Fornecedor"></jsp:useBean>
<jsp:setProperty property="*" name="f"/>
<%
    FornecedorDao.delete(f);
    response.sendRedirect("index.jsp");
%>
