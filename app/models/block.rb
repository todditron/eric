class Block < ActiveRecord::Base
  attr_accessible :name, :title, :body, as: [:default, :admin]

  validates :name, presence: true, uniqueness: true
end
