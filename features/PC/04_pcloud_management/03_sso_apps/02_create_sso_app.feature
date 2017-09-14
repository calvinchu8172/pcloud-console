Feature: Pcloud Management - SSO APPs - Create SSO APP

  Background:
    Given the super admin has already signed up

  @javascript @webmock
  Scenario: [04_03_02]
    新增 App Group
    # Given Time now is "2017-01-02 12:00:00"
    Given the super admin has already signed in
     When the super admin clicks "P.Cloud 管理" within "側邊功能"
      And clicks "SSO APP 管理" within "側邊功能"
     Then the super admin should see "新增 SSO APP"
     When the super admin clicks "新增 SSO APP"
     Then the super admin should be at page - "/admin/pcloud/sso_apps/new"
     When the super admin fills in "名稱" with "SSO APP 1"
     When the super admin fills in "Redirect URI" with "http://pcloud.dev:90/users/auth/pcloud/callback"
     When the super admin fills in "Logout Redirect URI" with "http://pcloud.dev:90"
     When the super admin fills in "Scopes" with "index create update"
      And presses "提交"
     Then the super admin should be at page - "/admin/pcloud/sso_apps/1"
      And should see "名稱 SSO APP 1"
      And should see "Client ID c4d67b7f3b7f409b9577796060c81e02abce42529e4005a50fe4239bcb0e34b9"
      And should see "Client Secret f0f7ed91dcb3e9fb0b7dcce133acf7b75e9266aea3cb9ced3f55afb7fdec8486"
      And should see "Scopes index create update"
      And should see "Redirect URI http://pcloud.dev:90/users/auth/pcloud/callback"
      And should see "Logout Redirect URI http://pcloud.dev:90"
      And should see "建立時間 2017-09-14T06:52:47.031Z"
      And should see "更新時間 2017-09-14T06:52:47.031Z"
