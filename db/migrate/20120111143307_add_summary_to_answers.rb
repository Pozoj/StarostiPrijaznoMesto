class AddSummaryToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :summary, :text
  end
end
