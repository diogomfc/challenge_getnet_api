*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    RequestsLibrary

Resource    ../resources/base.resource

*** Variables ***
#Dados gerais
#Dados do teste
#Elementos da página home
#Elementos da página de registro
#Elementos página de Login
#Elementos da página do vôo
#Elementos da pagina resultados do vôo
#Página reserva do Vôo 
#Passageiro 1
#Elemento página de reserva
#Elementos página de visto
*** Keywords ***

*** Test Cases ***
Deve Excluir um registro de usuário dado id valido então retorna status 200
    iniciar sessão
