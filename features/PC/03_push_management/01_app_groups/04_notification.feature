Feature: Push Management - App Group Notification

  Background:
    Given the super admin has already signed up
    Given the system manager has already been created by super admin
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
    Given Push Server has an App Group Access Key data as below:
    """
    {
      "access_key_id": "c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e",
      "app_group_id": "569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "description": "APP_GROUP_ACCESS_KEY_DESCRIPTION1",
      "app_group_topic_arn": "arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "public_key": "-----BEGIN CERTIFICATE-----\nMIIDYjCCAkoCCQDHthb1fYOBkDANBgkqhkiG9w0BAQUFADBzMQswCQYDVQQGEwJU\nVzEPMA0GA1UECAwGVGFpd2FuMQ8wDQYDVQQHDAZUYWlwZWkxFTATBgNVBAoMDEVj\nb3dvcmsgSW5jLjEVMBMGA1UECwwMRWNvd29yayBJbmMuMRQwEgYDVQQDDAtQdXNo\nU2VydmljZTAeFw0xNzA3MjAwNTUzMjlaFw0zNzA3MjAwNTUzMjlaMHMxCzAJBgNV\nBAYTAlRXMQ8wDQYDVQQIDAZUYWl3YW4xDzANBgNVBAcMBlRhaXBlaTEVMBMGA1UE\nCgwMRWNvd29yayBJbmMuMRUwEwYDVQQLDAxFY293b3JrIEluYy4xFDASBgNVBAMM\nC1B1c2hTZXJ2aWNlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5gRE\nvkmFqckEqbbzmQvP+9txHf1aT48+uexDMb7YpELcb1zeExpYhyIzcCUoOjXLwZIu\nIRHXM3Vas82s567OPVpwTS5cYygYff8djUT8AsqB/pkB3zh3iPpLjcPN68bOJs75\nci7aD2UpWxXh9bUvJIK7rxK3r2ejiGNdvE2EOqZaWbt0GDZ85SG8vDi5y8ku4u6+\nVb80lsIHcuDrqRQ4v0kr4F8OxEzhIFztKsBUOY+QRQqvvz3xtK2c3J+fpWDhXdxp\nrgV78pOWVaxZU4kQl1Lu1BMh3Mdj5Nrsun9q7KOM3SRyap+3URxDxMz0RUohkl2X\npTvQhwCaFQmE5kIYRQIDAQABMA0GCSqGSIb3DQEBBQUAA4IBAQCazHC1EPRgH+/1\nGu3WC6bwZWoAgvGV7vnlvUQnEr9jztZTQx6YvIQvh5M2mDiMYZXWQYT9OxTpt2qC\nZN8VE6WnZ6prP8LRbmhy1eoq9rELsrUT0GjfU0QIWTH9QUh+bUtVKgGKdMdxQDzn\n9OHga8DMWRlwC0qtoR0Dr7Ch1q0bOAw7D45kYvhkhemygZ5A1a+Hmv2AcPPxvz9o\nVQ2VFfrPytvDS7y9fG0s7ep7cWPXPy3855TPHBsZwZ56f5zVAD8vj9JbX/cDCP8I\nVFzRXuJZuLAjKVOsfb/7oPHUZf31bYg07OHy9mcGbnqpuUMhvjVxk1zWcEArMzmi\nLriPOjhv\n-----END CERTIFICATE-----\n",
      "status": "active",
      "type": "app_group",
      "created_at": "2017-07-14T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """
    Given Push Server has an App Group App data as below:
    """
    {
      "app_id": "419b0e28-a418-4e79-8dda-72cafbf4b036",
      "app_group_id": "569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "name": "pcloud-android",
      "description": "Pcloud Alpha Android 版",
      "status": "active",
      "application_arn": "arn:aws:sns:us-east-1:567710019248:app/GCM/pcloud-android-alpha",
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
      "app_id": "17ac740b-5c0f-4b55-a90e-1d65ec499a46",
      "app_group_id": "569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "name": "pcloud-ios-test",
      "description": "Pcloud Alpha iOS 測試版",
      "status": "revoked",
      "application_arn": "arn:aws:sns:us-east-1:567710019248:app/APNS_SANDBOX/pcloud-alpha-ios-test",
      "bundle_id": "ios_test_bundle_id",
      "platform": "APNS_SANDBOX",
      "topic_arn": "arn:aws:sns:us-east-1:567710019248:17ac740b-5c0f-4b55-a90e-1d65ec499a46",
      "created_at": "2017-07-16T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """


  @javascript @webmock
  Scenario: [03_01_04]
    App Groups 發送測試推播
    Given the super admin has already signed in
     Then the super admin should be at page - "/"
     When the super admin clicks "推播管理" within "側邊功能"
     Then the super admin should see "App Group 列表"
     When the super admin clicks "App Group 列表" within "側邊功能"
     Then the super admin should be at page - "/admin/push/app_groups"
      And should see "App Group 管理"
      And should see "App Group 列表"
      And should see "名稱" - "APP_GROUP_NAME1" on App Group List table Row "1"
      And should see "描述" - "APP_GROUP_DESCRIPTION1" on App Group List table Row "1"
      And should see "建立時間" - "2017-07-14T02:56:42.276Z" on App Group List table Row "1"
      And should see "更新時間" - "2017-07-18T01:48:48.008Z" on App Group List table Row "1"
      And clicks "檢視" link on App Group List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b"
      And should see "發送測試推播" within "側邊功能"
     When the super admin clicks "發送測試推播" within "側邊功能"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/notification"
      And selects "發送對象" with "super_admin@example.com" option
      And selects "發送對象" with "system_manager@example.com" option
     When the super admin fills in "訊息主旨" with "title"
      And the super admin fills in "訊息內容" with "content"
      And presses "提交"
      And should see /發送測試推播成功 - {"code":"0000","message":"OK","data":{"job_id":"c8756b3c-7ce6-11e7-83d1-03192e974713","total_ids":2,"total":2}}/

