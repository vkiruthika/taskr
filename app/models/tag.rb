class Tag < ActiveRecord::Base
  has_many :taggables
  has_many :tasks, :through=>:taggables
end
