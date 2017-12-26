package br.com.casadocodigo.loja.daos;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;

@Repository
public class ProductDao {

	@PersistenceContext
	private EntityManager manager;

	public void save(Product product) {
		manager.persist(product);
	}

	public List<Product> list() {
		String query = "select distinct p from Product p join fetch p.prices";
		return manager.createQuery(query, Product.class).getResultList();
	}

	public Product find(Integer id) {
		String jpql = "select distinct(p) from Product p join fetch p.prices where p.id = :id";
		return manager
				.createQuery(jpql, Product.class)
				.setParameter("id", id).getSingleResult();
	}

	public BigDecimal sumPricesPerType(BookType bookType) {
		String jpql = "select sum(price.value) from Product p join p.prices price"
				+ " where price.bookType = :bookType";
		return manager
				.createQuery(jpql, BigDecimal.class)
				.setParameter("bookType", bookType).getSingleResult();
	}
}
