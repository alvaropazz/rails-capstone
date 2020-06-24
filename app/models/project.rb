class Project < ApplicationRecord
  belongs_to :user, optional: true
  has_many :groupings, dependent: :destroy
  has_many :groups, through: :groupings

  def group 
    groups.first
  end

  def group=(group)
    g = Group.find_by(name: group)
    groups << g if g
  end
end
