<%@attribute name="title" required="true"%>
<%@attribute name="bodyClass" required="false"%>
<%@attribute name="extraScripts" fragment="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html class="no-js" lang="pt">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>${title}</title>
	
	<c:url value="/" var="contextPath" />
	
	<link rel="icon" href="/resources/imagens/favicon.png" type="image/png" />
	<link rel="stylesheet" href="${contextPath }resources/css/uikit.min.css" />
	<link rel="stylesheet" href="${contextPath }resources/css/style.css" />
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
	
</head>
<c:url var="shoppingCartUrl" value='/shopping' />
<body class="${bodyClass}">
	
	<header id="layout-header">
		<div class="clearfix container">
			<a href="/products" id="logo"></a>
			<div id="header-content">
				<nav id="main-nav">
					<ul class="clearfix">
						<li>
							<a href="${shoppingCartUrl }" rel="nofollow">Seu carrinho (${shoppingCart.quantity})</a>
						</li>
						<li>
							<a href="/pages/sobre-a-casa-do-codigo" rel="nofollow">Sobre n�s</a>
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
				<a href="/collections/livros-de-agile">
					<fmt:message key="navigation.category.agile" />
				</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-front-end">
					<fmt:message key="navigation.category.front" />
				</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-games">
					<fmt:message key="navigation.category.games" />
				</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-java">
					<fmt:message key="navigation.category.java" />
				</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-mobile">
					<fmt:message key="navigation.category.mobile" />
				</a>
			</li>
			<li class="category">
				<a href="/collections/livros-desenvolvimento-web">
					<fmt:message key="navigation.category.web" />
				</a>
			</li>
			<li class="category">
				<a href="/collections/outros">
					<fmt:message key="navigation.category.others" />
				</a>
			</li>	
			
			<security:authorize access="isAuthenticated()">
				<security:authentication property="principal" var="user"/>
				<c:url var="logoutUrl" value="/logout" />
				<li class="uk-align-right user-info">
					<span><spring:message code="users.welcome" arguments="${user.name }"/></span>
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

	<jsp:doBody />
	
	<footer id="layout-footer">
		<div class="clearfix container">
			<nav class="breadcrumbs" itemprop="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#"></nav>

			<div id="collections-footer">
				<!-- cdc-footer -->
				<p class="footer-title">Cole��es de Programa��o</p>
				<ul class="footer-text-links">
					<li>
						<a href="/collections/livros-de-java">Java</a>
					</li>
					<li>
						<a href="/collections/livros-desenvolvimento-web">Desenvolvimento Web</a>
					</li>
					<li>
						<a href="/collections/livros-de-mobile">Mobile</a>
					</li>
					<li>
						<a href="/collections/games">Games</a>
					</li>
					<li>
						<a href="/collections/livros-de-front-end">Front End</a>
					</li>
				</ul>
				
				<p class="footer-title">Outros Assuntos</p>
				
				<ul class="footer-text-links">
					<li>
						<a href="/collections/livros-de-agile">Agile</a>
					</li>
					<li>
						<a href="/collections/outros">e outros...</a>
					</li>
				</ul>
			</div>
			
			<div id="social-footer">
				<!-- books-footer -->
				<p class="footer-title">Links da Casa do C�digo</p>
				<ul class="footer-text-links">
					<li>
						<a href="http://livros.casadocodigo.com.br" rel="nofollow">Meus E-books</a>
					</li>
					<li>
						<a href="/pages/sobre-a-casa-do-codigo">Sobre a Casa do C�digo</a>
					</li>
					<li>
						<a href="/pages/perguntas-frequentes">Perguntas Frequentes</a>
					</li>
					<li>
						<a href="https://www.caelum.com.br">Caelum - Ensino e Inova��o</a>
					</li>
					<li>
						<a href="http://www.codecrushing.com/" rel="nofollow">Code Crushing</a>
					</li>
				</ul>
				
				<p class="footer-title"><spring:message code="footer.languages"/></p>
				
				<ul>
					<li>
						<a href="${contextPath }products?locale=pt_BR" rel="nofollow">
							<img class="flagIcon" alt="Idioma do Brasil" src="${contextPath }resources/imagens/br_icon.png"/>
						</a>						
					</li>
					<li>
						<a href="${contextPath }products?locale=en_US" rel="nofollow">
							<img class="flagIcon" alt="Idioma do Brasil" src="${contextPath }resources/imagens/us_icon.png"/>
						</a>
					</li>
				</ul>
			</div>
			
			<div id="newsletter-footer">
				<!-- social-footer -->
				<p class="footer-title">Receba as Novidades e Lan�amentos</p>
				<div id="form-newsletter">
					<form action="https://docs.google.com/spreadsheet/formResponse?formkey=dFhxZ2tDalFiclU4T2FLZVY4UXVUc2c6MQ&embedded=true&ifq"
						method="POST" id="ss-form" class="form-newsletter">
						<ul>
							<li>
								<input type="hidden" name="pageNumber" value="0">
								<input type="hidden" name="backupCache" value="">
								<input type="email" name="entry.0.single" value="" class="ss-q-short" id="entry_0" placeholder="seu@email.com">
							</li>
							<li>
								<input type="submit" name="submit" value="Quero Receber!" id="submit-newsletter">
							</li>
						</ul>
					</form>
					
					<ul>
						<li class="ie8">
							<a href="https://docs.google.com/spreadsheet/viewform?formkey=dFhxZ2tDalFiclU4T2FLZVY4UXVUc2c6MQ&ifq" rel="nofollow">Receba as Novidades e Lan�amentos</a>
						</li>
					</ul>
				</div>
				
				<ul class="footer-payments">
					<li>
						<img class="accepts-paypal" src="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/accepts_paypal.png?58522" border="0" alt="Paypal" width="130" height="80" />
					</li>
					<li>
						<img class="accepts-pagseguro" src="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/logopagseguro.png?58522" border="0" alt="PagSeguro" width="180" height="26" />
					</li>
				</ul>
			</div>
		</div>
	</footer>
	
	<jsp:invoke fragment="extraScripts" />
</body>
</html>
