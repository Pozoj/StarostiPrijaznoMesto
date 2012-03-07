class CreateWorkHours < ActiveRecord::Migration
  def change
    create_table :work_hours do |t|
      t.integer :institution_id
      t.string :mon_from
      t.string :mon_to
      t.string :tue_from
      t.string :tue_to
      t.string :wed_from
      t.string :wed_to
      t.string :thu_from
      t.string :thu_to
      t.string :fri_from
      t.string :fri_to
      t.string :sat_from
      t.string :sat_to
      t.string :sun_from
      t.string :sun_to

      t.timestamps
    end
  end
end
