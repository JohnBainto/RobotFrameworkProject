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
    Product Page Should Be Open

Locked Out Login
    Open Browser To Login Page
    Input Username    ${LOCKED OUT USER}
    Input Pass        ${VALID PASSWORD}
    Submit Credentials
    Error Message Shown    Epic sadface: Sorry, this user has been locked out.

Typed Wrong Password
    Open Browser To Login Page
    Input Username    ${VALID USER}
    Input Pass        ${INVALID PASSWORD}
    Submit Credentials
    Error Message Shown    Epic sadface: Username and password do not match any user in this service

Logged In As Problem User And Sees A Broken Inventory Page
    Open Browser To Login Page
    Input Username    ${PROBLEM USER}
    Input Pass        ${VALID PASSWORD}
    Submit Credentials
    Problem Product Page Should Be Open

Sort Product Name (A to Z)
    Open Browser To Login Page
    Input Username    ${VALID USER}
    Input Pass        ${VALID PASSWORD}
    Submit Credentials
    Product Page Should Be Open
    Sort By Name A To Z

Sort Product Name (Z to A)
    Open Browser To Login Page
    Input Username    ${VALID USER}
    Input Pass        ${VALID PASSWORD}
    Submit Credentials
    Product Page Should Be Open
    Sort By Name Z To A

Sort Product Price (Low To High)
    Open Browser To Login Page
    Input Username    ${VALID USER}
    Input Pass        ${VALID PASSWORD}
    Submit Credentials
    Product Page Should Be Open
    Sort By Price Low To High

Sort Product Price (High To Low)
    Open Browser To Login Page
    Input Username    ${VALID USER}
    Input Pass        ${VALID PASSWORD}
    Submit Credentials
    Product Page Should Be Open
    Sort By Price High To Low