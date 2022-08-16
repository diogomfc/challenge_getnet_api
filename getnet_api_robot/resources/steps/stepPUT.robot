*** Settings ***
Documentation       Guia para os testes de PUT Users

Resource            ${EXECDIR}/resources/base.robot


*** Keywords ***
Validate status code 200
    Integer    response status    200
    Output    response status
    Output    $

Dado o endereço da API
    Start Session

Quando realizar uma requisição alterando o cadastro do usuário para name: ${name} , Job: ${job}
    REST.PUT    ${ENDPOINT_UPDATE}    {"name": "${name}", "job": "${job}"}

Então a API irá retornar os dados alterados respondendo o código 200
    Validate status code 200

