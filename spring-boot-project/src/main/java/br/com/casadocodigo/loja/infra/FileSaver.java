package br.com.casadocodigo.loja.infra;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {

	private static final String SEPARATOR = System.getProperty("file.separator");
	private static final String BASEFOLDER = System.getProperty("user.home") 
			+ SEPARATOR + "casadocodigo" + SEPARATOR;
	
	public String write(String folder, MultipartFile file) {
		
		String path = BASEFOLDER + folder + SEPARATOR;
		String filePath = path + file.getOriginalFilename();
		
		try {
			file.transferTo(new File(filePath));
			return filePath;
		} catch (IOException e) {
			throw new RuntimeException("Não foi possível salvar arquivo", e);
		}
	}

	
}
