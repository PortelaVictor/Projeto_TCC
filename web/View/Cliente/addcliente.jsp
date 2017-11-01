<%-- 
    Document   : addusuario
    Created on : 17/09/2017, 14:24:19
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.ClienteDao"%>  
<jsp:useBean id="c" class="com.javatpoint.bean.Cliente"></jsp:useBean>  
<jsp:setProperty property="*" name="c"/>  
  
<%  
    int i=ClienteDao.save(c);  
    if(i>0){  
        response.sendRedirect("clienteform-sucesso.jsp");  
    }else{  
        response.sendRedirect("clienteform-erro.jsp");  
    }  
%>