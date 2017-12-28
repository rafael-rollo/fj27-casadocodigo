package br.com.casadocodigo.loja.services;

import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.casadocodigo.loja.models.Role;
import br.com.casadocodigo.loja.models.User;

@Service
@Profile("dev")
public class InitialDataGenerationService {
	
	private static final Logger logger = LoggerFactory.getLogger(InitialDataGenerationService.class);
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	@PersistenceContext
	private EntityManager manager;
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void generateInitialData() {
		
		if(usersAlreadyExists()) {
			logger.info("Já existem usuários na base de dados. Não foi necessária a geração dos dados iniciais!");
			return;
		}
		
		logger.info("Criando usuários e roles padrão para testes");
		generateRoles();
		generateUsers();
	}

	private boolean usersAlreadyExists() {
		TypedQuery<Long> query = manager.createQuery("select count(u.id) from User u", Long.class);
		return query.getSingleResult() > 0 ? true : false;
	}
	
	private void generateRoles() {
		List<Role> roles = Arrays.asList( new Role("ROLE_ADMIN"), 
				new Role("ROLE_COMPRADOR"));
		roles.stream().forEach(manager::persist);
	}

	private void generateUsers() {
		User admin = new User();
		admin.setName("Administrador");
		admin.setLogin("admin@casadocodigo.com.br");
		admin.setPassword(encoder.encode("123456"));
		admin.addRole(new Role("ROLE_ADMIN"));
		
		User comprador = new User();
		comprador.setName("Comprador");
		comprador.setLogin("comprador@gmail.com");
		comprador.setPassword(encoder.encode("123456"));
		comprador.addRole(new Role("ROLE_COMPRADOR"));
		
		manager.persist(admin);
		manager.persist(comprador);
	}
}
