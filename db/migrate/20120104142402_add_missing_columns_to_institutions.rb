class AddMissingColumnsToInstitutions < ActiveRecord::Migration
  def change
    add_column :institutions, :phone, :string
    add_column :institutions, :fax, :string
    add_column :institutions, :website, :string
    add_column :institutions, :tasks, :text
  end
end