*** Settings ***
Documentation     Guia para os testes de GET Users

Resource   ${EXECDIR}/resources/base.robot

*** Keywords ***
Validate status code 200
    Integer     response status   200
    Output      $

Validate status code 404
    Integer     response status   404
    Output      $

Dado o endereço da API
  Start Session

# Cenário: Consultar usuários
Quando realizar uma requisição para listar todos os usuários
    REST.GET    ${ENDPOINT_LIST_USERS}

Então a API irá retornar os dados correspondentes respondendo o código 200
    REST.GET    ${ENDPOINT_LIST_USERS}
    Validate status code 200


# Cenário: Consultar usuários Desconhecidos
Quando realizar uma requisição para listar os usuários desconhecidos
    REST.GET    ${ENDPOINT_LIST_RESOURCE}

Então a API irá retornar os dados dos usuários desconhecidos respondendo o código 200
    REST.GET    ${ENDPOINT_LIST_RESOURCE}
    Validate status code 200

#Deve consultar usuário dado id valido então retorna status 200
Quando realizar uma requisição passando o ID do usuário
    REST.GET    ${ENDPOINT_SINGLE_USER}
Então a API irá retornar os dados do usuário correspondente retornando o código 200
    REST.GET    ${ENDPOINT_SINGLE_USER}
    Validate status code 200

#Não deve consultar usuário dado id inválido então retorna status 404
Quando realizar uma requisição passando um ID inválido
    REST.GET    ${ENDPOINT_SINGLE_USER_NOT_FOUND}

Então a API não deve retornar os dados de usuário respondendo o código 404
    REST.GET    ${ENDPOINT_SINGLE_USER_NOT_FOUND}
    Validate status code 404
#Deve consultar usuário desconhecido dado id valido então retorna status 200
Quando realizar uma requisição passando o ID do usuário desconhecido
    REST.GET    ${ENDPOINT_SINGLE_RESOURCE}

Então a API irá retornar os dados do usuário desconhecido correspondente retornando o código 200
    REST.GET    ${ENDPOINT_SINGLE_RESOURCE}
    Validate status code 200

#Não deve consultar usuário desconhecido dado id inválido então retorna status 404
Quando realizar uma requisição passando um ID inválido do usuário desconhecido
    REST.GET    ${ENDPOINT_SINGLE_RESOURCE_NOT_FOUND}

Então a API não deve retornar dados de usuário desconhecido respondendo o código 404
    REST.GET    ${ENDPOINT_SINGLE_RESOURCE_NOT_FOUND}
    Validate status code 404

#Deve listar todos usuários com delay então retorna status 200
Quando realizar uma requisição para listar todos os usuários com delay
    REST.GET    ${ENDPOINT_DELAYED_RESPONSE}

Então a API irá retornar dados dos usuários com delay respondendo o código 200
    REST.GET    ${ENDPOINT_DELAYED_RESPONSE}
    Validate status code 200
