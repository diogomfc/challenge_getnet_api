package br.com.getnet.services;

import io.restassured.response.Response;
import static io.restassured.RestAssured.*;
import io.restassured.http.ContentType;

public class Base {

  public static Response responseGetRequest(String resource) {
    return given()
        .contentType(ContentType.JSON)
        .when()
        .get(resource)
        .then()
        .extract()
        .response()
        .prettyPeek();
  }

  public static Response responsePostRequest(
      String resource,
      String name,
      String job) {
    return given()
        .contentType(ContentType.JSON)
        .when()
        .body("{\"name\":\"" + name + "\",\"job\":\"" + job + "\"}")
        .post(resource)
        .then()
        .extract()
        .response()
        .prettyPeek();
  }

  public static Response responsePostRequestRegister(
      String resource,
      String email,
      String password) {
    return given()
        .contentType(ContentType.JSON)
        .when()
        .body("{\"email\":\"" + email + "\",\"password\":\"" + password + "\"}")
        .post(resource)
        .then()
        .extract()
        .response()
        .prettyPeek();
  }

  public static Response responsePostRequestRegisterUnsucceful(
      String resource,
      String email) {
    return given()
        .contentType(ContentType.JSON)
        .when()
        .body("{\"email\":\"" + email + "\"}")
        .post(resource)
        .then()
        .extract()
        .response()
        .prettyPeek();
  }

  public static Response responsePatchRequest(
      String resource,
      String name,
      String job) {
    return given()
        .contentType(ContentType.JSON)
        .when()
        .body("{\"name\":\"" + name + "\",\"job\":\"" + job + "\"}")
        .put(resource)
        .then()
        .extract()
        .response()
        .prettyPeek();
  }

  public static Response responsePutRequest(
      String resource,
      String name,
      String job) {
    return given()
        .contentType(ContentType.JSON)
        .when()
        .body("{\"name\":\"" + name + "\",\"job\":\"" + job + "\"}")
        .put(resource)
        .then()
        .extract()
        .response()
        .prettyPeek();
  }

  public static Response responseDeleteRequest(String resource) {
    return given()
        .contentType(ContentType.JSON)
        .when()
        .delete(resource)
        .then()
        .extract()
        .response()
        .prettyPeek();
  }

}
