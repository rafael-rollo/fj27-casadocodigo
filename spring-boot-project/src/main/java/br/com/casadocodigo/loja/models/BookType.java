package br.com.casadocodigo.loja.models;

public enum BookType {

	EBOOK {
		@Override
		public String toString() {
			return "Ebook";
		}
	},
	PRINTED {
		@Override 
		public String toString() {
			return "Impresso";
		}		
	},
	COMBO {
		@Override
		public String toString() {
			return "Combo";
		}		
	};
}
