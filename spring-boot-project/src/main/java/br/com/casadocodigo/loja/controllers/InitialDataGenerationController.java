package br.com.casadocodigo.loja.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.casadocodigo.loja.services.InitialDataGenerationService;

@RestController
@Profile("dev")
public class InitialDataGenerationController {

	@Autowired
	private InitialDataGenerationService service;
	
	@GetMapping("/gerar/dados")
	public String generateData() {
		service.generateInitialData();
		return "Dados gerados! =)";
	}
}
