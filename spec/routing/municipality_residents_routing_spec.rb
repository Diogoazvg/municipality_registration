# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MunicipalityResidentsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/municipality_residents').to route_to('municipality_residents#index')
    end

    it 'routes to #new' do
      expect(get: '/municipality_residents/new').to route_to('municipality_residents#new')
    end

    it 'routes to #show' do
      expect(get: '/municipality_residents/1').to route_to('municipality_residents#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/municipality_residents/1/edit').to route_to('municipality_residents#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/municipality_residents').to route_to('municipality_residents#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/municipality_residents/1').to route_to('municipality_residents#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/municipality_residents/1').to route_to('municipality_residents#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/municipality_residents/1').to route_to('municipality_residents#destroy', id: '1')
    end
  end
end
