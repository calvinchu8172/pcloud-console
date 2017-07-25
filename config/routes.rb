Rails.application.routes.draw do

  root 'admin/dashboard#index'

  devise_for :users,
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
    },
    path_names: {
      invitation: 'creation'
    },
    skip: [
      :sessions, :registrations, :passwords, :confirmations, :invitations, :unlocks
    ]

  devise_scope :user do
    # 登入登出
    get    'users/sign_in',  to: 'users/sessions#new',     as: 'new_user_session'
    delete 'users/sign_out', to: 'users/sessions#destroy', as: 'destroy_user_session'
    # 更新個人資料
    get 'admin/users/edit', to: 'users/registrations#edit',   as: 'edit_user_registration'
    put 'admin/users',      to: 'users/registrations#update', as: 'user_registration'
    # 新增人員
    get  'admin/users/creation/new', to: 'users/creations#new',    as: 'new_users_creation'
    post 'admin/users/creation',     to: 'users/creations#create', as: 'users_creation'
  end

  # ----------- #
  # - 管理後台 - #
  # ----------- #

  namespace :admin do

    # - 系統管理 / 人員帳號列表 - #
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        # 鎖定與解鎖帳號
        delete 'lock',   to: 'users#lock'
        put    'unlock', to: 'users#unlock'
      end
    end

    # - 系統管理 / 使用紀錄 - #
    resources :logs, only: [:index] do
      collection do
        get 'download', to: 'logs#download_csv'
      end
    end

    # - 推播管理 - #
    namespace :push do
      # - 推播管理 / App Group 列表 - #
      resources :app_groups, except: [:destroy] do
        # - 推播管理 / App Group / Access Key - #
        resources :access_keys, module: :app_groups, except: [:destroy] do
          member do
            get :download
            put :revoke
          end
        end
      end
    end

  end
end
