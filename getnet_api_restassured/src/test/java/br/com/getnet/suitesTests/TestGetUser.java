package br.com.getnet.suitesTests;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import io.restassured.response.Response;
import br.com.getnet.services.Services;

public class TestGetUser {
  private Services getService = new Services();

  @Test
  public void deveRetornarListaComTodosUsuariosDaPage2() {
    Response response = getService.getListUsers();
    assertEquals(200, response.getStatusCode());
    System.out.println("Consulta todos usuarios da pagina 2 realizada com sucesso!");
  }

  @Test
  public void QuandoFacoABuscaPorUmUsuarioEntaoRetornaStatus200() {
    Response response = getService.getSingleUser();
    assertEquals(200, response.getStatusCode());
    System.out.println("Consulta por um usuario realizada com sucesso!");
  }

  @Test
  public void QuandoFacoABuscaPorUmUsuarioQueNaoExisteEntaoRetornaStatus404() {
    Response response = getService.getSingleUserNotFound();
    assertEquals(404, response.getStatusCode());
    System.out.println("Consulta por um usuario que nao existe realizada com sucesso!");
  }

  @Test
  public void QuandoFacoABuscaPorUsuariosDesconhecidosEntaoRetornaStatus200() {
    Response response = getService.getListResource();
    assertEquals(200, response.getStatusCode());
    System.out.println("Consulta por usuarios Desconhecidos realizada com sucesso!");
  }

  @Test
  public void QuandoFacoABuscaPorUmUsuarioDesconhecidoEntaoRetornaStatus200() {
    Response response = getService.getSingleUserResource();
    assertEquals(200, response.getStatusCode());
    System.out.println("Consulta por um usuario Desconhecido realizada com sucesso!");
  }

  @Test
  public void QuandoFacoABuscaPorUmUsuarioDesconhecidoQueNaoExisteEntaoRetornaStatus404() {
    Response response = getService.getSingleUserResourceNotFound();
    assertEquals(404, response.getStatusCode());
    System.out.println("Consulta por um usuario Desconhecido que nao existe realizada com sucesso!");
  }

  @Test
  public void QuandoFacoABuscaPorUsuariosComDelayEntaoRetornaStatus200() {
    Response response = getService.getUsersDelaydResponse();
    assertEquals(200, response.getStatusCode());
    System.out.println("Consulta por usuarios com delay realizada com sucesso!");
  }

}
