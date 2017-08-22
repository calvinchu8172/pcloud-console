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
  Scenario: [03_03_02_01]
    新增 App Group App - iOS APNS
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
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/01dd8f4e-df4a-425b-9943-96069c0622aa"
      And should see "名稱 iOS APP Name 1"
      And should see "描述 iOS APP Description 1"
      And should see "狀態 啟用"
      And should see "平台 APNS"
      And should see "iOS Bundle ID iOS APP Bundle ID 1"
      And should see "APP SNS Application arn:aws:sns:us-east-1:567710019248:app/APNS/17ac740b-5c0f-4b55-a90e-1d65ec499a46"
      And should see "APP SNS Topic arn:aws:sns:us-east-1:567710019248:pcloud-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa"
      And should see "建立時間 2017-07-18T06:52:47.031Z"
      And should see "更新時間 2017-07-18T06:52:47.031Z"

  @javascript @webmock
  Scenario: [03_03_02_02]
    新增 App Group App - iOS APNS Sandbox
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
     When the super admin fills in "名稱" with "iOS Sandbox APP Name 1"
     When the super admin selects "APNS Sandbox" from "平台"
     When the super admin fills in "描述" with "iOS Sandbox APP Description 1"
     When the super admin fills in "iOS Bundle ID" with "iOS Sandbox APP Bundle ID 1"
     When the super admin attaches the file "ios-push-app.p12" to "選擇 P12 檔案"
     When the super admin fills in "密碼" with "marslin@ecoworkinc.com"
     When the super admin presses "解析成憑證與私鑰"
      And presses "提交"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/01dd8f4e-df4a-425b-9943-96069c0622aa"
      And should see "名稱 iOS Sandbox APP Name 1"
      And should see "描述 iOS Sandbox APP Description 1"
      And should see "狀態 啟用"
      And should see "平台 APNS Sandbox"
      And should see "iOS Bundle ID iOS Sandbox APP Bundle ID 1"
      And should see "APP SNS Application arn:aws:sns:us-east-1:567710019248:app/APNS/17ac740b-5c0f-4b55-a90e-1d65ec499a46"
      And should see "APP SNS Topic arn:aws:sns:us-east-1:567710019248:pcloud-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa"
      And should see "建立時間 2017-07-18T06:52:47.031Z"
      And should see "更新時間 2017-07-18T06:52:47.031Z"

  @javascript @webmock
  Scenario: [03_03_02_03]
    新增 App Group App - Android GCM
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
     When the super admin fills in "名稱" with "Android APP Name 1"
     When the super admin selects "GCM" from "平台"
     When the super admin fills in "描述" with "Android APP Description 1"
     When the super admin fills in "Android Package Name" with "Android APP Package Name"
     When the super admin fills in "API Key" with "api-key-12345678"
     # When the super admin attaches the file "ios-push-app.p12" to "選擇 P12 檔案"
     # When the super admin fills in "密碼" with "marslin@ecoworkinc.com"
     # When the super admin presses "解析成憑證與私鑰"
      And presses "提交"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/01dd8f4e-df4a-425b-9943-96069c0622aa"
      And should see "名稱 Android APP Name 1"
      And should see "描述 Android APP Description 1"
      And should see "狀態 啟用"
      And should see "平台 GCM"
      And should see "Android Package Name Android APP Package Name"
      And should see "APP SNS Application arn:aws:sns:us-east-1:567710019248:app/APNS/17ac740b-5c0f-4b55-a90e-1d65ec499a46"
      And should see "APP SNS Topic arn:aws:sns:us-east-1:567710019248:pcloud-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa"
      And should see "建立時間 2017-07-18T06:52:47.031Z"
      And should see "更新時間 2017-07-18T06:52:47.031Z"
