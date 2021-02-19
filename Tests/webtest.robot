*** Settings ***
Documentation   This is some basics info about the whole test suit.
Library          SeleniumLibrary

*** Test Cases ***
Users can access website
  [Documentation]   This is some basics info about the test.
  [Tags]            Test1
  Open Browser   about:blank   chrome
  Go To          https://www.Willys.se//
  Wait until Page Contains Handel billing mat online
  Close Browser



