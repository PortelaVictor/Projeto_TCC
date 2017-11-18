<%-- 
    Document   : deleteform
    Created on : 17/09/2017, 15:36:08
    Author     : porte
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="com.javatpoint.dao.ProdutoDao,com.javatpoint.bean.Produto"%>
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
<!DOCTYPE html>
<html>
    <head>
        <title>Deletar Produto</title>
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
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header"> Deletar Usuário</h1>
				</div>
				<!-- /.col-lg-12 -->
				<div class="col-lg-12">
					<div id="list" class="row">
						<div class="table-responsive col-md-12">
                                                    <%
                                                            String id=request.getParameter("id");
                                                            Produto p=ProdutoDao.getRecordById(Integer.parseInt(id));
                                                    %>   
                                                    <form action="deleteproduto.jsp" method="post">
                                                            <div class="col-md-12">
                                                            <input type="hidden" name="id" value="<%=p.getId()%>" disabled="disabled" />
                                                        <div class="col-md-12">
                                                            <div class="form-group col-md-3">
                                                                <label for="nome_completo"> Nome:</label>
                                                                <input type="text" class="form-control" name="nome" value="<%=p.getNome()%>" disabled="disabled" >
                                                            </div>
                                                            <div class="form-group col-md-3">
                                                                <label for="descricao"> Descrição</label>
                                                                <input type="text" class="form-control" name="descricao" value="<%=p.getDescricao()%>" disabled="disabled" >
                                                            </div>
                                                            <div class="form-group col-md-3">
                                                                <label for="dvencimento">Vencimento:</label>
                                                                <input type="date" class="form-control" name="dvencimento" value="<%=p.getDvencimento()%>"disabled="disabled" >
                                                            </div>
                                                            <%  
                                                                //Query buscando categoria
                                                                ResultSet resultset=null;
                                                                try{
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection con=null;
                                                                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/producao","root","");
                                                                    Statement statement = con.createStatement();
                                                                    resultset =statement.executeQuery("select id,nome from categoria");
                                                            %>
                                                            <div class="form-group col-md-4">
                                                                <label for="categoria">Categoria</label>
                                                                <select class="form-control" id="sel1" name="categoria">
                                                                    <%while(resultset.next()){
                                                                        if(p.getCategoria()==resultset.getInt(1)){
                                                                        %>
                                                                            <option selected value=<%= resultset.getString(1)%>><%= resultset.getString(2)%></option>
                                                                        <% 
                                                                        } else {
                                                                        %>
                                                                            <option value=<%= resultset.getString(1)%>><%= resultset.getString(2)%></option>
                                                                        <% 
                                                                        }
                                                                    }
                                                                    %>
                                                                </select>
                                                                <%
                                                                    }catch(Exception e){out.println("Entrada errada"+e);}
                                                                %>
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <label for="unidade">Unidade:</label>
                                                                <select class="form-control" id="sel1" name="unidade">
                                                                    <option value="<%=p.getUnidade()%>"disabled="disabled"><%=p.getUnidade()%></option>
                                                                    <option>Caixa</option>
                                                                    <option>Lt</option>
                                                                    <option>m</option>
                                                                </select>
                                                            </div>
                                                        </div>	
                                                        <div class="form-group col-md-12">
                                                            <div class="col-md-4">
                                                                <button id="cancelar" type="button" name="cancela" class="btn btn-default" onclick="voltar()">Cancelar</button>
                                                                <button id="delete" name="delete" class="btn btn-danger">Deletar</button>
                                                            </div>
                                                        </div>    
                                                    </form>
						</div>
					</div> <!-- /#list -->
				</div>
			</div>
			<!-- /.row -->
		<!-- /#wrapper -->
		</div>
		<!-- /#wrapper -->
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

	</body>
    
</html>
