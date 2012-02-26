class EditAnswersTimes < ActiveRecord::Migration
  def change
    add_column :answers, :institutionalized_at, :datetime
    add_column :answers, :answered_at, :datetime
    add_column :answers, :misplaced_at, :datetime
    add_column :answers, :waiting_at, :datetime
  end
end
