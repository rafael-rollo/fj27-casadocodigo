<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cdc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<cdc:page title="Nossos livros">
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
</cdc:page>