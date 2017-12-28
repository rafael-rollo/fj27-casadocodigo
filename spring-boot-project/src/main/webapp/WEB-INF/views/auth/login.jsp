<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/" var="contextPath" />
<link rel="stylesheet" href="${contextPath }resources/css/uikit.min.css" />
<link rel="stylesheet" href="${contextPath }resources/css/style.css" />
<script src="${contextPath }resources/js/uikit.min.js"></script>
<script src="${contextPath }resources/js/uikit-icons.min.js"></script>
<title>Login</title>
</head>
<body>
	<div class="uk-container uk-container-small">
		<section>
			<form:form servletRelativeAction="/login" method="post">
				<fieldset class="uk-fieldset">
		
					<legend class="uk-legend">Efetuar Login</legend>
		
					<div class="uk-margin">
						<input type='text' class="uk-input" name='username' placeholder="Login" />
					</div>
					 
					<div class="uk-margin">
						<input type='password' class="uk-input" name='password' placeholder="Senha" />
					</div>
					
					<div>
						<input class="uk-button uk-button-default" type="submit" value="Login" />
					</div>
				</fieldset>
			</form:form>
		</section>
	</div>
</body>
</html>