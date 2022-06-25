*** Settings ***
Documentation    robot que hace un login
Library          RPA.Browser.Selenium    auto_close=${False}


*** Keywords ***
Open intranet robot
    Open Available Browser    https://robotsparebinindustries.com/#/


*** Tasks ***
Ingresal a la pagina web
    Open intranet robot

