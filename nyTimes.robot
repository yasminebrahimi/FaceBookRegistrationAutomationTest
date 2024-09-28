*** Settings ***
Library    SeleniumLibrary 
Library    XML
Library    String





*** Test Cases ***
Ny times
    Open Browser    https://www.nytimes.com    Chrome 
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)

    Sleep    1

    Maximize Browser Window


    #data-testid="Accept all-btn"
    Click Button    xpath://button[@data-testid='Accept all-btn']


    ${count}=    Get Element Count    xpath://html/body/div[2]/div[2]/div[1]/div[2]/header/div[4]/nav/ul/li[*]/a   
    Log To Console    ${count} 

    ${refrencePosition}=    Get Vertical Position
    ...   xpath:/html/body/div[2]/div[2]/div[1]/div[2]/header/div[4]/nav/ul/li[8]/a
    

    FOR    ${counter}    IN RANGE    2    ${count}
        Log    ${counter}
        ${testPosition}=    Get Vertical Position 
        ...    xpath:/html/body/div[2]/div[2]/div[1]/div[2]/header/div[4]/nav/ul/li[${count}]/a
        Run Keyword And Continue On Failure    Should Be Equal    ${refrencePosition}    ${testPosition}
        
        END

        Close Browser

