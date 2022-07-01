*** Settings ***
Documentation    Suite description
Library           Selenium2Library
Library           Collections
Test Teardown     close browser session
Resource          resource.robot

*** Test Cases ***
Login To eBay HomePage
    Fill the login form     ${Validusername}       ${Valid_password}
    wait Until Element is located in page           ${shop_page_load}
    Verify the Cart title on shop page

*** Keywords ***
Login EbayHome
     create_webdriver  ${browser}    executable_path=C:\\Users\\LakshmiYadav\\Downloads\\updatedDriver\\geckodriver.exe
       go to              ${url}


Register on ebay
         [arguments]     ${user_name}   ${password1}

           click element     xpath ://span[@id='gh-ug']//a[contains(text(),'Sign in')]
           input text        xpath:  //input[@id='firstname']        ${ebayname}
           input text        xpath: //input[@id='lastname']      ${ebaylast}
           input text         xpath ://input[@id='Email']         ${email}
           input password      xpath : //input[@id='password']     ${ebaypass}
           click button       xpath: //button[@id='EMAIL_REG_FORM_SUBMIT']