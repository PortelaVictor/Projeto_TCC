<%-- 
    Document   : editproduto
    Created on : 22/09/2017, 19:53:31
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.VendaDao"%>  
<jsp:useBean id="v" class="com.javatpoint.bean.Venda"></jsp:useBean>  
<jsp:setProperty property="*" name="v"/>  
<%  
    int i=VendaDao.cancelar(v);
    response.sendRedirect("index.jsp");  
%>