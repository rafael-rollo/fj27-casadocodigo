## Projeto do curso desenvolvido com Spring Boot

> O template do projeto foi gerado a partir da ferramenta [Spring Initialzr](https://start.spring.io/)

# Rodando o projeto

Para testar na sua máquina baixe o zip ou clone o repositório em sua máquina. A partir daí você tem duas opções:

1. Importar como um Maven Project na IDE de sua preferência e rodar como uma simples Java Application; ou
1. Subir a aplicação direto pelo terminal (necessário a ferramenta cliente do Maven - mvn)
    > ``` bash
    > cd spring-boot-project/
    > 
    > mvn clean package
    > mvn spring-boot:run
    > ```

Com a aplicação no ar acesse o endpoints [http://localhost:8080/gerar/dados](http://localhost:8080/gerar/dados) para gerar os usuários de teste. Lembre-se que seguem os mesmos dados do treinamento: `admin@casadocodigo.com.br` e `comprador@gmail.com`, ambos com a senha `123456`.

Pronto! Faça os testes, insira produtos, adicione ao carrinho, feche uma compra.. mas o mais importante, analise o código e veja as diferenças entre a configuração da aplicação com o Boot e a aplicação com Spring da forma "tradicional".  

=)