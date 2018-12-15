class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :prioritize
      t.boolean :done
      t.datetime :deadline
      t.datetime :deleted_at
      t.references :project, foreign_key: true, index: true

      t.timestamps
    end
  end
end
