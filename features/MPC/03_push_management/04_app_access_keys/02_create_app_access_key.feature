Feature: Push Management - Apps - Create App Access Key

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
      "app_id": "17ac740b-5c0f-4b55-a90e-1d65ec499a46",
      "app_group_id": "569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "name": "myzyxel-ios-test",
      "description": "myZyxel Alpha iOS 測試版",
      "status": "active",
      "application_arn": "arn:aws:sns:us-east-1:567710019248:app/APNS_SANDBOX/myzyxel-alpha-ios-test",
      "bundle_id": "ios_test_bundle_id",
      "platform": "APNS_SANDBOX",
      "topic_arn": "arn:aws:sns:us-east-1:567710019248:17ac740b-5c0f-4b55-a90e-1d65ec499a46",
      "created_at": "2017-07-16T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """

  @javascript @webmock
  Scenario: [03_04_02]
    新增 App Access Key
    # Given Time now is "2017-01-02 12:00:00"
    Given the super admin has already signed in
     When the super admin clicks "推播管理" within "側邊功能"
      And clicks "App Group 列表" within "側邊功能"
     Then the super admin should be at page - "/admin/push/app_groups"
      And clicks "檢視" link on App Group List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b"
     When the super admin clicks "Apps 列表"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps"
      And should see "APP_GROUP_NAME1 - Apps 列表"
      And should see "名稱" - "myzyxel-ios-test" on App Group App List table Row "1"
      And should see "狀態" - "啟用" on App Group App List table Row "1"
      And should see "平台" - "APNS Sandbox" on App Group App List table Row "1"
      And should see "建立時間" - "2017-07-16T02:56:42.276Z" on App Group App List table Row "1"
      And should see "更新時間" - "2017-07-18T01:48:48.008Z" on App Group App List table Row "1"
      And clicks "檢視" link on App List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46"
      And should see "myzyxel-ios-test - Access Keys 列表"
     Then the super admin should see "新增 Access Key"
     When the super admin clicks "新增 Access Key"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46/access_keys/new"
     When the super admin fills in "描述" with "Access Key Description 1"
      And presses "提交"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46/access_keys/110ec58a-a0f2-4ac4-8393-c866d813b8d1"
      And should see "Access Key ID 110ec58a-a0f2-4ac4-8393-c866d813b8d1"
      And should see "描述 Access Key Description 1"
      And should see "APP 平台 APNS Sandbox"
      And should see "狀態 啟用"
      And should see "APP Group Topic ARN arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b"
      And should see "APP Topic ARN arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa"
      And should see "Application ARN arn:aws:sns:us-east-1:567710019248:app/APNS_SANDBOX/myzyxel-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa"
      And should see "建立時間 2017-07-14T02:56:42.276Z"
      And should see "更新時間 2017-07-18T01:48:48.008Z"
