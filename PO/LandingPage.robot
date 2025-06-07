*** Settings ***
Documentation    A resousce file is used for reusedable keywords and variables



*** Keywords ***
Fill the Loging form
    [Arguments]       ${userId}       ${password}   
    Input Text        id:username    ${userId}
    Input Password    id:password    ${password}
    Click Button      signInBtn


verify error message is correct    
   Element Text Should Be        ${Error_Message_Login}        Incorrect username/password.
