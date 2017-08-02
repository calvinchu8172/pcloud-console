Feature: Push Management - App Group App List

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
      "application_arn": "arn:aws:sns:us-east-1:567710019248:app/GCM/myzyxel-android-alpha",
      "package_name": "android_package_name",
      "platform": "GCM",
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
      "application_arn": "arn:aws:sns:us-east-1:567710019248:app/APNS/myzyxel-alpha-ios",
      "bundle_id": "ios_bundle_id",
      "platform": "APNS",
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
      "application_arn": "arn:aws:sns:us-east-1:567710019248:app/APNS_SANDBOX/myzyxel-alpha-ios-test",
      "bundle_id": "ios_test_bundle_id",
      "platform": "APNS_SANDBOX",
      "topic_arn": "arn:aws:sns:us-east-1:567710019248:17ac740b-5c0f-4b55-a90e-1d65ec499a46",
      "created_at": "2017-07-16T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """

  @javascript @webmock
  Scenario: [03_03_01]
    查看推播 App Group Apps 列表
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
     And should see "名稱" - "myzyxel-ios-test" on App Group App List table Row "1"
     And should see "描述" - "myZyxel Alpha iOS 測試版" on App Group App List table Row "1"
     And should see "平台" - "APNS Sandbox" on App Group App List table Row "1"
     And should see "建立時間" - "2017-07-16T02:56:42.276Z" on App Group App List table Row "1"
     And should see "更新時間" - "2017-07-18T01:48:48.008Z" on App Group App List table Row "1"
     And should see "名稱" - "myzyxel-ios" on App Group App List table Row "2"
     And should see "描述" - "myZyxel Alpha iOS 版" on App Group App List table Row "2"
     And should see "平台" - "APNS" on App Group App List table Row "2"
     And should see "建立時間" - "2017-07-15T02:56:42.276Z" on App Group App List table Row "2"
     And should see "更新時間" - "2017-07-18T01:48:48.008Z" on App Group App List table Row "2"
     And should see "名稱" - "myzyxel-android" on App Group App List table Row "3"
     And should see "描述" - "myZyxel Alpha Android 版" on App Group App List table Row "3"
     And should see "平台" - "GCM" on App Group App List table Row "3"
     And should see "建立時間" - "2017-07-14T02:56:42.276Z" on App Group App List table Row "3"
     And should see "更新時間" - "2017-07-18T01:48:48.008Z" on App Group App List table Row "3"
     When the super admin clicks "返回"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b"
