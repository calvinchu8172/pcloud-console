@timecop
Feature: System Management - Lock Unlock User

  Background:
    Given Time now is "2017-01-01 12:00:00"
    Given the super admin has already signed up
    Given the user manager has already been created by super admin

  @javascript
  Scenario: [02-04-01]
    1. 鎖定人員帳號
    2. 解鎖人員帳號
    # 1
    When the user goes to page - "/"
    Then the user should be at page - "/users/sign_in"
    When the user fills in "信箱" with "super_admin@example.com"
     And fills in "密碼" with "12345678"
     And presses "提交"
    Then the user should be at page - "/"
    When the user clicks "人員帳號管理" within "側邊功能"
    Then the user should see "人員帳號列表"
    When the user clicks "人員帳號列表" within "側邊功能"
    Then the user should be at page - "/admin/users"
    When the user clicks "檢視" link on User List table Row "1"
    Then the user should be at page - "/admin/users/2"
     And the user should see "鎖定"
    When the user clicks "鎖定"
     And accepts a confirm message - "您確定要執行？"
    Then the user should see "已成功鎖定 user_manager@example.com"
     And should see "被鎖定時間 2017-01-01 20:00:00 +0800"
    # 2
     And should see "解鎖"
    When the user clicks "解鎖"
     And accepts a confirm message - "您確定要執行？"
    Then the user should see "已成功解鎖 user_manager@example.com"
     And should not see "被鎖定時間 2017-01-01 20:00:00 +0800"
