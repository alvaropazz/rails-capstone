class Group < ApplicationRecord
  has_many :groupings
  has_many :projects, through: :groupings
end
