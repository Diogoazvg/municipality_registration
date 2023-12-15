# frozen_string_literal: true

json.extract! municipality_resident, :id, :full_name, :cpf, :cns, :email, :birthday, :phone_number, :image_data,
              :created_at, :updated_at
json.url municipality_resident_url(municipality_resident, format: :json)
