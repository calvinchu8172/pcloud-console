Feature: Push Management - App Groups - Create App group App

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

  @javascript @webmock
  Scenario: [03_03_02]
    新增 App Group App
    # Given Time now is "2017-01-02 12:00:00"
    Given the super admin has already signed in
     When the super admin clicks "推播管理" within "側邊功能"
      And clicks "App Group 列表" within "側邊功能"
     Then the super admin should be at page - "/admin/push/app_groups"
      And clicks "檢視" link on App Group List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b"
     When the super admin clicks "Apps 列表"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps"
     When the super admin clicks "新增 App"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/new"
     When the super admin fills in "名稱" with "iOS APP Name 1"
     When the super admin selects "APNS" from "平台"
     When the super admin fills in "描述" with "iOS APP Description 1"
     When the super admin fills in "iOS Bundle ID" with "iOS APP Bundle ID 1"
     When the super admin attaches the file "ios-push-app.p12" to "選擇 P12 檔案"
     When the super admin fills in "密碼" with "marslin@ecoworkinc.com"
     When the super admin presses "解析成憑證與私鑰"
      And presses "提交"
     # When debug
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/01dd8f4e-df4a-425b-9943-96069c0622aa"
     # When debug


