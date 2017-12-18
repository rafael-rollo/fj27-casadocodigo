package br.com.casadocodigo.loja.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

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
}
