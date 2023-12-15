class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code, null: false
      t.string :address1, null: false
      t.string :complement
      t.string :neighborhood, null: false
      t.string :city, null: false
      t.integer :uf, null: false
      t.integer :ibge
      t.references :municipality_resident, null: false

      t.timestamps
    end
  end
end
