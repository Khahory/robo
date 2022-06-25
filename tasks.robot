*** Settings ***
Documentation    robot que hace un login
Library          RPA.Browser.Selenium    auto_close=${False}
Library          RPA.HTTP
Library          RPA.Excel.Files
Library          RPA.PDF

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

Fill and submit the form for one person
    [Arguments]    ${sales_rep}
    Input Text                    firstname      ${sales_rep}[First Name]
    Input Text                    lastname       ${sales_rep}[Last Name]
    Select From List By Value     salestarget    ${sales_rep}[Sales Target]
    Input Text                    salesresult    ${sales_rep}[Sales]
    Click Button    Submit

Fill the form using the data from Excel file
    Open Workbook     SalesData.xlsx
    # createa var
    ${sales_reps}=    Read Worksheet As Table    header=true
    Close Workbook

    # create a cycle for lines
    FOR    ${sales_rep}    IN    @{sales_reps}
        Fill and submit the form for one person    ${sales_rep}        
    END

Collect the result                            #el path donde se guarda
    Screenshot        css:div.sales-summary    ${OUTPUT_DIR}${/}sales_sumary.png


Export table as PDF
    #puede que la informacion aun este cargando, asi que pondremos una especie de espera
    Wait Until Element Is Visible    id:sales-results

    # aqui obtenermos el html puro y lo guardamos en esta variable (despues lo convertimos en un PDF)
    ${sales_result_html}=        Get Element Attribute    id:sales-results    outerHTML
    Html To Pdf    ${sales_result_html}    ${OUTPUT_DIR}${/}sales_pdf.pdf

Logout and close
    Click Button    Log out
    Close Browser
    
    
*** Tasks ***
Open browser and Log in
    Open intranet robot
    Log in
    Download the excel file
    Fill the form using the data from Excel file
    Collect the result
    Export table as PDF
    # try catch, si algo de arriba falla, pues ejecuta...     Logout and close
    [Teardown]    Logout and close