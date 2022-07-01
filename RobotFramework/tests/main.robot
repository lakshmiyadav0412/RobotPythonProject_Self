*** Setting ***
Documentation    To validate the Login Form
Library        Selenium2Library
Test Teardown      Close Browser
#Resources

*** Variables ***

${Error_Message_Loggin}     css:.alert-danger
${browser}                  Firefox
${url}                      https://rahulshettyacademy.com/loginpagePractise/

*** Test Cases ***

Validate succesful Login
   Open the browser with Mortage page
   Fill the form
   wait until it checks and display error message
   verify error message is correct

*** Keywords ***

Open the browser with Mortage page

   create_webdriver  ${browser}    executable_path=C:\\Users\\LakshmiYadav\\Downloads\\updatedDriver\\geckodriver.exe
   go to              ${url}


Fill the form
    input text          id:username  lakshmiyadav
    input password      id:password  12345677
    click button        id:signInBtn

wait until it checks and display error message
      wait until element is visible   ${Error_Message_Loggin}

verify error message is correct
   ${result} =  get text       ${Error_Message_Loggin}
   Should Be Equal As Strings    ${result}            Incorrect useme/password.
   #this below line does exact same thing above line do in much optimzed way :)
   element text should be      ${Error_Message_Loggin}        Incorrect useme/password.









