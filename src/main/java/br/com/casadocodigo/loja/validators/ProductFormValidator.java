package br.com.casadocodigo.loja.validators;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

import br.com.casadocodigo.loja.controllers.forms.ProductForm;

public class ProductFormValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ProductForm.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ProductForm form = (ProductForm) target;
		MultipartFile summary = form.getSummary();

		if(summary == null || summary.isEmpty()) {
			errors.rejectValue("summary", "field.required.productForm.summary");
		}
		
		if(! summary.getOriginalFilename().endsWith(".pdf")) {
			errors.rejectValue("summary", "invalid.types.productForm.summary");
		}
	}

}
