<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cdc" %>

<cdc:page title="${product.title }">
	<article id="${product.title}" itemscope itemtype="http://schema.org/Book">
		<header id="product-highlight" class="clearfix">
			<div id="product-overview" class="container">
				<img itemprop="image" width="280px" height="395px" src='http://cdn.shopify.com/s/files/1/0155/7645/products/cover-apis-java_large.jpeg?v=1423244220' class="product-featured-image" alt="${product.title}">
				<h1 class="product-title" itemprop="name">${product.title}</h1>
				<p class="product-author">
					<span class="product-author-link"></span>
				</p>
	
				<p itemprop="description" class="book-description">
					${product.description}<br/>
					 Veja o <a href="<c:url value='/${product.summaryPath}'/>" target="_blank">sum&#225;rio</a> completo do livro!
				</p>
			</div>
		</header>
	
		<section class="buy-options clearfix">
			<form:form servletRelativeAction="/shopping" method="post" class="container">
				<input type="hidden" value="${product.id}" name="productId"/>
				<ul id="variants" class="clearfix">
					<c:forEach items="${product.prices}" var="price">
						<li class="buy-option">
							<input type="radio" name="bookType" class="variant-radio" id="${product.id}-${price.bookType}"
								value="${price.bookType}" ${price.bookType.name() == 'COMBO' ? 'checked' : ''}>
							 
							<label class="variant-label" for="${product.id}-${price.bookType}"> 
								${price.bookType}
							</label>
							<p class="variant-price">${price.value}</p>
						</li>
					</c:forEach>
				</ul>
	
				<input type="submit" class="submit-image icon-basket-alt" alt="Compre agora" title="Compre agora '${product.title}'!" value="comprar"/>
			</form:form>
		</section>

		<div class="container">
			<section class="author product-detail" itemprop="author" itemscope itemtype="http://schema.org/Person">
				<h2 class="section-title" itemprop="name">${product.title}</h2>
				<span itemprop="description">
					<p class="book-description">${product.description}</p>
				</span>
			</section>
	
			<section class="data product-detail">
				<h2 class="section-title">Dados do livro:</h2>
				<p>
					Número de paginas: <span itemprop="numberOfPages">${product.numberOfPages}</span>
				</p>
	
				<p></p>
				<p>
					Encontrou um erro? <a href='/submissao-errata' target='_blank'>Submeta uma errata</a>
				</p>
			</section>
		</div>
	</article>
</cdc:page>