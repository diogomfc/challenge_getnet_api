*** Settings ***
Documentation     Arquivo base do projeto

Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    JSONLibrary
Library    String

Library    REST     https://reqres.in/api/
Resource   ${EXECDIR}/variables/Variables.resource

*** Keywords ***
Start Session
   create Session     GETNET_API_ROBOT    ${BASE_URL}     verify=True