<%-- 
    Document   : editcliente
    Created on : 24/09/2017, 18:22:10
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.ClienteDao"%>  
<jsp:useBean id="c" class="com.javatpoint.bean.Cliente"></jsp:useBean>  
<jsp:setProperty property="*" name="c"/>  
<%  
    int i=ClienteDao.update(c);  
    response.sendRedirect("index.jsp");  
%>
