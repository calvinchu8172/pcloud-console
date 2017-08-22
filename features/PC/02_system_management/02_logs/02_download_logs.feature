@timecop
Feature: System Management - Logs - Download Logs

  Background:
    Given Time now is "2017-01-01 12:00:00"
    Given the super admin has already signed up
    Given Time now is "2017-01-02 12:00:00"
    Given the system manager has already been created by super admin

  @javascript
  Scenario: [02_02_02_01]
    下載使用紀錄
    Given Time now is "2017-01-03 12:00:00"
    Given the super admin has already signed in
     Then the super admin should be at page - "/"
     When the super admin clicks "系統管理" within "側邊功能"
     When the super admin clicks "使用紀錄" within "側邊功能"
     Then the super admin should be at page - "/admin/logs"
      And should see "下載 CSV"
     When the super admin clicks "下載 CSV"
     Then the super admin should download a csv file - "logs-2017-01-03T120000Z.csv"
      And the csv file headers should be:
      """
      [
        "來源物件",
        "來源 IP",
        "目標物件",
        "動作事件",
        "建立時間"
      ]
      """
      And the csv file content should be:
      """
      [
        [
          "super_admin@example.com",
          "127.0.0.1",
          null,
          "登入",
          "2017-01-03 12:00:00 UTC"
        ],
        [
          "super_admin@example.com",
          "127.0.0.1",
          "system_manager@example.com",
          "新增使用者",
          "2017-01-02 12:00:00 UTC"
        ],
        [
          "super_admin@example.com",
          "127.0.0.1",
          null,
          "超級管理員註冊",
          "2017-01-01 12:00:00 UTC"
        ]
      ]
      """
