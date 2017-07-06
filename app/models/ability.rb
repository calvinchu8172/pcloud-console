class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      user.groups.each do |group|
        send("load_#{group.i18n_name}_permissions", user)
      end
      load_super_admin_permissions(user) if user.super_admin?
    end
  end

  private

    # -------------------- #
    # - 載入超級管理員權限 - #
    # -------------------- #

    def load_super_admin_permissions(user)

      # # -------------- #
      # # - 人員帳號管理 - #
      # # -------------- #
      # # 列表, 查看
      # can :read, User
      # # 新增人員
      # can :create, User
      # # 重寄新增認證信
      # can :resend_creation, User do |u|
      #   !u.super_admin? && !u.invitation_accepted?
      # end
      # # 編輯 (非自己人員)
      # can :update, User do |u|
      #   u != user
      # end
      # # 鎖定 (非自己人員)
      # can :lock, User do |u|
      #   !u.access_locked? && u != user
      # end
      # # 解鎖 (非自己人員)
      # can :unlock, User do |u|
      #   u.access_locked? && u != user
      # end
      can :manage, :all
    end

    def load_system_management_permissions(user)

      # can :manage, :all
      # -------------- #
      # - 人員帳號管理 - #
      # -------------- #
      # 列表, 查看
      # can :read, User, { profile: { role: [0, 1, 2] } }
      can :read, User
      # 新增人員
      can :create, User
      # 重寄新增認證信
      can :resend_creation, User do |u|
        !u.super_admin? && !u.invitation_accepted?
      end
      # 編輯 (非自己人員)
      # can :update, User do |u|
      #   u != user
      # end
      # 編輯 (不可編輯超級管理員)
      can :update, User do |u|
        !u.super_admin?
      end
      # 鎖定 (不可鎖定自己人員與超級管理員)
      can :lock, User do |u|
        !u.access_locked? && u != user && !u.super_admin?
      end
      # 解鎖 (不可鎖定自己人員與超級管理員)
      can :unlock, User do |u|
        u.access_locked? && u != user && !u.super_admin?
      end
    end

    # -------------------- #
    # - 載入無權限 - #
    # -------------------- #

    def load_push_management_permissions(user)
    end


    # ---------------- #
    # - 載入管理員權限 - #
    # ---------------- #

    def load_user_manager_permissions(user)

      # -------------- #
      # - 人員帳號管理 - #
      # -------------- #
      # 列表, 查看
      can :read, User, { profile: { role: [0, 1, 2] } }
      # 新增人員
      can :create, User
      # 重寄新增認證信
      can :resend_creation, User do |u|
        !u.super_admin? && !u.invitation_accepted?
      end
      # 編輯 (非自己人員)
      can :update, User do |u|
        u != user
      end
      # 鎖定 (非自己人員)
      can :lock, User do |u|
        !u.access_locked? && u != user
      end
      # 解鎖 (非自己人員)
      can :unlock, User do |u|
        u.access_locked? && u != user
      end
    end

    # -------------------- #
    # - 載入應用管理員權限 - #
    # -------------------- #

    def load_app_manager_permissions(user)
    end

    # -------------------- #
    # - 載入內容管理員權限 - #
    # -------------------- #

    def load_content_manager_permissions(user)
    end

    # -------------------- #
    # - 載入無權限 - #
    # -------------------- #

    def load_anonymous_permissions(user)
    end
end
