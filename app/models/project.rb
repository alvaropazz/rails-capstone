class Project < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_one :groupings, foreign_key: :project_id
  has_one :group, through: :groupings
end
