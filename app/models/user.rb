class User < ApplicationRecord
  validates_presence_of :name
  has_many :projects, foreign_key: :author_id, class_name: 'Project'
  has_many :groups
end
