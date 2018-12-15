class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :tag, array: true, default: []
      t.references :user, foreign_key: true, index: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
