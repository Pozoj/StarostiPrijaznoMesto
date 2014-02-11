class AddVisibleToInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :visible, :string
  end
end
