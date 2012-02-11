class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :address
      t.string :tax_nr
      t.string :telephone
      t.string :fax
      t.string :mobile
      t.string :email
      t.string :url

      t.timestamps
    end
  end
end
