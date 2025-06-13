*** Settings ***
Documentation    A resousce file is used for reusedable keywords and variables



*** Keywords ***
wait until Element is located in the page
    [Arguments]        ${element}
    Wait Until Element Is Visible    ${element}


Verify card title in the shop page 
   @{listelements} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
   @{LIST} =    Get WebElements    css:.card-title
   @{actuallist} =    Create List
   FOR    ${element}    IN    @{LIST}
       Log    ${element.text}
       Append To List       ${actuallist}    ${element.text}   
   END

   Lists Should Be Equal        ${actuallist}    ${listelements}
