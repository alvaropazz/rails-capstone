class Project < ApplicationRecord
  belongs_to :user, optional: true
  has_many :groupings, dependent: :destroy
  has_many :groups, through: :groupings

  def group=(group)
    project_group = Group.where(name: group).first
    groups.push(project_group) if project_group
  end

