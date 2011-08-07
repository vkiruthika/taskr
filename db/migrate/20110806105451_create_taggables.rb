class CreateTaggables < ActiveRecord::Migration
  def self.up
    create_table :taggables do |t|
      t.references :tag
      t.references :task

      t.timestamps
    end
  end

  def self.down
    drop_table :taggables
  end
end
