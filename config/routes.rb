# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'municipality_residents#index'

  resources :municipality_residents

  post '/municipality_resident/:id/status', to: 'municipality_residents#change_status', as: 'municipality_status'
  get 'search', to: 'search#el_search', as: 'el_search'
end
