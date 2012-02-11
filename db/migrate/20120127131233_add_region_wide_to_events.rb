class AddRegionWideToEvents < ActiveRecord::Migration
  def change
    add_column :events, :region_wide, :boolean
  end
end
