@timecop
Feature: System Management - Logs - Log List

  Background:
    Given Time now is "2017-01-01 12:00:00"
    Given the super admin has already signed up
    Given Time now is "2017-01-02 12:00:00"
    Given the system manager has already been created by super admin

  @javascript
  Scenario: [02_02_01_01]
    查看人員帳號列表
    Given Time now is "2017-01-03 12:00:00"
    Given the super admin has already signed in
     Then the user should be at page - "/"
     When the user clicks "系統管理" within "側邊功能"
     Then the user should see "使用記錄"
     When the user clicks "使用記錄" within "側邊功能"
     Then the user should be at page - "/admin/logs"
      And should see "使用記錄列表"
      And should see "來源物件" - "super_admin@example.com" on User List table Row "1"
      And should see "來源 IP" - "127.0.0.1" on User List table Row "1"
      And should see "目標物件" - "" on User List table Row "1"
      And should see "動作事件" - "登入" on User List table Row "1"
      And should see "建立時間" - "2017-01-03 12:00:00 UTC" on User List table Row "1"
      And should see "來源物件" - "super_admin@example.com" on User List table Row "2"
      And should see "來源 IP" - "127.0.0.1" on User List table Row "2"
      And should see "目標物件" - "system_manager@example.com" on User List table Row "2"
      And should see "動作事件" - "新增使用者" on User List table Row "2"
      And should see "建立時間" - "2017-01-02 12:00:00 UTC" on User List table Row "2"
      And should see "來源物件" - "super_admin@example.com" on User List table Row "3"
      And should see "來源 IP" - "127.0.0.1" on User List table Row "3"
      And should see "目標物件" - "" on User List table Row "3"
      And should see "動作事件" - "超級管理員註冊" on User List table Row "3"
      And should see "建立時間" - "2017-01-01 12:00:00 UTC" on User List table Row "3"
