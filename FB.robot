*** Settings ***
Library    SeleniumLibrary 
Library    XML
Library    String



*** Test Cases ***
Facebook register 
    Open Browser    http://www.facebook.com/r.php    Chrome 
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    
    # Wait for 2 seconds to let the page load
    Sleep    2

    # Maximize the browser window for better visibility
    Maximize Browser Window

    # Close the popup if it appears (xpath used to target the element)
    Click Element    xpath:/html/body/div[3]/div[2]/div/div/div/div/div[3]/div[2]/div/div[2]/div[1]/div

    # Verify that the page contains the text "Create a new account"
    Page Should Contain    Create a new account

    Click Element    name:firstname
    Input Text    name:firstname    Donalnd 

    Sleep    1

    Click Element    name:lastname
    Input Text    name:lastname    Duck

    Sleep    1s

    Click Element    name:reg_email__
    Input Text    name:reg_email__    d.d@d.com

    Click Element    name:reg_passwd__
    Input Text    name:reg_passwd__    verySecretPasswd


    Click Element    id:month
    Select From List By Label    id:month    Jun

    Click Element    id:day
    Select From List By Label    id:day    16

    Click Element    id:year
    Select From List By Label    id:year    1933

    Select Radio Button    sex    2


    Set Screenshot Directory   C:\\Users\\zeina\\OneDrive\\Desktop\\ohjelmistotestaus\\P23 
    Capture Page Screenshot    screenshot.png

    Close Browser