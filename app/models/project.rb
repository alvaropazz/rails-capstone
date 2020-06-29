class Project < ApplicationRecord
  validates_presence_of :name
  belongs_to :author, class_name: 'User'
  has_one :grouping, foreign_key: :project_id
  has_one :group, through: :groupings

  scope :has_group, -> { where.not('group_id IS NULL') }
  scope :no_group, -> { where('group_id IS NULL') }
end
