Feature: Push Management - App Groups - Update App Group

  Background:
    Given the super admin has already signed up
    Given Push Server has an App Group data as below:
    """
    {
      "app_group_id": "c1e7371a-7b2e-401a-8f86-480a88d2230f",
      "name": "APP_GROUP_NAME1",
      "description": "APP_GROUP_DESCRIPTION1",
      "topic_arn": "arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "created_at": "2017-07-14T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """

  @javascript @webmock
  Scenario: [03_03_01]
    編輯 App Group
    Given the super admin has already signed in
     When the super admin clicks "推播管理" within "側邊功能"
      And clicks "App Group 列表" within "側邊功能"
     Then the super admin should be at page - "/admin/push/app_groups"
      And clicks "檢視" link on User List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/c1e7371a-7b2e-401a-8f86-480a88d2230f"
      And should see "編輯"
     When the super admin clicks "編輯"
     Then the super admin should be at page - "/admin/push/app_groups/c1e7371a-7b2e-401a-8f86-480a88d2230f/edit"
      And should see "名稱"
     When the super admin fills in "名稱" with "APP_GROUP_NAME1_MODIFY"
     When the super admin fills in "描述" with "APP_GROUP_DESCRIPTION1_MODIFY"
      And presses "提交"
     Then the super admin should be at page - "/admin/push/app_groups/c1e7371a-7b2e-401a-8f86-480a88d2230f"
      And should see "名稱 APP_GROUP_NAME1_MODIFY"
      And should see "描述 APP_GROUP_DESCRIPTION1_MODIFY"
      And should see "APP Group ID c1e7371a-7b2e-401a-8f86-480a88d2230f"
      And should see "Topic ARN arn:aws:sns:us-east-1:567710019248:c1e7371a-7b2e-401a-8f86-480a88d2230f"
      And should see "建立時間 2017-07-18T06:52:47.031Z"
      And should see "更新時間 2017-07-19T06:52:47.031Z"