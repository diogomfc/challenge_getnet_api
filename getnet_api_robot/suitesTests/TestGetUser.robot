*** Settings ***
Documentation     Suite de testes GET

Resource   ${EXECDIR}/resources/steps/stepGET.robot

*** Test Cases ***

Deve listar todos usuários da página 2 então retorna status 200
    [Tags]    GET1
    Dado o endereço da API
    Quando realizar uma requisição para listar todos os usuários
    Então a API irá retornar os dados correspondentes respondendo o código 200
Deve consultar usuário dado id valido então retorna status 200
    [Tags]    GET
    Dado o endereço da API
    Quando realizar uma requisição passando o ID do usuário
    Então a API irá retornar os dados do usuário correspondente retornando o código 200

Não deve consultar usuário dado id inválido então retorna status 404
    [Tags]    GET
    Dado o endereço da API
    Quando realizar uma requisição passando um ID inválido
    Então a API não deve retornar os dados de usuário respondendo o código 404


Deve listar todos usuários desconhecidos então retorna status 200
    [Tags]    GET
    Dado o endereço da API
    Quando realizar uma requisição para listar os usuários desconhecidos
    Então a API irá retornar os dados dos usuários desconhecidos respondendo o código 200

Deve consultar usuário desconhecido dado id valido então retorna status 200
    [Tags]    GET
    Dado o endereço da API
    Quando realizar uma requisição passando o ID do usuário desconhecido
    Então a API irá retornar os dados do usuário desconhecido correspondente retornando o código 200

Não deve consultar usuário desconhecido dado id inválido então retorna status 404
    [Tags]    GET
    Dado o endereço da API
    Quando realizar uma requisição passando um ID inválido do usuário desconhecido
    Então a API não deve retornar dados de usuário desconhecido respondendo o código 404


Deve listar todos usuários com delay então retorna status 200
    [Tags]    GET
    Dado o endereço da API
    Quando realizar uma requisição para listar todos os usuários com delay
    Então a API irá retornar dados dos usuários com delay respondendo o código 200
