*** Setting ***
Documentation     To validate the Login Form
Library           Selenium2Library
Library           Collections
Test Setup        Open the browser with Mortage page
#Test Teardown     close browser session
Resource          resource.robot

#Resources
*** Variables ***
${Error_Message_Loggin}   xpath://div[@class='alert alert-danger col-md-12']
${shop_page_load}         xpath://h1[@class='my-4']


*** Test Cases ***

#Validate Unsuccesful Login
#
#  Fill the login form    ${user_name}        ${invalid_password}
#   wait Until Element is located in page    ${Error_Message_Loggin}
#   verify error message is correct



Validate cards display in the Shopping Page
    Fill the login form     ${Validusername}       ${Valid_password}
    wait Until Element is located in page           ${shop_page_load}
    Verify the Cart title on shop page
    Select the cart            Blackberry




*** Keywords ***

Open the browser with Mortage page

   create_webdriver  ${browser}    executable_path=${executable_path}
   go to              ${url}


Fill the login form
  [arguments]     ${user_name}   ${password1}

    input text          id:username        ${user_name}
    input password      id:password        ${password1}
    click button        id:signInBtn

#wait until it checks and display error message
   #   wait until element is visible   ${Error_Message_Loggin}

wait Until Element is located in page
   [arguments]              ${element}
  wait until element is visible    ${element}


verify error message is correct
   ${result} =  get text       ${Error_Message_Loggin}
   Should Be Equal As Strings    ${result}            Incorrect useme/password.
   #this below line does exact same thing above line do in much optimzed way :)
   element text should be      ${Error_Message_Loggin}        Incorrect useme/password.


Verify the Cart title on shop page
     @{expectedList} =  Create List      iphone X      Samsung Note 8       Nokia Edge      Blackberry
     ${listofElements} =   get webelements     xpath: //*[@class='card-body']/h4[@class='card-title']/descendant::a
     @{actualList} =   Create List
       FOR   ${ele}  IN   @{listofElements}:

              ${text} =  get element attribute      xpath://*[@class='card-body']/h4[@class='card-title']/descendant::a    text
               Log  ${text}
               append to list    ${actualList}     ${text}


       END
       lists should be equal    ${expectedList}     ${actualList}

Select the cart

  [arguments]       ${cartname}

  ${elements} = get webelements     css: .card-title
  ${index}=   Set Variable  1

  FOR   ${element} IN  ${elements}
    Exit For Loop If  ${cartname} == ${element.text}
    ${index} = Evaluate ${index} + 1

  END
   click button    xpath:(//*[@class='card-footer'])[${index}]/button








