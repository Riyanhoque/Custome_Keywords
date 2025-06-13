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



Fill the login details and login form 
    Input Text        id:username     rahulshettyacademy
    Input Password    id:password    learning
    Click Element     css:input[value='user']
    Wait Until Element Is Visible        css:.modal-body   
    Click Button      id:okayBtn
    Click Button      id:okayBtn
    Wait Until Element Is Not Visible        css:.modal-body
    Select From List By Value    css:Select.form-control    teach
    Select Checkbox     terms
    Checkbox Should Be Selected        terms
    Click Button      id:signInBtn
    Wait Until Page Contains Element    css:.nav-link

