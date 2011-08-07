class AddUserIdToTasks < ActiveRecord::Migration
  def self.up
   alter_table :tasks do |t|
     t.integer :user_id
   end  
  end

  def self.down
  end
end
