package br.com.getnet.services;

import io.restassured.response.Response;

public class Services extends Base {
  // Request da api

  private static final String BASE_URL = "https://reqres.in/api/";
  public static final String ENDPOINT_LIST_USERS = "users?page=2";
  public static final String ENDPOINT_SINGLE_USER = "users/4";
  public static final String ENDPOINT_SINGLE_USER_NOT_FOUND = "users/23";
  public static final String ENDPOINT_LIST_RESOURCE = "unknown";
  public static final String ENDPOINT_SINGLE_RESOURCE = "unknown/2";
  public static final String ENDPOINT_SINGLE_RESOURCE_NOT_FOUND = "unknown/23";
  public static final String ENDPOINT_CREATE = "users";
  public static final String ENDPOINT_UPDATE = "users/2";
  public static final String ENDPOINT_DELETE = "users/2";
  public static final String ENDPOINT_DELETE_NOT_FOUND = "users/23";
  public static final String ENDPOINT_REGISTER_SUCCESSFUL = "register";
  public static final String ENDPOINT_REGISTER_UNSUCCESSFUL = "register";
  public static final String ENDPOINT_LOGIN_SUCCESSFUL = "login";
  public static final String ENDPOINT_LOGIN_UNSUCCESSFUL = "login";
  public static final String ENDPOINT_DELAYED_RESPONSE = "users?delay=3";

  // GET
  public Response getListUsers() {
    return responseGetRequest(BASE_URL + ENDPOINT_LIST_USERS);
  }

  public Response getSingleUser() {
    return responseGetRequest(BASE_URL + ENDPOINT_SINGLE_USER);
  }

  public Response getSingleUserNotFound() {
    return responseGetRequest(BASE_URL + ENDPOINT_SINGLE_USER_NOT_FOUND);
  }

  public Response getListResource() {
    return responseGetRequest(BASE_URL + ENDPOINT_LIST_RESOURCE);
  }

  public Response getSingleUserResource() {
    return responseGetRequest(BASE_URL + ENDPOINT_SINGLE_RESOURCE);
  }

  public Response getSingleUserResourceNotFound() {
    return responseGetRequest(BASE_URL + ENDPOINT_SINGLE_RESOURCE_NOT_FOUND);
  }

  public Response getUsersDelaydResponse() {
    return responseGetRequest(BASE_URL + ENDPOINT_DELAYED_RESPONSE);
  }

  // POST
  public Response postCreateUser(String name, String job) {
    return responsePostRequest(BASE_URL + ENDPOINT_CREATE, name, job);
  }

  public Response postRegisterUser(String email, String password) {
    return responsePostRequestRegister(BASE_URL + ENDPOINT_REGISTER_SUCCESSFUL, email, password);
  }

  public Response postRegisterUnsuccefulUser(String email) {
    return responsePostRequestRegisterUnsucceful(BASE_URL + ENDPOINT_LOGIN_UNSUCCESSFUL, email);
  }

  public Response postLoginUser(String email, String password) {
    return responsePostRequestRegister(BASE_URL + ENDPOINT_LOGIN_SUCCESSFUL, email, password);
  }

  public Response postLoginUnsuccefulUser(String email) {
    return responsePostRequestRegisterUnsucceful(BASE_URL + ENDPOINT_LOGIN_UNSUCCESSFUL, email);
  }

  // PUT
  public Response putUpdateUser(String name, String job) {
    return responsePatchRequest(BASE_URL + ENDPOINT_UPDATE, name, job);
  }

  // PATCH
  public Response patchUpdateUser(String name, String job) {
    return responsePatchRequest(BASE_URL + ENDPOINT_UPDATE, name, job);
  }

  // DELETE
  public Response deleteUser() {
    return responseDeleteRequest(BASE_URL + ENDPOINT_DELETE);
  }
}
