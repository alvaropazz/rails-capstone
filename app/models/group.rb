class Group < ApplicationRecord
  belongs_to :user
  has_many :groupings, foreign_key: :group_id
  has_many :projects, through: :groupings

  scope :all_projects, -> (group) { Project.where('group_id = ?', group.id) }
end
