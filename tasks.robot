*** Settings ***
Documentation    robot que hace un login
Library          RPA.Browser.Selenium    auto_close=${FALSE}


*** Keywords ***
Abrir pagina web
    Open Available Browser    https://robotsparebinindustries.com/#/


*** Tasks ***
Ingresal a la pagina web
    Abrir pagina web

