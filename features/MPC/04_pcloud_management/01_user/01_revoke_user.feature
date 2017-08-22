@javascript @webmock
Feature: P.Cloud Management - Revoke User

  Background:
    Given the super admin has already signed up

  Scenario: [04_01_01]
    刪除 User 成功
    Given the super admin has already signed in
     Then the super admin should be at page - "/"
     When the super admin clicks "P.Cloud 管理" within "側邊功能"
     Then the super admin should see "帳號刪除"
     When the super admin clicks "帳號刪除" within "側邊功能"
     Then the super admin should be at page - "/admin/pcloud/user/revoke"
     When the super admin fills in "Email" with "user@example.com"
      And presses "提交"
     Then the super admin should see "是否確認刪除 user@example.com 帳號"
      And presses "確認"
     Then the super admin should see "請再次確認刪除 user@example.com 帳號"
      And presses "確認"
     Then the super admin should be at page - "/admin/pcloud/user/revoke"
     Then the super admin should see "刪除 user@example.com 成功"

  Scenario: [04_01_02]
    刪除 User 失敗，找不到 User
    Given the super admin has already signed in
     Then the super admin should be at page - "/"
     When the super admin clicks "P.Cloud 管理" within "側邊功能"
     Then the super admin should see "帳號刪除"
     When the super admin clicks "帳號刪除" within "側邊功能"
     Then the super admin should be at page - "/admin/pcloud/user/revoke"
     When the super admin fills in "Email" with "user1@example.com"
      And presses "提交"
     Then the super admin should see "是否確認刪除 user1@example.com 帳號"
      And presses "確認"
     Then the super admin should see "請再次確認刪除 user1@example.com 帳號"
      And presses "確認"
     Then the super admin should be at page - "/admin/pcloud/user/revoke"
     Then the super admin should see "刪除 user1@example.com 失敗 - User Not Found"