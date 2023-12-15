# frozen_string_literal: true

class ChangesBirthdayTypeToDate < ActiveRecord::Migration[7.0]
  def up
    remove_column :municipality_residents, :birthday
    add_column :municipality_residents, :birthday, :date
  end

  def down
    remove_column :municipality_residents, :birthday
    add_column :municipality_residents, :birthday, :string
  end
end
