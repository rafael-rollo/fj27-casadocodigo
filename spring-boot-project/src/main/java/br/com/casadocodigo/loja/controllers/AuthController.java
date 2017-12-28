package br.com.casadocodigo.loja.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

	@GetMapping("/login")
	public String loginPage() {
		return "auth/login";
	}
}
