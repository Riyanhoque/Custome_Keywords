*** Settings ***
Documentation    A resousce file is used for reusedable keywords and variables
Library    SeleniumLibrary
Library    Collections
Library        ./custome_library/shop.py
Library    XML
Test Setup        Open the browser url    Firefox
# Test Teardown        Close Browser
Resource        resource.robot
Resource        ./PO/LandingPage.robot
Resource        ./PO/ShopPage.robot
Resource        ./PO/CheckoutPage.robot
Resource        ./PO/ConfermationPage.robot
Resource         api.robot


*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Page}                       css:.nav-link
@{productLists}        iphone X    Nokia Edge
${country_name}        India

${VALID_USER}      api_test_user
${VALID_PASS}      api_secure_pass
${INVALID_USER}    wrong_user
${INVALID_PASS}    wrong_pass

${ITEMS_ENDPOINT}  /items
${LOGIN_ENDPOINT}  /login

${AUTH_TOKEN}      ${EMPTY}
${CREATED_ITEM_ID} ${EMPTY}

*** Test Cases ***    
Validate UnSuccesful Login
    [Tags]    Negative     
    LandingPage.Fill the Loging form    ${User_invalid_id}    ${User_invalidpass}
    ShopPage.wait until Element is located in the page        ${Error_Message_Login}
    LandingPage.verify error message is correct 

Validate Cards display in the shopping page
    LandingPage.Fill the Loging form    ${User_Valid_id}    ${User_valid_pass}
    ShopPage.wait until Element is located in the page        ${Page}
    ShopPage.Verify card title in the shop page 
    # ShopPage.Select the card        Blackberry
    add card shop list    ${productLists}
    CheckoutPage.Verify items in the checkout page and process
    ConfermationPage.Enter the contry and select it        ${country_name}


Select the from and navigate to the child window
    LandingPage.Fill the login details and login form    





