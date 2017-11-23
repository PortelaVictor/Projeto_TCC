<%-- 
    Document   : editcliente
    Created on : 24/09/2017, 18:22:10
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.ClienteDao"%>  
<jsp:useBean id="cj" class="com.javatpoint.bean.Clientejuridico"></jsp:useBean>  
<jsp:setProperty property="*" name="cj"/>  
<%  
    int i=ClienteDao.update(cj);  
    response.sendRedirect("index.jsp");  
%>
