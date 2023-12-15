# frozen_string_literal: true

class CreateMunicipalityResidents < ActiveRecord::Migration[7.0]
  def change
    create_table :municipality_residents do |t|
      t.string :full_name, null:false
      t.string :cpf, null:false
      t.string :cns, null:false
      t.string :email, null:false
      t.string :birthday, null:false
      t.string :phone_number, null:false
      t.string :image_data, null:false
      t.integer :active, default: 0

      t.timestamps
    end
  end
end
