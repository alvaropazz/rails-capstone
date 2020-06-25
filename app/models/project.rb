class Project < ApplicationRecord
  belongs_to :user, optional: true
  has_many :groupings
  has_many :groups, through: :groupings
end
