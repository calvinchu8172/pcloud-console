@timecop
Feature: System Management - Users - User Detail

  Background:
    Given Time now is "2017-01-01 12:00:00"
    Given the super admin has already signed up
    Given Time now is "2017-01-02 12:00:00"
    Given the system manager has already been created by super admin

  @javascript
  Scenario: [02_01_03_01]
    查看人員帳號詳細資訊
    Given the super admin has already signed in
     When the super admin clicks "系統管理" within "側邊功能"
      And clicks "人員帳號列表" within "側邊功能"
      And clicks "檢視" link on User List table Row "1"
     Then the user should be at page - "/admin/users/2"
      And should see "信箱 system_manager@example.com"
      And should see "鎖定狀態 解鎖"
      And should see "權限 系統管理"
      And should see "登入次數 0"
      And should see "登入時間"
      And should see "登入 IP"
      And should see "上次登入時間"
      And should see "上次登入 IP"
      And should see "被新增時間 2017-01-02 12:00:00 UTC"
      And should see "新增人 super_admin@example.com"
      And should see "被鎖定時間"
     When the super admin clicks "super_admin"
      And clicks "登出"
    Given Time now is "2017-01-03 12:00:00"
    Given the system manager has already signed in
     When the system manager clicks "系統管理" within "側邊功能"
      And clicks "人員帳號列表" within "側邊功能"
      And clicks "檢視" link on User List table Row "1"
     Then the user should be at page - "/admin/users/2"
      And should see "信箱 system_manager@example.com"
      And should see "鎖定狀態 解鎖"
      And should see "權限 系統管理"
      And should see "登入次數 1"
      And should see "登入時間 2017-01-03 12:00:00"
      And should see "登入 IP"
      And should see "上次登入時間 2017-01-03 12:00:00"
      And should see "上次登入 IP"
      And should see "被新增時間 2017-01-02 12:00:00 UTC"
      And should see "新增人 super_admin@example.com"
      And should see "被鎖定時間"
