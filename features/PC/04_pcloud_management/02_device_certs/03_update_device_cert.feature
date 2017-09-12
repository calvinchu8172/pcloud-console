Feature: Pcloud Management - Device Certs - Update Device Cert

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

  @javascript @webmock
  Scenario: [04_02_03]
    編輯 裝置憑證
    Given the super admin has already signed in
     When the super admin clicks "P.Cloud 管理" within "側邊功能"
      And clicks "裝置憑證管理" within "側邊功能"
     Then the super admin should be at page - "/admin/pcloud/device_certs"
      And clicks "檢視" link on Device Cert List table Row "1"
     Then the super admin should be at page - "/admin/pcloud/device_certs/53152101-d6fe-4cb7-afb7-64e0f905a4b6"
      And should see "編輯"
     When the super admin clicks "編輯"
     Then the super admin should be at page - "/admin/pcloud/device_certs/53152101-d6fe-4cb7-afb7-64e0f905a4b6/edit"
      And should see "描述"
     When the super admin fills in "描述" with "DEVICE_CERT_DESCRIPTION1_MODIFY"
      And presses "提交"
     Then the super admin should be at page - "/admin/pcloud/device_certs/53152101-d6fe-4cb7-afb7-64e0f905a4b6"
      And should see "憑證編號 53152101-d6fe-4cb7-afb7-64e0f905a4b6"
      And should see "描述 DEVICE_CERT_DESCRIPTION1_MODIFY"
      And should see "建立時間 2017-07-14T02:56:42.276Z"
      And should see "更新時間 2017-07-18T06:52:47.032Z"
