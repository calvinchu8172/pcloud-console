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

  namespace :admin do

    resources :users, only: [:index, :show, :edit, :update] do
      member do
        # 鎖定與解鎖帳號
        delete 'lock',   to: 'users#lock'
        put    'unlock', to: 'users#unlock'
      end
    end

    resources :logs, only: [:index] do
      collection do
        get 'download', to: 'logs#download_csv'
      end
    end
  end
end
