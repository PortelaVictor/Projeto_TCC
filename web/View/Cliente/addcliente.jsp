<%-- 
    Document   : addcliente
    Created on : 24/09/2017, 16:13:32
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.ClienteDao"%>  
<jsp:useBean id="c" class="com.javatpoint.bean.Cliente"></jsp:useBean>  
<jsp:setProperty property="*" name="c"/>  

<%  
    int i=ClienteDao.save(c);  
    if(i>0){  
        response.sendRedirect("addcliente-sucesso.jsp");  
    }else{  
        response.sendRedirect("addcliente-erro.jsp");  
    }  
%>