Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  post 'home/result'
end
