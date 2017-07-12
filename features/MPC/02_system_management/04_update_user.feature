Feature: System Management - Update User

  Background:
    Given the super admin has already signed up
    Given the system manager has already been created by super admin

  @javascript
  Scenario: [02-04-01]
    編輯人員帳號
    Given the super admin has already signed in
     When the super admin clicks "系統管理" within "側邊功能"
      And clicks "人員帳號列表" within "側邊功能"
      And clicks "檢視" link on User List table Row "1"
     Then the super admin should be at page - "/admin/users/2"
      And should see "編輯"
     When the super admin clicks "編輯"
     Then the super admin should be at page - "/admin/users/2/edit"
      And should see "信箱 system_manager@example.com"
     When the super admin selects "權限" with "推播管理" option
      And presses "提交"
     Then the super admin should be at page - "/admin/users/2"
      And should see "權限 系統管理 推播管理"
