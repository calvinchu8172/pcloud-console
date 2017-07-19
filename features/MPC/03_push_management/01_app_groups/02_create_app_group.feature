Feature: Push Management - App Groups - Create App group

  Background:
    # Given Time now is "2017-01-01 12:00:00"
    Given the super admin has already signed up

  @javascript @webmock
  Scenario: [03_02_01]
    新增 App Group
    # Given Time now is "2017-01-02 12:00:00"
    Given the super admin has already signed in
     When the super admin clicks "推播管理" within "側邊功能"
      And clicks "App Group 列表" within "側邊功能"
     Then the super admin should see "新增 App Group"
     When the super admin clicks "新增 App Group"
     Then the super admin should be at page - "/admin/push/app_groups/new"
     When the super admin fills in "名稱" with "App Group 1"
     When the super admin fills in "描述" with "App Group Description 1"
      And presses "提交"
     Then the super admin should be at page - "/admin/push/app_groups/c1e7371a-7b2e-401a-8f86-480a88d2230f"
      And should see "名稱 App Group 1"
      And should see "描述 App Group Description 1"
      And should see "APP Group ID c1e7371a-7b2e-401a-8f86-480a88d2230f"
      And should see "Topic ARN arn:aws:sns:us-east-1:567710019248:c1e7371a-7b2e-401a-8f86-480a88d2230f"
      And should see "建立時間 2017-07-18T06:52:47.031Z"
      And should see "更新時間 2017-07-18T06:52:47.031Z"
