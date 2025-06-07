*** Settings ***
Documentation    A resousce file is used for reusedable keywords and variables



*** Keywords ***
wait until Element is located in the page
    [Arguments]        ${element}
    Wait Until Element Is Visible    ${element}
