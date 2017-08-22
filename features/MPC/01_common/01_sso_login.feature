@proxy @webmock
Feature: Common - SSO Login

  Scenario: [01_01_01]
    User logs in SSO, authorizes Console and logs out
    When the customer goes to page - "/"
    Then the customer should see "P.Cloud 後台"
    When the customer presses "登入"
     And fills in "Email" with "customer@example.com"
     And fills in "Password" with "12345678"
     And presses "Submit"
     And presses "Authorize"
    Then the customer should see "Dashboard"
    When the customer clicks "customer"
     And clicks "登出"
    Then the customer should be at page - "/users/sign_in"
     And should see "您需要先登入後才能繼續。"

  Scenario: [01-01-02]
    User denies authorization
    When the customer goes to page - "/"
    Then the customer should see "P.Cloud 後台"
    When the customer presses "登入"
     And fills in "Email" with "customer@example.com"
     And fills in "Password" with "12345678"
     And presses "Submit"
     And presses "Deny"
    Then the customer should see a message - "P.Cloud 後台 無法從 Myzyxel 驗證"
     And should see a message - "擁有者或認證伺服器拒絕此需求"
