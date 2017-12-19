package br.com.casadocodigo.loja.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import br.com.casadocodigo.loja.exception.PaymentProcessException;
import br.com.casadocodigo.loja.models.PaymentData;

@Service
public class PaymentProcessorService {

	@Autowired
	private RestTemplate restTemplate;
	
	private static final String PAYMENT_URI = "http://book-payment.herokuapp.com/payment";
	private static final Logger logger = LoggerFactory.getLogger(PaymentProcessorService.class);
	
	public void execute(PaymentData paymentData) throws PaymentProcessException {
		
		String response = null;
		try {
			response = restTemplate.postForObject(PAYMENT_URI, paymentData, String.class);
			logger.info(response);

		} catch (HttpClientErrorException e) {
			logger.error(response);
			throw new PaymentProcessException("Não foi possível gerar pagamento: " + response, e);
		}
	}
}
