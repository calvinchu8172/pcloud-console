Feature: Push Management - App Group List

  Background:
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
    Given Push Server has an App Group data as below:
    """
    {
      "app_group_id": "b439fae9-9a27-44d1-b5c7-fc4c3934c884",
      "name": "APP_GROUP_NAME2",
      "description": "APP_GROUP_DESCRIPTION2",
      "topic_arn": "arn:aws:sns:us-east-1:567710019248:b439fae9-9a27-44d1-b5c7-fc4c3934c884",
      "created_at": "2017-07-14T02:57:42.587Z",
      "updated_at": "2017-07-18T01:48:29.158Z"
    }
    """

  @javascript @webmock
  Scenario: [03_01_01]
    查看推播 App Groups 列表
    Given the super admin has already signed in
     Then the super admin should be at page - "/"
     When the super admin clicks "推播管理" within "側邊功能"
     Then the super admin should see "App Group 列表"
     When the super admin clicks "App Group 列表" within "側邊功能"
     Then the super admin should be at page - "/admin/push/app_groups"
      And should see "App Group 管理"
      And should see "App Group 列表"
      And should see "名稱" - "APP_GROUP_NAME2" on App Group List table Row "1"
      And should see "描述" - "APP_GROUP_DESCRIPTION2" on App Group List table Row "1"
      And should see "建立時間" - "2017-07-14T02:57:42.587Z" on App Group List table Row "1"
      And should see "更新時間" - "2017-07-18T01:48:29.158Z" on App Group List table Row "1"
      And should see "名稱" - "APP_GROUP_NAME1" on App Group List table Row "2"
      And should see "描述" - "APP_GROUP_DESCRIPTION1" on App Group List table Row "2"
      And should see "建立時間" - "2017-07-14T02:56:42.276Z" on App Group List table Row "2"
      And should see "更新時間" - "2017-07-18T01:48:48.008Z" on App Group List table Row "2"
