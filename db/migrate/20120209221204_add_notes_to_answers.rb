class AddNotesToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :notes, :text
  end
end
