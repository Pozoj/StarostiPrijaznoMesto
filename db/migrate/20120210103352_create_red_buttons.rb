class CreateRedButtons < ActiveRecord::Migration
  def change
    create_table :red_buttons do |t|
      t.string :title
      t.text :short_description
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
