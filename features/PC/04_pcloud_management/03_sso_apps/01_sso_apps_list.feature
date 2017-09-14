Feature: Pcloud Management - SSO APP List

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
      "created_at": "2017-07-14T02:56:42.276Z",
      "updated_at": "2017-07-18T01:48:48.008Z"
    }
    """
    Given Push Server has an SSO APP data as below:
    """
    {
      "id": "2",
      "name": "SSO_APP2",
      "uid": "0d109d86751194ec8b371de4eae1f7d6091914cbaf7ac22b05e88174356a8c36",
      "secret": "442ee8a4ccedc58bfe2ba85c1fd5bfc8f38e88b1e92c3b1cd19f6759afefbbc8",
      "redirect_uri": "http://pcloud.dev:100/users/auth/pcloud/callback",
      "logout_redirect_uri": "http://pcloud.dev:100",
      "scopes": [],
      "created_at": "2017-07-14T02:57:42.587Z",
      "updated_at": "2017-07-18T01:48:29.158Z"
    }
    """

  @javascript @webmock
  Scenario: [04_03_01]
    查看推播 SSO APPs 列表
    Given the super admin has already signed in
     Then the super admin should be at page - "/"
     When the super admin clicks "P.Cloud 管理" within "側邊功能"
     Then the super admin should see "SSO APP 管理"
     When the super admin clicks "SSO APP 管理" within "側邊功能"
     Then the super admin should be at page - "/admin/pcloud/sso_apps"
      And should see "SSO APP 管理"
      And should see "SSO APP 列表"
      And should see "名稱" - "SSO_APP1" on SSO APP List table Row "1"
      And should see "Redirect URI" - "http://pcloud.dev:90/users/auth/pcloud/callback" on SSO APP List table Row "1"
      And should see "名稱" - "SSO_APP2" on SSO APP List table Row "2"
      And should see "Redirect URI" - "http://pcloud.dev:100/users/auth/pcloud/callback" on SSO APP List table Row "2"
