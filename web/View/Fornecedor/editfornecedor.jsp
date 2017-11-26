<%-- 
    Document   : editcliente
    Created on : 24/09/2017, 18:22:10
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.FornecedorDao"%>  
<jsp:useBean id="fj" class="com.javatpoint.bean.Fornecedorjuridico"></jsp:useBean>  
<jsp:setProperty property="*" name="f"/>  
<%  
    int i=FornecedorDao.update(fj);  
    response.sendRedirect("index.jsp");  
%>
