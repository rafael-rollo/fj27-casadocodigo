package br.com.casadocodigo.loja.exception;

public class PaymentProcessException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1605804837367303447L;

	public PaymentProcessException(String message, Exception cause) {
		super(message, cause);
	}

}
