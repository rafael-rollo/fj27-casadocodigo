package br.com.casadocodigo.loja.controllers.forms;

import javax.validation.Valid;

import org.springframework.web.multipart.MultipartFile;

import br.com.casadocodigo.loja.models.Product;

public class ProductForm {

	@Valid
	private Product product;
	private MultipartFile summary;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public MultipartFile getSummary() {
		return summary;
	}

	public void setSummary(MultipartFile summary) {
		this.summary = summary;
	}

}
