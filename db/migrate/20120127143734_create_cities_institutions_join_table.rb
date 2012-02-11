class CreateCitiesInstitutionsJoinTable < ActiveRecord::Migration
  def up
    create_table :cities_institutions,  :force => true, :id => false do |t|
      t.integer :city_id
      t.integer :institution_id
    end
  end

  def down
    drop_table :cities_institutions
  end
end
