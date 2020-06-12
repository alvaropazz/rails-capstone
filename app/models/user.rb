class User < ApplicationRecord
  validates_presence_of :name
  has_many :groups
  has_many :projects, foreign_key: 'author_id'
end
