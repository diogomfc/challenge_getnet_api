*** Settings ***
Documentation       Suite de testes PATCH

Resource            ${EXECDIR}/resources/steps/stepPATCH.robot


*** Test Cases ***
Deve Atualizar o cadastro do usuário dado name e job então retorna status 200
    [Tags]    patch
    Dado o endereço da API
    Quando realizar uma requisição alterando o cadastro do usuário para name: Diogo Silva , Job: Analista QA
    Então a API irá retornar os dados alterados respondendo o código 200

