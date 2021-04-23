*** Setting ***
*** Setting ***
Documentation                   This is some basic infor about the whole test suite
Library                         SeleniumLibrary
Library                         DateTime
Test Setup                      Open browser                      http://localhost:4200/                          Chrome
Test Teardown                   End Web Test
*** Variables ***
${URL}                          http://localhost:4200/
${BROWSER}                      Chrome
${HomePage}                     Welcome to Petclinic
${Welcome}                      /html/body/app-root/app-welcome/h1
#${OWNERS}                       /html/body/app-root/div[1]/nav/div/ul/li[2]/a
#${ADDNEW}                       /html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[2]/a
#${New_Owner_Text}               New Owner
#${First_Name}                   xpath://*[@id="firstName"]
${F_Name}                       xpath://html/body/app-root/app-owner-add/div/div/form/div[2]/div/input
${Last_Name}                    xpath://*[@id="lastName"]
${L_Name}                       xpath://*[@id="lastName"]
${Address}                      xpath://*[@id="address"]
${Owner_Address}                xpath://*[@id="address"]
${City}                         xpath://*[@id="city"]
${Owner_City}                   xpath://*[@id="city"]
${Telephone}                    xpath://*[@id="telephone"]
${Owner_Telephone}              xpath://*[@id="telephone"]
${ADD_Owner_Button}             xpath:/html/body/app-root/app-owner-add/div/div/form/div[7]/div/button[2]
${Owners}                       Owners



*** Test Cases ***
User can add a new Owner
      [Documentation]   This test adds a new owner with AddNew
      [Tags]            Add a new owner
        Given User on the Infotiv PetClinic page
        When User select the Owners with AddNew
        User enters valid Owners Details For AddNew
        Then System shows the added Owner
        End Web Test

User can add a new Owner through Ist option
      [Documentation]   This test adds a new owner with All Option
      [Tags]            Add a new owner in another tab
        Given User on the Infotiv PetClinic page
        When User select the Owners with All
        User enters valid Owners Details
        Then System shows the added Owner
        End Web Test

*** Keywords ***
Given User on the Infotiv PetClinic page
    set selenium speed                1
    Wait until Page Contains          Welcome to Petclinic

When User select the Owners with AddNew
    click element                xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a/span
    Mouse Down                   xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[2]/a/span[2]
    click element                xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[2]/a/span[2]

User On New Owner Page
    page should contain               New Owner

Then System shows the added Owner
    page should contain               ${Owners}

When User select the Owners with All
    click element                xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/a/span
    Mouse Down                   xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span
    click element                xpath://html/body/app-root/div[1]/nav/div/ul/li[2]/ul/li[1]/a/span



User On New Owner Page with all Owners Existing
    page should contain          Owners
    click button                 xpath://html/body/app-root/app-owner-list/div/div/div/div/button

User enters valid Owners Details
    User On New Owner Page with all Owners Existing
#    click element                     ${First_Name}
    input text                        ${F_Name}                  Julee
    click element                     ${Last_Name}
    input text                        ${L_Name}                  Anderson
    click element                     ${Address}
    input text                        ${Owner_Address}           Jonnaberi
    click element                     ${City}
    input text                        ${Owner_City}              Oslo
    click element                     ${Telephone}
    input text                        ${Owner_Telephone}         1234567893
    click element                     ${ADD_Owner_Button}

User enters valid Owners Details For AddNew

#    click element                     ${First_Name}
    input text                        ${F_Name}                  Julee
    click element                     ${Last_Name}
    input text                        ${L_Name}                  Anderson
    click element                     ${Address}
    input text                        ${Owner_Address}           Jonnaberi
    click element                     ${City}
    input text                        ${Owner_City}              Oslo
    click element                     ${Telephone}
    input text                        ${Owner_Telephone}         1234567893
    click element                     ${ADD_Owner_Button}



End Web Test
   Close All Browsers