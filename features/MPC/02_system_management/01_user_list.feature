Feature: System Management - User List

  Background:
    Given the super admin has already signed up
    Given the super admin has already signed in

  @javascript
  Scenario: [02-01-01]
    查看人員帳號列表
    Then the user should be at page - "/"
     And should see "myZyxel 推播後台"
     And should see "系統管理"
    When the user clicks "系統管理" within "側邊功能"
    Then the user should see "人員帳號列表"
    When the user clicks "人員帳號列表" within "側邊功能"
    Then the user should be at page - "/admin/users"
     And should see "人員帳號管理"
     And should see "信箱" - "super_admin@example.com" on User List table Row "1"
     And should see "登入次數" - "1" on User List table Row "1"
     And should see "鎖定狀態" - "解鎖" on User List table Row "1"
