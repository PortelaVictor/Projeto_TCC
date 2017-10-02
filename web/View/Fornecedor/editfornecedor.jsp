<%-- 
    Document   : editcliente
    Created on : 24/09/2017, 18:22:10
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.FornecedorDao"%>  
<jsp:useBean id="f" class="com.javatpoint.bean.Fornecedor"></jsp:useBean>  
<jsp:setProperty property="*" name="f"/>  
<%  
    int i=FornecedorDao.update(f);  
    response.sendRedirect("index.jsp");  
%>
