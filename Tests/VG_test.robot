*** Setting ***
Documentation                   This is some basic infor about the whole test suite
Library                         SeleniumLibrary
Library                         Collections
Test Teardown                   End Web Test
*** Variables ***
${URL}                          https://rental13.infotiv.net/
${BROWSER}                      Chrome
${LOGIN_TEXTBOX}                //*[@id="email"]
${PASSWORD_TEXTBOX}             //*[@id="password"]
${LOGIN_BUTTON}                 //*[@id="login"]
${SUCCESS_LOGIN_LEBEL}          //*[@id="welcomePhrase"]
${MYPAGE_BOOING_HISTORY_TEXT}   //*[@id="historyText"]
${BOOKING_START_PAGE_LEBEL}     //*[@id="questionText"]
${StartDate_TEXTBOX}            //*[@id="start"]
${EndDate_TEXTBOX}              //*[@id="end"]
${Continue_BUTTON}              //*[@id="continue"]
${show_Cars}                    //*[@id="questionText"]
#${Make_BUTTON}                  //*[@id="ms-list-1"]/button
#${List_Cars}                    //*[@id="ms-opt-1"]
#${Passengers_BUTTON}            //*[@id="ms-list-2"]/button
#${List_Passengers}              //*[@id="ms-opt-5"]
#${Book_BUTTON}                 //*[@id="carSelect1"]
${Click_BUTTON}                 //*[@id="bookVivaropass9"]
${Confirm_booking}              //*[@id="questionText"]
${Booking_Page_Middlepane}      //*[@id="middlepane"]
${Card_Details}                 //*[@id="cardNum"]
${CardHolder_Name}              //*[@id="fullName"]
${cvc_Number}                   //*[@id="cvc"]
${Booking_confirmed}            //*[@id="questionTextSmall"]
${Card_Detail_Confirm_Button}   //*[@id="confirm"]


*** Test Cases ***
Valid user can book car
        [Documentation]                 This test is to verfiy end to end functionality for car booking
        [Tags]                          Smoke Test Car Booking Complete
        Given Valid User on the confirmBooking page
        When User enter valid card details
        And User click on the confirm button
        Then System shows the car booking is confirmed

*** Keywords ***
Valid User on the confirmBooking page
    Open browser                      ${URL}                          ${BROWSER}
    User supply valid email and password
    User press the login button
    User should get authenticated and can see booking start page
    User supply valid Date
    User click on the continue button
    User selects the Make and Number Of Passengers To Book Car
    #User select cars and passengers
    #User click on the Book button
    User on the confirmBooking page

User enter valid card details
    click element                      ${Card_Details}
    input text                         ${Card_Details}              6666666666666666
    click element                      ${CardHolder_Name}
    input text                         ${CardHolder_Name}           Jyotirmayee
    click element                      ${cvc_Number}
    input text                         ${cvc_Number}                897

User click on the confirm button
     click element                     ${Booking_Page_Middlepane}
     Wait Until Element Is Visible     ${Card_Detail_Confirm_Button}
     click element                     ${Card_Detail_Confirm_Button}

System shows the car booking is confirmed
     Wait Until Element Is Visible   ${Booking_confirmed}
     Element Should Be Visible       ${Booking_confirmed}

User supply valid email and password
    Click Element                   ${LOGIN_TEXTBOX}
    Input Text                      ${LOGIN_TEXTBOX}                abcabc@gmail.com
    Click Element                   ${PASSWORD_TEXTBOX}
    Input Text                      ${PASSWORD_TEXTBOX}             abcabc

User press the login button
   Click Element                    ${LOGIN_BUTTON}

User should get authenticated and can see booking start page
    Wait Until Element Is Visible    ${SUCCESS_LOGIN_LEBEL}
    Element Should Be Visible        ${SUCCESS_LOGIN_LEBEL}
    Element Should Be Visible        ${BOOKING_START_PAGE_LEBEL}

User supply valid Date
     click element                   ${StartDate_TEXTBOX}
     Input Text                      ${StartDate_TEXTBOX}             0326
     click element                   ${EndDate_TEXTBOX}
     Input Text                      ${EndDate_TEXTBOX}               0328

User click on the continue button
     click element                   ${Continue_BUTTON}

User on the showCars Page
     Wait Until Element Is Visible   ${show_Cars}

Authenticated User on the showCars Page
    Open browser
    ${URL}                          ${BROWSER}
    User supply valid email and password
    User press the login button
    User should get authenticated and can see booking start page
    User supply valid Date
    User click on the continue button

User selects the Make and Number Of Passengers To Book Car
      Wait Until Element Is Visible  ${Click_BUTTON}
      Click button                   ${Click_BUTTON}

#User select cars and passengers
      #click element                   ${Make_BUTTON}
      #select checkbox                 ${List_Cars}
      #click element                   ${Passengers_BUTTON}
      #select checkbox                 ${List_Passengers}
      #Sleep                           1
      #click element                   ${Booking_Page_Middlepane}

#User click on the Book button

     #Wait Until Element Is Visible    ${Book_BUTTON}
     #click element                    ${Book_BUTTON}

User on the confirmBooking page
      Wait Until Element Is Visible   ${Confirm_booking}
      Element Should Be Visible       ${Confirm_booking}

End Web Test
   Close All Browsers