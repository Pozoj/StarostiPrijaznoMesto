class AddInstitutionToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :institution_id, :integer
  end
end
