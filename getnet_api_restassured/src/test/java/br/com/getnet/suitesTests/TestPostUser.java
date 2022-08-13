package br.com.getnet.suitesTests;

import static org.junit.Assert.assertEquals;

import com.github.javafaker.Faker;
import org.junit.Test;

import io.restassured.response.Response;
import br.com.getnet.services.Services;

public class TestPostUser {
  Services postService = new Services();
  Faker faker = new Faker();
  String name = faker.name().firstName();
  String job = faker.job().title();
  String password = faker.internet().password();
  String emailCadastrado = "eve.holt@reqres.in";
  String passwordCadastrado = "pistol";
  Response response;

  @Test
  public void QuandoCadastroUmNovoUsuarioEntaoRetornaStatus201() {
    Response response = postService.postCreateUser(name, job);
    assertEquals(201, response.getStatusCode());
    System.out.println("Cadastro de um novo usuario realizada com sucesso!");
  }

  @Test
  public void QuandoRegistroUmNovoUsuarioEntaoRetornaStatus200() {
    Response response = postService.postRegisterUser(emailCadastrado, passwordCadastrado);
    assertEquals(200, response.getStatusCode());
    System.out.println("Resgistro do usuario realizada com sucesso!");
  }

  @Test
  public void QuandoRegistroUmNovoUsuarioSemPasswordEntaoRetornaStatus400() {
    Response response = postService.postRegisterUnsuccefulUser(emailCadastrado);
    assertEquals(400, response.getStatusCode());
    System.out.println("error: Missing password");
  }

  @Test
  public void QuandoEfetuoLoginComEmailePasswordValidosEntaoRetornaStatus200() {
    Response response = postService.postLoginUser(emailCadastrado, passwordCadastrado);
    assertEquals(200, response.getStatusCode());
    System.out.println("Login Efetuado com sucesso!");
  }

  @Test
  public void QuandoEfetuoLoginComEmailSemPasswordEntaoRetornaStatus400() {
    Response response = postService.postLoginUnsuccefulUser(emailCadastrado);
    assertEquals(400, response.getStatusCode());
    System.out.println("error: Missing password");
  }

}
