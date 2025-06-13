*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Library        ./custome_library/shop.py
Library    XML
Test Setup        open the browser with the Mortagage payment url
Test Teardown        Close Browser
Resource        resource.robot
Resource        ./PO/LandingPage.robot
Resource        ./PO/ShopPage.robot

*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Page}                       css:.nav-link
@{productLists}        Blackberry    Nokia Edge


*** Test Cases ***    
Validate UnSuccesful Login         
    LandingPage.Fill the Loging form    ${User_invalid_id}    ${User_invalidpass}
    ShopPage.wait until Element is located in the page        ${Error_Message_Login}
    LandingPage.verify error message is correct 

Validate Cards display in the shopping page
    LandingPage.Fill the Loging form    ${User_Valid_id}    ${User_valid_pass}
    ShopPage.wait until Element is located in the page        ${Page}
    ShopPage.Verify card title in the shop page 
    ShopPage.Select the card        Blackberry
    add card shop list    ${productLists}


Select the from and navigate to the child window
    LandingPage.Fill the login details and login form    





*** Keywords ***    

