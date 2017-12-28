package br.com.casadocodigo.loja.controllers;

import java.math.BigDecimal;
import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.daos.ProductDao;
import br.com.casadocodigo.loja.exception.PaymentProcessException;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.PaymentData;
import br.com.casadocodigo.loja.models.Product;
import br.com.casadocodigo.loja.models.ShoppingCart;
import br.com.casadocodigo.loja.models.ShoppingItem;
import br.com.casadocodigo.loja.services.PaymentProcessorService;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {

	@Autowired
	private ProductDao productDao;

	@Autowired
	private ShoppingCart cart;
	
	@Autowired
	private PaymentProcessorService paymentProcessorService;

	@PostMapping
	public String add(Integer productId, BookType bookType) {

		ShoppingItem item = createItem(productId, bookType);
		cart.add(item);
		return "redirect:/products";
	}

	@GetMapping
	public String items() {
		return "shoppingCart/items";
	}

	@PostMapping(value = "/checkout")
	public Callable<String> checkout(RedirectAttributes attributes) {
		return () -> {
			BigDecimal total = cart.getTotal();
	
			try {
				paymentProcessorService.execute(new PaymentData(total));
				cart.clear();
				
				attributes.addFlashAttribute("successfulPayment", "Pagamento efetuado com sucesso");
				return "redirect:/products";
	
			} catch (PaymentProcessException e) {
				attributes.addFlashAttribute("unsuccessfulPayment", "Não foi possível gerar o pagamento!");
				return "redirect:/shopping";
			}
		};
	}

	private ShoppingItem createItem(Integer productId, BookType bookType) {
		Product product = productDao.find(productId);
		ShoppingItem item = new ShoppingItem(product, bookType);
		return item;
	}

}
