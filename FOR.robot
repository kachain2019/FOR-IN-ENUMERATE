*** Settings ***
Library  Selenium2Library
Library  BuiltIn

*** Test Cases ***
1. Open Website
    Open Browser  https://tympanus.net/Development/PageLoadingEffects/  browser=chrome
    Set Selenium speed  0.3
    Maximize browser Window

2. FOR IN ENUMERATE
    @{ITEMS}    Create List     Lazy Stretch      Circle    Spill    Frame it
    :FOR    ${INDEX}     ${ELEMENT}    IN ENUMERATE   @{ITEMS}
    \    Wait Until Page Contains Element   //div[@class="pageload-overlay"]
    \    Click Element  //a[text()="${ELEMENT}"]
    \    Log To Console  ${ELEMENT}
    \    Click Element  //a[@class="pageload-link"][text()="Show Page Loader"]
    \    Wait Until Page Contains Element   //div[@class="pageload-overlay"]
    \    Click Element  //a[@class="pageload-link"][text()="Go back"]
