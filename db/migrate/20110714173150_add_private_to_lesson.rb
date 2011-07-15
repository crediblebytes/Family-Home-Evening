class AddPrivateToLesson < ActiveRecord::Migration
  def self.up
    add_column :lessons, :private, :boolean, :default => true
  end

  def self.down
    remove_column :lessons, :private
  end
end
