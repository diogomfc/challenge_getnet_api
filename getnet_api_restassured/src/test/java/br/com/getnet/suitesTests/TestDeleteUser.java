package br.com.getnet.suitesTests;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import io.restassured.response.Response;
import br.com.getnet.services.Services;

public class TestDeleteUser {
  Services deleteService = new Services();

  @Test
  public void QuandoDeletoUmUsuarioEntaoRetornaStatus200() {
    Response response = deleteService.deleteUser();
    assertEquals(204, response.getStatusCode());
    System.out.println("Usuario deletado com sucesso!");
  }
}
