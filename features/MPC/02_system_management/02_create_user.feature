@timecop
Feature: System Management - Create User

  Background:
    Given Time now is "2017-01-01 12:00:00"
    Given the super admin has already signed up

  @javascript
  Scenario: [02-02-01]
    新增人員帳號
    Given Time now is "2017-01-02 12:00:00"
    Given the super admin has already signed in
     When the super admin clicks "系統管理" within "側邊功能"
      And clicks "人員帳號列表" within "側邊功能"
     Then the super admin should see "新增人員"
     When the super admin clicks "新增人員"
     Then the super admin should be at page - "/admin/users/creation/new"
     When the super admin fills in "信箱" with "system_manager@example.com"
      And selects "權限" with "系統管理" option
      And presses "提交"
     Then the super admin should be at page - "/admin/users"
      And should see "信箱" - "system_manager@example.com" on Users List table Row "1"
      And should see "登入次數" - "0" on Users List table Row "1"
      And should see "建立時間" - "2017-01-02 12:00:00 UTC" on User List table Row "1"
      And should see "鎖定狀態" - "解鎖" on User List table Row "1"
