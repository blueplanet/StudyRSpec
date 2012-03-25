class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title, :null => false
      t.text :body, :null => false
      t.date :posted_on
      t.timestamp :created_at
      t.timestamp :updated_at
      t.integer :blog_id, :null => false

      t.timestamps
    end
  end
end
