# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'municipality_residents/show', type: :view do
  before(:each) do
    assign(:municipality_resident, MunicipalityResident.create!(
                                     full_name: 'Full Name',
                                     cpf: 'Cpf',
                                     cns: 'Cns',
                                     email: 'Email',
                                     birthday: 'Birthday',
                                     phone_number: 'Phone Number',
                                     image_data: 'Image Data'
                                   ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Cns/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Birthday/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Image Data/)
  end
end
