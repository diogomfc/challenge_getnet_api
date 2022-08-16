*** Settings ***
Documentation       Guia para os testes de POST Users

Resource            ${EXECDIR}/resources/base.robot


*** Keywords ***
Validate status code 200
    Integer    response status    200
    output    response status

Validate status code 201
    Integer    response status    201
    output    response status

Validate status code 400
    Integer    response status    400
    output    response status
    Output    $

## Quando cadastro um novo usuário dado name e job então retorna status 201

Dado o endereço da API
    Start Session

Quando realizar uma requisição para cadastrar um usuário
    REST.POST    ${ENDPOINT_CREATE}    ${GET_NEW_USER_JSON}

Então a API irá retornar os dados do cadastro respondendo o código 201
    Validate status code 201
    [Teardown]    Output    response body    ${OUTPUTDIR}/new_user.json

## Quando registro um usuário dado e-mail e password então retorna status 200

Quando realizar uma requisição para registrar um usuário com e-mail e password validos
    REST.POST    ${ENDPOINT_REGISTER_SUCCESSFUL}    ${GET_REGISTER_USER_JSON}

Então a API irá retornar id e token do registro respondendo o código 200
    Validate status code 200
    [Teardown]    Output    response body    ${OUTPUTDIR}/new_register_user.json

## Quando efetuo login dado email e password validos então retorna status 200

Quando realizar uma requisição para efetuar o login com e-mail e password validos
    REST.POST    ${ENDPOINT_LOGIN_SUCCESSFUL}    ${GET_LOGIN_USER_JSON}

Então a API irá retornar o token do login respondendo o código 200
    Validate status code 200
    [Teardown]    Output    response body    ${OUTPUTDIR}/new_login_user.json

## Não deve registrar um novo usuário dado password vazio então retorna status 400

Quando realizar uma requisição para rgistrar um usuário com password vazio
    REST.POST    ${ENDPOINT_REGISTER_SUCCESSFUL}    ${GET_LOGIN_USER_JSON.replace("password", "")}

Quando realizar uma requisição para efetuar o login com password vazio
    REST.POST    ${ENDPOINT_LOGIN_UNSUCCESSFUL}    ${GET_LOGIN_USER_JSON.replace("password", "")}

Então a API irá retornar error respondendo o código 400
    Validate status code 400
