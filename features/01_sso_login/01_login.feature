@javascript @proxy @webmock
Feature: 01_01: SSO Login

  Scenario: 01_01_01
    User logs in SSO, authorizes Console and logs out

    When the user goes to page - "/"
    Then the user should see "P.Cloud 後台"
    Then the user should see "登入"
    When the user presses "登入"
     And fills in "Email" with "customer@example.com"
     And fills in "Password" with "12345678"
     And presses "Submit"
     And presses "Authorize"
    Then the user should see "Dashboard"
    When the user clicks "customer"
     And clicks "登出"
    Then the user should be at page - "/users/sign_in"
     And should see "成功登出了。"

  Scenario: 01_01_02
    User denies authorization

    When the user goes to page - "/"
    Then the user should see "P.Cloud 後台"
    Then the user should see "登入"
    When the user presses "登入"
     And fills in "Email" with "customer@example.com"
     And fills in "Password" with "12345678"
     And presses "Submit"
     And presses "Deny"
    Then the user should see a message - "無法從 Ecowork 驗證"
    Then the user should see a message - "擁有者或認證伺服器拒絕此需求"
    Then the user should see "P.Cloud 後台"
