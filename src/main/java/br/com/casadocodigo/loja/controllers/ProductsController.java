package br.com.casadocodigo.loja.controllers;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.daos.ProductDao;
import br.com.casadocodigo.loja.infra.FileSaver;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;

@Controller
@RequestMapping("/products")
public class ProductsController {

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private FileSaver fileSaver;

	/*@InitBinder("product")
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new ProductValidator());
	}*/
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public ModelAndView form(Product product) {
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types", BookType.values());
		return modelAndView;
	}

	@Transactional
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView save(@Valid Product product, BindingResult result,
			MultipartFile summary, RedirectAttributes attributes) {		
		if (result.hasErrors()) {
			return form(product);
		}
		
		String summaryPath = fileSaver.write("uploaded-summaries", summary);
		product.setSummaryPath(summaryPath);
		
		productDao.save(product);

		attributes.addFlashAttribute("newProduct", product.getTitle());
		return new ModelAndView("redirect:/products");
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products", productDao.list());
		return modelAndView;
	}
}
