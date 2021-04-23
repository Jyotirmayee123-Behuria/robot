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
User can update the existing Owner
      [Documentation]   This test update the existing owner with pet
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

