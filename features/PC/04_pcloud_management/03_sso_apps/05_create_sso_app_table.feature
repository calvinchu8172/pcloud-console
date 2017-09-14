Feature: Pcloud Management - Create SSO APP DB

  Background:
    Given the super admin has already signed up
    Given Push Server has an SSO APP data as below:
    """
    {
      "id": "1",
      "name": "SSO_APP1",
      "uid": "c4d67b7f3b7f409b9577796060c81e02abce42529e4005a50fe4239bcb0e34b9",
      "secret": "f0f7ed91dcb3e9fb0b7dcce133acf7b75e9266aea3cb9ced3f55afb7fdec8486",
      "redirect_uri": "http://pcloud.dev:90/users/auth/pcloud/callback",
      "logout_redirect_uri": "http://pcloud.dev:90",
      "scopes": [],
      "created_at": "2017-09-14T02:56:42.276Z",
      "updated_at": "2017-09-14T02:56:42.276Z"
    }
    """

  @javascript @webmock
  Scenario: [04_03_05]
    編輯 App Group
    Given the super admin has already signed in
     When the super admin clicks "P.Cloud 管理" within "側邊功能"
      And clicks "SSO APP 管理" within "側邊功能"
     Then the super admin should be at page - "/admin/pcloud/sso_apps"
      And clicks "SSO_APP1" link on SSO APP List table Row "1"
     Then the super admin should be at page - "/admin/pcloud/sso_apps/1"
      And should see "建立 OSS APP Table"
     When the super admin clicks "建立 OSS APP Table"
     Then the super admin should be at page - "/admin/pcloud/sso_apps/1"
      And should see "名稱 SSO_APP1"
      And should see "SSO_APP1 成功建立 Table"
