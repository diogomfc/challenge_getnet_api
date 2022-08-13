package br.com.getnet.services;

import io.restassured.response.Response;

public class Services extends Base {
  // Request da api

  private static final String ENDPOINT = "https://reqres.in/api/";
  public static final String LIST_USERS = "users?page=2";
  public static final String SINGLE_USER = "users/4";
  public static final String SINGLE_USER_NOT_FOUND = "users/23";
  public static final String LIST_RESOURCE = "unknown";
  public static final String SINGLE_RESOURCE = "unknown/2";
  public static final String SINGLE_RESOURCE_NOT_FOUND = "unknown/23";
  public static final String CREATE = "users";
  public static final String UPDATE = "users/2";
  public static final String DELETE = "users/2";
  public static final String DELETE_NOT_FOUND = "users/23";
  public static final String REGISTER_SUCCESSFUL = "register";
  public static final String REGISTER_UNSUCCESSFUL = "register";
  public static final String LOGIN_SUCCESSFUL = "login";
  public static final String LOGIN_UNSUCCESSFUL = "login";
  public static final String DELAYED_RESPONSE = "users?delay=3";

  // GET
  public Response getListUsers() {
    return responseGetRequest(ENDPOINT + LIST_USERS);
  }

  public Response getSingleUser() {
    return responseGetRequest(ENDPOINT + SINGLE_USER);
  }

  public Response getSingleUserNotFound() {
    return responseGetRequest(ENDPOINT + SINGLE_USER_NOT_FOUND);
  }

  public Response getListResource() {
    return responseGetRequest(ENDPOINT + LIST_RESOURCE);
  }

  public Response getSingleUserResource() {
    return responseGetRequest(ENDPOINT + SINGLE_RESOURCE);
  }

  public Response getSingleUserResourceNotFound() {
    return responseGetRequest(ENDPOINT + SINGLE_RESOURCE_NOT_FOUND);
  }

  public Response getUsersDelaydResponse() {
    return responseGetRequest(ENDPOINT + DELAYED_RESPONSE);
  }

  // POST
  public Response postCreateUser(String name, String job) {
    return responsePostRequest(ENDPOINT + CREATE, name, job);
  }

  public Response postRegisterUser(String email, String password) {
    return responsePostRequestRegister(ENDPOINT + REGISTER_SUCCESSFUL, email, password);
  }

  public Response postRegisterUnsuccefulUser(String email) {
    return responsePostRequestRegisterUnsucceful(ENDPOINT + REGISTER_UNSUCCESSFUL, email);
  }

  public Response postLoginUser(String email, String password) {
    return responsePostRequestRegister(ENDPOINT + LOGIN_SUCCESSFUL, email, password);
  }

  public Response postLoginUnsuccefulUser(String email) {
    return responsePostRequestRegisterUnsucceful(ENDPOINT + LOGIN_UNSUCCESSFUL, email);
  }

  // PUT
  public Response putUpdateUser(String name, String job) {
    return responsePatchRequest(ENDPOINT + UPDATE, name, job);
  }

  // PATCH
  public Response patchUpdateUser(String name, String job) {
    return responsePatchRequest(ENDPOINT + UPDATE, name, job);
  }

  // DELETE
  public Response deleteUser() {
    return responseDeleteRequest(ENDPOINT + DELETE);
  }
}
