<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/" var="contextPath" />
<link rel="stylesheet" href="${contextPath }resources/css/uikit.min.css" />
<link rel="stylesheet" href="${contextPath }resources/css/style.css" />
<script src="${contextPath }resources/js/uikit.min.js"></script>
<script src="${contextPath }resources/js/uikit-icons.min.js"></script>
<title>Acesso Negado!</title>
</head>
<body>
	<div class="uk-container uk-container-small">
		<section>
			<h1>Você não tem autorização para ver o conteúdo dessa página!</h1>
		</section>
	</div>
</body>
</html>