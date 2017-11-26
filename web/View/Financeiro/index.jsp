<%-- 
    Document   : index
    Created on : 25/11/2017, 16:39:37
    Author     : porte
--%>

<%
    if ((session.getAttribute("id") == null) || (session.getAttribute("id") == "" )) {
%>


<%} else {
%>
    Welcome <%=session.getAttribute("id")%>
<a href='logout.jsp'>Sair</a>
<%
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Financeiro</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap Core CSS Importante menu lateral-->
        <link href="../../Model/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../../Model/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- DataTables CSS -->
        <link href="../../Model/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

        <!-- DataTables Responsive CSS -->
        <link href="../../Model/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

        <!-- Custom CSS importante menu de cima-->
        <link href="../../Model/dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts impotante imagens-->
        <link href="../../Model/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="wrapper">
            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                            <a class="navbar-brand" href="..\home_administrador.jsp">DASHBOARD</a>
                    </div>
                    <!-- /.navbar-header -->
                    <ul class="nav navbar-top-links navbar-right">
                            <!-- /.dropdown -->
                            <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-user">
                                            <li><a href="perfil.jsp"><span class="glyphicon glyphicon-user"></span>Perfil</a></li>
                                            <li><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span>Sair</a></li>
                                    </ul>
                                    <!-- /.dropdown-user -->
                            </li>
                            <!-- /.dropdown -->
                    </ul>
                    <!-- /.navbar-top-links -->
                    <div class="navbar-default sidebar" role="navigation">
                            <div class="sidebar-nav navbar-collapse">
                                    <ul class="nav" id="side-menu">
                                            <li>
                                                    <a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i> Início</a>
                                            </li>
                                            <li>
                                                    <a href="#"><i class="fa fa-files-o fa-fw"></i> Cadastros Básicos<span class="fa arrow"></span></a>
                                                    <ul class="nav nav-second-level">
                                                            <li>
                                                                    <a href="Categoria/index.jsp">Categoria</a>
                                                            </li>
                                                            <li>
                                                                     <a href="Cliente/index.jsp">Cliente</a>
                                                            </li>
                                                            <li>    
                                                                     <a href="Fornecedor/index.jsp">Fornecedor</a>
                                                            </li>
                                                            <li>    
                                                               <a href="Produtos/index.jsp">Produtos</a>
                                                            </li>
                                                            <li>    
                                                                    <a href="Usuario/index.jsp">Usuário</a>
                                                            </li>
                                                    </ul>
                                                    <!-- /.nav-second-level -->
                                            </li>
                                            <li>
                                                    <a href="#"><i class="fa fa-edit fa-fw"></i> Compras / Vendas<span class="fa arrow"></span></a>
                                                    <ul class="nav nav-second-level">
                                                            <li>
                                                                    <a href="Compras/index.jsp">Compras</a>
                                                            </li>
                                                            <li>
                                                                    <a href="Vendas/index.jsp">Vendas</a>
                                                            </li>
                                                    </ul>
                                                    <!-- /.nav-second-level -->
                                            </li>
                                    </ul>
                            </div>
                            <!-- /.sidebar-collapse -->
                    </div>
                    <!-- /.navbar-static-side -->
            </nav>
        </div>
        
        <div id="page-wrapper">
            <div class="col-md-12">
                                    <table id="products-table" border="1" width="900px" >	
                                        <thead bgcolor="#DDEEFF">
                                                <th><label for="dnascimento" align="center">Data</label></th>
                                                <th><label for="produto" align="center">Compra</label></th>	
                                                <th><label for="quantidade" align="center">Venda</label></th>
                                                <th><label for="totalproduto" align="center">Total Dia</label></th>
		
                                        </thead>
                                        <tbody>	
                                            

                                            
                                            

                                                     <%  
                //Query buscando categoria
                ResultSet resultset=null;
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=null;
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/producao","root","");
                    Statement statement = con.createStatement();
                    resultset =statement.executeQuery("select data, sum(case when tipo='Compra' then total else 0 end ) as compra, sum(case when tipo='Venda' then total else 0 end ) as Venda,( sum(case when tipo='Compra' then total else 0 end ) - sum(case when tipo='Venda' then total else 0 end ) ) as TotalDia    from(SELECT 'Venda' as Tipo,dvenda as data, totalvenda as total FROM Venda union ALL SELECT 'Compra'as Tipo, dcompra as data,totalcompra as total FROM Compra ) as fluxocaixa group by data order by data");
                    while(resultset.next()){
                           %>
                           <tr>
                                <td><input type="date" class="form-control" name="numero" id="email" value="<%= resultset.getString(1)%>" disabled="disabled"></td>
                                <td><input type="number" class="form-control" name="total" id="email" value="<%= resultset.getString(2)%>" disabled="disabled"></td>
                                <td><input type="number" class="form-control" name="total" id="email" value="<%= resultset.getString(3)%>" disabled="disabled"></td>
                                <td><input type="number" class="form-control" name="total" id="email" value="<%= resultset.getString(4)%>" disabled="disabled"></td>
                           </tr>
                           
                           <% 
                    }
               
                    }catch(Exception e){out.println("Entrada errada"+e);}
                %>                                          
                                         </tbody>
                                        <br>
                                        <tfoot>

                                        </tfoot>	
                                    </table>
                                </div>
                
        </div>
		<!-- /#wrapper -->
		<!-- jQuery  deixa o menu lateral aberto-->
		<script src="../../Model/vendor/jquery/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript abir o menu lateral-->
		<script src="../../Model/vendor/bootstrap/js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="../../Model/vendor/metisMenu/metisMenu.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="../../Model/dist/js/sb-admin-2.js"></script>

	</body>
   
</html>
