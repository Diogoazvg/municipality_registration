class ChangesDefaultActive < ActiveRecord::Migration[7.0]
  def up
    remove_column :municipality_residents, :active
    add_column :municipality_residents, :active, :boolean, default: false
  end

  def down
    remove_column :municipality_residents, :active
    add_column :municipality_residents, :active, :integer, default: 0
  end
end
