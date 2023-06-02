# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    municipality_resident
    zip_code { '28013266' }
    address1 { 'Principal Street' }
    complement { 'Next a place' }
    neighborhood { 'Some neighborhood' }
    city { 'A city' }
    uf { 1 }
    ibge { '1234567' }
  end
end
