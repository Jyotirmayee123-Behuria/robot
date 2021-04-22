*** Setting ***
Documentation                   This is some basic infor about the whole test suite
Library                         SeleniumLibrary
*** Variables ***
${URL}                          https://rental13.infotiv.net/
${BROWSER}                      Chrome
${LOGIN_TEXTBOX}                //*[@id="email"]
${PASSWORD_TEXTBOX}             //*[@id="password"]
${LOGIN_BUTTON}                 //*[@id="login"]
${SUCCESS_LOGIN_LEBEL}          //*[@id="welcomePhrase"]

*** Test Cases ***
User can login by supplying valid credentials
    [Tags]   USER_LOGIN
    Navigate to the home page
    Enter Email and Password
    Click Login Button
    set selenium speed        1
    Verify Login Success Message
    Close current browser

*** Keywords ***
Navigate to the home page
    Open browser                    ${URL}                          ${BROWSER}

Enter Email and Password
    Click Element                   ${LOGIN_TEXTBOX}
    Input Text                      ${LOGIN_TEXTBOX}                abcabc@gmail.com
    Click Element                   ${PASSWORD_TEXTBOX}
    Input Text                      ${PASSWORD_TEXTBOX}             abcabc

Click Login Button
    Click Element                    ${LOGIN_BUTTON}

Verify Login Success Message
    Wait Until Element Is Visible    ${SUCCESS_LOGIN_LEBEL}
    Element Should Be Visible        ${SUCCESS_LOGIN_LEBEL}

Close current browser
   Close Browser