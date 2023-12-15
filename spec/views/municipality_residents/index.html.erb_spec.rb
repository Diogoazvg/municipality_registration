# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'municipality_residents/index', type: :view do
  before(:each) do
    assign(:municipality_residents, [
             MunicipalityResident.create!(
               full_name: 'Full Name',
               cpf: 'Cpf',
               cns: 'Cns',
               email: 'Email',
               birthday: 'Birthday',
               phone_number: 'Phone Number',
               image_data: 'Image Data'
             ),
             MunicipalityResident.create!(
               full_name: 'Full Name',
               cpf: 'Cpf',
               cns: 'Cns',
               email: 'Email',
               birthday: 'Birthday',
               phone_number: 'Phone Number',
               image_data: 'Image Data'
             )
           ])
  end

  it 'renders a list of municipality_residents' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Full Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Cpf'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Cns'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Email'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Birthday'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Phone Number'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Image Data'.to_s), count: 2
  end
end
