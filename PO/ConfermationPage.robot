*** Settings ***
Documentation    A resousce file is used for reusedable keywords and variables


Library    SeleniumLibrary
Resource    ShopPage.robot


*** Variables ***
${Country_location}    //a[text()='India']


*** Keywords ***
Enter the contry and select it
    [Arguments]    ${country_name}
    Input Text    id:country    ${country_name}   
    wait until Element is located in the page  //a[text()='India']
    Click Element        //a[text()='${country_name}']
    Click Element    css:.checkbox label

