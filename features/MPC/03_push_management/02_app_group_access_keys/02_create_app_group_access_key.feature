Feature: Push Management - App Groups - Create App group Access Key

  Background:
    # Given Time now is "2017-01-01 12:00:00"
    Given the super admin has already signed up
    Given Push Server has an App Group data as below:
    """
    {
      "app_group_id": "569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "name": "APP_GROUP_NAME1",
      "description": "APP_GROUP_DESCRIPTION1",
      "topic_arn": "arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "created_at": "2017-07-14T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """

  @javascript @webmock
  Scenario: [03_02_02]
    新增 App Group Access Key
    # Given Time now is "2017-01-02 12:00:00"
    Given the super admin has already signed in
     When the super admin clicks "推播管理" within "側邊功能"
      And clicks "App Group 列表" within "側邊功能"
     Then the super admin should be at page - "/admin/push/app_groups"
      And clicks "檢視" link on User List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b"
     Then the super admin should see "新增 Access Key"
     When the super admin clicks "新增 Access Key"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/access_keys/new"
     When the super admin fills in "名稱" with "Access Key 1"
     When the super admin fills in "描述" with "Access Key Description 1"
      And presses "提交"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/access_keys/c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e"
      And should see "Access Key ID c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e"
      And should see "名稱 Access Key 1"
      And should see "描述 Access Key Description 1"
      And should see "狀態 啟用"
      And should see "APP Group Topic ARN arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b"
      And should see "建立時間 2017-07-18T06:52:47.031Z"
      And should see "更新時間 2017-07-18T06:52:47.031Z"
