# frozen_string_literal: true

FactoryBot.define do
  factory :municipality_resident do
    full_name { 'Jhon Doe' }
    cpf { Faker::CPF.number }
    cns { '187329617340002' }
    email { 'jhon_doe@email.com' }
    birthday { Date.current - 20.years }
    phone_number { '22986676541' }
    image_data do
      Shrine.uploaded_file(
        'id' => SecureRandom.hex(8),
        'storage' => 'cache',
        'metadata' => { 'mime_type' => 'image/jpeg', 'size' => 1.megabyte }
      ).to_json
    end
  end
end
