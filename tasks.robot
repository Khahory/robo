*** Settings ***
Documentation    robot que hace un login
Library          RPA.Browser.Selenium    auto_close=${False}


*** Keywords ***
Open intranet robot
    Open Available Browser    https://robotsparebinindustries.com/#/
Log in
                      #esto es <input id='username'> le pondre 'maria'
    Input Text        username    maria
    Input Password    password    thoushallnotpass
    Submit Form

*** Tasks ***
Open browser and Log in
    Open intranet robot
    Log in

