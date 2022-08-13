package br.com.getnet.suitesTests;

import static org.junit.Assert.assertEquals;

import com.github.javafaker.Faker;
import org.junit.Test;

import io.restassured.response.Response;
import br.com.getnet.services.Services;

public class TestPatchUser {
  Services patchService = new Services();

  Faker faker = new Faker();
  String name = faker.name().firstName();
  String job = faker.job().title();
  Response response;

  @Test
  public void QuandoAtualizoUmUsuarioEntaoRetornaStatus200() {
    Response response = patchService.putUpdateUser(name, job);
    assertEquals(200, response.getStatusCode());
    System.out.println("Atualizacao do usuario realizada com sucesso!");
  }
}
