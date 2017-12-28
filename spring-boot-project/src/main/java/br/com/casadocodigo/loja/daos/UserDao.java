package br.com.casadocodigo.loja.daos;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.User;

@Repository
public class UserDao implements UserDetailsService {

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		String jpql = "select u from User u where u.login = :username";
		
		try {
			return manager.createQuery(jpql, User.class)
					.setParameter("username", username)
					.getSingleResult();
			
		} catch (NoResultException e) {
			throw new UsernameNotFoundException("Usuario " + username + " não foi encontrado", e);
		}
	}

}
