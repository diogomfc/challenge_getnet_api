<h2>Desafio - Testes de API automatizado - Getnet</h2>

API utilizada: https://reqres.in/api

## Frameworks Utilizados

### 🌐 RestAssured

Tecnologias utilizadas:

- [REST Assured](https://rest-assured.io)
- [JUnit](https://junit.org/junit4)
- [Maven](https://maven.apache.org)
- [Postman](https://www.postman.com)

Estrutura das pastas:

📂 services/</br>
&nbsp; &nbsp; &nbsp;🍵Base.java (Onde está classe base)<br>
📂 services/</br>
&nbsp; &nbsp; &nbsp;🍵Service.java (Onde está classe de services)<br>
📂 suitesTets/<br>
&nbsp; &nbsp; &nbsp;🍵TestDelete.java (Onde está classe para excluir cadastro)<br>
&nbsp; &nbsp; &nbsp;🍵TestGetUser.java (Onde está classe de consultas)<br>
&nbsp; &nbsp; &nbsp;🍵TestPatchUser.java (Onde está classe de atualizar cadastros)<br>
&nbsp; &nbsp; &nbsp;🍵TestPostUser.java (Onde está classe de cadastros)<br>
&nbsp; &nbsp; &nbsp;🍵TestPutUser.java (Onde está classe de atualizar cadastros)<br>
🪶pom.xml (Arquivo do maven com as configurações e repositórios)

## ⚙️ Rodando o Projeto

```bash
# Clone este repositório
$ git clone https://github.com/diogomfc/challenge_getnet_api
# ou use a opção de download.

# Acesse a pasta do projeto
$ cd challenge_getnet_api

# Acesse a pasta do em restassured
$ cd getnet_api_restassured

# Instale as dependências e plugin no repositório maven conforme arquivo pom.xml
https://mvnrepository.com/

# Executando os testes
Para executar os testes vá até a pasta de testes desejada e execute.

```

---

### 🤖 Robot Framework

Estrutura das pastas:

- [Robot Framework](https://robotframework.org/)

---

### 🟠 Postman

<img src="postman/result-tests.png">

Adicionado na 📂 postman do projeto collection e environment.

---

## 🧪 Cobertura dos testes

<img src="docs/txtCadastro.png">
<p style='font-size: 17px'>Este endpoint é responsável por inserir uma nova simulação.</p>
<img src="docs/imgPost.png" width="700px">

<img src="docs/txtConsultar.png">
<p style='font-size: 17px'>Este endpoint é responsável por alterar uma cadastro já existente.</p>
<img src="docs/imgGET.png" width="700px">

<img src="docs/txtAlterar.png">
<p style='font-size: 17px'>Este endpoint é responsável por retorna a simulação previamente cadastrada.</p>
<img src="docs/imgPutPatch.png" width="700px">

<img src="docs/txtRemove.png">
<p style='font-size: 17px'>Este endpoint é responsável por remove um usuário previamente cadastrado pelo seu ID.</p>
<img src="docs/imgDELETE.png" width="700px">

---

<div align="center">
  <small>Diogo Silva - 2022</small>
</div>
