*** Settings ***
Documentation    A online shop application, to validate the login form and shop items, checkout and confirmation page

Library    SeleniumLibrary
Library    OperatingSystem


*** Variables ***
${User_invalid_id}        rahulshe
${User_Valid_id}          rahulshettyacademy 
${User_invalidpass}       124343
${User_valid_pass}        learning
${Url}        https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser with the Mortagage payment url
    Create Webdriver    Firefox
    Go To    ${Url}
    Maximize Browser Window