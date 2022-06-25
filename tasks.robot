*** Settings ***
Documentation    robot que hace un login
Library          RPA.Browser.Selenium    auto_close=${False}
Library          RPA.HTTP

*** Keywords ***
Open intranet robot
    Open Available Browser    https://robotsparebinindustries.com/#/
Log in
                      #esto es <input id='username'> le pondre 'maria'
    Input Text        username    maria
    Input Password    password    thoushallnotpass
    Submit Form
    Wait Until Page Contains Element    id:sales-form


Download the excel file
    Download    https://robotsparebinindustries.com/SalesData.xlsx

File and submit the form for one person
    Input Text    firstname    Angel
    Input Text    lastname    Maria
    Select From List By Value    salestarget    70000
    Input Text    salesresult    1000


*** Tasks ***
Open browser and Log in
    Open intranet robot
    Log in
    Download the excel file
    File and submit the form for one person
