Feature: Push Management - App Groups - Download App Group Access Key

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

  @javascript @webmock @proxy
  Scenario: [03_02_04]
    下載 App Group Access Key
    Given the super admin has already signed in
     When the super admin clicks "推播管理" within "側邊功能"
      And clicks "App Group 列表" within "側邊功能"
     Then the super admin should be at page - "/admin/push/app_groups"
      And clicks "檢視" link on User List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b"
      # And clicks "下載" link on User List table Row "1"
      And clicks "檢視" link on User List table Row "1"
     Then the super admin should be at page - "/admin/push/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/access_keys/c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e"
     When the super admin clicks "下載"
     Then the super admin should download a file - "c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e.pem"
      And the file content should be:
      """
      -----BEGIN RSA PRIVATE KEY-----
      MIIEowIBAAKCAQEAoIBAFRD1FZYUwXbaDuik0hE+r9Ab4hsUx8zB4s62YVdkPLXp
      hGcOcoP6kc7NH1aVRLFTPGGgtjujdj8N84Cs4RYMaZXNqMa1a6NFIlcVtPthnoV0
      hSJlMW8NzBTF1iMMbRD/wSODWXc0uNOmAWHjNZ9ixd7AzCkSAChcB0MsLCsD/nRT
      RYLvuxImwteea5IcTgykd1Psa/WZJh/RPq9UigMOOXGZrt6aYlsl+poJYOqdl1q+
      VVKl/9kUYoPYCRPSsspC1DLk3pqF0Uc6AxZKwrbCZyZ/10UxKhXNBrxbzQJvNHVa
      vSMyufB8a/qBL+gA2hJDxyw0rXBxfcBEWAwedQIDAQABAoIBAB2JnMGDvmb7mNRF
      6DmILRUP4WZ/uTHyY++lSiVQf5YIfEUEAXbBdJI0ob+FvJBA4fWjYLsjCG2hKiMP
      1aRzkN1Xrm8cB55A+5BUmtuIBVGqVbvTua7qto7TbkmZpRMUnivQThEgVQL5AjXl
      lY55klQDAi2CIh8wi8SFqPIZNZ7m/RUu9h1QlkgHI+pPYevW3lkG2cG6sl9lKTBJ
      mlCSldWeZLuvd75nayEDQHbx0rI5UF5u3oeSsrcme4zxG6SvnmhTXuI91QVuf9k2
      eOy86Cf5JdyiCTVhCnLGHX9AB7YTlIFTi00z/nHPLBNs7PBadXZxkqjADsjr40nq
      Sa4k6aECgYEAzltdkRgj72g5ThkLbMv11+G79ROII4NUb+LDP1VtOI5vi3pQhOKB
      XOJaiU0ToixMAUaktWzGPdY4RwS8tBXRaen/Gok+tFDYE3Qtt/cJjmHD1qph9sGn
      4WDpJrDzwiidP9t0CsYiitrd4YNhvzQ5pcT7ED55RclE0tgqZqVBfjkCgYEAxxzQ
      21hAuJxtPA1sa3VFJ3PeAjhsPzej+MZTtMfk23lqwBuPziQ77RwxOrfgfdSznHgf
      JNpYBDGrGleLfApIkA12a8bU4GahSWIqa/fYwcsybky4hncDQted8gRqUU25wYd8
      35+9D2nJ/s3U1teBJkaLjpWRTPvtuMz9IufHYh0CgYBK2RLwHNxz6s7WR/k/5h7u
      xd7h/sqjbvBCgPKm1zp9iBRnd98aw/l+ElAaew2DBiQvVktJzwF8zmWtRMeZXkyN
      6STxoBRRXP1y2PH4Ry99KHLbOwO7d/SHqBoJQae4pfibf+LwQXun98kBEiFzM+Mx
      AGi8NJzSNjWzcFq4znoZ6QKBgEs79SLcLuBSoues/sl/rxigLEPUg/pDEN8AOUK2
      wR+4ugBKqcSvZkFKhMN2FQoWo6M8tC/dnKJBDjDO4XKGBDMCEzvYDjmYLdsnj3Xq
      WWmoWK7aqGKOd5n7FMAMsQt1ffnFMwbgObSoOV3g8koXdcI7p6HBm/xluMY6Fm/o
      +ip1AoGBAIgxplw+IOeqaMcvK/EApBktmDrZnA3n23rA85lzlxal9GPNaXn9sCyI
      uJ2dcm5f3ohVMx2uMRTicgJ6wVGMpWL6BmoHUbB96W0L4/LpLUu3+kJqxUbgZ657
      9hjNKjLWzLyrf4FuYg6vwEGy3QUWZtpWyrpMd16Uko27RLRoR+dd
      -----END RSA PRIVATE KEY-----

      """
