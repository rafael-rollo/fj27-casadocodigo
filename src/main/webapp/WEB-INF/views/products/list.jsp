<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/" var="contextPath" />
<link rel="stylesheet" href="${contextPath }resources/css/uikit.min.css" />
<script src="${contextPath }resources/js/uikit.min.js"></script>
<script src="${contextPath }resources/js/uikit-icons.min.js"></script>

<link rel="icon" href="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/favicon.ico?11981592617154272979" type="image/ico" />
<link href="https://plus.googlecom/108540024862647200608" rel="publisher"/>
<link href="${contextPath}resources/css/cssbase-min.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'/>
<link href="${contextPath}resources/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/fontello-ie7.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/fontello-embedded.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/fontello.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/style-cdc.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/layout-colors.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/responsive-style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/guia-do-programador-style.css" rel="stylesheet" type="text/css"  media="all"  />
<link href="${contextPath}resources/css/produtos.css" rel="stylesheet" type="text/css"  media="all"  />
<link rel="canonical" href="http://www.casadocodigo.com.br/" />

<title>Livros</title>
<style type="text/css">
	.user-info {
		padding: 0.1em; 
		display: flex;
		align-items: center;
		color: #fff;
	}
	
	.user-info * {
		margin: .2em;
	}
</style>
</head>
<body>
	<header id="layout-header">
		<div class="clearfix container">
			<a href="/casadocodigo/products" id="logo"></a>
			<div id="header-content">
				<nav id="main-nav">
					<ul class="clearfix">
						<li>
							<a href="${shoppingCartUrl}" rel="nofollow">Seu carrinho (${shoppingCart.quantity})</a>
						</li>
						<li>
							<a href="/pages/sobre-a-casa-do-codigo" rel="nofollow">Sobre nós</a>
						</li>
						<li>
							<a href="/pages/perguntas-frequentes" rel="nofollow">Perguntas Frequentes</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>	
	
	<nav class="categories-nav">
		<ul class="container">
			<li class="category">
				<a href="http://www.casadocodigo.com.br">Home</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-agile">Agile</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-front-end">Front End</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-games">Games</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-java">Java</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-mobile">Mobile</a>
			</li>
			<li class="category">
				<a href="/collections/livros-desenvolvimento-web">Web</a>
			</li>
			<li class="category">
				<a href="/collections/outros">Outros</a>
			</li>	
			
			<security:authorize access="isAuthenticated()">
				<security:authentication property="principal" var="user"/>
				<c:url var="logoutUrl" value="/logout" />
				<li class="uk-align-right user-info">
					<span>Olá, ${user.name }</span>
					<span uk-icon="icon: user"></span>
					<span uk-icon="icon: triangle-down"></span>
					<div uk-dropdown="mode: click">
					    <ul class="uk-nav uk-dropdown-nav">
					        <li class="uk-active">
					        		<a href="${logoutUrl }">Sair</a>
					        	</li>
					    </ul>
					</div>
				</li>
			</security:authorize>
		</ul>
	</nav>
	<div class="uk-container">
		<header>
			<h1>Todos os Livros</h1>
		</header>
		<section>
			<c:if test="${newProduct != null }">
				<div class="uk-alert-success" uk-alert>
					<a class="uk-alert-close" uk-close></a>
					<p>O título <strong>${newProduct }</strong> foi adicionado com sucesso!</p>
				</div>
			</c:if>
			<c:if test="${successfulPayment != null }">
				<div class="uk-alert-success" uk-alert>
					<a class="uk-alert-close" uk-close></a>
					<p>${successfulPayment }</p>
				</div>
			</c:if>
			<table
				class="uk-table uk-table-small uk-table-responsive uk-table-striped uk-table-hover">
				<thead>
					<tr>
						<th>Id</th>
						<th>Titulo</th>
						<th>Descrição</th>
						<th>Ebook</th>
						<th>Impresso</th>
						<th>Combo</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${products }">
						<tr>
							<td>${product.id }</td>
							<td>${product.title }</td>
							<td>${product.description }</td>
							<c:forEach var="price" items="${product.prices }">
								<td>${price.value}</td>
							</c:forEach>
							<td>
 								<c:url value="/products/${product.id}" var="linkDetalhar"/>
 								<a href="${linkDetalhar}" uk-icon="icon: search" title="Ver Detalhes"></a>
 							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		 	<security:authorize access="hasRole('ROLE_ADMIN')">
				<a class="uk-button uk-button-primary"
					href="<c:url value='/products/form'/>">Novo Livro</a>
		 	</security:authorize>
		</section>
	</div>
</body>
</html>