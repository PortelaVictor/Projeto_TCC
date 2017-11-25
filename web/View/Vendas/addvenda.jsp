<%-- 
    Document   : addusuario
    Created on : 17/09/2017, 14:24:19
    Author     : porte
--%>

<%@page import="com.javatpoint.dao.VendaDao"%>  
<jsp:useBean id="v" class="com.javatpoint.bean.Venda"></jsp:useBean>  
<jsp:setProperty property="*" name="v"/>  

<%
    
    String[] values = request.getParameterValues("items");   
    
 
    int i=VendaDao.save(v,values);     
    if(i==1){   
        response.sendRedirect("addvenda-sucesso.jsp");  
    }
    else if(i==2){   
        response.sendRedirect("addvenda-estoque.jsp");  
    }
    else{  
        response.sendRedirect("addvenda-erro.jsp");  
    }  
%>