class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.super_admin?
        can :manage, :all
      else
        user.groups.each do |group|
          send("load_#{group.i18n_name}_permissions", user)
        end
      end
    end
  end

  private

    def load_system_management_permissions(user)

      # ----------- #
      # - 人員帳號 - #
      # ----------- #

      # 列表, 查看
      can :read, User
      # 新增人員
      can :create, User
      # 編輯 (不可編輯超級管理員)
      can :update, User do |u|
        !u.super_admin?
      end
      # 鎖定 (不可鎖定自己與超級管理員)
      can :lock, User do |u|
        !u.access_locked? && u != user && !u.super_admin?
      end
      # 解鎖 (不可鎖定自己與超級管理員)
      can :unlock, User do |u|
        u.access_locked? && u != user && !u.super_admin?
      end

      # ----------- #
      # - 使用紀錄 - #
      # ----------- #

      # 列表
      can :read, Log
      # 下載 CSV
      can :download_csv, Log
    end

    # ------------------ #
    # - 載入推播管理權限 - #
    # ------------------ #

    def load_push_management_permissions(user)
    end
end
