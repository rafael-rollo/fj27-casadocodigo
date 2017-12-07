<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/" var="contextPath" />
<link rel="stylesheet" href="${contextPath }resources/css/uikit.min.css" />
<link rel="stylesheet" href="${contextPath }resources/css/style.css" />
<script src="${contextPath }resources/js/uikit.min.js"></script>
<script src="${contextPath }resources/js/uikit-icons.min.js"></script>
<title>Novo Livro</title>
</head>
<body>
	<div class="uk-container uk-container-small">
		<section>
			<form:form servletRelativeAction="/products" method="post" commandName="productForm" enctype="multipart/form-data">
				<fieldset class="uk-fieldset">
		
					<legend class="uk-legend">Novo Produto</legend>
		
					<div class="uk-margin">
						<form:input path="product.title" placeholder="Título" cssClass="uk-input"/>
						<form:errors path="product.title" cssClass="validation-error"/>						
					</div>
		
					<div class="uk-margin">
						<form:textarea rows="5" path="product.description" placeholder="Descrição" class="uk-textarea"/>
						<form:errors path="product.description" cssClass="validation-error"/>
					</div>
					
					<div class="uk-margin">
						<form:input path="product.numberOfPages" placeholder="Número de Páginas" cssClass="uk-input"/>
						<form:errors path="product.numberOfPages" cssClass="validation-error"/>
					</div>
					
					<c:forEach var="bookType" items="${types }" varStatus="status">
						<div class="uk-margin">
							<form:input path="product.prices[${status.index }].value" placeholder="Preço (R$) ${bookType.toString() }" cssClass="uk-input"/>
							<form:errors path="product.prices[${status.index }].value" cssClass="validation-error"/>
						</div>
						<input type="hidden" name="product.prices[${status.index }].bookType" value="${bookType }"/>
					</c:forEach>
					
					<div class="uk-margin">
						<form:input path="product.releaseDate" type="date" placeholder="Data de Lançamento" cssClass="uk-input" />
						<form:errors path="product.releaseDate" cssClass="validation-error"/>
					</div>
					
					<div class="uk-margin">
						<div class="js-upload" uk-form-custom>
							<label for="summary">Sumário do Livro: </label>
	    						<input type="file" id="summary" name="summary" multiple>
	    						<button class="uk-button uk-button-default" type="button" tabindex="-1">Selecione o arquivo</button>
			    				
			    				<br />
			    				<form:errors path="summary" cssClass="validation-error"/>
						</div>
					</div>
				
					<div>
						<input class="uk-button uk-button-default" type="submit" value="Salvar" />
					</div>
				</fieldset>
			</form:form>
		</section>
	</div>
</body>
</html>