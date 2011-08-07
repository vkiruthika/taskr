class AddUserIdToBuckets < ActiveRecord::Migration
  def self.up
   alter_table :buckets do |t|
     t.references :user
   end  
  end

  def self.down
  end
end
