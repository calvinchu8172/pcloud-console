@timecop
Feature: System Management - Users - Lock Unlock User

  Background:
    Given Time now is "2017-01-01 12:00:00"
    Given the super admin has already signed up
    Given Time now is "2017-01-02 12:00:00"
    Given the system manager has already been created by super admin

  @proxy @webmock
  Scenario: [02_01_05_01]
    1. 鎖定人員帳號
    2. 解鎖人員帳號
    # 1. 鎖定人員帳號
    Given the super admin has already signed in
     When the super admin clicks "系統管理" within "側邊功能"
      And clicks "人員帳號列表" within "側邊功能"
      And clicks "檢視" link on User List table Row "1"
     Then the super admin should be at page - "/admin/users/2"
      And should see "鎖定"
     When the super admin clicks "鎖定"
      And accepts a confirm message - "您確定要執行？"
     Then the super admin should see "已成功鎖定 system_manager@example.com"
      And should see "被鎖定時間 2017-01-02 12:00:00 UTC"
     When the super admin clicks "super_admin"
      And clicks "登出"
     When the system manager presses "登入"
      And fills in "Email" with "system_manager@example.com"
      And fills in "Password" with "12345678"
      And presses "Submit"
      And presses "Authorize"
     Then the system manager should see "帳號已被鎖定或停用，請逕洽管理員協助處理。"
    # 2. 解鎖人員帳號
    Given the super admin has already signed in
     When the super admin clicks "系統管理" within "側邊功能"
      And clicks "人員帳號列表" within "側邊功能"
      And clicks "檢視" link on User List table Row "1"
     Then the super admin should be at page - "/admin/users/2"
      And should see "解鎖"
     When the super admin clicks "解鎖"
      And accepts a confirm message - "您確定要執行？"
     Then the super admin should see "已成功解鎖 system_manager@example.com"
      And should not see "被鎖定時間 2017-01-02 12:00:00 UTC"
     When the super admin clicks "super_admin"
      And clicks "登出"
     When the system manager presses "登入"
      And fills in "Email" with "system_manager@example.com"
      And fills in "Password" with "12345678"
      And presses "Submit"
     Then the system manager should see "Dashboard"
