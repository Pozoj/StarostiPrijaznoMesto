class CreateStatisticsTables < ActiveRecord::Migration
  def change
    create_table :statistics_tables do |t|

      t.timestamps
    end
  end
end
