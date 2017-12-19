package br.com.casadocodigo.loja.controllers;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.daos.ProductDao;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.PaymentData;
import br.com.casadocodigo.loja.models.Product;
import br.com.casadocodigo.loja.models.ShoppingCart;
import br.com.casadocodigo.loja.models.ShoppingItem;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {

	@Autowired
	private ProductDao productDao;

	@Autowired
	private ShoppingCart cart;

	@Autowired
	private RestTemplate restTemplate;

	@RequestMapping(method = RequestMethod.POST)
	public String add(Integer productId, BookType bookType) {

		ShoppingItem item = createItem(productId, bookType);
		cart.add(item);
		return "redirect:/products";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String items() {
		return "shoppingCart/items";
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public String checkout(RedirectAttributes attributes) {
		BigDecimal total = cart.getTotal();
		String uri = "http://book-payment.herokuapp.com/payment";

		try {
			String response = restTemplate.postForObject(uri, new PaymentData(total), String.class);
			System.out.println(response);

			cart.clear();
			
			attributes.addFlashAttribute("successfulPayment", "Pagamento efetuado com sucesso");
			return "redirect:/products";

		} catch (HttpClientErrorException e) {
			System.out.println("Ocorreu um erro ao criar o Pagamento: " + e.getMessage());
			attributes.addFlashAttribute("unsuccessfulPayment", "Não foi possível gerar o pagamento!");
			return "redirect:/shopping";
		}
	}

	private ShoppingItem createItem(Integer productId, BookType bookType) {
		Product product = productDao.find(productId);
		ShoppingItem item = new ShoppingItem(product, bookType);
		return item;
	}

}
