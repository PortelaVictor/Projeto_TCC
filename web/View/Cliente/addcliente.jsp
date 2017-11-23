<%-- 
    Document   : addusuario
    Created on : 17/09/2017, 14:24:19
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.ClienteDao"%>  
<jsp:useBean id="cj" class="com.javatpoint.bean.Clientejuridico"></jsp:useBean>  
<jsp:setProperty property="*" name="cj"/>  

<%
    
    //String[] values = request.getParameterValues("dados");   
    
 
    int i=ClienteDao.save(cj);     
    if(i>0){   
        response.sendRedirect("addcliente-sucesso.jsp");  
    }else{  
        response.sendRedirect("addcliente-erro.jsp");  
    }  
%>