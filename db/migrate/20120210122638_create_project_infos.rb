class CreateProjectInfos < ActiveRecord::Migration
  def change
    create_table :project_infos do |t|
      t.text :content

      t.timestamps
    end
  end
end
