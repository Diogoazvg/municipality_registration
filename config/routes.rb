# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'residents#index'

  resources :municipality_residents

  post '/municipality_resident/:id/status', to: 'municipality_residents#change_status', as: 'municipality_status'
end
