<%-- 
    Document   : deletecliente
    Created on : 24/09/2017, 18:20:25
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.ClienteDao"%>
<jsp:useBean id="c" class="com.javatpoint.bean.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>
<%
    ClienteDao.delete(c);
    response.sendRedirect("index.jsp");
%>
