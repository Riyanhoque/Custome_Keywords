*** Settings ***
Documentation    A resousce file is used for reusedable keywords and variables


Library    SeleniumLibrary

*** Keywords ***
Verify items in the checkout page and process
    Click Element    css:.btn.btn-success
    Wait Until Page Contains Element    css:.btn.btn-success
