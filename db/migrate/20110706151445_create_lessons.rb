class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :lessons, :user_id
    add_index :lessons, :created_at
  end

  def self.down
    drop_table :lessons
  end
end
