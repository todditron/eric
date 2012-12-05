class Post < ActiveRecord::Base
  attr_accessible :body, :date, :title, as: [:default, :admin]

  validates :date, presence: true
  validates :title, presence: true
  validates :body, presence: true

  default_scope order("date DESC")
end
