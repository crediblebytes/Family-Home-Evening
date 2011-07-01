class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons do |t|
      t.string :title
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :lessons
  end
end
