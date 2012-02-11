class AddRangeToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :range, :string
  end
end
