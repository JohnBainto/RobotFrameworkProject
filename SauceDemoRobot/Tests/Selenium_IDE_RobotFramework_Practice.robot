*** Settings ***
Documentation   A test suite with a single test for valid login
...
...              This test follows the example using keywords from
...              the SeleniumLibrary
Resource         resources.robot
Test Teardown    Close Browser

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    ${VALID USER}
    Input Pass        ${VALID PASSWORD}
    Submit Credentials
    # should be open in products page
    Product Page Should Be Open

Locked Out Login
    Open Browser To Login Page
    Input Username    ${LOCKED OUT USER}
    Input Pass        ${VALID PASSWORD}
    Submit Credentials
    Error Message Shown    Epic sadface: Sorry, this user has been locked out.

Typed Wrong Password
    Open Browser To Login Page
    Input Username    ${LOCKED OUT USER}
    Input Pass        invalid
    Submit Credentials
    Error Message Shown    Epic sadface: Username and password do not match any user in this service