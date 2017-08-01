# myZyxel Console 各版本發佈內容

## Version：1.0.0-b2

#### Release Engineer：Calvin

#### Issue：

- Features

  - Feature 功能 #24836: 04.推播管理/APP Group List (含APP Group Key)

    - 查看 APP Group 列表
    - 新增 APP Group
    - 查看 APP Group 詳細資訊
    - 編輯 APP Group
    - 查看 APP Group Access Key 列表
    - 新增 APP Group Access Key
    - 查看 APP Group Access Key 詳細資訊
    - 編輯 APP Group Access Key
    - 下載 APP Group Access Key
    - 切換 APP Group Access Key 狀態

#### notes：none

#### known issue：none

## Version：1.0.0-b1

#### Release Engineer：Calvin

#### Issue：

- Features

  - Feature 功能 #24785: 1. 資料庫規劃
  - Feature 功能 #24786: 2. 整合 SSO
  - Feature 功能 #24789: 3. 權限建置
  - Feature 功能 #24792: 4. 管理人員身分權限頁面
  - Feature 功能 #24805: 5. 使用記錄頁面

#### notes：

- 新增 Migrations:

  - version 20161215180453

    - 新建 `users` table
    - 新增 `id` 欄位並建立 index
    - 新增 `email` 欄位並建立 index
    - 新增 `encrypted_password` 欄位
    - 新增 `reset_password_token` 欄位並建立 index
    - 新增 `reset_password_sent_at` 欄位
    - 新增 `remember_created_at` 欄位
    - 新增 `sign_in_count` 欄位
    - 新增 `current_sign_in_at` 欄位
    - 新增 `last_sign_in_at` 欄位
    - 新增 `current_sign_in_ip` 欄位
    - 新增 `last_sign_in_ip` 欄位
    - 新增 `confirmation_token` 欄位並建立 index
    - 新增 `confirmed_at` 欄位
    - 新增 `confirmation_sent_at` 欄位
    - 新增 `unconfirmed_email` 欄位
    - 新增 `failed_attempts` 欄位
    - 新增 `unlock_token` 欄位並建立 index
    - 新增 `locked_at` 欄位
    - 新增 `created_at` 欄位
    - 新增 `updated_at` 欄位

  - version 20161215180454

    - 新建 `profiles` table
    - 新增 `id` 欄位並建立 index
    - 新增 `user_id` 欄位並建立 index
    - 新增 `super_admin` 欄位並建立 index
    - 新增 `name` 欄位
    - 新增 `created_at` 欄位
    - 新增 `updated_at` 欄位

  - version 20161215180455

    - 新建 `logs` table
    - 新增 `id` 欄位並建立 index
    - 新增 `source_type` 欄位並建立 index
    - 新增 `source_id` 欄位
    - 新增 `target_type` 欄位並建立 index
    - 新增 `target_id` 欄位
    - 新增 `event` 欄位並建立 index
    - 新增 `extra` 欄位
    - 新增 `created_at` 欄位
    - 新增 `updated_at` 欄位並建立 index

  - version 20170106045047

    - 修改 `users` table
    - 新增 `invited_by_id` 欄位並建立 index
    - 新增 `invitation_token` 欄位並建立 index
    - 新增 `invitation_created_at` 欄位
    - 新增 `invitation_sent_at` 欄位
    - 新增 `invitation_accepted_at` 欄位
    - 新增 `invitation_limit` 欄位
    - 新增 `invited_by` 欄位
    - 新增 `invitations_count` 欄位並建立 index

  - version 20170703085211

    - 新建 `omnioauths` table
    - 新增 `id` 欄位並建立 index
    - 新增 `user_id` 欄位並建立 index
    - 新增 `provider` 欄位
    - 新增 `uid` 欄位
    - 新增 `image` 欄位
    - 新增 `created_at` 欄位
    - 新增 `updated_at` 欄位

  - version 20170703085212

    - 新建 `groups` table
    - 新增 `id` 欄位並建立 index
    - 新增 `name` 欄位
    - 新增 `created_at` 欄位
    - 新增 `updated_at` 欄位

  - version 20170703085213

    - 新建 `groups_users` table
    - 新增 `id` 欄位並建立 index
    - 新增 `group_id` 欄位並建立 index
    - 新增 `user_id` 欄位並建立 index
    - 新增 `created_at` 欄位
    - 新增 `updated_at` 欄位

#### known issue：none
