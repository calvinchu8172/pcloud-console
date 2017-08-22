Feature: Push Management - Apps - Revoke App Access Key

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
      "name": "pcloud-ios-test",
      "description": "Pcloud Alpha iOS 測試版",
      "status": "active",
      "application_arn": "arn:aws:sns:us-east-1:567710019248:app/APNS_SANDBOX/pcloud-alpha-ios-test",
      "app_group_topic_arn": "APP_GROUP_TOPIC_ARN",
      "bundle_id": "ios_test_bundle_id",
      "locales": [ "de", "en", "fr", "it", "pt", "ru", "th", "tr", "zh-TW", "zh-CN" ],
      "platform": "APNS_SANDBOX",
      "topic_arn": "arn:aws:sns:us-east-1:567710019248:17ac740b-5c0f-4b55-a90e-1d65ec499a46",
      "created_at": "2017-07-16T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """
    Given Push Server has an App Access Key data as below:
    """
    {
      "access_key_id": "110ec58a-a0f2-4ac4-8393-c866d813b8d1",
      "app_group_id": "569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "app_id": "17ac740b-5c0f-4b55-a90e-1d65ec499a46",
      "description": "APP_ACCESS_KEY_DESCRIPTION1",
      "app_group_topic_arn": "arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b",
      "app_topic_arn": "arn:aws:sns:us-east-1:567710019248:pcloud-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa",
      "application_arn": "arn:aws:sns:us-east-1:567710019248:app/APNS_SANDBOX/pcloud-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa",
      "platform": "APNS_SANDBOX",
      "public_key": "-----BEGIN CERTIFICATE-----\nMIIFQzCCAyugAwIBAgICEAIwDQYJKoZIhvcNAQELBQAwgbAxCzAJBgNVBAYTAlRX\nMQ8wDQYDVQQIDAZUYWl3YW4xEDAOBgNVBAcMB0hzaW5DaHUxIjAgBgNVBAoMGVp5\nWEVMIGNvbW11bmljYXRpb24gY29ycC4xDTALBgNVBAsMBENBQkMxJTAjBgNVBAMM\nHG15WnlYRUxDbG91ZCBpbnRlcm1lZGlhdGUgQ0ExJDAiBgkqhkiG9w0BCQEWFWNs\nb3VkYWRtQHp5eGVsLmNvbS50dzAeFw0xNTA1MTMwMzUxMTFaFw0xNTA4MTEwMzUx\nMTFaMIGaMQswCQYDVQQGEwJUVzEPMA0GA1UECAwGVGFpd2FuMRAwDgYDVQQHDAdI\nc2luQ2h1MSIwIAYDVQQKDBlaeVhFTCBjb21tdW5pY2F0aW9uIGNvcnAuMQ0wCwYD\nVQQLDARDQUJDMQ8wDQYDVQQDDAZBcHBEZXYxJDAiBgkqhkiG9w0BCQEWFWNsb3Vk\nYWRtQHp5eGVsLmNvbS50dzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB\nAN9WcIRlMya4yJ8XOMHsv5XsoZurDLfJOMNDYRS0Q/HSrdXcnGHNX4HuCvjEweXo\nKu4vuv+A1s8qWqq3UZ4kNWWFOrFG+HPD1UD8j8wF3bAeZti91Gt9JBoR3Z934SZy\nuJlk6CXRHdYxdsjKVJjJ/sxcwLeWjppvO6ZaPYkPKLPDj0BildylsMWqfVqo64/R\nY8N27MR6wCQPBbXrY452wDXnL5l/A1ro7EyOhEFKif+H2XTapfjRtjcIvdV174Yo\ngLJMslx3J7XIPQ5VPioRY6qzohV7n815O1GeGu5gCyIafsRmHmrGGQaQOcl1J73l\n+1it8zAifVoKMMNaadCB/mECAwEAAaN7MHkwCQYDVR0TBAIwADAsBglghkgBhvhC\nAQ0EHxYdT3BlblNTTCBHZW5lcmF0ZWQgQ2VydGlmaWNhdGUwHQYDVR0OBBYEFHM1\nZBqsiFBU8ahaqV3F3kKcY0izMB8GA1UdIwQYMBaAFNBx+rl/NYLomZsDoTPHWCkH\nSH4mMA0GCSqGSIb3DQEBCwUAA4ICAQDVrvzAtv3zC9VoqZidnG3jRogVFgMTqeZG\nkkZGmrU8VeJ/Xl7Yov9CdP0vT80x9YwSrqrvTQ/UQ8DePaUYhjAuDP9zokBd6rFO\n9uM+2Ym/bGNx7zKWpj5KByt2fGJuS23S67y0qttSISoPktsAXsfk61V/ZVCFrNKV\nqLbc5Ra73ga36BRL/4ip3/04+q7QIKQNd5VRh48Ei927rU5nj6lfQZWea716SjCO\n/a/ABZkRlkVJeZRWY1yCmR2eKTqRgcin3sjwNpZlAbCoqMuuUPb3X9t1JsmVS89r\nv5qtltt5Tkoq8TuMeDraCw/u1duG9bLwdJV+8T2UUjs9ra2OQOCuTmU10U5VaJBR\n+Yy3uiO80gadNgTEcrEn04Q85counkGSFFOYxfv+ZunaJ/EWm6iZ0sfCKhro09xT\nXBc1uLhJsE9Yk3VPkoVW8wNyk86QRxo2SoHI17OCQHG0nvEnqpznRnOcyexK9yFR\nuD+YowSVFC5xPj7LEZLB3SdRSouG+I+JOXXIG7mlG62oD0KW74nZrhMQZw+V0or3\nFYNBCEH7EzRRfIVpjLDX6Y7UIWmNtenPCaGXJXdKL+a1cn/BTLQVOQRJPQanz2fx\nRuXBx8MVep/Ot2wyuACj34Z1ozJ5OVBKuhcWHbRSH0PLEOi0o1jGgEA4mXdXZHO9\nQBzeRHk0vw==\n-----END CERTIFICATE-----\n",
      "status": "active",
      "type": "app",
      "created_at": "2017-07-14T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """

  @javascript @webmock
  Scenario: [03_04_05]
    編輯 App Group
    Given the super admin has already signed in
     When the super admin clicks "推播管理" within "側邊功能"
      And clicks "App Group 列表" within "側邊功能"
     Then the super admin should be at page - "/admin/push/app_groups"
      And clicks "檢視" link on App Group List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b"
     When the super admin clicks "Apps 列表"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps"
      And should see "APP_GROUP_NAME1 - Apps 列表"
      And should see "名稱" - "pcloud-ios-test" on App Group App List table Row "1"
      And should see "狀態" - "啟用" on App Group App List table Row "1"
      And should see "平台" - "APNS Sandbox" on App Group App List table Row "1"
      And should see "建立時間" - "2017-07-16T02:56:42.276Z" on App Group App List table Row "1"
      And should see "更新時間" - "2017-07-18T01:48:48.008Z" on App Group App List table Row "1"
      And clicks "檢視" link on App List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46"
      And clicks "檢視" link on App Access Key List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46/access_keys/110ec58a-a0f2-4ac4-8393-c866d813b8d1"
      And should see "註銷" within "工具列"
     When the super admin clicks "註銷"
      And accepts a confirm message - "您確定要執行？"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46/access_keys/110ec58a-a0f2-4ac4-8393-c866d813b8d1"
     Then should not see "編輯" within "工具列"
     Then should not see "下載" within "工具列"
     Then should not see "註銷" within "工具列"
