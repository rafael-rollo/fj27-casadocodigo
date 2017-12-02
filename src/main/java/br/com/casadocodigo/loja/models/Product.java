package br.com.casadocodigo.loja.models;

public class Product {

	private String title;
	private String description;
	private Integer numberOfPages;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getNumberOfPages() {
		return numberOfPages;
	}

	public void setNumberOfPages(Integer numberOfPages) {
		this.numberOfPages = numberOfPages;
	}

	@Override
	public String toString() {
		return "Product [title=" + title + ", description=" + description + ", numberOfPages=" + numberOfPages + "]";
	}
}
