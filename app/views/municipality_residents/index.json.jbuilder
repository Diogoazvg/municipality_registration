# frozen_string_literal: true

json.array! @municipality_residents, partial: 'municipality_residents/municipality_resident', as: :municipality_resident
