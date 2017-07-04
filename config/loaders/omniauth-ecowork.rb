Rails.application.configure do
  config_for(:omniauth_ecowork).each{ |k,v| ENV[k] = v }
end