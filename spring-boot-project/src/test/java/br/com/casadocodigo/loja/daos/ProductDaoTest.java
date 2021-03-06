package br.com.casadocodigo.loja.daos;

import java.math.BigDecimal;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import br.com.casadocodigo.loja.builders.ProductBuilder;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;

@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
@RunWith	(SpringRunner.class)
@ActiveProfiles("test")
public class ProductDaoTest {

	@Autowired
	private ProductDao productDao;

	@Test
	@Transactional
	public void shouldSumAllPricesOfEachBookPerType() {

		List<Product> printedBooks = ProductBuilder
				.newProduct(BookType.PRINTED, BigDecimal.TEN)
				.more(4)
				.buildAll();
		printedBooks.stream().forEach(productDao::save);

		List<Product> ebooks = ProductBuilder
				.newProduct(BookType.EBOOK, BigDecimal.TEN)
				.more(4)
				.buildAll();
		ebooks.stream().forEach(productDao::save);

		BigDecimal value = productDao.sumPricesPerType(BookType.PRINTED);
		Assert.assertEquals(new BigDecimal("50").setScale(2), value);
	}
}
