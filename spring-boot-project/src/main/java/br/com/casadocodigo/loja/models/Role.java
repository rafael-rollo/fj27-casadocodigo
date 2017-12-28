package br.com.casadocodigo.loja.models;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.security.core.GrantedAuthority;

@Entity
public class Role implements GrantedAuthority {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8372548122313390206L;
	@Id
	private String name;
	
	/**
	 * @deprecated
	 */
	public Role() {
	}
	
	public Role(String name) {
		this.name = name;
		
	}
	
	@Override
	public String getAuthority() {
		return this.getName();
	}
	
	public String getName() {
		return name;
	}

}
