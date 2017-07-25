Feature: Push Management - App Groups - Update App Group Access Key

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
    Given Push Server has an App Group Access Key data as below:
    """
    {
      "access_key_id": "c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e",
      "app_group_id": "569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "name": "APP_GROUP_ACCESS_KEY_NAME1",
      "description": "APP_GROUP_ACCESS_KEY_DESCRIPTION1",
      "app_group_topic_arn": "arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "public_key": "-----BEGIN CERTIFICATE-----\nMIIDYjCCAkoCCQDHthb1fYOBkDANBgkqhkiG9w0BAQUFADBzMQswCQYDVQQGEwJU\nVzEPMA0GA1UECAwGVGFpd2FuMQ8wDQYDVQQHDAZUYWlwZWkxFTATBgNVBAoMDEVj\nb3dvcmsgSW5jLjEVMBMGA1UECwwMRWNvd29yayBJbmMuMRQwEgYDVQQDDAtQdXNo\nU2VydmljZTAeFw0xNzA3MjAwNTUzMjlaFw0zNzA3MjAwNTUzMjlaMHMxCzAJBgNV\nBAYTAlRXMQ8wDQYDVQQIDAZUYWl3YW4xDzANBgNVBAcMBlRhaXBlaTEVMBMGA1UE\nCgwMRWNvd29yayBJbmMuMRUwEwYDVQQLDAxFY293b3JrIEluYy4xFDASBgNVBAMM\nC1B1c2hTZXJ2aWNlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5gRE\nvkmFqckEqbbzmQvP+9txHf1aT48+uexDMb7YpELcb1zeExpYhyIzcCUoOjXLwZIu\nIRHXM3Vas82s567OPVpwTS5cYygYff8djUT8AsqB/pkB3zh3iPpLjcPN68bOJs75\nci7aD2UpWxXh9bUvJIK7rxK3r2ejiGNdvE2EOqZaWbt0GDZ85SG8vDi5y8ku4u6+\nVb80lsIHcuDrqRQ4v0kr4F8OxEzhIFztKsBUOY+QRQqvvz3xtK2c3J+fpWDhXdxp\nrgV78pOWVaxZU4kQl1Lu1BMh3Mdj5Nrsun9q7KOM3SRyap+3URxDxMz0RUohkl2X\npTvQhwCaFQmE5kIYRQIDAQABMA0GCSqGSIb3DQEBBQUAA4IBAQCazHC1EPRgH+/1\nGu3WC6bwZWoAgvGV7vnlvUQnEr9jztZTQx6YvIQvh5M2mDiMYZXWQYT9OxTpt2qC\nZN8VE6WnZ6prP8LRbmhy1eoq9rELsrUT0GjfU0QIWTH9QUh+bUtVKgGKdMdxQDzn\n9OHga8DMWRlwC0qtoR0Dr7Ch1q0bOAw7D45kYvhkhemygZ5A1a+Hmv2AcPPxvz9o\nVQ2VFfrPytvDS7y9fG0s7ep7cWPXPy3855TPHBsZwZ56f5zVAD8vj9JbX/cDCP8I\nVFzRXuJZuLAjKVOsfb/7oPHUZf31bYg07OHy9mcGbnqpuUMhvjVxk1zWcEArMzmi\nLriPOjhv\n-----END CERTIFICATE-----\n",
      "status": "active",
      "type": "app_group",
      "created_at": "2017-07-14T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """

  @javascript @webmock
  Scenario: [03_02_03]
    編輯 App Group
    Given the super admin has already signed in
     When the super admin clicks "推播管理" within "側邊功能"
      And clicks "App Group 列表" within "側邊功能"
     Then the super admin should be at page - "/admin/push/app_groups"
      And clicks "檢視" link on User List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b"
      And clicks "檢視" link on User List table Row "1"
     # When the super admin goes to page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/access_keys/c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/access_keys/c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e"
      And should see "編輯"
     When the super admin clicks "編輯"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/access_keys/c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e/edit"
      And should see "名稱"
     When the super admin fills in "名稱" with "APP_GROUP_NAME1_MODIFY"
     When the super admin fills in "描述" with "APP_GROUP_DESCRIPTION1_MODIFY"
     When the super admin chooses "停用"
      And presses "提交"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/access_keys/c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e"
      And should see "Access Key ID c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e"
      And should see "名稱 APP_GROUP_NAME1_MODIFY"
      And should see "描述 APP_GROUP_DESCRIPTION1_MODIFY"
      And should see "狀態 inactive"
      And should see "APP Group Topic ARN arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b"
      And should see "建立時間 2017-07-18T06:52:47.031Z"
      And should see "更新時間 2017-07-19T06:52:47.031Z"