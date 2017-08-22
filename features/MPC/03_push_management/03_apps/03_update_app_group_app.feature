Feature: Push Management - App Groups - Update App group App

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
    Given Push Server has an App Group App data as below:
    """
    {
      "app_id": "419b0e28-a418-4e79-8dda-72cafbf4b036",
      "app_group_id": "569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "name": "myzyxel-android",
      "description": "myZyxel Alpha Android 版",
      "status": "active",
      "application_arn": "arn:aws:sns:us-east-1:567710019248:app/GCM/myzyxel-android-alpha",
      "app_group_topic_arn": "APP_GROUP_TOPIC_ARN",
      "package_name": "android_package_name",
      "platform": "GCM",
      "locales": [ "de", "en", "fr", "it", "pt", "ru", "th", "tr", "zh-TW", "zh-CN" ],
      "topic_arn": "arn:aws:sns:us-east-1:567710019248:419b0e28-a418-4e79-8dda-72cafbf4b036",
      "created_at": "2017-07-14T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """
    Given Push Server has an App Group App data as below:
    """
    {
      "app_id": "01dd8f4e-df4a-425b-9943-96069c0622aa",
      "app_group_id": "569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "name": "myzyxel-ios",
      "description": "myZyxel Alpha iOS 版",
      "status": "active",
      "application_arn": "arn:aws:sns:us-east-1:567710019248:app/APNS/myzyxel-alpha-ios",
      "app_group_topic_arn": "APP_GROUP_TOPIC_ARN",
      "bundle_id": "ios_bundle_id",
      "platform": "APNS",
      "locales": [ "de", "en", "fr", "it", "pt", "ru", "th", "tr", "zh-TW", "zh-CN" ],
      "topic_arn": "arn:aws:sns:us-east-1:567710019248:01dd8f4e-df4a-425b-9943-96069c0622aa",
      "created_at": "2017-07-15T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """
    Given Push Server has an App Group App data as below:
    """
    {
      "app_id": "17ac740b-5c0f-4b55-a90e-1d65ec499a46",
      "app_group_id": "569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "name": "myzyxel-ios-test",
      "description": "myZyxel Alpha iOS 測試版",
      "status": "active",
      "application_arn": "arn:aws:sns:us-east-1:567710019248:app/APNS_SANDBOX/myzyxel-alpha-ios-test",
      "app_group_topic_arn": "APP_GROUP_TOPIC_ARN",
      "bundle_id": "ios_test_bundle_id",
      "platform": "APNS_SANDBOX",
      "locales": [ "de", "en", "fr", "it", "pt", "ru", "th", "tr", "zh-TW", "zh-CN" ],
      "topic_arn": "arn:aws:sns:us-east-1:567710019248:17ac740b-5c0f-4b55-a90e-1d65ec499a46",
      "created_at": "2017-07-16T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """

  @javascript @webmock
  Scenario: [03_03_03_01]
    修改推播 App Group APNS Sandbox App
    Given the super admin has already signed in
     Then the super admin should be at page - "/"
     When the super admin clicks "推播管理" within "側邊功能"
     Then the super admin should see "App Group 列表"
     When the super admin clicks "App Group 列表" within "側邊功能"
     Then the super admin should be at page - "/admin/push/app_groups"
      And clicks "檢視" link on App Group List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b"
     When the super admin clicks "Apps 列表"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps"
     And should see "APP_GROUP_NAME1 - Apps 列表"
     And clicks "檢視" link on App Group App List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46"
      And should see "編輯"
     When the super admin clicks "編輯"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46/edit"
      And should see "APP ID 17ac740b-5c0f-4b55-a90e-1d65ec499a46"
      And should see "平台 APNS Sandbox"
     When the super admin fills in "名稱" with "myzyxel-ios-test-modify"
     When the super admin chooses "停用"
     When the super admin fills in "描述" with "myZyxel Alpha iOS 測試版 改"
     When the super admin fills in "iOS Bundle ID" with "ios_test_bundle_id_modify"
     When the super admin attaches the file "ios-push-app.p12" to "選擇 P12 檔案"
     When the super admin fills in "密碼" with "marslin@ecoworkinc.com"
     When the super admin presses "解析成憑證與私鑰"
      And presses "提交"
    Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46"
      And should see "名稱 myzyxel-ios-test-modify"
      And should see "描述 myZyxel Alpha iOS 測試版 改"
      And should see "狀態 停用"
      And should see "平台 APNS Sandbox"
      And should see "iOS Bundle ID ios_test_bundle_id"
      And should see "APP SNS Application arn:aws:sns:us-east-1:567710019248:app/APNS_SANDBOX/17ac740b-5c0f-4b55-a90e-1d65ec499a46"
      And should see "APP SNS Topic arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-17ac740b-5c0f-4b55-a90e-1d65ec499a46"
      And should see "建立時間 2017-07-18T06:52:47.031Z"
      And should see "更新時間 2017-07-20T06:52:47.031Z"

  @javascript @webmock
  Scenario: [03_03_03_02]
    修改推播 App Group APNS App
    Given the super admin has already signed in
     Then the super admin should be at page - "/"
     When the super admin clicks "推播管理" within "側邊功能"
     Then the super admin should see "App Group 列表"
     When the super admin clicks "App Group 列表" within "側邊功能"
     Then the super admin should be at page - "/admin/push/app_groups"
      And clicks "檢視" link on App Group List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b"
     When the super admin clicks "Apps 列表"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps"
     And should see "APP_GROUP_NAME1 - Apps 列表"
     And clicks "檢視" link on App Group App List table Row "2"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/01dd8f4e-df4a-425b-9943-96069c0622aa"
      And should see "編輯"
     When the super admin clicks "編輯"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/01dd8f4e-df4a-425b-9943-96069c0622aa/edit"
      And should see "APP ID 01dd8f4e-df4a-425b-9943-96069c0622aa"
      And should see "平台 APNS"
     When the super admin fills in "名稱" with "myzyxel-ios-modify"
     When the super admin chooses "停用"
     When the super admin fills in "描述" with "myZyxel Alpha iOS 改"
     When the super admin fills in "iOS Bundle ID" with "ios_bundle_id_modify"
     When the super admin attaches the file "ios-push-app.p12" to "選擇 P12 檔案"
     When the super admin fills in "密碼" with "marslin@ecoworkinc.com"
     When the super admin presses "解析成憑證與私鑰"
      And presses "提交"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/01dd8f4e-df4a-425b-9943-96069c0622aa"
      And should see "名稱 myzyxel-ios-modify"
      And should see "描述 myZyxel Alpha iOS 改"
      And should see "狀態 停用"
      And should see "iOS Bundle ID ios_bundle_id_modify"
      And should see "APP SNS Application arn:aws:sns:us-east-1:567710019248:app/APNS/01dd8f4e-df4a-425b-9943-96069c0622aa"
      And should see "APP SNS Topic arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa"
      And should see "建立時間 2017-07-18T06:52:47.031Z"
      And should see "更新時間 2017-07-21T06:52:47.031Z"

  @javascript @webmock
  Scenario: [03_03_03_02]
    修改推播 App Group GCM App
    Given the super admin has already signed in
     Then the super admin should be at page - "/"
     When the super admin clicks "推播管理" within "側邊功能"
     Then the super admin should see "App Group 列表"
     When the super admin clicks "App Group 列表" within "側邊功能"
     Then the super admin should be at page - "/admin/push/app_groups"
      And clicks "檢視" link on App Group List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b"
     When the super admin clicks "Apps 列表"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps"
     And should see "APP_GROUP_NAME1 - Apps 列表"
     And clicks "檢視" link on App Group App List table Row "3"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/419b0e28-a418-4e79-8dda-72cafbf4b036"
      And should see "編輯"
     When the super admin clicks "編輯"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/419b0e28-a418-4e79-8dda-72cafbf4b036/edit"
      And should see "APP ID 419b0e28-a418-4e79-8dda-72cafbf4b036"
      And should see "平台 GCM"
     When the super admin fills in "名稱" with "myzyxel-android-modify"
     When the super admin chooses "停用"
     When the super admin fills in "描述" with "myZyxel Alpha Android 版 改"
     When the super admin fills in "Android Package Name" with "android_package_name_modify"
     When the super admin fills in "API Key" with "AIzaSyBYazNIBst6TAEoqBvE2thFqQd6vFlLzII"
      And presses "提交"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/419b0e28-a418-4e79-8dda-72cafbf4b036"
      And should see "名稱 myzyxel-android-modify"
      And should see "描述 myZyxel Alpha Android 版 改"
      And should see "狀態 停用"
      And should see "Android Package Name android_package_name"
      And should see "APP SNS Application arn:aws:sns:us-east-1:567710019248:app/GCM/419b0e28-a418-4e79-8dda-72cafbf4b036"
      And should see "APP SNS Topic arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-419b0e28-a418-4e79-8dda-72cafbf4b036"
      And should see "建立時間 2017-07-18T06:52:47.031Z"
      And should see "更新時間 2017-07-22T06:52:47.031Z"




