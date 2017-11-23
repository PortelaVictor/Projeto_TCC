<%-- 
    Document   : deletecliente
    Created on : 24/09/2017, 18:20:25
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.ClienteDao"%>
<jsp:useBean id="cj" class="com.javatpoint.bean.Clientejuridico"></jsp:useBean>
<jsp:setProperty property="*" name="cj"/>
<%
    ClienteDao.delete(cj);
    response.sendRedirect("index.jsp");
%>
