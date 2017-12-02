package br.com.casadocodigo.loja.validators;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.IntStream;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.casadocodigo.loja.models.Price;
import br.com.casadocodigo.loja.models.Product;

public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Product.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "field.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "field.required");

		Product product = (Product) target;

		Integer numberOfPages = product.getNumberOfPages();
		if (numberOfPages == null || numberOfPages < 30) {
			errors.rejectValue("numberOfPages", "field.required");
		}

		List<Price> prices = product.getPrices();
		IntStream.range(0, prices.size())
				.filter(i -> hasValidationError(prices.get(i)))
				.forEach(i -> errors.rejectValue("prices["+ i +"].value", 
						"field.required"));	
	}

	private boolean hasValidationError(Price price) {
		BigDecimal value = price.getValue();
		if (value == null || value.longValue() < 0) {
			return true;
		}
		return false;
	}

}
