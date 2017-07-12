@javascript
Feature: Common - User Profile Update

  Background:
    Given the super admin has already signed up

  Scenario: [01_03_01]
    修改個人檔案
    Given the super admin has already signed in
     Then the super admin should be at page - "/"
     When the super admin clicks "super_admin"
      And clicks "修改個人檔案"
     Then the super admin should be at page - "/admin/users/edit"
     When the user fills in "暱稱" with "SuperAdmin"
      And presses "提交"
     Then the super admin should be at page - "/"
      And should see "您已經成功的更新帳號資訊。"
      And should see "SuperAdmin"
