@proxy @webmock
Feature: Common - Super Admin

  Scenario: [01_02_01]
    1. 第一個登入的使用者將成為超級管理員
    2. 第二個登入的使用者無任何權限
    # 1. 第一個登入的使用者將成為超級管理員
    When the customer goes to page - "/"
    Then the customer should see "P.Cloud 後台"
    When the customer presses "登入"
     And fills in "Email" with "customer@example.com"
     And fills in "Password" with "12345678"
     And presses "Submit"
     And presses "Authorize"
    Then the customer should see "Dashboard"
     And should see "超級管理員註冊成功。"
    # 2. 第二個登入的使用者無任何權限
    When the customer clicks "customer"
     And clicks "登出"
    Then the customer2 should be at page - "/users/sign_in"
    When the customer2 presses "登入"
     And fills in "Email" with "customer2@example.com"
     And fills in "Password" with "12345678"
     And presses "Submit"
     And presses "Authorize"
    Then the customer2 should see "Dashboard"
     And should see "您無任何權限。"
