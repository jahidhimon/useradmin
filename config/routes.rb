# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'up' => 'rails/health#show', as: :rails_health_check

  post 'block' => 'home#manage_blocking'

  root 'home#index'
end
