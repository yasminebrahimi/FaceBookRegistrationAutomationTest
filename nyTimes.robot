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





*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}     http://jimms.fi

*** Test Cases ***
TC_06_Verify_Add_To_Cart_Link
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Sleep    1


    Input Text    id:searchinput    ps5  
    #Click Button    css=.material-icon.ms-0
    Press Keys    id:searchinput    RETURN
    
    Sleep    2
    
    #tuotesivulle 
    Click Element    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div/img


    Sleep    5

   
    Wait Until Page Contains Element    xpath=//button[/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[3]/div[2]/addto-cart-wrapper/div/a]  

    
    Page Should Contain Element    xpath=//button[/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[3]/div[2]/addto-cart-wrapper/div/a]

    Close Browser 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


