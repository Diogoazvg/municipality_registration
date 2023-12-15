# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'municipality_residents/new', type: :view do
  before(:each) do
    assign(:municipality_resident, MunicipalityResident.new(
                                     full_name: 'MyString',
                                     cpf: 'MyString',
                                     cns: 'MyString',
                                     email: 'MyString',
                                     birthday: 'MyString',
                                     phone_number: 'MyString',
                                     image_data: 'MyString'
                                   ))
  end

  it 'renders new municipality_resident form' do
    render

    assert_select 'form[action=?][method=?]', municipality_residents_path, 'post' do
      assert_select 'input[name=?]', 'municipality_resident[full_name]'

      assert_select 'input[name=?]', 'municipality_resident[cpf]'

      assert_select 'input[name=?]', 'municipality_resident[cns]'

      assert_select 'input[name=?]', 'municipality_resident[email]'

      assert_select 'input[name=?]', 'municipality_resident[birthday]'

      assert_select 'input[name=?]', 'municipality_resident[phone_number]'

      assert_select 'input[name=?]', 'municipality_resident[image_data]'
    end
  end
end
