class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer
      t.text :suggestion
      t.string :answer_status
      
      t.integer :user_id
      t.integer :institution_id
      t.integer :post_id

      t.timestamps
    end
  end
end
