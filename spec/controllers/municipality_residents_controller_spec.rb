# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MunicipalityResidentsController, type: :controller do
  subject { create(:municipality_resident, active: status) }

  let(:model) { MunicipalityResident }
  let(:user_last) { model.last }
  let(:status) { true }
  let(:twilio_client) { instance_double(Twilio::REST::Client) }

  before do
    allow(Twilio::REST::Client).to receive(:new).and_return(twilio_client)
    allow(twilio_client).to receive_message_chain(:messages, :create)
  end

  describe 'Create' do
    let(:municipality_resident) { attributes_for(:municipality_resident) }
    let(:address) { attributes_for(:address) }

    context 'when create' do
      before do
        post :create, params: { municipality_resident: municipality_resident.merge(address_attributes: address) }
      end

      it { expect(user_last.full_name).to eq municipality_resident[:full_name] }
      it { expect(response).to redirect_to(municipality_residents_path) }
    end

    context 'when the mandatory parameters are not passed' do
      before { post :create, params: { municipality_resident: { name: '' } } }

      it { assert_response 422 }
      it { expect(model.count).to eq 0 }
    end
  end

  describe 'New' do
    it 'success' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template :new
    end
  end

  describe 'Update' do
    context 'when success' do
      it 'update a resident' do
        patch :update, params: { id: subject.id, municipality_resident: { full_name: 'New name' } }

        expect(subject.reload.full_name).to eq 'New name'
        expect(response).to redirect_to(municipality_resident_path(subject))
      end
    end

    context 'with error' do
      before { patch :update, params: { id: subject.id, municipality_resident: { full_name: nil } } }

      it { assert_response 422 }
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
