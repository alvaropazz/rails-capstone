class Project < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  belongs_to :group
end
