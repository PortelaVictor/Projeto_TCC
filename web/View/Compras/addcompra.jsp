<%-- 
    Document   : addusuario
    Created on : 17/09/2017, 14:24:19
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.CompraDao"%>  
<jsp:useBean id="c" class="com.javatpoint.bean.Compra"></jsp:useBean>  
<jsp:setProperty property="*" name="c"/>  
  
<%  
    int i=CompraDao.save(c);  
    if(i>0){  
        response.sendRedirect("addcompra-sucesso.jsp");  
    }else{  
        response.sendRedirect("addcompra-erro.jsp");  
    }  
%>