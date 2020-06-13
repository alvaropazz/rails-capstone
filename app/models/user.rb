class User < ApplicationRecord
  has_many :projects, foreign_key: 'author_id'
  has_many :groups, through: :projects
end
