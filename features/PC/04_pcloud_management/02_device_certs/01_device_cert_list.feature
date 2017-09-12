Feature: Pcloud Management - Device Cert List

  Background:
    Given the super admin has already signed up
    Given Pcloud Server has an Device Cert data as below:
    """
    {
      "serial": "53152101-d6fe-4cb7-afb7-64e0f905a4b6",
      "description":"DEVICE_CERT_DESCRIPTION1",
      "created_at": "2017-07-14T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """
    Given Pcloud Server has an Device Cert data as below:
    """
    {
      "serial": "ee71bc0e-f4cc-45ec-bdde-dc545376e1e1",
      "description":"DEVICE_CERT_DESCRIPTION2",
      "created_at": "2017-07-14T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """

  @javascript @webmock
  Scenario: [04_02_01]
    查看 P.Cloud 裝置憑證 列表
    Given the super admin has already signed in
     Then the super admin should be at page - "/"
     When the super admin clicks "P.Cloud 管理" within "側邊功能"
     Then the super admin should see "裝置憑證管理"
     When the super admin clicks "裝置憑證管理" within "側邊功能"
     Then the super admin should be at page - "/admin/pcloud/device_certs"
      And should see "裝置憑證管理"
      And should see "裝置憑證列表"
      And should see "憑證編號" - "53152101-d6fe-4cb7-afb7-64e0f905a4b6" on App Group List table Row "1"
      And should see "描述" - "DEVICE_CERT_DESCRIPTION1" on App Group List table Row "1"
      And should see "憑證編號" - "ee71bc0e-f4cc-45ec-bdde-dc545376e1e1" on App Group List table Row "2"
      And should see "描述" - "DEVICE_CERT_DESCRIPTION2" on App Group List table Row "2"
