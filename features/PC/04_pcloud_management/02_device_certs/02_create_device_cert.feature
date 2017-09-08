Feature: Pcloud Management - Device Certs - Create Device Cert

  Background:
    Given the super admin has already signed up

  @javascript @webmock
  Scenario: [04_02_02]
    新增 裝置憑證
    # Given Time now is "2017-01-02 12:00:00"
    Given the super admin has already signed in
     When the super admin clicks "P.Cloud 管理" within "側邊功能"
      And clicks "裝置憑證管理" within "側邊功能"
     Then the super admin should see "新增憑證"
     When the super admin clicks "新增憑證"
     Then the super admin should be at page - "/admin/pcloud/device_certs/new"
     When the super admin attaches the file "device-cert.crt" to "上傳憑證"
     When the super admin fills in "描述" with "Device Cert Description 1"
      And presses "提交"
     Then the super admin should be at page - "/admin/pcloud/device_certs/1"
      And should see "憑證編號 53152101-d6fe-4cb7-afb7-64e0f905a4b6"
      And should see "描述 Device Cert Description 1"
      And should see "建立時間 2017-07-18T06:52:47.031Z"
      And should see "更新時間 2017-07-18T06:52:47.032Z"
