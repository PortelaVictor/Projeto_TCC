<%-- 
    Document   : deleteform
    Created on : 24/09/2017, 18:20:01
    Author     : porte
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="com.javatpoint.dao.ClienteDao,com.javatpoint.bean.Clientejuridico"%>
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
        <title>Deletar Usuário</title>
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
					<h1 class="page-header"> Deletar Cliente</h1>
				</div>
				<!-- /.col-lg-12 -->
				<div class="col-lg-12">
					<div id="list" class="row">
						<div class="table-responsive col-md-12">
							<%
                                                            String id=request.getParameter("id");
                                                            Clientejuridico cj=ClienteDao.getRecordById(Integer.parseInt(id));
							%>     
							<form action="deletecliente.jsp" method="post">
                                                            <div class="col-md-12">
                                                                <input type="hidden" name="id" value="<%=cj.getId()%>"/>
                                                                <div class="row">
                                                                    <div class="form-group col-md-6">
                                                                        <label for="nome"> Nome:</label>
                                                                        <input type="text" class="form-control" name="nome" value="<%=cj.getNome()%>" disabled="disabled">
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <label for="cpfcnpj">CPF:</label>
                                                                        <input type="text" class="form-control" name="cpfcnpj" value="<%=cj.getCpfcnpj()%>" disabled="disabled">
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <label for="dnascimento">Data Nascimento:</label>
                                                                        <input type="date" class="form-control" name="dnascimento" value="<%=cj.getDnascimento()%>" disabled="disabled">
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <label for="contato">Contato:</label>
                                                                        <input type="text" class="form-control" name="contato" value="<%=cj.getContato()%>" disabled="disabled">
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <label for="email">Informe e-mail:</label>
                                                                        <input type="email" class="form-control" name="email" value="<%=cj.getEmail()%>" disabled="disabled">
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="box">
                                                                        <h4 class="underline">Informações de Pessoa Júridica</h4>
                                                                    </div>

                                                                    <div class="form-group col-md-3">
                                                                        <label for="cnpj">CNPJ:</label>
                                                                        <input type="text" class="form-control" id="cnpj" name="cnpj" value="<%=cj.getCnpj()%> "disabled="disabled" >
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <label for="insce">IE:</label>
                                                                        <input type="text" class="form-control" id="insce" name="insce" value="<%=cj.getInsce()%>" disabled="disabled">
                                                                    </div>

                                                                </div>    
                                                                <div class="box">
                                                                    <h4 class="underline">Informações de Endereço</h4>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-group col-md-3">
                                                                        <label for="cep">CEP:</label>
                                                                        <input type="text" class="form-control" name="cep" value="<%=cj.getCep()%>" disabled="disabled">
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label for="endereco">Endereço:</label>
                                                                        <input type="text" class="form-control" name="endereco" value="<%=cj.getEndereco()%>" disabled="disabled">
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <label for="numero">Numero:</label>
                                                                        <input type="number" class="form-control" name="numero" value="<%=cj.getNumero()%>" disabled="disabled">
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label for="complemento">Complemento:</label>
                                                                        <input type="text" class="form-control" name="complemento" value="<%=cj.getComplemento()%>" disabled="disabled">
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <label for="estado">Estado:</label>
                                                                        <select class="form-control" id="sel1" name="estado" disabled="disabled">
                                                                            <option><%= cj.getEstado()%></option> 
                                                                            <option>Acre</option> 
                                                                            <option>Alagoas</option> 
                                                                            <option>Amazonas</option> 
                                                                            <option>Amapá</option> 
                                                                            <option>Bahia</option> 
                                                                            <option>Ceará</option> 
                                                                            <option>Distrito Federal</option> 
                                                                            <option>Espírito Santo</option> 
                                                                            <option>Goiás</option> 
                                                                            <option>Maranhão</option> 
                                                                            <option>Mato Grosso</option> 
                                                                            <option>Mato Grosso do Sul</option> 
                                                                            <option>Minas Gerais</option> 
                                                                            <option>Pará</option> 
                                                                            <option>Paraíba</option> 
                                                                            <option>Paraná</option> 
                                                                            <option>Pernambuco</option> 
                                                                            <option>Piauí</option> 
                                                                            <option>Rio de Janeiro</option> 
                                                                            <option>Rio Grande do Norte</option> 
                                                                            <option>Rondônia</option> 
                                                                            <option>Rio Grande do Sul</option> 
                                                                            <option>Roraima</option> 
                                                                            <option>Santa Catarina</option> 
                                                                            <option>Sergipe</option> 
                                                                            <option>São Paulo</option> 
                                                                            <option>Tocantins</option> 
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group col-md-3">
                                                                        <label for="cidade">Cidade:</label>
                                                                        <input type="text" class="form-control" name="cidade" value="<%=cj.getCidade()%>" disabled="disabled">
                                                                    </div>
                                                                </div>
                                                            </div>        
                                                            <div class="row">
                                                                <div class="form-group col-md-12">
									<div class="col-md-4">
										<button id="cancelar" type="button" name="cancela" class="btn btn-default" onclick="voltar()">Cancelar</button>
										<button id="delete" name="delete" class="btn btn-danger">Deletar</button>
									</div>
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
