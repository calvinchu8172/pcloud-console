@proxy @webmock
Feature: myZyxel Push Console - SSO - Login

  Scenario: [MPC_01_01_01]
    User logs in SSO, authorizes Console and logs out
    When the user goes to page - "/"
    Then the user should see "myZyxel 推播後台"
    When the user presses "登入"
     And fills in "Email" with "customer@example.com"
     And fills in "Password" with "12345678"
     And presses "Submit"
     And presses "Authorize"
    Then the user should see "Dashboard"
    When the user clicks "customer"
     And clicks "登出"
    Then the user should be at page - "/users/sign_in"
     And should see "您需要先登入後才能繼續。"

  Scenario: [MPC_01_01_02]
    User denies authorization
    When the user goes to page - "/"
    Then the user should see "myZyxel 推播後台"
    When the user presses "登入"
     And fills in "Email" with "customer@example.com"
     And fills in "Password" with "12345678"
     And presses "Submit"
     And presses "Deny"
    Then the user should see a message - "myZyxel 推播後台 無法從 Myzyxel 驗證"
     And should see a message - "擁有者或認證伺服器拒絕此需求"
