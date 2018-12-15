class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :body
      t.string :file
      t.datetime :deleted_at
      t.references :task, foreign_key: true, index: true

      t.timestamps
    end
  end
end
