*** Settings ***
Documentation   A resource file with reusable keywords and variables
...
...              Creating system specific keywords from default keywords
...              from SeleniumLibrary
Library          SeleniumLibrary
*** Variables ***
${SERVER}                    www.saucedemo.com
${BROWSER}                   chrome
${DELAY}                     0
${VALID USER}                standard_user
${PROBLEM USER}              problem_user
${LOCKED OUT USER}           locked_out_user
${VALID PASSWORD}            secret_sauce
${INVALID PASSWORD}          invalid
${LOGIN URL}                 https://${SERVER}/
${HOME URL}                  https://${SERVER}/inventory.html
${PROBLEM PRODUCT IMAGE}     /static/media/sl-404.168b1cce.jpg

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Element    login-button

Product Page Should Be Open
    Element Text Should Be    class:title    PRODUCTS

Problem Product Page Should Be Open
    Page Should Contain Image    ${PROBLEM PRODUCT IMAGE}

Input Username
    [Arguments]    ${username}
    Input Text    user-name    ${username}

Input Pass
    [Arguments]    ${password}
    Input Password    password    ${password}

Submit Credentials
    Click Button    login-button

Sort By Name A To Z
    Select From List By Value    css=*[data-test="product_sort_container"]    az
    List Selection Should Be     css=*[data-test="product_sort_container"]    az

Sort By Name Z To A
    Select From List By Value    css=*[data-test="product_sort_container"]    za
    List Selection Should Be     css=*[data-test="product_sort_container"]    za

Sort By Price Low To High
    Select From List By Value    css=*[data-test="product_sort_container"]    lohi
    List Selection Should Be     css=*[data-test="product_sort_container"]    lohi

Sort By Price High To Low
    Select From List By Value    css=*[data-test="product_sort_container"]    hilo
    List Selection Should Be     css=*[data-test="product_sort_container"]    hilo

Error Message Shown
    [Arguments]    ${error}
    Element Text Should Be    css:*[data-test="error"]    ${error}