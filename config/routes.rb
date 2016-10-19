Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "send_sms" => "captchas#create"
  post "validate" => "captchas#show"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
