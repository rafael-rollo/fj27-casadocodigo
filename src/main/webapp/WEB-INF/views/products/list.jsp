<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/" var="contextPath" />
<link rel="stylesheet" href="${contextPath }resources/css/uikit.min.css" />
<script src="${contextPath }resources/js/uikit.min.js"></script>
<script src="${contextPath }resources/js/uikit-icons.min.js"></script>
<title>Livros</title>
<style type="text/css">
</style>
</head>
<body>
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
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<a class="uk-button uk-button-primary"
				href="<c:url value='/products/form'/>">Novo Livro</a>
		</section>
	</div>
</body>
</html>