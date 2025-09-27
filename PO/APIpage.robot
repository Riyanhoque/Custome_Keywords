*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://rahulshettyacademy.com/loginpagePractise/
${HEADER_AUTH}    Content-Type=application/json    # Base header for JSON requests
${ITEM_ID}    ${None}                              # Variable to store ID for PUT/DELETE
${AUTH_TOKEN}    ${None}                          # Variable to store token from login

*** Keywords ***
Create Session and Login
    Create Session    api_session    ${BASE_URL}    headers=${HEADER_AUTH}
    ${LOGIN_BODY}=    Create Dictionary    username=rahulshettyacademy    password=learning
    ${resp}=    POST On Session
    ...    api_session
    ...    /login
    ...    json=${LOGIN_BODY}
    
    # Verify success and extract token
    Should Be Equal As Strings    ${resp.status_code}    200
    ${TOKEN}=    Set Variable    ${resp.json()}[token]
    Set Global Variable    ${AUTH_TOKEN}    Bearer ${TOKEN}

Setup Test Headers
    ${HEADERS}=    Create Dictionary
    ...    Content-Type=application/json
    ...    Authorization=${AUTH_TOKEN}
    [Return]    ${HEADERS}