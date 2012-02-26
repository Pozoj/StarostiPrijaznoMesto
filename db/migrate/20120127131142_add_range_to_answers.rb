class AddRangeToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answer_range, :string
  end
end
