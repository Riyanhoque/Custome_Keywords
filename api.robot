*** Settings ***
Library    Collections
Library    SeleniumLibrary
Library    BuiltIn


*** Test Cases ***

play around with the dictionary
    &{data}=    Create Dictionary    name=rahulshetty    courese=robot    website=rahulshettyacademy.com
    Log    ${data}
    Dictionary Should Contain Key    ${data}    website
    Log    ${data}[website]