# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MunicipalityResident, type: :model do
  subject { build(:municipality_resident, cpf:, birthday:, phone_number:, email:, cns:) }

  let(:cpf) { Faker::CPF.number }
  let(:cns) { '702550937100001' }
  let(:email) { 'jhon_doe@email.com' }
  let(:phone_number) { '22986676541' }
  let(:birthday) { Date.current - 20.years }
  let(:twilio_client) { instance_double(Twilio::REST::Client) }

  before do
    allow(Twilio::REST::Client).to receive(:new).and_return(twilio_client)
    allow(twilio_client).to receive_message_chain(:messages, :create)
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:birthday) }
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_uniqueness_of(:cpf).case_insensitive }
    it { is_expected.to validate_presence_of(:cns) }
  end

  shared_context 'invalid_attributes' do
    it { is_expected.to be_invalid }
  end

  context 'when invalid cpf' do
    let(:cpf) { '99999999999' }

    it_behaves_like 'invalid_attributes'
  end

  context 'when invalid birthday' do
    let(:birthday) { Date.current }

    it_behaves_like 'invalid_attributes'
  end

  context 'when invalid email' do
    let(:email) { 'jhon_doe@@.email.com' }

    it_behaves_like 'invalid_attributes'
  end

  context 'when invalid cns' do
    let(:email) { '999999999999999' }

    it_behaves_like 'invalid_attributes'
  end

  context 'when valid attributes' do
    it { is_expected.to be_valid }
  end

  context 'when invalid email' do
    let(:email) { 'jhon_doe@@.email.com' }

    it { is_expected.to be_invalid }
  end

  context 'when invalid cns' do
    let(:email) { '999999999999999' }

    it { is_expected.to be_invalid }
  end

  context 'when update record' do
    subject { create(:municipality_resident, full_name: 'Ray') }

    let(:update) { subject.update!(full_name: 'Joe') }

    it 'description' do
      expect { update }.to change(subject, :full_name).from('Ray').to('Joe')
    end
  end
end
