*** Settings ***
Documentation       Suite de testes PATCH

Resource            ${EXECDIR}/resources/steps/stepDELETE.robot


*** Test Cases ***
Deve Excluir um registro de usuário dado id valido então retorna status 204
    [Tags]    delete
    Dado o endereço da API
    Quando realizar uma requisição para excluir um cadastro de usuário com id valido
    Então a API irá retornar os dados da exclusão respondendo o código 204

