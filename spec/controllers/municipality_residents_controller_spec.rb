# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MunicipalityResidentsController, type: :controller do
  subject { create(:municipality_resident, active: status) }

  let(:model) { MunicipalityResident }
  let(:user_last) { model.last }
  let(:status) { true }

  describe 'Create' do
    before { post :create, params: { municipality_resident: attributes } }
    context 'when create' do
      let(:attributes) { attributes_for(:municipality_resident) }

      it 'create a resident', :aggregate_faluires do
        post :create, params: { municipality_resident: attributes }

        expect(user_last.full_name).to eq attributes[:full_name]
        expect(response).to redirect_to(new_municipality_resident_path)
      end
    end

    context 'with error' do
      let(:attributes) { { full_name: 'name' } }

      it 'description' do
        post :create, params: { municipality_resident: attributes }

        assert_response :redirect
      end
    end
  end

  describe 'Update' do
    context 'when update' do
      it 'update a resident' do
        patch :update, params: { id: subject.id, municipality_resident: { full_name: 'New name' } }

        expect(subject.reload.full_name).to eq 'New name'
        expect(response).to redirect_to(municipality_resident_path(subject))
      end
    end

    context 'with error' do
      it 'description' do
        patch :update, params: { id: subject.id, municipality_resident: { full_name: nil } }

        assert_response :redirect
      end
    end
  end

  describe 'Activate/Deactivate' do
    before { post :change_status, params: { id: subject.id } }

    context 'when deactivate' do
      let(:status) { true }

      it { expect(subject.reload.active?).to be_falsey }
    end

    context 'when activate'
    let(:status) { false }

    it { expect(subject.reload.active?).to be_truthy }
  end
  describe 'Search' do
    before do
      create(:municipality_resident, full_name: 'Albert Some')
      create(:municipality_resident, full_name: 'Albert all')
      create(:municipality_resident, full_name: 'Bob')
      MunicipalityResident.reindex
      post :index, params: { search: name }
    end
    let(:instance_resident) { @controller.instance_variable_get(:@municipality_residents) }
    let(:name) { 'Albert Some' }

    context 'when passed specific params' do
      it { expect(instance_resident).to include(have_attributes(full_name: name)) }
      it { expect(instance_resident.count).to eq 1 }
    end

    context 'when passed correctly params but dont specific' do
      let(:name) { 'Albert' }

      it { expect(instance_resident.pluck(:full_name)).to match_array(['Albert Some', 'Albert all']) }
      it { expect(instance_resident.count).to eq 2 }
    end

    shared_context 'returns all records' do
      before { post :index, params: {} }

      it { expect(instance_resident.count).to eq 3 }
    end

    context 'when not passed params search' do
      let(:params) { {} }

      it_behaves_like 'returns all records'
    end
    context 'when passed empty params search' do
      let(:name) { '' }

      it_behaves_like 'returns all records'
    end
  end
end
