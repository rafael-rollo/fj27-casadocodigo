package br.com.casadocodigo.loja.controllers;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.controllers.forms.ProductForm;
import br.com.casadocodigo.loja.daos.ProductDao;
import br.com.casadocodigo.loja.infra.FileSaver;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;
import br.com.casadocodigo.loja.validators.ProductFormValidator;

@Controller
@RequestMapping("/products")
public class ProductsController {

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private FileSaver fileSaver;

	@InitBinder("productForm")
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new ProductFormValidator());
	}
	
	@GetMapping(value = "/form")
	public ModelAndView form(ProductForm productForm) {
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types", BookType.values());
		return modelAndView;
	}

	@Transactional
	@CacheEvict(value = "lastProducts", allEntries = true)
	@PostMapping
	public ModelAndView save(@Valid ProductForm productForm, BindingResult result,
			RedirectAttributes attributes) {		
		
		if (result.hasErrors()) {
			return form(productForm);
		}
		
		String summaryPath = fileSaver.write("uploaded-summaries", productForm.getSummary());
		
		Product product = productForm.getProduct();
		product.setSummaryPath(summaryPath);
		
		productDao.save(product);
		attributes.addFlashAttribute("newProduct", product.getTitle());
		return new ModelAndView("redirect:/products");
	}

	@Cacheable("lastProducts")
	@GetMapping
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products", productDao.list());
		return modelAndView;
	}
	
	@GetMapping(value = "/{id}")
	public ModelAndView show(@PathVariable Integer id) {
		
		ModelAndView modelAndView = new ModelAndView("products/show");
		modelAndView.addObject("product", productDao.find(id));
		return modelAndView;
	}
}
