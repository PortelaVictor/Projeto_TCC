<%-- 
    Document   : produtoform
    Created on : 16/09/2017, 20:45:24
    Author     : porte
--%>

<%
    if ((session.getAttribute("id") == null) || (session.getAttribute("id") == "" )) {
%>


<%} else {
%>
    Welcome <%
	session.getAttribute("id");
%>
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
        <title>Adicionar Venda</title>
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
								<a href="home.jsp"><i class="fa fa-dashboard fa-fw"></i> Início</a>
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
										 <a href="compra/index.jsp">compra</a>
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
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"> Cadastro Vendas</h1>
                </div>
                <!-- /.col-lg-12 -->
                <div class="col-lg-12">
                    <div id="list" class="row">
                        <div class="table-responsive col-md-12">
                            <form action="addvenda.jsp" method="post">
                                <div class="col-md-12"> 

                                    <%  
                                        //Query buscando Fornecedor
                                        ResultSet resultset=null;
                                        try{
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection con=null;
                                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/producao","root","");
                                            Statement statement = con.createStatement();
                                            resultset =statement.executeQuery("select * from cliente");
                                    %>
                                    <div class="form-group col-md-4">
                                        <label for="cliente">Cliente</label>
                                        <select class="form-control" id="sel1" name="cliente">
                                            <option></option>
                                            <%while(resultset.next()){%>
                                            <option value=<%= resultset.getString(1)%>><%= resultset.getString(2)%></option>
                                            <%}%>
                                        </select>
                                        <%
                                            }catch(Exception e){out.println("Entrada errada"+e);}
                                        %>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="box">
                                        <h4 class="underline">Informações Item Venda</h4>
                                    </div>
                                    <div class="box">
                                        <button type="button" class="btn btn-default" onclick="javascript:{AddTableRow();}" >Adicionar Produto</button><br><br>
                                    </div>
                                    <table id="products-table">	
                                        <thead>
                                            <tr>

                                            </tr>   
                                        </thead>
                                        <tbody>	
                                            

                                            
                                            
                                            <tr>	
                                                <th><label for="codigo">Número Linha:</label></th>
                                                <th><label for="produto">Produto:</label></th>	
                                                <th><label for="quantidade">Quantidade</label></th>
                                                <th><label for="preco">Preço</label></th>
                                                <th><label for="totalproduto">Total Produto</label></th>
                                                <th><label for="acao">Ações</label></th>		
                                            </tr>
                                            
                                            
                                            <c:forEach items="${items}" var="items">                                          
                                            <tr>
                                                <td><input type="text" value="1" class="form-control"  id="codigo" name="codigo" disabled="disabled"></td>
                                                <td>
                                                    <%  
                                                        //Query buscando produtos
                                                        //ResultSet resultset=null;
                                                        try{
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            Connection con=null;
                                                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/producao","root","");
                                                            Statement statement = con.createStatement();
                                                            resultset =statement.executeQuery("select * from produto");
                                                    %>
                                                    <select class="form-control" id="sel1" name="items">
                                                        <option></option>
                                                        <%while(resultset.next()){%>
                                                        <option value=<%= resultset.getString(1)%>><%= resultset.getString(2)%></option>
                                                        <%}%>
                                                    </select>
                                                    <%
                                                        }catch(Exception e){out.println("Entrada errada"+e);}
                                                    %>

                                                </td>
                                                <td><input type="number" class="form-control" name="items" ></td>
                                                <td><input type='number' step='any' class="form-control" name="items" ></td>
                                                <td><input type='number' step='any' class="form-control" name="items" ></td>
                                                <!--<td>		 
                                                    <button onclick="RemoveTableRow(this)"  class="btn btn-danger">Remover</button>
                                                </td>-->	
                                            </tr>	
                                            
                                            </c:forEach>
                                            
                                        </tbody>
                                        <br>
                                        <tfoot>

                                        </tfoot>	
                                    </table>
                                </div> 
                                <br><br>                    
                                <div class="form-group col-md-12">
                                    <div class="col-md-4">
                                      <button id="cancelar" type="button" name="cancela" class="btn btn-default" onclick="voltar()">Cancelar</button>
                                      <button id="incluir" name="incluir" class="btn btn-primary">Salvar</button>
                                    </div>
                                </div>    
                            </form>
                        </div>
                    </div> <!-- /#list -->
                </div>
            </div>
            <!-- /.row -->
		</div>
	</body>	
    <!-- /#wrapper -->
    <script type="text/javascript">
            function AddTableRow()
            {
                AddTableRow = function() {		
                    var newRow = $("<tr>");
                    var cols = "";	
                    cols += '<td><input type="number" id="codigo" class="form-control" name="codigo" disabled="disabled"></td>';
                    cols += '<td>\n\
                    <%  
                            //Query buscando produtos
                            //ResultSet resultset=null;
                            try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con=null;
                                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/producao","root","");
                                Statement statement = con.createStatement();
                                resultset =statement.executeQuery("select * from produto");
                        %>\n\
                        <select class="form-control" id="sel1" name="items">\n\
                        <option></option>\n\
                        <%while(resultset.next()){%>\n\
                            <option value="<%= resultset.getString(1)%>"><%= resultset.getString(2)%></option>\n\
                        <%}%>\n\
                        </select>\n\
                        <%
                            }catch(Exception e){out.println("Entrada errada"+e);}
                        %>\n\
                    </td>';	
                    cols += '<td><input type="number" class="form-control" name="items" ></td>';	
                    cols += '<td><input type="number" class="form-control" name="items" ></td>';
                    cols += '<td><input type="number" class="form-control" name="items" ></td>';
                    cols += '<td>';		
                    cols += '<button type="button" class="btn btn-danger" onclick="RemoveTableRow(this)"  class="btn btn-danger">Remover</button>';
                    cols += '</td>';		
                    newRow.append(cols);	
                       
                    $("#products-table").append(newRow);
                    $("input[name='codigo']").each(function(ind) {
                        $(this).val(ind + 1);
                    }); 
                    return false;	
                };
            }
        </script>
        <script type="text/javascript">
            RemoveTableRow = function(handler) {
                alert(handler);
                var tr = $(handler).closest('tr');

                tr.fadeOut(400, function(){ 
                  tr.remove(); 
                }); 

                return false;
            };
        </script>
    <script type="text/javascript">
        function voltar()
        {
            location.href=" index.jsp"
        }
    </script>
    <!-- jQuery  deixa o menu lateral aberto-->
    <script src="../../Model/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript abir o menu lateral-->
    <script src="../../Model/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../../Model/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../../Model/dist/js/sb-admin-2.js"></script>
</html>
