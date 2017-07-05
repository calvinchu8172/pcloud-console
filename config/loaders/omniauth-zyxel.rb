Rails.application.configure do
  config_for(:omniauth_zyxel).each{ |k,v| ENV[k] = v }
end